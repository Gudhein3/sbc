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
	jz .L46
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+161]
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
	jz .L47
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
	lea rax, [abs string+172]
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
	jz .L48
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+174]
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
.L49: ; while continue
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
	jz .L50
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
jmp .L49
.L50: ; while break
.L48: ; if
jmp .L52
.L47: ; if
.L53: ; while continue
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
	jz .L54
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
jmp .L53
.L54: ; while break
.L52: ; else
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+176]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L55
.L46: ; if
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
	jz .L56
	mov rax, 0
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L57: ; while continue
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
	jz .L58
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
jmp .L57
.L58: ; while break
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
.L59: ; while continue
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
	jz .L60
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
	jz .L61
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+178]
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
	lea rax, [abs string+194]
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
	jmp .L60 ; break
.L61: ; if
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
jmp .L59
.L60: ; while break
	mov rax, [rbp-40]
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L63
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+197]
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
	lea rax, [abs string+208]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L63: ; if
jmp .L65
.L56: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 40
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L66
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
jmp .L67
.L66: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 38
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L68
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
jmp .L69
.L68: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 42
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L70
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
	lea rax, [abs string+210]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L71
.L70: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 39
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L72
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
	mov rax, [rbp-8]
	push rax
	mov rax, 110
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L74
	mov rax, 10
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L75
.L74: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 116
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L76
	mov rax, 9
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L77
.L76: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 92
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L78
	mov rax, 92
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L79
.L78: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 39
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L80
	mov rax, 39
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L81
.L80: ; if
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+227]
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
.L81: ; else
.L79: ; else
.L77: ; else
.L75: ; else
.L73: ; if
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
	lea rax, [abs string+255]
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
	lea rax, [abs string+266]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L83
.L72: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L84
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
.L85: ; while continue
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
	jz .L86
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
	jz .L87
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
	jz .L88
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
	mov rax, 10
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
jmp .L89
.L88: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 116
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L90
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
	mov rax, 9
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
jmp .L91
.L90: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 92
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L92
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
	mov rax, 92
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
jmp .L93
.L92: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L94
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
	mov rax, 34
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
jmp .L95
.L94: ; if
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+268]
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
.L95: ; else
.L93: ; else
.L91: ; else
.L89: ; else
jmp .L96
.L87: ; if
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
.L96: ; else
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
jmp .L85
.L86: ; while break
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
	lea rax, [abs string+296]
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
	lea rax, [abs string+319]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L97
.L84: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 45
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
	lea rax, [abs string+322]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L99
.L98: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 33
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
	lea rax, [abs string+332]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+348]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+358]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L101
.L100: ; if
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+374]
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
.L101: ; else
.L99: ; else
.L97: ; else
.L83: ; else
.L71: ; else
.L69: ; else
.L67: ; else
.L65: ; else
.L55: ; else
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
	jz .L102
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
	lea rax, [abs string+408]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+419]
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
	jz .L103
	mov rax, 0
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L104: ; while continue
	mov rax, [rbp-24]
	push rax
	mov rax, 6
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L105
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
	lea rax, [abs string+434]
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
	lea rax, [abs string+441]
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
	lea rax, [abs string+448]
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
	jz .L106
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L107
.L106: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 41
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L108
	jmp .L105 ; break
.L108: ; if
.L107: ; else
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
jmp .L104
.L105: ; while break
.L103: ; if
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
	jz .L111
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+455]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L111: ; if
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+464]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+479]
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
	jz .L113
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+490]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L113: ; if
	mov rax, 0
	push rax
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L115: ; while continue
	mov rax, [rbp-24]
	push rax
	mov rax, [rbp-32]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L116
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+503]
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
	lea rax, [abs string+509]
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
jmp .L115
.L116: ; while break
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+511]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L102: ; if
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
	jz .L118
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+521]
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
	lea rax, [abs string+532]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+542]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L118: ; if
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
.L120: ; while continue
	mov rax, 1
	test rax, rax
	jz .L121
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
	jz .L122
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
	lea rax, [abs string+565]
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
	lea rax, [abs string+576]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+591]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+601]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L123
.L122: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 45
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L124
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
	lea rax, [abs string+616]
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
	lea rax, [abs string+627]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+642]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+652]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L125
