/*
This is the first viable version of the sbc compiler.

This version of the compiler is released as Public Domain.
THIS VERSION OF THE COMPILER HAS BEEN OUTDATED AND SHOULD BE USED ONLY AS A HISTORICAL REFERENCE.
*/

#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <sys/wait.h>

typedef struct {
    char name[32];
    size_t frame_offset;
} Variable;

static char active_character = 0;
#define STREAM_CAPACITY 1024
static char stream[STREAM_CAPACITY];
static size_t stream_size = 0;

#define VARIABLES_CAPACITY 32
static Variable variables[VARIABLES_CAPACITY];
static size_t variables_count = 0;

FILE *input_file = NULL;
FILE *output_file = NULL;
static int do_output_parse = 0;

static int break_address = 0;
static int continue_address = 0;

void push(char c) {
    // TODOOO: Avoid overflows.
    stream[stream_size++] = c;
}

void next() {
    if (stream_size != 0) {
        active_character = stream[0];
        memmove(stream, stream+1, stream_size--);
    }
    else {
        active_character = fgetc(input_file);
        if (do_output_parse) fprintf(stderr, "%c", active_character);
    }
    if (active_character == '/') {
        char c = fgetc(input_file);
        if (c == '*') {
            for (;;) {
                c = fgetc(input_file);
                if (c == '*') {
                    c = fgetc(input_file);
                    if (c == '/') break;
                }
            }
            active_character = fgetc(input_file);
        }
        else {
            push(c);
        }
    }
}

void nextr() {
    active_character = fgetc(input_file);
}

char peek() {
    if (active_character == 0) {
        next();
    }
    return active_character;
}

void emit(char c) {
    fputc(c, output_file);
}

void emits(const char *s) {
    fprintf(output_file, "%s", s);
}

void emitd(size_t zu) {
    fprintf(output_file, "%zu", zu);
}

void whitespace() {
    while (isspace(peek())) {
        next();
    }
}

void expect(char c) {
    if (peek() != c) {
        fprintf(stderr, "Expected '%c' but got '%c'.\n", c, peek());
        exit(1);
    }
    next();
}

#define STRING_BUFFER_CAP 64*1024
static char string_buffer[STRING_BUFFER_CAP] = {0};
static size_t string_buffer_size = 0;

#define NAME_BUFFER_CAP 512
static char name_buffer[NAME_BUFFER_CAP] = {0};

void expr();

void primary();
void lexpr() {
    whitespace();
    char c = peek();
    int found = 0;
    if (isalpha(c)) {
        size_t i = 0;
        while (isalnum(c)) {
            if (i >= NAME_BUFFER_CAP - 1) {
                fprintf(stderr, "Too long name\n", c);
                exit(1);
            }
            name_buffer[i++] = c;
            next();
            c = peek();
        }
        name_buffer[i] = '\0';
        for (i = 0; i < variables_count; ++i) {
            if (strcmp(variables[i].name, name_buffer) == 0) {
                emits("\tlea rax, [rbp-");
                emitd(variables[i].frame_offset);
                emits("]\n");
                found = 1;
                break;
            }
        }
        if (!found) {
            emits("\tmov rax, ");
            emits(name_buffer);
            emits("\n");
        }
    }
    else if (c == '(') {
        next();
        lexpr();
        expect(')');
    }
    else if (c == '*') {
        next();
        primary();
    }
    else {
        fprintf(stderr, "Invalid left expression: '%c'\n", c);
        exit(1);
    }
    whitespace();
    c = peek();
    if (c == '[') {
        if (found) emits("\tmov rax, [rax]\n");
        emits("\tpush rax\n");
        next();
        expr();
        expect(']');
        emits("\tpop rcx\n");
        emits("\tlea rax, [rcx+rax*8]\n");
    }
}

const char *ra[6] = {
    "rdi", "rsi", "rdx", "rcx", "r8", "r9"
};

