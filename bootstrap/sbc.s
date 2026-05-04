extern __errno_location
getErrno:
	jmp __errno_location
Blchar:
	mov r10b, [rdi]
	movzx rax, r10b
	ret
Bschar:
	mov byte [rdi], sil
	movzx rax, sil
	ret
extern fread
extern fwrite
extern printf
extern fprintf
extern stderr
extern isspace
extern isdigit
extern isxdigit
extern isalpha
extern isalnum
extern exit
extern strcmp
extern fopen
extern strerror
extern perror
extern fclose
extern fork
extern execvp
extern waitpid
extern memmove
section .bss
variables: resq 160
section .text
section .bss
varcnt: resq 1
section .text
section .bss
activecharacter: resq 1
section .text
section .bss
stream: resq 128
section .text
section .bss
streamsize: resq 1
section .text
section .bss
inputfile: resq 1
section .text
section .bss
outputfile: resq 1
section .text
section .bss
dooutputparse: resq 1
section .text
push:
	push rbp
	mov rbp, rsp
	mov [rbp-8], rdi
	sub rsp, 32
	mov rax, Bschar
	push r13
	mov r13, rax
	mov rax, stream
	push rax
	mov rax, streamsize
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
	mov rax, [rbp-8]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	mov rax, streamsize
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, streamsize
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	leave
	ret
next:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, streamsize
	mov rax, [rax]
	test rax, rax
	jz .L0
	mov rax, Blchar
	push r13
	mov r13, rax
	mov rax, stream
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	push rax
	mov rax, activecharacter
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, memmove
	push r13
	mov r13, rax
	mov rax, stream
	push rdi
	mov rdi, rax
	mov rax, stream
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rsi
	mov rsi, rax
	mov rax, streamsize
	mov rax, [rax]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, streamsize
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	mov rax, streamsize
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L1
.L0: ; if
	mov rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, activecharacter
	mov rax, [rax]
	push rax
	mov rax, 47
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L2
	mov rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, activecharacter
	mov rax, [rax]
	push rax
	mov rax, 42
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L3
.L4: ; while continue
	mov rax, 1
	test rax, rax
	jz .L5
	mov rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, activecharacter
	mov rax, [rax]
	push rax
	mov rax, 42
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L6
	mov rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, activecharacter
	mov rax, [rax]
	push rax
	mov rax, 47
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L7
	jmp .L5 ; break
.L7: ; if
.L6: ; if
jmp .L4
.L5: ; while break
	mov rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L10
.L3: ; if
	mov rax, activecharacter
	mov rax, [rax]
	push rax
	mov rax, 47
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L11
.L12: ; while continue
	mov rax, 1
	test rax, rax
	jz .L13
	mov rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, activecharacter
	mov rax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L14
	jmp .L13 ; break
.L14: ; if
jmp .L12
.L13: ; while break
	mov rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L16
.L11: ; if
	mov rax, push
	push r13
	mov r13, rax
	mov rax, activecharacter
	mov rax, [rax]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, 47
	push rax
	mov rax, activecharacter
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L16: ; else
.L10: ; else
.L2: ; if
.L1: ; else
	mov rax, activecharacter
	mov rax, [rax]
	leave
	ret
nextr:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, fread
	push r13
	mov r13, rax
	mov rax, activecharacter
	push rdi
	mov rdi, rax
	mov rax, 1
	push rsi
	mov rsi, rax
	mov rax, 1
	push rdx
	mov rdx, rax
	mov rax, inputfile
	mov rax, [rax]
	push rcx
	mov rcx, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	pop r13
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L18
	mov rax, 0xFF
	push rax
	mov rax, activecharacter
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L18: ; if
	mov rax, dooutputparse
	mov rax, [rax]
	test rax, rax
	jz .L20
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+0]
	push rsi
	mov rsi, rax
	mov rax, activecharacter
	mov rax, [rax]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
.L20: ; if
	mov rax, activecharacter
	mov rax, [rax]
	leave
	ret
peek:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, activecharacter
	mov rax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L22
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L23
.L22: ; if
	mov rax, activecharacter
	mov rax, [rax]
.L23: ; else
	leave
	ret
emit:
	push rbp
	mov rbp, rsp
	mov [rbp-8], rdi
	sub rsp, 32
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, outputfile
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+3]
	push rsi
	mov rsi, rax
	mov rax, [rbp-8]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	leave
	ret
emits:
	push rbp
	mov rbp, rsp
	mov [rbp-8], rdi
	sub rsp, 32
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, outputfile
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+6]
	push rsi
	mov rsi, rax
	mov rax, [rbp-8]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	leave
	ret
emitd:
	push rbp
	mov rbp, rsp
	mov [rbp-8], rdi
	sub rsp, 32
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, outputfile
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+9]
	push rsi
	mov rsi, rax
	mov rax, [rbp-8]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	leave
	ret
section .bss
continueaddress: resq 1
section .text
section .bss
breakaddress: resq 1
section .text
section .bss
addrcounter: resq 1
section .text
section .bss
namebuffer: resq 64
section .text
section .bss
strbuf: resq 1024
section .text
section .bss
strbufsz: resq 1
section .text
section .bss
ra: resq 6
section .text
whitespace:
	push rbp
	mov rbp, rsp
	sub rsp, 16
.L24: ; while continue
	mov rax, isspace
	push r13
	mov r13, rax
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L25
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L24
.L25: ; while break
	leave
	ret