.L124: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 38
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L126
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
	lea rax, [abs string+667]
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
	lea rax, [abs string+678]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+693]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+703]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L127
.L126: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 124
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L128
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
	lea rax, [abs string+718]
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
	lea rax, [abs string+729]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+744]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+754]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L129
.L128: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 94
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L130
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
jmp .L131
.L130: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 42
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L132
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
	lea rax, [abs string+819]
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
	lea rax, [abs string+830]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+845]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+855]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L133
.L132: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 47
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L134
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
	lea rax, [abs string+865]
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
	lea rax, [abs string+876]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+891]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+901]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+916]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L135
.L134: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 37
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L136
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
	lea rax, [abs string+926]
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
	lea rax, [abs string+937]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+952]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+962]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+977]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
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
jmp .L137
.L136: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 61
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
	lea rax, [abs string+1002]
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
	lea rax, [abs string+1013]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1028]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1038]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1053]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
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
jmp .L139
.L138: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 33
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
	lea rax, [abs string+1079]
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
	lea rax, [abs string+1090]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1105]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1115]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1130]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1141]
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
	mov rax, 60
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
	jz .L143
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
jmp .L144
.L143: ; if
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
	jz .L145
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
.L145: ; if
.L144: ; else
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1157]
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
	lea rax, [abs string+1168]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1183]
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
	jz .L147
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1193]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L148
.L147: ; if
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
	mov rax, [rbp-16]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L149
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1222]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L150
.L149: ; if
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
.L150: ; else
.L148: ; else
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
jmp .L151
.L142: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 62
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
	jz .L153
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
jmp .L154
.L153: ; if
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
	jz .L155
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
.L155: ; if
.L154: ; else
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1259]
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
	lea rax, [abs string+1270]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1285]
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
	jz .L157
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1295]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L158
.L157: ; if
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
	mov rax, [rbp-16]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L159
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1324]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L160
.L159: ; if
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
.L160: ; else
.L158: ; else
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
jmp .L161
.L152: ; if
	jmp .L121 ; break
.L161: ; else
.L151: ; else
.L141: ; else
.L139: ; else
.L137: ; else
.L135: ; else
.L133: ; else
.L131: ; else
.L129: ; else
.L127: ; else
.L125: ; else
.L123: ; else
jmp .L120
.L121: ; while break
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
	jz .L162
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
	lea rax, [abs string+1361]
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
	lea rax, [abs string+1372]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1382]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1399]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L162: ; if
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
	jz .L164
	mov rax, 0
	leave
	ret
.L164: ; if
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
.L166: ; while continue
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
	jz .L167
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
	jz .L168
	mov rax, [rbp-8]
	push rax
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L169: ; while continue
	mov rax, [rbp-32]
	push rax
	mov rax, [rbp-24]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L170
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
jmp .L169
.L170: ; while break
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
.L168: ; if
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
jmp .L166
.L167: ; while break
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
	jz .L172
	mov rax, [rbp-8]
	push rax
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L173: ; while continue
	mov rax, [rbp-32]
	push rax
	mov rax, [rbp-24]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L174
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
jmp .L173
.L174: ; while break
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
.L172: ; if
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
	jz .L176
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
.L177: ; while continue
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
	jz .L178
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
jmp .L177
.L178: ; while break
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
jmp .L179
.L176: ; if
	mov rax, tryword
	push r13
	mov r13, rax
	lea rax, [abs string+1414]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L180
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1423]
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
	lea rax, [abs string+1431]
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
jmp .L181
.L180: ; if
	mov rax, tryword
	push r13
	mov r13, rax
	lea rax, [abs string+1444]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L182
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1450]
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
	lea rax, [abs string+1458]
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
jmp .L183
.L182: ; if
	mov rax, tryword
	push r13
	mov r13, rax
	lea rax, [abs string+1468]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L184
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
	lea rax, [abs string+1474]
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
	lea rax, [abs string+1477]
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
	lea rax, [abs string+1497]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1513]
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
	lea rax, [abs string+1520]
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
	lea rax, [abs string+1527]
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
	lea rax, [abs string+1530]
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
jmp .L185
.L184: ; if
	mov rax, tryword
	push r13
	mov r13, rax
	lea rax, [abs string+1547]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L186
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
	lea rax, [abs string+1554]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1562]
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
jmp .L187
.L186: ; if
	mov rax, tryword
	push r13
	mov r13, rax
	lea rax, [abs string+1568]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L188
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
	lea rax, [abs string+1571]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1587]
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
	lea rax, [abs string+1594]
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
	jz .L189
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1599]
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
.L189: ; if
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1606]
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
	lea rax, [abs string+1609]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, [rbp-32]
	test rax, rax
	jz .L191
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
	lea rax, [abs string+1617]
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
	lea rax, [abs string+1620]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L191: ; if
	mov rax, 0
	leave
	ret