void primary() {
    whitespace();
    char c = peek();
    if (isdigit(c)) {
        emits("\tmov rax, ");
        if (c == '0') {
            next();
            c = peek();
            emit('0');
            if (c == 'x') {
                emit('x');
                next();
                c = peek();
                while (isxdigit(c)) {
                    emit(c);
                    next();
                    c = peek();
                }
            }
        }
        else {
            while (isdigit(c)) {
                emit(c);
                next();
                c = peek();
            }
        }
        emit('\n');
    }
    else if (isalpha(c)) {
        size_t i = 0;
        while (isalnum(c)) {
            if (i >= NAME_BUFFER_CAP - 1) {
                fprintf(stderr, "Too long name\n", c);
                exit(1);
            }
            name_buffer[i++] = c;
            // printf("'%c'\n", c);
            next();
            c = peek();
        }
        name_buffer[i] = '\0';
        int found = 0;
        for (i = 0; i < variables_count; ++i) {
            if (strcmp(variables[i].name, name_buffer) == 0) {
                emits("\tmov rax, [rbp-");
                emitd(variables[i].frame_offset);
                emits("]\n");
                found = 1;
                break;
            }
        }
        if (!found) {
            emits("\tmov rax, ");
            emits(name_buffer);
            emits("\n");
        }
    }
    else if (c == '(') {
        next();
        expr();
        expect(')');
    }
    else if (c == '&') {
        next();
        lexpr();
    }
    else if (c == '*') {
        next();
        primary();
        emits("\tmov rcx, [rax]\n");
        emits("\tmov rax, rcx\n");
    }
    else if (c == '"') {
        nextr();
        c = peek();
        size_t start_index = string_buffer_size;
        // TODOOO: Avoid overflows.
        while (peek() != '"') {
            c = peek();
            if (c == '\\') {
                nextr();
                c = peek();
                if (c == 'n') {
                    string_buffer[string_buffer_size++] = '\n';
                }
                else if (c == 't') {
                    string_buffer[string_buffer_size++] = '\t';
                }
                else if (c == '\\') {
                    string_buffer[string_buffer_size++] = '\\';
                }
                else {
                    fprintf(stderr, "Invalid escape code: '\\%c'\n", c);
                    exit(1);
                }
                c = 0;
            }
            else {
                string_buffer[string_buffer_size++] = c;
            }
            nextr();
        }
        nextr();
        string_buffer[string_buffer_size++] = '\0';
        emits("\tlea rax, [abs string+");
        emitd(start_index);
        emits("]\n");
    }
    else if (c == '-') {
        next();
        primary();
        emits("\tneg rax\n");
    }
    else if (c == '!') {
        next();
        primary();
        emits("\ttest rax, rax\n");
        emits("\tsetz al\n");
        emits("\tmovzx rax, al\n");
    }
    else if (c == '*') {
        next();
        primary();
        emits("\tmov rax, [rax]\n");
    }
    else {
        fprintf(stderr, "Invalid primary expression: '%c'\n", c);
        exit(1);
    }
    whitespace();
    c = peek();
    if (c == '(') {
        next();
        emits("\tpush r13\n");
        emits("\tmov r13, rax\n");
        whitespace();
        int argc = 0;
        if (peek() != ')') {
            for(int i = 0; i < 6; ++i) { // TODOO: Allow more than 6 arguments
                argc++;
                expr();
                emits("\tpush ");
                emits(ra[i]);
                emits("\n\tmov ");
                emits(ra[i]);
                emits(", rax\n");
                whitespace();
                c = peek();
                if (c == ',') {
                    next();
                }
                if (c == ')') {
                    break;
                }
            }
        }
        expect(')');
        if (!(argc&1)) {
            emits("\tpush 0\n");
        }
        // emits("\tmov r9, rsp\n");
        // emits("\tmov r8, r9\n");
        // emits("\tand r8, 15\n");
        // emits("\tsub rsp, r8\n");
        // emits("\tpush r9\n");
        // emits("\tpush 0\n");
        emits("\txor rax, rax\n");
        emits("\tcall r13\n");
        // emits("\tpop r9\n");
        // emits("\tpop rsp\n");
        if (!(argc&1)) {
            emits("\tadd rsp, 8\n");
        }
        for(int i = 0; i < argc; ++i) {
            emits("\tpop ");
            emits(ra[argc-i-1]);
            emit('\n');
        }
        emits("\tpop r13\n");
    }
    whitespace();
    c = peek();
    if (c == '[') {
        emits("\tpush rax\n");
        next();
        expr();
        expect(']');
        emits("\tpop rcx\n");
        emits("\tmov rax, [rcx+rax*8]\n");
    }
}