expect:
	push rbp
	mov rbp, rsp
	mov [rbp-8], rdi
	sub rsp, 32
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	push rax
	mov rax, [rbp-8]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L26
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L27
.L26: ; if
	mov rax, printf
	push r13
	mov r13, rax
	lea rax, [abs string+13]
	push rdi
	mov rdi, rax
	mov rax, [rbp-8]
	push rsi
	mov rsi, rax
	mov rax, [rbp-16]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, exit
	push r13
	mov r13, rax
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L27: ; else
	leave
	ret
lexpr:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, 0
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, isalpha
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L28
	mov rax, 0
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L29: ; while continue
	mov rax, isalnum
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L30
	mov rax, Bschar
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rax
	mov rax, [rbp-16]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
	mov rax, [rbp-8]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-16]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L29
.L30: ; while break
	mov rax, Bschar
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rax
	mov rax, [rbp-16]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
	mov rax, 0
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	mov rax, 0
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L31: ; while continue
	mov rax, [rbp-16]
	push rax
	mov rax, varcnt
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L32
	mov rax, strcmp
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rdi
	mov rdi, rax
	mov rax, variables
	push rax
	mov rax, [rbp-16]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	mul rcx
	pop rcx
	lea rax, [rcx+rax*8]
	push rax
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L33
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+37]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, variables
	push rax
	mov rax, [rbp-16]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	mul rcx
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+53]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, 1
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	jmp .L32 ; break
.L33: ; if
	mov rax, [rbp-16]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L31
.L32: ; while break
	mov rax, [rbp-24]
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L35
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+56]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+67]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L35: ; if
jmp .L37
.L28: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 40
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L38
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 41
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L39
.L38: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 42
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L40
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L41
.L40: ; if
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+69]
	push rsi
	mov rsi, rax
	mov rax, [rbp-8]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, exit
	push r13
	mov r13, rax
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L41: ; else
.L39: ; else
.L37: ; else
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 91
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L42
	mov rax, [rbp-24]
	test rax, rax
	jz .L43
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+100]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L43: ; if
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+117]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 93
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+128]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+138]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L42: ; if
	leave
	ret
parseEscapeCode:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 110
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L46
	mov rax, 10
jmp .L47
.L46: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 116
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L48
	mov rax, 9
jmp .L49
.L48: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 92
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L50
	mov rax, 92
jmp .L51
.L50: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 39
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L52
	mov rax, 39
jmp .L53
.L52: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 120
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L54
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, isxdigit
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L55
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+161]
	push rsi
	mov rsi, rax
	mov rax, [rbp-8]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, exit
	push r13
	mov r13, rax
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L55: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 57
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L57
	mov rax, [rbp-8]
	push rax
	mov rax, 48
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L58
.L57: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 102
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L59
	mov rax, [rbp-8]
	push rax
	mov rax, 97
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L60
.L59: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 70
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L61
	mov rax, [rbp-8]
	push rax
	mov rax, 65
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L61: ; if
.L60: ; else
.L58: ; else
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, isxdigit
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L63
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+195]
	push rsi
	mov rsi, rax
	mov rax, [rbp-8]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, exit
	push r13
	mov r13, rax
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L63: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 57
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L65
	mov rax, [rbp-16]
	push rax
	mov rax, 16
	mov rcx, rax
	pop rax
	mul rcx
	push rax
	mov rax, [rbp-8]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L66
.L65: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 102
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L67
	mov rax, [rbp-16]
	push rax
	mov rax, 16
	mov rcx, rax
	pop rax
	mul rcx
	push rax
	mov rax, [rbp-8]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 97
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L68
.L67: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 70
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L69
	mov rax, [rbp-16]
	push rax
	mov rax, 16
	mov rcx, rax
	pop rax
	mul rcx
	push rax
	mov rax, [rbp-8]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 65
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L69: ; if
.L68: ; else
.L66: ; else
	mov rax, [rbp-16]
jmp .L71
.L54: ; if
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+229]
	push rsi
	mov rsi, rax
	mov rax, [rbp-8]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, exit
	push r13
	mov r13, rax
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L71: ; else
.L53: ; else
.L51: ; else
.L49: ; else
.L47: ; else
	leave
	ret
	leave
	ret
primary:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, 0
	push rax
	lea rax, [rbp-40]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, isdigit
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L72
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+257]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-8]
	push rax
	mov rax, 48
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L73
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+268]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-8]
	push rax
	mov rax, 120
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L74
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+270]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L75: ; while continue
	mov rax, isxdigit
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L76
	mov rax, emit
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L75
.L76: ; while break
.L74: ; if
jmp .L78
.L73: ; if
.L79: ; while continue
	mov rax, isdigit
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L80
	mov rax, emit
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L79
.L80: ; while break
.L78: ; else
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+272]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L81
.L72: ; if
	mov rax, isalpha
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L82
	mov rax, 0
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L83: ; while continue
	mov rax, isalnum
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L84
	mov rax, Bschar
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rax
	mov rax, [rbp-24]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
	mov rax, [rbp-8]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-24]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L83
.L84: ; while break
	mov rax, Bschar
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rax
	mov rax, [rbp-24]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
	mov rax, 0
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	mov rax, 0
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L85: ; while continue
	mov rax, [rbp-24]
	push rax
	mov rax, varcnt
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L86
	mov rax, strcmp
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rdi
	mov rdi, rax
	mov rax, variables
	push rax
	mov rax, [rbp-24]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	mul rcx
	pop rcx
	lea rax, [rcx+rax*8]
	push rax
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L87
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+274]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, variables
	push rax
	mov rax, [rbp-24]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	mul rcx
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+290]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, 1
	push rax
	lea rax, [rbp-40]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	jmp .L86 ; break
.L87: ; if
	mov rax, [rbp-24]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L85