.L188: ; if
.L187: ; else
.L185: ; else
.L183: ; else
.L181: ; else
.L179: ; else
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
.L194: ; while continue
	mov rax, 1
	test rax, rax
	jz .L195
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
	jz .L196
	mov rax, 0
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L197: ; while continue
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
	jz .L198
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
jmp .L197
.L198: ; while break
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
	lea rax, [abs string+1630]
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
	jz .L199
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
.L200: ; while continue
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
	jz .L201
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
jmp .L200
.L201: ; while break
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
jmp .L202
.L199: ; if
	mov rax, strcmp
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rdi
	mov rdi, rax
	lea rax, [abs string+1645]
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
	jz .L203
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1652]
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
.L204: ; while continue
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
	jz .L205
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
jmp .L204
.L205: ; while break
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
jmp .L206
.L203: ; if
	mov rax, strcmp
	push r13
	mov r13, rax
	mov rax, namebuffer
	push rdi
	mov rdi, rax
	lea rax, [abs string+1660]
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
	jz .L207
	mov rax, 0
	push rax
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
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
	mov rax, 34
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L208: ; while continue
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
	jz .L209
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
	jz .L210
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
	jz .L211
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
	mov rax, 10
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
jmp .L212
.L211: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 116
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L213
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
	mov rax, 9
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
jmp .L214
.L213: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 92
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L215
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
	mov rax, 92
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
jmp .L216
.L215: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L217
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
	mov rax, 34
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
jmp .L218
.L217: ; if
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+1667]
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
.L218: ; else
.L216: ; else
.L214: ; else
.L212: ; else
jmp .L219
.L210: ; if
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
.L219: ; else
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
	mov rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L208
.L209: ; while break
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
	mov rax, inputfile
	mov rax, [rax]
	push rax
	lea rax, [rbp-48]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, fopen
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
	mov rax, inputfile
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, inputfile
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L220
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+1698]
	push rsi
	mov rsi, rax
	mov rax, namebuffer
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
.L220: ; if
	mov rax, top
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
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
	mov rax, [rbp-48]
	push rax
	mov rax, inputfile
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L222
.L207: ; if
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
	jz .L223
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
	lea rax, [abs string+1721]
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
	lea rax, [abs string+1735]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1745]
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
	mov rax, 91
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
	push rax
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1760]
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
	lea rax, [abs string+1774]
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
	jz .L226
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
	lea rax, [abs string+1782]
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
	jz .L227
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1784]
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
.L228: ; while continue
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
	jz .L229
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
jmp .L228
.L229: ; while break
.L227: ; if
jmp .L231
.L226: ; if
.L232: ; while continue
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
	jz .L233
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
jmp .L232
.L233: ; while break
.L231: ; else
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
	lea rax, [abs string+1786]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L234
.L225: ; if
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
	lea rax, [abs string+1802]
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
	lea rax, [abs string+1805]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1816]
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
.L235: ; while continue
	mov rax, [rbp-16]
	push rax
	mov rax, 6
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L236
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
	jz .L237
	jmp .L236 ; break
.L237: ; if
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
	jz .L239
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+1831]
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
.L239: ; if
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
.L241: ; while continue
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
	jz .L242
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
jmp .L241
.L242: ; while break
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
	lea rax, [abs string+1852]
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
	lea rax, [abs string+1863]
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
	lea rax, [abs string+1867]
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
	jz .L243
	jmp .L236 ; break