void expr() {
    primary();
    whitespace();
    for (;;) {
        char c = peek();
        if (c == '+') {
            next();
            emits("\tpush rax\n");
            primary();
            whitespace();
            emits("\tmov rcx, rax\n");
            emits("\tpop rax\n");
            emits("\tadd rax, rcx\n");
        }
        else if (c == '-') {
            next();
            emits("\tpush rax\n");
            primary();
            whitespace();
            emits("\tmov rcx, rax\n");
            emits("\tpop rax\n");
            emits("\tsub rax, rcx\n");
        }
        else if (c == '&') {
            next();
            emits("\tpush rax\n");
            primary();
            whitespace();
            emits("\tmov rcx, rax\n");
            emits("\tpop rax\n");
            emits("\tand rax, rcx\n");
        }
        else if (c == '|') {
            next();
            emits("\tpush rax\n");
            primary();
            whitespace();
            emits("\tmov rcx, rax\n");
            emits("\tpop rax\n");
            emits("\tor rax, rcx\n");
        }
        else if (c == '^') {
            next();
            emits("\tpush rax\n");
            primary();
            whitespace();
            emits("\tmov rcx, rax\n");
            emits("\tpop rax\n");
            emits("\txor rax, rcx\n");
        }
        else if (c == '*') {
            next();
            emits("\tpush rax\n");
            primary();
            whitespace();
            emits("\tmov rcx, rax\n");
            emits("\tpop rax\n");
            emits("\tmul rcx\n");
        }
        else if (c == '/') {
            next();
            emits("\tpush rax\n");
            primary();
            whitespace();
            emits("\tmov rcx, rax\n");
            emits("\tpop rax\n");
            emits("\txor rdx, rdx\n");
            emits("\tdiv rcx\n");
        }
        else if (c == '%') {
            next();
            emits("\tpush rax\n");
            primary();
            whitespace();
            emits("\tmov rcx, rax\n");
            emits("\tpop rax\n");
            emits("\txor rdx, rdx\n");
            emits("\tdiv rcx\n");
            emits("\tmov rax, rdx\n");
        }
        else if (c == '=') {
            next();
            expect('=');
            emits("\tpush rax\n");
            primary();
            whitespace();
            emits("\tmov rcx, rax\n");
            emits("\tpop rax\n");
            emits("\tcmp rax, rcx\n");
            emits("\tsete al\n");
            emits("\tmovzx rax, al\n");
        }
        else if (c == '!') {
            next();
            expect('=');
            emits("\tpush rax\n");
            primary();
            whitespace();
            emits("\tmov rcx, rax\n");
            emits("\tpop rax\n");
            emits("\tcmp rax, rcx\n");
            emits("\tsetne al\n");
            emits("\tmovzx rax, al\n");
        }
        else if (c == '<') {
            next();
            int mode = 0;
            if (peek() == '=') {
                mode = 1;
                next();
            }
            else if (peek() == '<') {
                mode = 2;
                next();
            }
            emits("\tpush rax\n");
            primary();
            whitespace();
            emits("\tmov rcx, rax\n");
            emits("\tpop rax\n");
            if (mode == 2)
                emits("\tshl rax, cl\n");
            else {
                emits("\tcmp rax, rcx\n");
                if (mode == 1)
                    emits("\tsetbe al\n");
                else
                    emits("\tsetb al\n");
            }
            emits("\tmovzx rax, al\n");
        }
        else if (c == '>') {
            next();
            int mode = 0;
            if (peek() == '=') {
                mode = 1;
                next();
            }
            else if (peek() == '>') {
                mode = 1;
                next();
            }
            emits("\tpush rax\n");
            primary();
            whitespace();
            emits("\tmov rcx, rax\n");
            emits("\tpop rax\n");
            if (mode == 2)
                emits("\tshr rax, cl\n");
            else {
                emits("\tcmp rax, rcx\n");
                if (mode == 1)
                    emits("\tsetae al\n");
                else
                    emits("\tseta al\n");
            }
            emits("\tmovzx rax, al\n");
        }
        else {
            break;
        }
    }
    whitespace();
    char c = peek();
    if (c == ':') {
        next();
        emits("\tpush rax\n");
        lexpr();
        emits("\tpop rcx\n");
        emits("\tmov [rax], rcx\n");
        emits("\tmov rax, rcx\n");
    }
}

