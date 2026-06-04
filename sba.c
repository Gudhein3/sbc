#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>
#include <assert.h>

#define Fmt_SV "%.*s"
#define Pass_SV(sv) (sv).length, (sv).data

typedef struct {
    const char *data;
    size_t length;
} String_View;

String_View sv_load_file(const char *fname) {
    FILE *fptr = fopen(fname, "rb");
    if (!fptr) {
        fprintf(stderr, "Cannot open file: %s\n", fname);
        exit(1);
    }
    fseek(fptr, 0, SEEK_END);
    size_t length = ftell(fptr);
    fseek(fptr, 0, SEEK_SET);
    char *data = malloc(length);
    fread(data, 1, length, fptr);
    fclose(fptr);
    return (String_View) {
        data,
        length
    };
}

String_View sv_chop_by_char(String_View *sv, char delim) {
    String_View result = (String_View) {
        sv->data,
        0
    };
    while (sv->length && sv->data[0] != delim) {
        --sv->length;
        ++sv->data;
        ++result.length;
    }
    if (sv->length && sv->data[0] == delim) {
        --sv->length;
        ++sv->data;
    }
    return result;
}

void sv_strip(String_View *sv) {
    while (sv->length && isspace(sv->data[0])) {
        --sv->length;
        ++sv->data;
    }
    while (sv->length && isspace(sv->data[sv->length-1])) {
        --sv->length;
    }
}

bool sv_equal_cstr(String_View sv, const char *cstr) {
    if (sv.length != strlen(cstr)) return 0;
    return 0 == memcmp(sv.data, cstr, sv.length);
}

bool sv_starts_cstr(String_View sv, const char *cstr) {
    if (sv.length < strlen(cstr)) return 0;
    return 0 == memcmp(sv.data, cstr, strlen(cstr));
}

size_t sv_parse_size(String_View sv) {
    size_t idx = 0;
    String_View osv = sv;
    while (sv.length) {
        char c = *sv.data;
        if (isdigit(c)) {
            idx = idx*10 + c - '0';
        } else {
            fprintf(stderr, "Unreachable: Invalid decimal literal at: "Fmt_SV"\n", Pass_SV(osv));
            return 1;
        }
        ++sv.data;
        --sv.length;
    }
    return idx;
}