.L243: ; if
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
jmp .L235
.L236: ; while break
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
.L245: ; while continue
	mov rax, 1
	test rax, rax
	jz .L246
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
	jz .L247
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	jmp .L246 ; break
.L247: ; if
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
	jz .L249
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+1869]
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
.L249: ; if
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
.L251: ; while continue
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
	jz .L252
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
jmp .L251
.L252: ; while break
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
	jz .L253
	jmp .L246 ; break
.L253: ; if
	mov rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L245
.L246: ; while break
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
	lea rax, [abs string+1890]
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
	lea rax, [abs string+1901]
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
	lea rax, [abs string+1903]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+1911]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L234: ; else
.L224: ; else
.L222: ; else
.L206: ; else
.L202: ; else
jmp .L255
.L196: ; if
	mov rax, [rbp-8]
	push rax
	mov rax, 0xFF
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L256
	jmp .L195 ; break
jmp .L257
.L256: ; if
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+1917]
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
.L257: ; else
.L255: ; else
jmp .L194
.L195: ; while break
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
	lea rax, [abs string+1942]
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
	lea rax, [abs string+2002]
	push rax
	mov rax, ra
	push rax
	mov rax, 0
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2006]
	push rax
	mov rax, ra
	push rax
	mov rax, 1
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2010]
	push rax
	mov rax, ra
	push rax
	mov rax, 2
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2014]
	push rax
	mov rax, ra
	push rax
	mov rax, 3
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2018]
	push rax
	mov rax, ra
	push rax
	mov rax, 4
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	lea rax, [abs string+2021]
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
	jz .L258
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
.L258: ; if
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
	lea rax, [abs string+2024]
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
	jz .L260
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
.L260: ; if
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
	lea rax, [abs string+2028]
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
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L262: ; if
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
	lea rax, [abs string+2031]
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
	jz .L264
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2034]
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
.L264: ; if
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
	lea rax, [abs string+2057]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2063]
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
	jz .L266
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2066]
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
.L266: ; if
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2092]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2117]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2128]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2151]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2160]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2178]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2196]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2202]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2211]
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
	lea rax, [abs string+2250]
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
	lea rax, [abs string+2256]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2273]
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
.L268: ; while continue
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
	jz .L269
	mov rax, emits
	push r13
	mov r13, rax
	lea rax, [abs string+2285]
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
jmp .L268
.L269: ; while break
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
	lea rax, [abs string+2289]
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
	jz .L270
	lea rax, [abs string+2294]
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
.L270: ; if
	lea rax, [abs string+2297]
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
	lea rax, [abs string+2305]
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
	lea rax, [abs string+2311]
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
	lea rax, [abs string+2314]
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
	lea rax, [abs string+2320]
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
	lea rax, [abs string+2323]
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
	lea rax, [abs string+2331]
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
	lea rax, [abs string+2334]
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
.L272: ; while continue
	mov rax, [rbp-8]
	test rax, rax
	jz .L273
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
jmp .L272
.L273: ; while break
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
	jz .L274
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2340]
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
jmp .L275
.L274: ; if
	mov rax, [rbp-48]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L276
	mov rax, perror
	push r13
	mov r13, rax
	lea rax, [abs string+2361]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, 1
	leave
	ret
.L276: ; if
.L275: ; else
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
	jz .L278
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2366]
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
	movzx rax, al
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
.L278: ; if
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
	jz .L280
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2399]
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
jmp .L281
.L280: ; if
	mov rax, [rbp-48]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L282
	mov rax, perror
	push r13
	mov r13, rax
	lea rax, [abs string+2417]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	mov rax, 1
	leave
	ret
.L282: ; if
.L281: ; else
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
	jz .L284
	mov rax, fprintf
	push r13
	mov r13, rax
	mov rax, stderr
	mov rax, [rax]
	push rdi
	mov rdi, rax
	lea rax, [abs string+2422]
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
	movzx rax, al
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
.L284: ; if
	mov rax, 0
	leave
	ret