static size_t addr_counter = 0;

int try_word(const char *str) {
    char c;
    const char *_s = str;
    c = peek();
    if (c != *str) {
        return 0;
    }
    _s++;
    next();
    while (*_s) {
        c = peek();
        if (c != *_s) {
            for (const char *i = str; i < _s; ++i) {
                push(*i);
            }
            push(c);
            next();
            return 0;
        }
        _s++;
        next();
    }
    c = peek();
    if (isalnum(c)) { // "if0" won't be considered as "if"
        for (const char *i = str; i < _s; ++i) {
            push(*i);
        }
        push(c);
        next();
        return 0;
    }
    whitespace();
    return 1;
}

void stmt() {
    whitespace();
    char c = peek();
    if (c == '{') {
        next();
        whitespace();
        while (peek() != '}') {
            stmt();
            whitespace();
        }
        next();
        return;
    }
    else if (try_word("continue")) {
        emits("\tjmp .L");
        emitd(continue_address);
        emits(" ; continue\n");
        expect(';');
        return;
    }
    else if (try_word("break")) {
        emits("\tjmp .L");
        emitd(break_address);
        emits(" ; break\n");
        expect(';');
        return;
    }
    else if (try_word("while")) {
        int oca = continue_address;
        int oba = break_address;
        int addr = addr_counter++;
        int addr1 = addr_counter++;
        continue_address = addr;
        break_address = addr1;
        emits(".L");
        emitd(addr);
        emits(": ; white continue\n");
        expr();
        emits("\ttest rax, rax\n");
        emits("\tjz .L");
        emitd(addr1);
        emit('\n');
        stmt();
        emits("jmp .L");
        emitd(addr);
        emit('\n');
        emits(".L");
        emitd(addr1);
        emits(": ; while break\n");
        continue_address = oca;
        break_address = oba;
        return;
    }
    else if (try_word("return")) {
        expr();
        emits("\tleave\n");
        emits("\tret\n");
        whitespace();
        expect(';');
        return;
    }
    else if (try_word("if")) {
        expr();
        // emits(".L");
        // continue_address = addr_counter++;
        // emitd(continue_address);
        // emits(":\n");
        emits("\ttest rax, rax\n");
        emits("\tjz .L");
        int addr = addr_counter++;
        emitd(addr);
        emit('\n');
        stmt();
        whitespace();
        c = peek();
        int has_else = try_word("else");
        size_t addr1 = addr_counter++;
        if (has_else) {
            emits("jmp .L");
            emitd(addr1);
            emit('\n');
        }
        emits(".L");
        emitd(addr);
        emits(": ; if\n");
        if (has_else) {
            stmt();
            emits(".L");
            emitd(addr1);
            emits(": ; else\n");
        }
        return;
    }
    expr();
    whitespace();
    expect(';');
}