.L86: ; while break
	mov rax, [rbp-40]
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L89
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+293]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+304]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L89: ; if
jmp .L91
.L82: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 123
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L92
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L93: ; while continue
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	mov rax, 125
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L94
	mov rax, stmt
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L93
.L94: ; while break
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L95
.L92: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 40
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L96
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 41
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L97
.L96: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 38
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L98
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L99
.L98: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 42
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L100
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+306]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L101
.L100: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 126
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L102
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+323]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L103
.L102: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 39
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L104
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 92
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L105
	mov rax, parseEscapeCode
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L105: ; if
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 39
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+333]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+344]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L107
.L104: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L108
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, strbufsz
	mov rax, [rax]
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L109: ; while continue
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	push rax
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L110
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 92
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L111
	mov rax, parseEscapeCode
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L111: ; if
	mov rax, Bschar
	push r13
	mov r13, rax
	mov rax, strbuf
	push rax
	mov rax, strbufsz
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
	mov rax, [rbp-8]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	mov rax, strbufsz
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, strbufsz
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L109
.L110: ; while break
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, Bschar
	push r13
	mov r13, rax
	mov rax, strbuf
	push rax
	mov rax, strbufsz
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
	mov rax, 0
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	mov rax, strbufsz
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, strbufsz
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+346]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, [rbp-16]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+369]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L113
.L108: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 45
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L114
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+372]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L115
.L114: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 33
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L116
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+382]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+398]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+408]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L117
.L116: ; if
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+424]
	push rsi
	mov rsi, rax
	mov rax, [rbp-8]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, exit
	push r13
	mov r13, rax
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L117: ; else
.L115: ; else
.L113: ; else
.L107: ; else
.L103: ; else
.L101: ; else
.L99: ; else
.L97: ; else
.L95: ; else
.L91: ; else
.L81: ; else
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 40
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L118
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+458]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+469]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, 0
	push rax
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	mov rax, 41
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L119
	mov rax, 0
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L120: ; while continue
	mov rax, [rbp-24]
	push rax
	mov rax, 6
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L121
	mov rax, [rbp-32]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+484]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	mov rax, ra
	push rax
	mov rax, [rbp-24]
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+491]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	mov rax, ra
	push rax
	mov rax, [rbp-24]
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+498]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 44
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L122
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L123
.L122: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 41
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L124
	jmp .L121 ; break
.L124: ; if
.L123: ; else
	mov rax, [rbp-24]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L120
.L121: ; while break
.L119: ; if
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 41
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-32]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	and rax, rcx
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L127
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+505]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L127: ; if
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+514]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+529]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-32]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	and rax, rcx
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L129
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+540]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L129: ; if
	mov rax, 0
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L131: ; while continue
	mov rax, [rbp-24]
	push rax
	mov rax, [rbp-32]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L132
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+553]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	mov rax, ra
	push rax
	mov rax, [rbp-32]
	push rax
	mov rax, [rbp-24]
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+559]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-24]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L131
.L132: ; while break
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+561]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L118: ; if
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 91
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L134
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+571]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 93
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+582]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+592]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L134: ; if
	leave
	ret
expr:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L136: ; while continue
	mov rax, 1
	test rax, rax
	jz .L137
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 43
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L138
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+615]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+626]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+641]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+651]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L139
.L138: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 45
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L140
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+666]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+677]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+692]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+702]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L141
.L140: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 38
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L142
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+717]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+728]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+743]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+753]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L143
.L142: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 124
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L144
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+768]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+779]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+794]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+804]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L145
.L144: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 94
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L146
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+818]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+829]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+844]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+854]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L147
.L146: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 42
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L148
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+869]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+880]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+895]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+905]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L149
.L148: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 47
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L150
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+915]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+926]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+941]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+951]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+966]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L151
.L150: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 37
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L152
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+976]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+987]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1002]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1012]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1027]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1037]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L153
.L152: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L154
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 61
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1052]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1063]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1078]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1088]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1103]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1113]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L155
.L154: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 33
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L156
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 61
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1129]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1140]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1155]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1165]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1180]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1191]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L157
.L156: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 60
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L158
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, 0
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L159
	mov rax, 1
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L160
.L159: ; if
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	mov rax, 60
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L161
	mov rax, 2
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L161: ; if
.L160: ; else
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1207]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1218]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1233]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-16]
	push rax
	mov rax, 2
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L163
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1243]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L164
.L163: ; if
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1257]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-16]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L165
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1272]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L166
.L165: ; if
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1283]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L166: ; else
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1293]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L164: ; else
jmp .L167
.L158: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 62
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L168
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, 0
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L169
	mov rax, 1
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L170
.L169: ; if
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	mov rax, 62
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L171
	mov rax, 2
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L171: ; if
.L170: ; else
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1309]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1320]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1335]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-16]
	push rax
	mov rax, 2
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L173
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1345]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L174
.L173: ; if
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1359]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-16]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L175
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1374]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L176
.L175: ; if
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1385]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L176: ; else
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1395]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L174: ; else
jmp .L177
.L168: ; if
	jmp .L137 ; break
.L177: ; else
.L167: ; else
.L157: ; else
.L155: ; else
.L153: ; else
.L151: ; else
.L149: ; else
.L147: ; else
.L145: ; else
.L143: ; else
.L141: ; else
.L139: ; else
jmp .L136
.L137: ; while break
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 58
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L178
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1411]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1422]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1432]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1449]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L178: ; if
	leave
	ret
section .bss
addrcnt: resq 1
section .text
tryword:
	push rbp
	mov rbp, rsp
	mov [rbp-8], rdi
	sub rsp, 48
	mov rax, [rbp-8]
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-16]
	push rax
	mov rax, Blchar
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L180
	mov rax, 0
	leave
	ret