int main(int argc, char **argv) {
    if (argc < 3) {
        fprintf(stderr, "Usage: %s input-IR output-file [linker flags]\n", argv[0]);
        return 2;
    }
    if (strlen(argv[2]) > 4090) {
        fprintf(stderr, "%s: Too long filepath: %s\n", argv[0], argv[2]);
        return 2;
    }

    char *binname = argv[2];
    static char asmname[4096];
    strcpy(asmname, argv[2]);
    strcat(asmname, ".s");
    static char objname[4096];
    strcpy(objname, argv[2]);
    strcat(objname, ".o");

    String_View code = sv_load_file(argv[1]);

    int sp = 0;

    static const char *ra[] = {"rdi", "rsi", "rdx", "rcx", "r8", "r9"};
    static const size_t ra_cnt = sizeof(ra)/sizeof(*ra);

    FILE *fptr = fopen(asmname, "wb");

    fprintf(fptr,
        "extern __errno_location\n"
        "Blchar:\n"
        "\tmov r10b, [rdi]\n"
        "\tmovzx rax, r10b\n"
        "\tret\n"
        "Bschar:\n"
        "\tmov byte [rdi], sil\n"
        "\tmovzx rax, sil\n"
        "\tret\n"

        "fpAdd:\n"
        "\tmovq xmm0, rdi\n"
        "\tmovq xmm1, rsi\n"
        "\taddsd xmm0, xmm1\n"
        "\tmovq rax, xmm0\n"
        "\tret\n"
        "fpSub:\n"
        "\tmovq xmm0, rdi\n"
        "\tmovq xmm1, rsi\n"
        "\tsubsd xmm0, xmm1\n"
        "\tmovq rax, xmm0\n"
        "\tret\n"
        "fpMul:\n"
        "\tmovq xmm0, rdi\n"
        "\tmovq xmm1, rsi\n"
        "\tmulsd xmm0, xmm1\n"
        "\tmovq rax, xmm0\n"
        "\tret\n"
        "fpDiv:\n"
        "\tmovq xmm0, rdi\n"
        "\tmovq xmm1, rsi\n"
        "\tdivsd xmm0, xmm1\n"
        "\tmovq rax, xmm0\n"
        "\tret\n"
        "fpLth:\n"
        "\tmovq xmm1, rdi\n"
        "\tmovq xmm0, rsi\n"
        "\tcomisd xmm0, xmm1\n"
        "\tseta al\n"
        "\tmovzx rax, al\n"
        "\tret\n"
        "fpGth:\n"
        "\tmovq xmm0, rdi\n"
        "\tmovq xmm1, rsi\n"
        "\tcomisd xmm0, xmm1\n"
        "\tseta al\n"
        "\tmovzx rax, al\n"
        "\tret\n"
        "fpEqu:\n" // Without parity check.
        "\tmovq xmm0, rdi\n"
        "\tmovq xmm1, rsi\n"
        "\tcomisd xmm0, xmm1\n"
        "\tsete al\n"
        "\tmovzx rax, al\n"
        "\tret\n"
        "fpInt2:\n"
        "\tcvtsi2sd xmm0, rdi\n"
        "\tmovq rax, xmm0\n"
        "\tret\n"
        "fp2Int:\n"
        "\tmovq xmm0, rdi\n"
        "\tcvttsd2si rax, xmm0\n"
        "\tret\n"
        );

   while (code.length) {
        sv_strip(&code);
        String_View line = sv_chop_by_char(&code, '\n');
        sv_strip(&line);
        if (line.length == 0) continue;
        String_View line3 = (String_View) {
            .data=line.data+3,
            .length=line.length-3
        };
        if (sv_starts_cstr(line, "xfp")) {
            fprintf(fptr, "lea rax, [rbp-"Fmt_SV"]\n", Pass_SV(line3));
        } else if (sv_starts_cstr(line, "xst")) {
            fprintf(fptr, "lea rax, "Fmt_SV"\n", Pass_SV(line3));
        } else if (sv_equal_cstr(line, "drf")) {
            fprintf(fptr, "mov rax, [rax]\n");
        } else if (sv_equal_cstr(line, "8dr")) {
            fprintf(fptr, "movzx rax, byte [rax]\n");
        } else if (sv_equal_cstr(line, "dr1")) {
            fprintf(fptr, "mov rcx, [rcx]\n");
        } else if (sv_equal_cstr(line, "sv0")) { ++sp;
            fprintf(fptr, "push rax\n");
        } else if (sv_equal_cstr(line, "sv1")) { ++sp;
            fprintf(fptr, "push rcx\n");
        } else if (sv_equal_cstr(line, "sv2")) { ++sp;
            fprintf(fptr, "push r13\n");
        } else if (sv_equal_cstr(line, "ld0")) { --sp;
            fprintf(fptr, "pop rax\n");
        } else if (sv_equal_cstr(line, "ld1")) { --sp;
            fprintf(fptr, "pop rcx\n");
        } else if (sv_equal_cstr(line, "ld2")) { --sp;
            fprintf(fptr, "pop r13\n");
        } else if (sv_equal_cstr(line, "not")) {
            fprintf(fptr, "not rax\n");
        } else if (sv_equal_cstr(line, "neg")) {
            fprintf(fptr, "neg rax\n");
        } else if (sv_equal_cstr(line, "shl")) {
            fprintf(fptr, "shl rax, cl\n");
        } else if (sv_equal_cstr(line, "shr")) {
            fprintf(fptr, "shr rax, cl\n");
        } else if (sv_equal_cstr(line, "and")) {
            fprintf(fptr, "and rax, rcx\n");
        } else if (sv_equal_cstr(line, "or")) {
            fprintf(fptr, "or rax, rcx\n");
        } else if (sv_equal_cstr(line, "xor")) {
            fprintf(fptr, "xor rax, rcx\n");
        } else if (sv_equal_cstr(line, "add")) {
            fprintf(fptr, "add rax, rcx\n");
        } else if (sv_equal_cstr(line, "sub")) {
            fprintf(fptr, "sub rax, rcx\n");
        } else if (sv_equal_cstr(line, "mul")) {
            fprintf(fptr, "mul rcx\n");
        } else if (sv_equal_cstr(line, "dec")) {
            fprintf(fptr, "dec rax\n");
        } else if (sv_equal_cstr(line, "inc")) {
            fprintf(fptr, "inc rax\n");
        } else if (sv_equal_cstr(line, "div")) {
            fprintf(fptr, "xor rdx, rdx\n");
            fprintf(fptr, "div rcx\n");
        } else if (sv_equal_cstr(line, "rem")) {
            fprintf(fptr, "xor rdx, rdx\n");
            fprintf(fptr, "div rcx\n");
            fprintf(fptr, "mov rax, rdx\n");
        } else if (sv_equal_cstr(line, "lnt")) {
            fprintf(fptr, "test rax, rax\n");
            fprintf(fptr, "setz al\n");
            fprintf(fptr, "movzx rax, al\n");
        } else if (sv_equal_cstr(line, "m20")) {
            fprintf(fptr, "mov r13, rax\n");
        } else if (sv_equal_cstr(line, "m10")) {
            fprintf(fptr, "mov rcx, rax\n");
        } else if (sv_equal_cstr(line, "m01")) {
            fprintf(fptr, "mov rax, rcx\n");
        } else if (sv_equal_cstr(line, "m0x")) {
            fprintf(fptr, "movq rax, xmm0\n");
        } else if (sv_equal_cstr(line, "dar")) {
            fprintf(fptr, "lea rax, [rcx+rax*8]\n");
        } else if (sv_equal_cstr(line, "equ")) {
            fprintf(fptr, "cmp rax, rcx\n");
            fprintf(fptr, "sete al\n");
            fprintf(fptr, "movzx rax, al\n");
        } else if (sv_equal_cstr(line, "neq")) {
            fprintf(fptr, "cmp rax, rcx\n");
            fprintf(fptr, "setne al\n");
            fprintf(fptr, "movzx rax, al\n");
        } else if (sv_equal_cstr(line, "ube")) {
            fprintf(fptr, "cmp rax, rcx\n");
            fprintf(fptr, "setbe al\n");
            fprintf(fptr, "movzx rax, al\n");
        } else if (sv_equal_cstr(line, "ubi")) {
            fprintf(fptr, "cmp rax, rcx\n");
            fprintf(fptr, "setb al\n");
            fprintf(fptr, "movzx rax, al\n");
        } else if (sv_equal_cstr(line, "uae")) {
            fprintf(fptr, "cmp rax, rcx\n");
            fprintf(fptr, "setae al\n");
            fprintf(fptr, "movzx rax, al\n");
        } else if (sv_equal_cstr(line, "uai")) {
            fprintf(fptr, "cmp rax, rcx\n");
            fprintf(fptr, "seta al\n");
            fprintf(fptr, "movzx rax, al\n");
        } else if (sv_equal_cstr(line, "erf")) {
            fprintf(fptr, "mov [rcx], rax\n");
        } else if (sv_equal_cstr(line, "8er")) {
            fprintf(fptr, "mov [rcx], al\n");
        } else if (sv_equal_cstr(line, "ret")) {
            fprintf(fptr, "leave\n");
            fprintf(fptr, "ret\n");
        } else if (sv_starts_cstr(line, "ljz")) {
            fprintf(fptr, "test rax, rax\n");
            fprintf(fptr, "jz .L"Fmt_SV"\n", Pass_SV(line3));
        } else if (sv_starts_cstr(line, "rsw")) {
            fprintf(fptr, "section .bss\n");
            String_View a = sv_chop_by_char(&line3, '*');
            fprintf(fptr, ""Fmt_SV": resq "Fmt_SV"\n", Pass_SV(line3), Pass_SV(a));
            fprintf(fptr, "section .text\n");
        } else if (sv_starts_cstr(line, "mfs")) {
            String_View a = sv_chop_by_char(&line3, ':');
            size_t idx = sv_parse_size(line3);
            // XXX: Dirty code.
            if (idx > ra_cnt) {
                fprintf(stderr, "Unreachable: Too big RA index: %zu>%zu at: "Fmt_SV"\n", idx, ra_cnt, Pass_SV(line));
            }
            fprintf(fptr, "mov [rbp-"Fmt_SV"], %s\n", Pass_SV(a), ra[idx]);
        } else if (sv_starts_cstr(line, "prc")) {
            sp = 0;
            fprintf(fptr, ""Fmt_SV":\n", Pass_SV(line3));
            fprintf(fptr, "push rbp\n");
            fprintf(fptr, "mov rbp, rsp\n");
        } else if (sv_starts_cstr(line, "alc")) {
            fprintf(fptr, "sub rsp, "Fmt_SV"\n", Pass_SV(line3));
        } else if (sv_starts_cstr(line, "glb")) {
            fprintf(fptr, "global "Fmt_SV"\n", Pass_SV(line3));
        } else if (sv_starts_cstr(line, "ext")) {
            fprintf(fptr, "extern "Fmt_SV"\n", Pass_SV(line3));
        } else if (sv_starts_cstr(line, "ljp")) {
            fprintf(fptr, "jmp .L"Fmt_SV"\n", Pass_SV(line3));
        } else if (sv_starts_cstr(line, "ldc")) {
            fprintf(fptr, "mov rax, "Fmt_SV"\n", Pass_SV(line3));
        } else if (sv_starts_cstr(line, "lds")) {
            fprintf(fptr, "lea rax, [abs string+"Fmt_SV"]\n", Pass_SV(line3));
        } else if (sv_starts_cstr(line, "svc")) {
            fprintf(fptr, "push "Fmt_SV"\n", Pass_SV(line3));
            sp += 1;
        } else if (sv_starts_cstr(line, "jlc")) {
            fprintf(fptr, "jmp .L"Fmt_SV"\n", Pass_SV(line3));
        } else if (sv_starts_cstr(line, "loc")) {
            fprintf(fptr, ".L"Fmt_SV":\n", Pass_SV(line3));
        } else if (sv_starts_cstr(line, "cal")) {
            size_t oargc = sv_parse_size(line3);
            size_t argc = oargc;
            size_t a;
            if (argc < ra_cnt) a = argc;
            else a = ra_cnt;
            for (size_t i = 0; i < a; ++i) {
                fprintf(fptr, "mov %s, [rsp+%zu]\n", ra[i], argc*8-8);
                argc -= 1;
            }
            if (oargc < ra_cnt) {
                fprintf(fptr, "add rsp, %zu\n", oargc*8);
                sp -= oargc;
            }
            size_t ptr = 0;
            bool pad = sp % 2 != 0; // Some functions expect rsp to be aligned pefectly to 16 bytes
            if (pad) {
                fprintf(fptr, "sub rsp, 8\n");
                ptr += 1;
            }
            for (size_t i = 0; i < argc; ++i) {
                fprintf(fptr, "push [rsp+%zu]\n", ptr+8);
                ptr += 1;
            }
            fprintf(fptr, "call r13\n");
            if (pad && oargc < ra_cnt) {
                fprintf(fptr, "add rsp, 8\n");
            }
            if (oargc >= ra_cnt) {
                fprintf(fptr, "add rsp, %zu\n", (ptr+oargc)*8);
            }
        } else if (sv_starts_cstr(line, "pux")) {
            size_t argc = sv_parse_size(line3);
            assert(argc < 6 && "Too many args");
            for (size_t i = 0; i < argc; ++i) {
                fprintf(fptr, "movq xmm%d, qword [rsp+%zu]\n", i, (argc-i)*8-8);
            }
            sp -= argc;
            fprintf(fptr, "add rsp, %zu\n", argc*8);
        } else if (sv_starts_cstr(line, "str")) {
            fprintf(fptr, "section .rodata\n");
            fprintf(fptr, "string: db "Fmt_SV"\n", Pass_SV(line3));
            break;
        } else {
            fprintf(stderr, "Unreachable: "Fmt_SV"\n", Pass_SV(line));
            return 1;
        }
    }
    fclose(fptr);
    // XXX: dirty
    static char *pargv[32];
    pargv[0] = "nasm";
    pargv[1] = "-g";
    pargv[2] = "-fELF64";
    pargv[3] = asmname;
    pargv[4] = "-o";
    pargv[5] = objname;
    pargv[6] = NULL;
    pid_t pid = fork();
    if (pid == 0) {
        fprintf(stderr, "Starting assemblage\n");
        execvp(pargv[0], pargv);
    } else if (pid < 0) {
        perror("fork");
        return 1;
    }
    int status;
    waitpid(pid, &status, 0);
    if (!WIFEXITED(status)) {
        fprintf(stderr, "Assembler exited abnormally: %d\n", WEXITSTATUS(status));
        return 1;
    }

    pargv[0] = "cc";
    pargv[1] = "-no-pie";
    pargv[2] = "-o";
    pargv[3] = binname;
    pargv[4] = objname;
    size_t pargc = 0; // XXX: very dirty
    while (pargc < 25) {
        pargv[pargc+5] = argv[pargc+3];
        ++pargc;
    }
    // TODO: error messaging if no

    pid = fork();
    if (pid == 0) {
        fprintf(stderr, "Starting linkage\n");
        execvp(pargv[0], pargv);
    } else if (pid < 0) {
        perror("fork");
        return 1;
    }
    waitpid(pid, &status, 0);
    if (!WIFEXITED(status)) {
        fprintf(stderr, "Linker exited abnormally: %d\n", WEXITSTATUS(status));
        return 1;
    }

/*

open(sys.argv[2]+'.s', "w").write(out)
subprocess.run(["nasm", "-g", "-fELF64", sys.argv[2]+'.s', "-o", sys.argv[2]+'.o'])
subprocess.run(["cc", "-no-pie", "-o", sys.argv[2], sys.argv[2]+'.o']+sys.argv[3:])
*/
}