void top() {
    for(;;) {
        whitespace();
        char c = peek();
        if (isalpha(c)) {
            size_t i = 0;
            while (isalnum(c)) {
                if (i >= NAME_BUFFER_CAP - 1) {
                    fprintf(stderr, "Too long name\n", c);
                    exit(1);
                }
                name_buffer[i++] = c;
                next();
                c = peek();
            }
            name_buffer[i] = '\0';
            if (strcmp(name_buffer, "global") == 0) {
                emits("global ");
                whitespace();
                c = peek();
                while (isalnum(c)) {
                    if (i >= NAME_BUFFER_CAP - 1) {
                        fprintf(stderr, "Too long name\n", c);
                        exit(1);
                    }
                    emit(c);
                    next();
                    c = peek();
                }
                emit('\n');
            }
            else if (strcmp(name_buffer, "extern") == 0) {
                emits("extern ");
                whitespace();
                c = peek();
                while (isalnum(c)) {
                    if (i >= NAME_BUFFER_CAP - 1) {
                        fprintf(stderr, "Too long name\n", c);
                        exit(1);
                    }
                    emit(c);
                    next();
                    c = peek();
                }
                emit('\n');
            }
            else if (peek() == ';') {
                next();
                emits("section .bss\n");
                emits(name_buffer);
                emits(": resq 1\n");
                emits("section .text\n");
            }
            else if (peek() == '[') {
                next();
                c = peek();
                size_t size = 0;
                if (c == '0') {
                    next();
                    c = peek();
                    if (c == 'x') {
                        next();
                        c = peek();
                        while (isxdigit(c)) {
                            if (c <= '9') {
                                size = size*16+c-'0';
                            }
                            else if (c <= 'A') {
                                size = size*16+c-'A'+10;
                            }
                            else if (c <= 'a') {
                                size = size*16+c-'a'+10;
                            }
                            next();
                            c = peek();
                        }
                    }
                }
                else {
                    while (isdigit(c)) {
                        size = size*10+c-'0';
                        next();
                        c = peek();
                    }
                }
                expect(']');
                expect(';');
                emits("section .bss\n");
                emits(name_buffer);
                emits(": resq ");
                emitd(size);
                emit('\n');
                emits("section .text\n");
            }
            else {
                emits(name_buffer);
                emits(":\n");
                whitespace();
                expect('(');
                whitespace();
                size_t frame_shift = 0;
                variables_count = 0;
                emits("\tpush rbp\n");
                emits("\tmov rbp, rsp\n");

                for(int i = 0; i < 6; ++i) { // TODOO: Allow more than 6 arguments
                    whitespace();

                    c = peek();
                    if (c == ')') {
                        break;
                    }
                    if (!isalpha(c)) {
                        fprintf(stderr, "Bad character: '%c'\n", c);
                        exit(1);
                    }
                    // TBD: Optimize this parsing thingy.
                    // TODOOO: Avoid overflows.
                    Variable *variable = &variables[variables_count++];
                    size_t j = 0;
                    while (isalnum(c)) {
                        variable->name[j++] = c;
                        next();
                        c = peek();
                    }
                    variable->name[j] = '\0';
                    frame_shift += 8;
                    variable->frame_offset = frame_shift;
                    emits("\tmov [rbp-");
                    emitd(frame_shift);
                    emits("], ");
                    emits(ra[i]);
                    emit('\n');

                    if (peek() != ',') {
                        break;
                    }
                    next();
                }
                whitespace();
                expect(')');
                whitespace();

                for(;;) {
                    whitespace();

                    c = peek();
                    if (c == '!') {
                        next();
                        break;
                    }
                    if (!isalpha(c)) {
                        fprintf(stderr, "Bad character: '%c'\n", c);
                        exit(1);
                    }
                    // TBD: Optimize this parsing thingy.
                    // TODOOO: Avoid overflows.
                    Variable *variable = &variables[variables_count++];
                    size_t i = 0;
                    while (isalnum(c)) {
                        variable->name[i++] = c;
                        next();
                        c = peek();
                    }
                    variable->name[i] = '\0';
                    frame_shift += 8;
                    variable->frame_offset = frame_shift;
                    if (peek() != ',') {
                        break;
                    }
                    next();
                }
                frame_shift += 8;
                emits("\tsub rsp, ");
                emitd(frame_shift+16-frame_shift%16);
                emit('\n');

                stmt();
                emits("\tleave\n");
                emits("\tret\n");
            }
        }
        else if (c == EOF) {
            break;
        }
        else {
            fprintf(stderr, "Invalid statement: '%c'\n", c);
            exit(1);
        }
    }
}