.L180: ; if
	mov rax, [rbp-24]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L182: ; while continue
	mov rax, Blchar
	push r13
	mov r13, rax
	mov rax, [rbp-24]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L183
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-16]
	push rax
	mov rax, Blchar
	push r13
	mov r13, rax
	mov rax, [rbp-24]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L184
	mov rax, [rbp-8]
	push rax
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L185: ; while continue
	mov rax, [rbp-32]
	push rax
	mov rax, [rbp-24]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L186
	mov rax, push
	push r13
	mov r13, rax
	mov rax, [rbp-32]
	mov rax, [rax]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-32]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L185
.L186: ; while break
	mov rax, push
	push r13
	mov r13, rax
	mov rax, [rbp-16]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, 0
	leave
	ret
.L184: ; if
	mov rax, [rbp-24]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L182
.L183: ; while break
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, isalnum
	push r13
	mov r13, rax
	mov rax, [rbp-16]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L188
	mov rax, [rbp-8]
	push rax
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L189: ; while continue
	mov rax, [rbp-32]
	push rax
	mov rax, [rbp-24]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L190
	mov rax, push
	push r13
	mov r13, rax
	mov rax, [rbp-32]
	mov rax, [rax]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-32]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L189
.L190: ; while break
	mov rax, push
	push r13
	mov r13, rax
	mov rax, [rbp-16]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, 0
	leave
	ret
.L188: ; if
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, 1
	leave
	ret
	leave
	ret
stmt:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 123
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L192
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L193: ; while continue
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	mov rax, 125
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L194
	mov rax, stmt
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L193
.L194: ; while break
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, 0
	leave
	ret
jmp .L195
.L192: ; if
	mov rax, tryword
	push r13
	mov r13, rax
	lea rax, [abs string+1464]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L196
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1473]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, continueaddress
	mov rax, [rax]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1481]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 59
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, 0
	leave
	ret
jmp .L197
.L196: ; if
	mov rax, tryword
	push r13
	mov r13, rax
	lea rax, [abs string+1494]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L198
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1500]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, breakaddress
	mov rax, [rax]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1508]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 59
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, 0
	leave
	ret
jmp .L199
.L198: ; if
	mov rax, tryword
	push r13
	mov r13, rax
	lea rax, [abs string+1518]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L200
	mov rax, continueaddress
	mov rax, [rax]
	push rax
	lea rax, [rbp-40]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, breakaddress
	mov rax, [rax]
	push rax
	lea rax, [rbp-48]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, addrcounter
	mov rax, [rax]
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, addrcounter
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-16]
	push rax
	mov rax, continueaddress
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-24]
	push rax
	mov rax, breakaddress
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, addrcounter
	mov rax, [rax]
	push rax
	mov rax, 2
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, addrcounter
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1524]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, [rbp-16]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1527]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1547]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1563]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, [rbp-24]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emit
	push r13
	mov r13, rax
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, stmt
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1570]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, [rbp-16]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emit
	push r13
	mov r13, rax
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1577]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, [rbp-24]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1580]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-40]
	push rax
	mov rax, continueaddress
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-48]
	push rax
	mov rax, breakaddress
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, 0
	leave
	ret
jmp .L201
.L200: ; if
	mov rax, tryword
	push r13
	mov r13, rax
	lea rax, [abs string+1597]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L202
	mov rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1604]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1612]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 59
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, 0
	leave
	ret
jmp .L203
.L202: ; if
	mov rax, tryword
	push r13
	mov r13, rax
	lea rax, [abs string+1618]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L204
	mov rax, addrcounter
	mov rax, [rax]
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, addrcounter
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, addrcounter
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1621]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1637]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, [rbp-16]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emit
	push r13
	mov r13, rax
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, stmt
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, tryword
	push r13
	mov r13, rax
	lea rax, [abs string+1644]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	push rax
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, addrcounter
	mov rax, [rax]
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, addrcounter
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, addrcounter
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-32]
	test rax, rax
	jz .L205
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1649]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, [rbp-24]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emit
	push r13
	mov r13, rax
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L205: ; if
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1656]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, [rbp-16]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1659]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-32]
	test rax, rax
	jz .L207
	mov rax, stmt
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1667]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, [rbp-24]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1670]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L207: ; if
	mov rax, 0
	leave
	ret
.L204: ; if
.L203: ; else
.L201: ; else
.L199: ; else
.L197: ; else
.L195: ; else
	mov rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 59
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	leave
	ret
top:
	push rbp
	mov rbp, rsp
	sub rsp, 64
.L210: ; while continue
	mov rax, 1
	test rax, rax
	jz .L211
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, isalpha
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L212
	mov rax, 0
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L213: ; while continue
	mov rax, isalnum
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L214
	mov rax, Bschar
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rax
	mov rax, [rbp-16]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
	mov rax, [rbp-8]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-16]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L213