section .rodata
string: db 37,99,0,37,99,0,37,115,0,37,122,117,0,69,120,112,101,99,116,101,100,32,37,99,32,98,117,116,32,103,111,116,32,37,99,10,0,9,108,101,97,32,114,97,120,44,32,91,114,98,112,45,0,93,10,0,9,109,111,118,32,114,97,120,44,32,0,10,0,73,110,118,97,108,105,100,32,108,101,102,116,32,101,120,112,114,101,115,115,105,111,110,58,32,39,37,99,39,10,0,9,109,111,118,32,114,97,120,44,32,91,114,97,120,93,10,0,9,112,117,115,104,32,114,97,120,10,0,9,112,111,112,32,114,99,120,10,0,9,108,101,97,32,114,97,120,44,32,91,114,99,120,43,114,97,120,42,56,93,10,0,9,109,111,118,32,114,97,120,44,32,0,48,0,120,0,10,0,9,109,111,118,32,114,97,120,44,32,91,114,98,112,45,0,93,10,0,9,109,111,118,32,114,97,120,44,32,0,10,0,9,109,111,118,32,114,97,120,44,32,91,114,97,120,93,10,0,73,110,118,97,108,105,100,32,101,115,99,97,112,101,32,99,111,100,101,58,32,39,92,37,99,39,10,0,9,109,111,118,32,114,97,120,44,32,0,10,0,73,110,118,97,108,105,100,32,101,115,99,97,112,101,32,99,111,100,101,58,32,39,92,37,99,39,10,0,9,108,101,97,32,114,97,120,44,32,91,97,98,115,32,115,116,114,105,110,103,43,0,93,10,0,9,110,101,103,32,114,97,120,10,0,9,116,101,115,116,32,114,97,120,44,32,114,97,120,10,0,9,115,101,116,122,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,73,110,118,97,108,105,100,32,112,114,105,109,97,114,121,32,101,120,112,114,101,115,115,105,111,110,58,32,39,37,99,39,10,0,9,112,117,115,104,32,114,49,51,10,0,9,109,111,118,32,114,49,51,44,32,114,97,120,10,0,9,112,117,115,104,32,0,10,9,109,111,118,32,0,44,32,114,97,120,10,0,9,112,117,115,104,32,48,10,0,9,120,111,114,32,114,97,120,44,32,114,97,120,10,0,9,99,97,108,108,32,114,49,51,10,0,9,97,100,100,32,114,115,112,44,32,56,10,0,9,112,111,112,32,0,10,0,9,112,111,112,32,114,49,51,10,0,9,112,117,115,104,32,114,97,120,10,0,9,112,111,112,32,114,99,120,10,0,9,109,111,118,32,114,97,120,44,32,91,114,99,120,43,114,97,120,42,56,93,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,97,100,100,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,115,117,98,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,97,110,100,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,111,114,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,120,111,114,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,109,117,108,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,120,111,114,32,114,100,120,44,32,114,100,120,10,0,9,100,105,118,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,120,111,114,32,114,100,120,44,32,114,100,120,10,0,9,100,105,118,32,114,99,120,10,0,9,109,111,118,32,114,97,120,44,32,114,100,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,101,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,110,101,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,115,104,108,32,114,97,120,44,32,99,108,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,98,101,32,97,108,10,0,9,115,101,116,98,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,115,104,114,32,114,97,120,44,32,99,108,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,97,101,32,97,108,10,0,9,115,101,116,97,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,112,111,112,32,114,99,120,10,0,9,109,111,118,32,91,114,97,120,93,44,32,114,99,120,10,0,9,109,111,118,32,114,97,120,44,32,114,99,120,10,0,99,111,110,116,105,110,117,101,0,9,106,109,112,32,46,76,0,32,59,32,99,111,110,116,105,110,117,101,10,0,98,114,101,97,107,0,9,106,109,112,32,46,76,0,32,59,32,98,114,101,97,107,10,0,119,104,105,108,101,0,46,76,0,58,32,59,32,119,104,105,108,101,32,99,111,110,116,105,110,117,101,10,0,9,116,101,115,116,32,114,97,120,44,32,114,97,120,10,0,9,106,122,32,46,76,0,106,109,112,32,46,76,0,46,76,0,58,32,59,32,119,104,105,108,101,32,98,114,101,97,107,10,0,114,101,116,117,114,110,0,9,108,101,97,118,101,10,0,9,114,101,116,10,0,105,102,0,9,116,101,115,116,32,114,97,120,44,32,114,97,120,10,0,9,106,122,32,46,76,0,101,108,115,101,0,106,109,112,32,46,76,0,46,76,0,58,32,59,32,105,102,10,0,46,76,0,58,32,59,32,101,108,115,101,10,0,103,108,111,98,97,108,0,103,108,111,98,97,108,32,0,101,120,116,101,114,110,0,101,120,116,101,114,110,32,0,105,109,112,111,114,116,0,73,110,118,97,108,105,100,32,101,115,99,97,112,101,32,99,111,100,101,58,32,39,92,37,99,39,10,0,114,98,0,70,97,105,108,101,100,32,116,111,32,111,112,101,110,58,32,37,115,58,32,37,115,0,115,101,99,116,105,111,110,32,46,98,115,115,10,0,58,32,114,101,115,113,32,49,10,0,115,101,99,116,105,111,110,32,46,116,101,120,116,10,0,115,101,99,116,105,111,110,32,46,98,115,115,10,0,58,32,114,101,115,113,32,0,48,0,120,0,10,115,101,99,116,105,111,110,32,46,116,101,120,116,10,0,58,10,0,9,112,117,115,104,32,114,98,112,10,0,9,109,111,118,32,114,98,112,44,32,114,115,112,10,0,66,97,100,32,99,104,97,114,97,99,116,101,114,58,32,39,37,99,39,10,0,9,109,111,118,32,91,114,98,112,45,0,93,44,32,0,10,0,66,97,100,32,99,104,97,114,97,99,116,101,114,58,32,39,37,99,39,10,0,9,115,117,98,32,114,115,112,44,32,0,10,0,9,108,101,97,118,101,10,0,9,114,101,116,10,0,73,110,118,97,108,105,100,32,115,116,97,116,101,109,101,110,116,58,32,39,37,99,39,10,0,85,115,97,103,101,58,32,37,115,32,91,45,112,112,93,32,91,45,103,93,32,105,110,112,117,116,45,99,111,100,101,32,111,117,116,112,117,116,45,102,105,108,101,32,91,108,105,110,107,101,114,32,102,108,97,103,115,93,10,0,114,100,105,0,114,115,105,0,114,100,120,0,114,99,120,0,114,56,0,114,57,0,45,112,112,0,45,103,0,114,98,0,70,97,105,108,101,100,32,116,111,32,111,112,101,110,58,32,37,115,58,32,37,115,0,111,117,116,46,115,0,119,98,0,70,97,105,108,101,100,32,116,111,32,111,112,101,110,58,32,111,117,116,46,115,58,32,37,115,0,101,120,116,101,114,110,32,95,95,101,114,114,110,111,95,108,111,99,97,116,105,111,110,10,0,103,101,116,69,114,114,110,111,58,10,0,9,106,109,112,32,95,95,101,114,114,110,111,95,108,111,99,97,116,105,111,110,10,0,66,108,99,104,97,114,58,10,0,9,109,111,118,32,114,49,48,98,44,32,91,114,100,105,93,10,0,9,109,111,118,122,120,32,114,97,120,44,32,114,49,48,98,10,0,9,114,101,116,10,0,66,115,99,104,97,114,58,10,0,9,109,111,118,32,98,121,116,101,32,91,114,100,105,93,44,32,115,105,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,115,105,108,10,0,9,114,101,116,10,0,115,101,99,116,105,111,110,32,46,114,111,100,97,116,97,10,0,115,116,114,105,110,103,58,32,100,98,32,0,44,0,10,0,110,97,115,109,0,45,103,0,45,102,69,76,70,54,52,0,111,117,116,46,115,0,45,111,0,111,117,116,46,111,0,99,99,0,45,110,111,45,112,105,101,0,45,111,0,111,117,116,46,111,0,83,116,97,114,116,105,110,103,32,97,115,115,101,109,98,108,105,110,103,10,0,102,111,114,107,0,65,115,115,101,109,98,108,101,114,32,101,120,105,116,101,100,32,97,98,110,111,114,109,97,108,108,121,58,32,37,100,10,0,83,116,97,114,116,105,110,103,32,108,105,110,107,105,110,103,10,0,102,111,114,107,0,76,105,110,107,101,114,32,101,120,105,116,101,100,32,97,98,110,111,114,109,97,108,108,121,58,32,37,100,10,0