void usage(const char *progname) {
    fprintf(stderr, "Usage: %s [-pp] [-g] input-code output-file [linker flags]\n", progname);
}

#define LINKER_ARGV_CAP 64
size_t linker_argc = 0;
char *linker_argv[LINKER_ARGV_CAP];

#define ASSEMBLER_ARGV_CAP 8
size_t assembler_argc = 0;
char *assembler_argv[ASSEMBLER_ARGV_CAP];

int main(int argc, char **argv) {
    if (argc <3) {
        usage(argv[0]);
        return 2;
    }
    int gdb = 0;
    argc--;argv++;
    if (strcmp(argv[0], "-pp") == 0) {
        argc--;argv++;
        do_output_parse = 1;
    }
    if (strcmp(argv[0], "-g") == 0) {
        argc--;argv++;
        gdb = 1;
    }
    input_file = fopen(argv[0], "rb");
    if (!input_file) {
        fprintf(stderr, "Failed to open: %s: %s", argv[0], strerror(errno));
        return 2;
    }
    argc--;argv++;
    char *output_bin_path = argv[0];
    argc--;argv++;
    output_file = fopen("out.s", "wb");
    if (!output_file) {
        fprintf(stderr, "Failed to open: out.s: %s", strerror(errno));
        return 1;
    }
    emits("extern __errno_location\n");
    emits("getErrno:\n");
    emits("\tjmp __errno_location\n");
    emits("Blchar:\n");
    emits("\tmov r10b, [rdi]\n");
    emits("\tmovzx rax, r10b\n");
    emits("\tret\n");
    emits("Bschar:\n");
    emits("\tmov byte [rdi], sil\n");
    emits("\tmovzx rax, sil\n");
    emits("\tret\n");
    top();
    emits("section .rodata\n");
    emits("string: db ");
    emitd(string_buffer[0]);
    for (size_t i = 1; i < string_buffer_size; ++i) {
        emits(", ");
        emitd(string_buffer[i]);
    }
    emit('\n');
    printf("\n");
    fclose(input_file);
    fclose(output_file);

    // Args
    assembler_argv[assembler_argc++] = "nasm";
    if (gdb) {
        assembler_argv[assembler_argc++] = "-g";
    }
    assembler_argv[assembler_argc++] = "-fELF64";
    assembler_argv[assembler_argc++] = "out.s";
    assembler_argv[assembler_argc++] = "-o";
    assembler_argv[assembler_argc++] = "out.o";
    assembler_argv[assembler_argc++] = NULL;
    linker_argv[linker_argc++] = "cc";
    linker_argv[linker_argc++] = "-no-pie";
    linker_argv[linker_argc++] = "-o";
    linker_argv[linker_argc++] = output_bin_path;
    linker_argv[linker_argc++] = "out.o";
    while (argc) {
        linker_argv[linker_argc++] = argv[0];
        argc--;argv++;
    }
    linker_argv[linker_argc++] = NULL;

    pid_t pid;
    int status;

    // Assembler
    pid = fork();
    if (pid == 0) {
        fprintf(stderr, "Starting assembling\n");
        execvp(assembler_argv[0], assembler_argv);
        // No return
    }
    else if (pid < 0) {
        perror("fork");
        return 1;
    }
    waitpid(pid, &status, 0);
    if (!WIFEXITED(status)) {
        fprintf(stderr, "Assembler exited abnormally: %d\n", WEXITSTATUS(status));
    }

    // Linker
    pid = fork();
    if (pid == 0) {
        fprintf(stderr, "Starting linking\n");
        execvp(linker_argv[0], linker_argv);
        // No return
    }
    else if (pid < 0) {
        perror("fork");
        return 1;
    }
    waitpid(pid, &status, 0);
    if (!WIFEXITED(status)) {
        fprintf(stderr, "Linker exited abnormally: %d\n", WEXITSTATUS(status));
    }
    return 0;
}