.L214: ; while break
	mov rax, Bschar
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rax
	mov rax, [rbp-16]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
	mov rax, 0
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	mov rax, strcmp
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rdi
	mov rdi, rax
	lea rax, [abs string+1680]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L215
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1687]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L216: ; while continue
	mov rax, isalnum
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L217
	mov rax, emit
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L216
.L217: ; while break
	mov rax, emit
	push r13
	mov r13, rax
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L218
.L215: ; if
	mov rax, strcmp
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rdi
	mov rdi, rax
	lea rax, [abs string+1695]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L219
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1702]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L220: ; while continue
	mov rax, isalnum
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L221
	mov rax, emit
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L220
.L221: ; while break
	mov rax, emit
	push r13
	mov r13, rax
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L222
.L219: ; if
	mov rax, strcmp
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rdi
	mov rdi, rax
	lea rax, [abs string+1710]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L223
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+1717]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	mov rax, exit
	push r13
	mov r13, rax
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L224
.L223: ; if
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	mov rax, 59
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L225
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1758]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1772]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1782]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L226
.L225: ; if
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	mov rax, 91
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L227
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1797]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1811]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-8]
	push rax
	mov rax, 48
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L228
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1819]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-8]
	push rax
	mov rax, 120
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L229
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1821]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L230: ; while continue
	mov rax, isxdigit
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L231
	mov rax, emit
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L230
.L231: ; while break
.L229: ; if
jmp .L233
.L228: ; if
.L234: ; while continue
	mov rax, isdigit
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L235
	mov rax, emit
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L234
.L235: ; while break
.L233: ; else
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 93
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 59
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1823]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L236
.L227: ; if
	mov rax, emits
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1839]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 40
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, 0
	push rax
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, 0
	push rax
	mov rax, varcnt
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1842]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1853]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, 0
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L237: ; while continue
	mov rax, [rbp-16]
	push rax
	mov rax, 6
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L238
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 41
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L239
	jmp .L238 ; break
.L239: ; if
	mov rax, isalpha
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L241
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+1868]
	push rsi
	mov rsi, rax
	mov rax, [rbp-8]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, exit
	push r13
	mov r13, rax
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L241: ; if
	mov rax, variables
	push rax
	mov rax, varcnt
	mov rax, [rax]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	mul rcx
	pop rcx
	lea rax, [rcx+rax*8]
	push rax
	lea rax, [rbp-40]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, varcnt
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, varcnt
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, 0
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L243: ; while continue
	mov rax, isalnum
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L244
	mov rax, [rbp-8]
	push rax
	lea rax, [rbp-40]
	mov rax, [rax]
	push rax
	mov rax, 1
	pop rcx
	lea rax, [rcx+rax*8]
	push rax
	mov rax, [rbp-24]
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-24]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L243
.L244: ; while break
	mov rax, 0
	push rax
	lea rax, [rbp-40]
	mov rax, [rax]
	push rax
	mov rax, 1
	pop rcx
	lea rax, [rcx+rax*8]
	push rax
	mov rax, [rbp-24]
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-32]
	push rax
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-32]
	push rax
	lea rax, [rbp-40]
	mov rax, [rax]
	push rax
	mov rax, 0
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1889]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, [rbp-32]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1900]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	mov rax, ra
	push rax
	mov rax, [rbp-16]
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1904]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	mov rax, 44
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L245
	jmp .L238 ; break
.L245: ; if
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, [rbp-16]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L237
.L238: ; while break
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, expect
	push r13
	mov r13, rax
	mov rax, 41
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L247: ; while continue
	mov rax, 1
	test rax, rax
	jz .L248
	mov rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 33
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L249
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	jmp .L248 ; break
.L249: ; if
	mov rax, isalpha
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L251
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+1906]
	push rsi
	mov rsi, rax
	mov rax, [rbp-8]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, exit
	push r13
	mov r13, rax
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L251: ; if
	mov rax, variables
	push rax
	mov rax, varcnt
	mov rax, [rax]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	mul rcx
	pop rcx
	lea rax, [rcx+rax*8]
	push rax
	lea rax, [rbp-40]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, varcnt
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, varcnt
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, 0
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L253: ; while continue
	mov rax, isalnum
	push r13
	mov r13, rax
	mov rax, [rbp-8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L254
	mov rax, [rbp-8]
	push rax
	lea rax, [rbp-40]
	mov rax, [rax]
	push rax
	mov rax, 1
	pop rcx
	lea rax, [rcx+rax*8]
	push rax
	mov rax, [rbp-24]
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-24]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L253
.L254: ; while break
	mov rax, 0
	push rax
	lea rax, [rbp-40]
	mov rax, [rax]
	push rax
	mov rax, 1
	pop rcx
	lea rax, [rcx+rax*8]
	push rax
	mov rax, [rbp-24]
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-32]
	push rax
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-32]
	push rax
	lea rax, [rbp-40]
	mov rax, [rax]
	push rax
	mov rax, 0
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	mov rax, 44
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L255
	jmp .L248 ; break
.L255: ; if
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L247
.L248: ; while break
	mov rax, [rbp-32]
	push rax
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1927]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, [rbp-32]
	push rax
	mov rax, 16
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, [rbp-32]
	push rax
	mov rax, 16
	mov rcx, rax
	pop rax
	xor rdx, rdx
	div rcx
	mov rax, rdx
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1938]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, stmt
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1940]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1948]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L236: ; else
.L226: ; else
.L224: ; else
.L222: ; else
.L218: ; else
jmp .L257
.L212: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 0xFF
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L258
	jmp .L211 ; break
jmp .L259
.L258: ; if
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+1954]
	push rsi
	mov rsi, rax
	mov rax, [rbp-8]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, exit
	push r13
	mov r13, rax
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L259: ; else
.L257: ; else
jmp .L210
.L211: ; while break
	leave
	ret
usage:
	push rbp
	mov rbp, rsp
	mov [rbp-8], rdi
	sub rsp, 32
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+1979]
	push rsi
	mov rsi, rax
	mov rax, [rbp-8]
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	leave
	ret
section .bss
linkerargc: resq 1
section .text
section .bss
linkerargv: resq 64
section .text
section .bss
assemblerargc: resq 1
section .text
section .bss
assemblerargv: resq 8
section .text
global main
main:
	push rbp
	mov rbp, rsp
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	sub rsp, 80
	lea rax, [abs string+2039]
	push rax
	mov rax, ra
	push rax
	mov rax, 0
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2043]
	push rax
	mov rax, ra
	push rax
	mov rax, 1
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2047]
	push rax
	mov rax, ra
	push rax
	mov rax, 2
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2051]
	push rax
	mov rax, ra
	push rax
	mov rax, 3
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2055]
	push rax
	mov rax, ra
	push rax
	mov rax, 4
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2058]
	push rax
	mov rax, ra
	push rax
	mov rax, 5
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 3
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L260
	mov rax, usage
	push r13
	mov r13, rax
	mov rax, [rbp-16]
	push rax
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, 2
	leave
	ret
.L260: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-16]
	push rax
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, strcmp
	push r13
	mov r13, rax
	mov rax, [rbp-16]
	push rax
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2061]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L262
	mov rax, [rbp-8]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-16]
	push rax
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, 1
	push rax
	mov rax, dooutputparse
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L262: ; if
	mov rax, strcmp
	push r13
	mov r13, rax
	mov rax, [rbp-16]
	push rax
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2065]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L264
	mov rax, [rbp-8]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-16]
	push rax
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, 1
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L264: ; if
	mov rax, fopen
	push r13
	mov r13, rax
	mov rax, [rbp-16]
	push rax
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2068]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	push rax
	mov rax, inputfile
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, inputfile
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L266
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2071]
	push rsi
	mov rsi, rax
	mov rax, [rbp-16]
	push rax
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rdx
	mov rdx, rax
	mov rax, strerror
	push r13
	mov r13, rax
	mov rax, getErrno
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, [rax]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	push rcx
	mov rcx, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, 2
	leave
	ret
.L266: ; if
	mov rax, [rbp-16]
	push rax
	mov rax, 1
	pop rcx
	mov rax, [rcx+rax*8]
	push rax
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 2
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-16]
	push rax
	mov rax, 16
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, fopen
	push r13
	mov r13, rax
	lea rax, [abs string+2094]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2100]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	push rax
	mov rax, outputfile
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, outputfile
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L268
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2103]
	push rsi
	mov rsi, rax
	mov rax, strerror
	push r13
	mov r13, rax
	mov rax, getErrno
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, [rax]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, 2
	leave
	ret
.L268: ; if
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2129]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2154]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2165]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2188]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2197]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2215]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2233]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2239]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2248]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2270]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2287]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, top
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2293]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2310]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, Blchar
	push r13
	mov r13, rax
	mov rax, strbuf
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, 1
	push rax
	lea rax, [rbp-40]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L270: ; while continue
	mov rax, [rbp-40]
	push rax
	mov rax, strbufsz
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L271
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2322]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emitd
	push r13
	mov r13, rax
	mov rax, Blchar
	push r13
	mov r13, rax
	mov rax, strbuf
	push rax
	mov rax, [rbp-40]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-40]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-40]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L270
.L271: ; while break
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2324]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, fclose
	push r13
	mov r13, rax
	mov rax, inputfile
	mov rax, [rax]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, fclose
	push r13
	mov r13, rax
	mov rax, outputfile
	mov rax, [rax]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	lea rax, [abs string+2326]
	push rax
	mov rax, assemblerargv
	push rax
	mov rax, assemblerargc
	mov rax, [rax]
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, assemblerargc
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, assemblerargc
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-24]
	test rax, rax
	jz .L272
	lea rax, [abs string+2331]
	push rax
	mov rax, assemblerargv
	push rax
	mov rax, assemblerargc
	mov rax, [rax]
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, assemblerargc
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, assemblerargc
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L272: ; if
	lea rax, [abs string+2334]
	push rax
	mov rax, assemblerargv
	push rax
	mov rax, assemblerargc
	mov rax, [rax]
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2342]
	push rax
	mov rax, assemblerargv
	push rax
	mov rax, assemblerargc
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2348]
	push rax
	mov rax, assemblerargv
	push rax
	mov rax, assemblerargc
	mov rax, [rax]
	push rax
	mov rax, 2
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2351]
	push rax
	mov rax, assemblerargv
	push rax
	mov rax, assemblerargc
	mov rax, [rax]
	push rax
	mov rax, 3
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, 0
	push rax
	mov rax, assemblerargv
	push rax
	mov rax, assemblerargc
	mov rax, [rax]
	push rax
	mov rax, 4
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2357]
	push rax
	mov rax, linkerargv
	push rax
	mov rax, linkerargc
	mov rax, [rax]
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2360]
	push rax
	mov rax, linkerargv
	push rax
	mov rax, linkerargc
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2368]
	push rax
	mov rax, linkerargv
	push rax
	mov rax, linkerargc
	mov rax, [rax]
	push rax
	mov rax, 2
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-32]
	push rax
	mov rax, linkerargv
	push rax
	mov rax, linkerargc
	mov rax, [rax]
	push rax
	mov rax, 3
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2371]
	push rax
	mov rax, linkerargv
	push rax
	mov rax, linkerargc
	mov rax, [rax]
	push rax
	mov rax, 4
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, linkerargc
	mov rax, [rax]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, linkerargc
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L274: ; while continue
	mov rax, [rbp-8]
	test rax, rax
	jz .L275
	mov rax, [rbp-16]
	push rax
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rax
	mov rax, linkerargv
	push rax
	mov rax, linkerargc
	mov rax, [rax]
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, linkerargc
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, linkerargc
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-8]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-16]
	push rax
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L274
.L275: ; while break
	mov rax, 0
	push rax
	mov rax, linkerargv
	push rax
	mov rax, linkerargc
	mov rax, [rax]
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, fork
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-48]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-48]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L276
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2377]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	mov rax, execvp
	push r13
	mov r13, rax
	mov rax, assemblerargv
	push rax
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	mov rax, assemblerargv
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
jmp .L277
.L276: ; if
	mov rax, [rbp-48]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L278
	mov rax, perror
	push r13
	mov r13, rax
	lea rax, [abs string+2398]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, 1
	leave
	ret
.L278: ; if
.L277: ; else
	mov rax, 0
	push rax
	lea rax, [rbp-56]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, waitpid
	push r13
	mov r13, rax
	mov rax, [rbp-48]
	push rdi
	mov rdi, rax
	lea rax, [rbp-56]
	push rsi
	mov rsi, rax
	mov rax, 0
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, [rbp-56]
	push rax
	mov rax, 0x7f
	mov rcx, rax
	pop rax
	and rax, rcx
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L280
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2403]
	push rsi
	mov rsi, rax
	mov rax, [rbp-56]
	push rax
	mov rax, 0xff00
	mov rcx, rax
	pop rax
	and rax, rcx
	push rax
	mov rax, 8
	mov rcx, rax
	pop rax
	shr rax, cl
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, 1
	leave
	ret
.L280: ; if
	mov rax, fork
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
	lea rax, [rbp-48]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, [rbp-48]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L282
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2436]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	mov rax, execvp
	push r13
	mov r13, rax
	mov rax, linkerargv
	push rax
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	mov rax, linkerargv
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
jmp .L283
.L282: ; if
	mov rax, [rbp-48]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L284
	mov rax, perror
	push r13
	mov r13, rax
	lea rax, [abs string+2454]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, 1
	leave
	ret
.L284: ; if
.L283: ; else
	mov rax, 0
	push rax
	lea rax, [rbp-56]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, waitpid
	push r13
	mov r13, rax
	mov rax, [rbp-48]
	push rdi
	mov rdi, rax
	lea rax, [rbp-56]
	push rsi
	mov rsi, rax
	mov rax, 0
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, [rbp-56]
	push rax
	mov rax, 0x7f
	mov rcx, rax
	pop rax
	and rax, rcx
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L286
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2459]
	push rsi
	mov rsi, rax
	mov rax, [rbp-56]
	push rax
	mov rax, 0xff00
	mov rcx, rax
	pop rax
	and rax, rcx
	push rax
	mov rax, 8
	mov rcx, rax
	pop rax
	shr rax, cl
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
	mov rax, 1
	leave
	ret
.L286: ; if
	mov rax, 0
	leave
	ret
section .rodata
string: db 37,99,0,37,99,0,37,115,0,37,122,117,0,69,120,112,101,99,116,101,100,32,37,99,32,98,117,116,32,103,111,116,32,37,99,10,0,9,108,101,97,32,114,97,120,44,32,91,114,98,112,45,0,93,10,0,9,109,111,118,32,114,97,120,44,32,0,10,0,73,110,118,97,108,105,100,32,108,101,102,116,32,101,120,112,114,101,115,115,105,111,110,58,32,39,37,99,39,10,0,9,109,111,118,32,114,97,120,44,32,91,114,97,120,93,10,0,9,112,117,115,104,32,114,97,120,10,0,9,112,111,112,32,114,99,120,10,0,9,108,101,97,32,114,97,120,44,32,91,114,99,120,43,114,97,120,42,56,93,10,0,73,110,118,97,108,105,100,32,104,101,120,97,100,101,99,105,109,97,108,32,100,105,103,105,116,58,32,39,92,37,99,39,10,0,73,110,118,97,108,105,100,32,104,101,120,97,100,101,99,105,109,97,108,32,100,105,103,105,116,58,32,39,92,37,99,39,10,0,73,110,118,97,108,105,100,32,101,115,99,97,112,101,32,99,111,100,101,58,32,39,92,37,99,39,10,0,9,109,111,118,32,114,97,120,44,32,0,48,0,120,0,10,0,9,109,111,118,32,114,97,120,44,32,91,114,98,112,45,0,93,10,0,9,109,111,118,32,114,97,120,44,32,0,10,0,9,109,111,118,32,114,97,120,44,32,91,114,97,120,93,10,0,9,110,111,116,32,114,97,120,10,0,9,109,111,118,32,114,97,120,44,32,0,10,0,9,108,101,97,32,114,97,120,44,32,91,97,98,115,32,115,116,114,105,110,103,43,0,93,10,0,9,110,101,103,32,114,97,120,10,0,9,116,101,115,116,32,114,97,120,44,32,114,97,120,10,0,9,115,101,116,122,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,73,110,118,97,108,105,100,32,112,114,105,109,97,114,121,32,101,120,112,114,101,115,115,105,111,110,58,32,39,37,99,39,10,0,9,112,117,115,104,32,114,49,51,10,0,9,109,111,118,32,114,49,51,44,32,114,97,120,10,0,9,112,117,115,104,32,0,10,9,109,111,118,32,0,44,32,114,97,120,10,0,9,112,117,115,104,32,48,10,0,9,120,111,114,32,114,97,120,44,32,114,97,120,10,0,9,99,97,108,108,32,114,49,51,10,0,9,97,100,100,32,114,115,112,44,32,56,10,0,9,112,111,112,32,0,10,0,9,112,111,112,32,114,49,51,10,0,9,112,117,115,104,32,114,97,120,10,0,9,112,111,112,32,114,99,120,10,0,9,109,111,118,32,114,97,120,44,32,91,114,99,120,43,114,97,120,42,56,93,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,97,100,100,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,115,117,98,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,97,110,100,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,111,114,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,120,111,114,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,109,117,108,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,120,111,114,32,114,100,120,44,32,114,100,120,10,0,9,100,105,118,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,120,111,114,32,114,100,120,44,32,114,100,120,10,0,9,100,105,118,32,114,99,120,10,0,9,109,111,118,32,114,97,120,44,32,114,100,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,101,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,110,101,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,115,104,108,32,114,97,120,44,32,99,108,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,98,101,32,97,108,10,0,9,115,101,116,98,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,115,104,114,32,114,97,120,44,32,99,108,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,97,101,32,97,108,10,0,9,115,101,116,97,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,112,111,112,32,114,99,120,10,0,9,109,111,118,32,91,114,97,120,93,44,32,114,99,120,10,0,9,109,111,118,32,114,97,120,44,32,114,99,120,10,0,99,111,110,116,105,110,117,101,0,9,106,109,112,32,46,76,0,32,59,32,99,111,110,116,105,110,117,101,10,0,98,114,101,97,107,0,9,106,109,112,32,46,76,0,32,59,32,98,114,101,97,107,10,0,119,104,105,108,101,0,46,76,0,58,32,59,32,119,104,105,108,101,32,99,111,110,116,105,110,117,101,10,0,9,116,101,115,116,32,114,97,120,44,32,114,97,120,10,0,9,106,122,32,46,76,0,106,109,112,32,46,76,0,46,76,0,58,32,59,32,119,104,105,108,101,32,98,114,101,97,107,10,0,114,101,116,117,114,110,0,9,108,101,97,118,101,10,0,9,114,101,116,10,0,105,102,0,9,116,101,115,116,32,114,97,120,44,32,114,97,120,10,0,9,106,122,32,46,76,0,101,108,115,101,0,106,109,112,32,46,76,0,46,76,0,58,32,59,32,105,102,10,0,46,76,0,58,32,59,32,101,108,115,101,10,0,103,108,111,98,97,108,0,103,108,111,98,97,108,32,0,101,120,116,101,114,110,0,101,120,116,101,114,110,32,0,105,109,112,111,114,116,0,105,109,112,111,114,116,105,110,103,32,115,116,117,102,102,32,105,115,32,110,111,116,32,105,109,112,108,101,109,101,110,116,101,100,32,121,101,116,46,10,0,115,101,99,116,105,111,110,32,46,98,115,115,10,0,58,32,114,101,115,113,32,49,10,0,115,101,99,116,105,111,110,32,46,116,101,120,116,10,0,115,101,99,116,105,111,110,32,46,98,115,115,10,0,58,32,114,101,115,113,32,0,48,0,120,0,10,115,101,99,116,105,111,110,32,46,116,101,120,116,10,0,58,10,0,9,112,117,115,104,32,114,98,112,10,0,9,109,111,118,32,114,98,112,44,32,114,115,112,10,0,66,97,100,32,99,104,97,114,97,99,116,101,114,58,32,39,37,99,39,10,0,9,109,111,118,32,91,114,98,112,45,0,93,44,32,0,10,0,66,97,100,32,99,104,97,114,97,99,116,101,114,58,32,39,37,99,39,10,0,9,115,117,98,32,114,115,112,44,32,0,10,0,9,108,101,97,118,101,10,0,9,114,101,116,10,0,73,110,118,97,108,105,100,32,115,116,97,116,101,109,101,110,116,58,32,39,37,99,39,10,0,85,115,97,103,101,58,32,37,115,32,91,45,112,112,93,32,91,45,103,93,32,105,110,112,117,116,45,99,111,100,101,32,111,117,116,112,117,116,45,102,105,108,101,32,91,108,105,110,107,101,114,32,102,108,97,103,115,93,10,0,114,100,105,0,114,115,105,0,114,100,120,0,114,99,120,0,114,56,0,114,57,0,45,112,112,0,45,103,0,114,98,0,70,97,105,108,101,100,32,116,111,32,111,112,101,110,58,32,37,115,58,32,37,115,0,111,117,116,46,115,0,119,98,0,70,97,105,108,101,100,32,116,111,32,111,112,101,110,58,32,111,117,116,46,115,58,32,37,115,0,101,120,116,101,114,110,32,95,95,101,114,114,110,111,95,108,111,99,97,116,105,111,110,10,0,103,101,116,69,114,114,110,111,58,10,0,9,106,109,112,32,95,95,101,114,114,110,111,95,108,111,99,97,116,105,111,110,10,0,66,108,99,104,97,114,58,10,0,9,109,111,118,32,114,49,48,98,44,32,91,114,100,105,93,10,0,9,109,111,118,122,120,32,114,97,120,44,32,114,49,48,98,10,0,9,114,101,116,10,0,66,115,99,104,97,114,58,10,0,9,109,111,118,32,98,121,116,101,32,91,114,100,105,93,44,32,115,105,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,115,105,108,10,0,9,114,101,116,10,0,115,101,99,116,105,111,110,32,46,114,111,100,97,116,97,10,0,115,116,114,105,110,103,58,32,100,98,32,0,44,0,10,0,110,97,115,109,0,45,103,0,45,102,69,76,70,54,52,0,111,117,116,46,115,0,45,111,0,111,117,116,46,111,0,99,99,0,45,110,111,45,112,105,101,0,45,111,0,111,117,116,46,111,0,83,116,97,114,116,105,110,103,32,97,115,115,101,109,98,108,105,110,103,10,0,102,111,114,107,0,65,115,115,101,109,98,108,101,114,32,101,120,105,116,101,100,32,97,98,110,111,114,109,97,108,108,121,58,32,37,100,10,0,83,116,97,114,116,105,110,103,32,108,105,110,107,105,110,103,10,0,102,111,114,107,0,76,105,110,107,101,114,32,101,120,105,116,101,100,32,97,98,110,111,114,109,97,108,108,121,58,32,37,100,10,0
