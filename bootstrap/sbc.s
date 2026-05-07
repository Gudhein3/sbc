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
; lexpr()
	lea rax, Bschar
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, stream
	push rax
; lexpr()
	lea rax, streamsize
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, streamsize
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, streamsize
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	leave
	ret
next:
	push rbp
	mov rbp, rsp
	sub rsp, 16
; lexpr()
	lea rax, streamsize
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L0
; lexpr()
	lea rax, Blchar
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, stream
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	push rax
; lexpr()
	lea rax, activecharacter
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, memmove
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, stream
	push rdi
	mov rdi, rax
; lexpr()
; lexpr()
	lea rax, stream
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, streamsize
	mov rax, [rax] ; Lexpr deref
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, streamsize
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
	lea rax, streamsize
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L1
.L0: ; if
; lexpr()
	lea rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, activecharacter
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 47
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L2
; lexpr()
	lea rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, activecharacter
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 42
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L3
.L4: ; while continue
; lexpr()
	mov rax, 1
	test rax, rax
	jz .L5
; lexpr()
	lea rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, activecharacter
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 42
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L6
; lexpr()
	lea rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, activecharacter
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
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
; lexpr()
	lea rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L10
.L3: ; if
; lexpr()
	lea rax, activecharacter
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 47
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L11
.L12: ; while continue
; lexpr()
	mov rax, 1
	test rax, rax
	jz .L13
; lexpr()
	lea rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, activecharacter
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
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
; lexpr()
	lea rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L16
.L11: ; if
; lexpr()
	lea rax, push
	push r13
	mov r13, rax
; lexpr()
	lea rax, activecharacter
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	mov rax, 47
	push rax
; lexpr()
	lea rax, activecharacter
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L16: ; else
.L10: ; else
.L2: ; if
.L1: ; else
; lexpr()
	lea rax, activecharacter
	mov rax, [rax] ; Lexpr deref
	leave
	ret
nextr:
	push rbp
	mov rbp, rsp
	sub rsp, 16
; lexpr()
	lea rax, fread
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, activecharacter
	push rdi
	mov rdi, rax
; lexpr()
	mov rax, 1
	push rsi
	mov rsi, rax
; lexpr()
	mov rax, 1
	push rdx
	mov rdx, rax
; lexpr()
	lea rax, inputfile
	mov rax, [rax] ; Lexpr deref
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
; lexpr()
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L18
; lexpr()
	mov rax, 0xFF
	push rax
; lexpr()
	lea rax, activecharacter
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L18: ; if
; lexpr()
	lea rax, dooutputparse
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L20
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+0]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, activecharacter
	mov rax, [rax] ; Lexpr deref
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
.L20: ; if
; lexpr()
	lea rax, activecharacter
	mov rax, [rax] ; Lexpr deref
	leave
	ret
peek:
	push rbp
	mov rbp, rsp
	sub rsp, 16
; lexpr()
	lea rax, activecharacter
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L22
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L23
.L22: ; if
; lexpr()
	lea rax, activecharacter
	mov rax, [rax] ; Lexpr deref
.L23: ; else
	leave
	ret
emit:
	push rbp
	mov rbp, rsp
	mov [rbp-8], rdi
	sub rsp, 32
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, outputfile
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+3]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
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
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, outputfile
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+6]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
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
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, outputfile
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+9]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
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
; lexpr()
	lea rax, isspace
	push r13
	mov r13, rax
; lexpr()
	lea rax, peek
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
; lexpr()
	lea rax, next
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
; lexpr()
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L26
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L27
.L26: ; if
; lexpr()
	lea rax, printf
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+13]
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdx
	mov rdx, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rcx
	mov rcx, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push r8
	mov r8, rax
	xor rax, rax
	call r13
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, exit
	push r13
	mov r13, rax
; lexpr()
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
parseEscapeCode:
	push rbp
	mov rbp, rsp
	sub rsp, 32
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 110
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L28
; lexpr()
	mov rax, 10
jmp .L29
.L28: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 116
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L30
; lexpr()
	mov rax, 9
jmp .L31
.L30: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 92
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L32
; lexpr()
	mov rax, 92
jmp .L33
.L32: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 39
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L34
; lexpr()
	mov rax, 39
jmp .L35
.L34: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 120
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L36
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
; lexpr()
	lea rax, isxdigit
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
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
	jz .L37
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+49]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, exit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L37: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 57
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setbe al
	movzx rax, al
	test rax, rax
	jz .L39
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 48
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L40
.L39: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 70
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setbe al
	movzx rax, al
	test rax, rax
	jz .L41
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 65
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
	mov rax, 10
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L42
.L41: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 102
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setbe al
	movzx rax, al
	test rax, rax
	jz .L43
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 97
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
	mov rax, 10
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L43: ; if
.L42: ; else
.L40: ; else
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
; lexpr()
	lea rax, isxdigit
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
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
	jz .L45
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+83]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, exit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L45: ; if
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 16
	mov rcx, rax
	pop rax
	mul rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 57
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setbe al
	movzx rax, al
	test rax, rax
	jz .L47
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	mov rax, 48
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L48
.L47: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 70
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setbe al
	movzx rax, al
	test rax, rax
	jz .L49
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	mov rax, 65
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
	mov rax, 10
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L50
.L49: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 102
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setbe al
	movzx rax, al
	test rax, rax
	jz .L51
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	mov rax, 97
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
	mov rax, 10
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L51: ; if
.L50: ; else
.L48: ; else
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
jmp .L53
.L36: ; if
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+117]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, exit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L53: ; else
.L35: ; else
.L33: ; else
.L31: ; else
.L29: ; else
	leave
	ret
	leave
	ret
lprimary:
	push rbp
	mov rbp, rsp
	sub rsp, 48
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+145]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, isalpha
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L54
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L55: ; while continue
; lexpr()
	lea rax, isalnum
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L56
; lexpr()
	lea rax, Bschar
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, namebuffer
	push rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L55
.L56: ; while break
; lexpr()
	lea rax, Bschar
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, namebuffer
	push rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
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
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L57: ; while continue
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, varcnt
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L58
; lexpr()
	lea rax, strcmp
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, namebuffer
	push rdi
	mov rdi, rax
; lexpr()
; lexpr()
	lea rax, variables
	push rax
; lexpr()
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 5
	mov rcx, rax
	pop rax
	mul rcx
	push rax
; lexpr()
	mov rax, 8
	mov rcx, rax
	pop rax
	mul rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
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
; lexpr()
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L59
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+156]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, variables
	push rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
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
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+172]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	mov rax, 1
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L59: ; if
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L57
.L58: ; while break
; lexpr()
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L61
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+175]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, namebuffer
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+186]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L61: ; if
jmp .L63
.L54: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 42
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L64
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L65
.L64: ; if
; lexpr()
	mov rax, 0
	leave
	ret
.L65: ; else
.L63: ; else
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L66
; lexpr()
	mov rax, 2
	leave
	ret
.L66: ; if
; lexpr()
	mov rax, 1
	leave
	ret
	leave
	ret
lexpr:
	push rbp
	mov rbp, rsp
	sub rsp, 32
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, lprimary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	test rax, rax
	jz .L68
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	mov rax, 91
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L69
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+188]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
	mov rax, 93
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+213]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+223]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L69: ; if
.L68: ; if
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	leave
	ret
	leave
	ret
primary:
	push rbp
	mov rbp, rsp
	sub rsp, 64
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, lprimary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-48]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
; lexpr()
	lea rax, [rbp-48]
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L72
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-40]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, isdigit
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L73
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+246]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 48
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L74
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+257]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 120
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L75
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+259]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L76: ; while continue
; lexpr()
	lea rax, isxdigit
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L77
; lexpr()
	lea rax, emit
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L76
.L77: ; while break
.L75: ; if
jmp .L79
.L74: ; if
.L80: ; while continue
; lexpr()
	lea rax, isdigit
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L81
; lexpr()
	lea rax, emit
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L80
.L81: ; while break
.L79: ; else
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+261]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L82
.L73: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 123
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L83
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L84: ; while continue
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	mov rax, 125
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L85
; lexpr()
	lea rax, stmt
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L84
.L85: ; while break
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L86
.L83: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 40
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L87
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
	mov rax, 41
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L88
.L87: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 38
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L89
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L90
.L89: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 126
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L91
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+263]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L92
.L91: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 39
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L93
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 92
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L94
; lexpr()
	lea rax, parseEscapeCode
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L94: ; if
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
	mov rax, 39
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+273]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+284]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L96
.L93: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L97
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, strbufsz
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L98: ; while continue
; lexpr()
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
	push rax
; lexpr()
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L99
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 92
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L100
; lexpr()
	lea rax, parseEscapeCode
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L100: ; if
; lexpr()
	lea rax, Bschar
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, strbuf
	push rax
; lexpr()
	lea rax, strbufsz
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, strbufsz
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, strbufsz
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, nextr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L98
.L99: ; while break
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, Bschar
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, strbuf
	push rax
; lexpr()
	lea rax, strbufsz
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
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
; lexpr()
	lea rax, strbufsz
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, strbufsz
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+286]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+309]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L102
.L97: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 45
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L103
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+312]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L104
.L103: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 33
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L105
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+322]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+338]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+348]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L106
.L105: ; if
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+364]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, exit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L106: ; else
.L104: ; else
.L102: ; else
.L96: ; else
.L92: ; else
.L90: ; else
.L88: ; else
.L86: ; else
.L82: ; else
.L72: ; if
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L108
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L109
; lexpr()
; lexpr()
	lea rax, [rbp-48]
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L110
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+398]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, exit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L110: ; if
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+450]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+461]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+471]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	mov rax, 0
	leave
	ret
jmp .L112
.L109: ; if
; lexpr()
	lea rax, push
	push r13
	mov r13, rax
; lexpr()
	mov rax, 61
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L112: ; else
.L108: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 40
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L114
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+488]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+499]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	mov rax, 41
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L115
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L116: ; while continue
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 6
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L117
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+514]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, ra
	push rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+521]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, ra
	push rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+528]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 44
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L118
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L119
.L118: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 41
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L120
	jmp .L117 ; break
.L120: ; if
.L119: ; else
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L116
.L117: ; while break
.L115: ; if
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
	mov rax, 41
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
; lexpr()
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	and rax, rcx
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L123
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+535]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L123: ; if
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+544]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+559]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
; lexpr()
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	and rax, rcx
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L125
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+570]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L125: ; if
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L127: ; while continue
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L128
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+583]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, ra
	push rax
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
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
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+589]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L127
.L128: ; while break
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+591]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-48]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L114: ; if
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 91
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L130
; lexpr()
	lea rax, [rbp-48]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 2
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L131
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+601]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L131: ; if
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+641]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
	mov rax, 93
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+652]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+662]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L133
.L130: ; if
; lexpr()
	lea rax, [rbp-48]
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L134
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+685]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L134: ; if
.L133: ; else
; lexpr()
	lea rax, [rbp-48]
	mov rax, [rax] ; Lexpr deref
	leave
	ret
	leave
	ret
expr:
	push rbp
	mov rbp, rsp
	sub rsp, 32
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L136: ; while continue
; lexpr()
	mov rax, 1
	test rax, rax
	jz .L137
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 43
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L138
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+716]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+727]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+742]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+752]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L139
.L138: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 45
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L140
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+767]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+778]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+793]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+803]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L141
.L140: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 38
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L142
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+818]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+829]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+844]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+854]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L143
.L142: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 124
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L144
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+869]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+880]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+895]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+905]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L145
.L144: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 94
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L146
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+919]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+930]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+945]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+955]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L147
.L146: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 42
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L148
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+970]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+981]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+996]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1006]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L149
.L148: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 47
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L150
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1016]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1027]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1042]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1052]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1067]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L151
.L150: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 37
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L152
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1077]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1088]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1103]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1113]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1128]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1138]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L153
.L152: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L154
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
	mov rax, 61
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1153]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1164]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1179]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1189]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1204]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1214]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L155
.L154: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 33
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L156
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
	mov rax, 61
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1230]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1241]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1256]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1266]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1281]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1292]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L157
.L156: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 60
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L158
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L159
; lexpr()
	mov rax, 1
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L160
.L159: ; if
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	mov rax, 60
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L161
; lexpr()
	mov rax, 2
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L161: ; if
.L160: ; else
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1308]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1319]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1334]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 2
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L163
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1344]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L164
.L163: ; if
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1358]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L165
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1373]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L166
.L165: ; if
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1384]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L166: ; else
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1394]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L164: ; else
jmp .L167
.L158: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 62
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L168
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L169
; lexpr()
	mov rax, 1
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L170
.L169: ; if
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	mov rax, 62
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L171
; lexpr()
	mov rax, 2
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L171: ; if
.L170: ; else
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1410]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, primary
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1421]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1436]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 2
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L173
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1446]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L174
.L173: ; if
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1460]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L175
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1475]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L176
.L175: ; if
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1486]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L176: ; else
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1496]
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
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 58
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L178
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1512]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
; lexpr()
	lea rax, lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L179
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+1523]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, exit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L179: ; if
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1584]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1594]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1611]
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
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, Blchar
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
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
	jz .L182
; lexpr()
	mov rax, 0
	leave
	ret
.L182: ; if
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L184: ; while continue
; lexpr()
	lea rax, Blchar
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L185
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, Blchar
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
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
	jz .L186
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L187: ; while continue
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L188
; lexpr()
	lea rax, push
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L187
.L188: ; while break
; lexpr()
	lea rax, push
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	mov rax, 0
	leave
	ret
.L186: ; if
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L184
.L185: ; while break
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, isalnum
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L190
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L191: ; while continue
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L192
; lexpr()
	lea rax, push
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L191
.L192: ; while break
; lexpr()
	lea rax, push
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	mov rax, 0
	leave
	ret
.L190: ; if
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	mov rax, 1
	leave
	ret
	leave
	ret
stmt:
	push rbp
	mov rbp, rsp
	sub rsp, 64
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 123
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L194
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L195: ; while continue
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	mov rax, 125
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L196
; lexpr()
	lea rax, stmt
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L195
.L196: ; while break
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	mov rax, 0
	leave
	ret
jmp .L197
.L194: ; if
; lexpr()
	lea rax, tryword
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1626]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L198
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1635]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, continueaddress
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1643]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
	mov rax, 59
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	mov rax, 0
	leave
	ret
jmp .L199
.L198: ; if
; lexpr()
	lea rax, tryword
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1656]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L200
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1662]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, breakaddress
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1670]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
	mov rax, 59
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	mov rax, 0
	leave
	ret
jmp .L201
.L200: ; if
; lexpr()
	lea rax, tryword
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1680]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L202
; lexpr()
	lea rax, continueaddress
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-40]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, breakaddress
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-48]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, addrcounter
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, addrcounter
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, continueaddress
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, breakaddress
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, addrcounter
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 2
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, addrcounter
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1686]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1689]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1709]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1725]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, stmt
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1732]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1739]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1742]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-40]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, continueaddress
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-48]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, breakaddress
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	mov rax, 0
	leave
	ret
jmp .L203
.L202: ; if
; lexpr()
	lea rax, tryword
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1759]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L204
; lexpr()
	lea rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1766]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1774]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
	mov rax, 59
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	mov rax, 0
	leave
	ret
jmp .L205
.L204: ; if
; lexpr()
	lea rax, tryword
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1780]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L206
; lexpr()
	lea rax, addrcounter
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, addrcounter
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, addrcounter
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1783]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1799]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, stmt
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, tryword
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1806]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, addrcounter
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, addrcounter
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, addrcounter
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L207
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1811]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L207: ; if
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1818]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1821]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L209
; lexpr()
	lea rax, stmt
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1829]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1832]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L209: ; if
; lexpr()
	mov rax, 0
	leave
	ret
.L206: ; if
.L205: ; else
.L203: ; else
.L201: ; else
.L199: ; else
.L197: ; else
; lexpr()
	lea rax, expr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
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
.L212: ; while continue
; lexpr()
	mov rax, 1
	test rax, rax
	jz .L213
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, isalpha
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L214
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L215: ; while continue
; lexpr()
	lea rax, isalnum
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L216
; lexpr()
	lea rax, Bschar
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, namebuffer
	push rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L215
.L216: ; while break
; lexpr()
	lea rax, Bschar
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, namebuffer
	push rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
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
; lexpr()
	lea rax, strcmp
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, namebuffer
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+1842]
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
; lexpr()
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L217
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1849]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L218: ; while continue
; lexpr()
	lea rax, isalnum
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L219
; lexpr()
	lea rax, emit
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L218
.L219: ; while break
; lexpr()
	lea rax, emit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L220
.L217: ; if
; lexpr()
	lea rax, strcmp
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, namebuffer
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+1857]
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
; lexpr()
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L221
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1864]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L222: ; while continue
; lexpr()
	lea rax, isalnum
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L223
; lexpr()
	lea rax, emit
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L222
.L223: ; while break
; lexpr()
	lea rax, emit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L224
.L221: ; if
; lexpr()
	lea rax, strcmp
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, namebuffer
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+1872]
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
; lexpr()
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L225
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+1879]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, exit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L226
.L225: ; if
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	mov rax, 59
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L227
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1920]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, namebuffer
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1934]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1944]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L228
.L227: ; if
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	mov rax, 91
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L229
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1959]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, namebuffer
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1973]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 48
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L230
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1981]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 120
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L231
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1983]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L232: ; while continue
; lexpr()
	lea rax, isxdigit
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L233
; lexpr()
	lea rax, emit
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L232
.L233: ; while break
.L231: ; if
jmp .L235
.L230: ; if
.L236: ; while continue
; lexpr()
	lea rax, isdigit
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L237
; lexpr()
	lea rax, emit
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L236
.L237: ; while break
.L235: ; else
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
	mov rax, 93
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
	mov rax, 59
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+1985]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L238
.L229: ; if
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, namebuffer
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2001]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
	mov rax, 40
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, varcnt
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2004]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2015]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L239: ; while continue
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 6
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L240
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 41
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L241
	jmp .L240 ; break
.L241: ; if
; lexpr()
; lexpr()
	lea rax, isalpha
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
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
	jz .L243
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+2030]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, exit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L243: ; if
; lexpr()
; lexpr()
	lea rax, variables
	push rax ; lexpr index
; lexpr()
	lea rax, varcnt
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 5
	mov rcx, rax
	pop rax
	mul rcx
	pop rcx
	lea rax, [rcx+rax*8]
	push rax
; lexpr()
	lea rax, [rbp-40]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, varcnt
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, varcnt
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L245: ; while continue
; lexpr()
	lea rax, isalnum
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L246
; lexpr()
	lea rax, Bschar
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-40]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L245
.L246: ; while break
; lexpr()
	lea rax, Bschar
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-40]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
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
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; lexpr()
	lea rax, [rbp-40]
	mov rax, [rax] ; Lexpr deref
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2051]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2062]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, ra
	push rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2066]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	mov rax, 44
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L247
	jmp .L240 ; break
.L247: ; if
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L239
.L240: ; while break
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
	push r13
	mov r13, rax
; lexpr()
	mov rax, 41
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L249: ; while continue
; lexpr()
	mov rax, 1
	test rax, rax
	jz .L250
; lexpr()
	lea rax, whitespace
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 33
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L251
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	jmp .L250 ; break
.L251: ; if
; lexpr()
; lexpr()
	lea rax, isalpha
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
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
	jz .L253
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+2068]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, exit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L253: ; if
; lexpr()
; lexpr()
	lea rax, variables
	push rax ; lexpr index
; lexpr()
	lea rax, varcnt
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 5
	mov rcx, rax
	pop rax
	mul rcx
	pop rcx
	lea rax, [rcx+rax*8]
	push rax
; lexpr()
	lea rax, [rbp-40]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, varcnt
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, varcnt
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L255: ; while continue
; lexpr()
	lea rax, isalnum
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L256
; lexpr()
	lea rax, Bschar
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-40]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L255
.L256: ; while break
; lexpr()
	lea rax, Bschar
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-40]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
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
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; lexpr()
	lea rax, [rbp-40]
	mov rax, [rax] ; Lexpr deref
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, peek
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	mov rax, 44
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L257
	jmp .L250 ; break
.L257: ; if
; lexpr()
	lea rax, next
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L249
.L250: ; while break
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2089]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 16
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
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
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2100]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, stmt
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2102]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2110]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L238: ; else
.L228: ; else
.L226: ; else
.L224: ; else
.L220: ; else
jmp .L259
.L214: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 0xFF
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L260
	jmp .L213 ; break
jmp .L261
.L260: ; if
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+2116]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, exit
	push r13
	mov r13, rax
; lexpr()
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L261: ; else
.L259: ; else
jmp .L212
.L213: ; while break
	leave
	ret
usage:
	push rbp
	mov rbp, rsp
	mov [rbp-8], rdi
	sub rsp, 32
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+2141]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
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
; lexpr()
	lea rax, [abs string+2201]
	push rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
	mov rax, 0
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [abs string+2205]
	push rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
	mov rax, 1
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [abs string+2209]
	push rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
	mov rax, 2
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [abs string+2213]
	push rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
	mov rax, 3
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [abs string+2217]
	push rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
	mov rax, 4
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [abs string+2220]
	push rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
	mov rax, 5
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 3
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L262
; lexpr()
	lea rax, usage
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr localvar deref
	push rax
; lexpr()
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	mov rax, 2
	leave
	ret
.L262: ; if
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, strcmp
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr localvar deref
	push rax
; lexpr()
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+2223]
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
; lexpr()
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L264
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	mov rax, 1
	push rax
; lexpr()
	lea rax, dooutputparse
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L264: ; if
; lexpr()
	lea rax, strcmp
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr localvar deref
	push rax
; lexpr()
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+2227]
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
; lexpr()
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L266
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	mov rax, 1
	push rax
; lexpr()
	lea rax, [rbp-24]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L266: ; if
; lexpr()
	lea rax, fopen
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr localvar deref
	push rax
; lexpr()
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+2230]
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
; lexpr()
	lea rax, inputfile
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
; lexpr()
	lea rax, inputfile
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L268
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+2233]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr localvar deref
	push rax
; lexpr()
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rdx
	mov rdx, rax
; lexpr()
	lea rax, strerror
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, getErrno
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, [rax] ; Lexpr deref
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
; lexpr()
	mov rax, 2
	leave
	ret
.L268: ; if
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr localvar deref
	push rax
; lexpr()
	mov rax, 1
	pop rcx
	mov rax, [rcx+rax*8]
	push rax
; lexpr()
	lea rax, [rbp-32]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 2
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 16
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, fopen
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2257]
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+2263]
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
; lexpr()
	lea rax, outputfile
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
; lexpr()
	lea rax, outputfile
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L270
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+2266]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, strerror
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, getErrno
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	mov rax, [rax] ; Lexpr deref
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
; lexpr()
	mov rax, 2
	leave
	ret
.L270: ; if
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2293]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2318]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2329]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2352]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2361]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2379]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2397]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2403]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2412]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2434]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2451]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, top
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2457]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2474]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, Blchar
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, strbuf
	push rax
; lexpr()
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
; lexpr()
	mov rax, 1
	push rax
; lexpr()
	lea rax, [rbp-40]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L272: ; while continue
; lexpr()
	lea rax, [rbp-40]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, strbufsz
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L273
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2486]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
	push r13
	mov r13, rax
; lexpr()
	lea rax, Blchar
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, strbuf
	push rax
; lexpr()
	lea rax, [rbp-40]
	mov rax, [rax] ; Lexpr deref
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
; lexpr()
	lea rax, [rbp-40]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-40]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L272
.L273: ; while break
; lexpr()
	lea rax, emits
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2488]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, fclose
	push r13
	mov r13, rax
; lexpr()
	lea rax, inputfile
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, fclose
	push r13
	mov r13, rax
; lexpr()
	lea rax, outputfile
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [abs string+2490]
	push rax
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
	lea rax, assemblerargc
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, assemblerargc
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, assemblerargc
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-24]
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L274
; lexpr()
	lea rax, [abs string+2495]
	push rax
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
	lea rax, assemblerargc
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, assemblerargc
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, assemblerargc
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L274: ; if
; lexpr()
	lea rax, [abs string+2498]
	push rax
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
	lea rax, assemblerargc
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [abs string+2506]
	push rax
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
	lea rax, assemblerargc
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [abs string+2512]
	push rax
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
	lea rax, assemblerargc
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 2
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [abs string+2515]
	push rax
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
	lea rax, assemblerargc
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 3
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
	lea rax, assemblerargc
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 4
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [abs string+2521]
	push rax
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
	lea rax, linkerargc
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [abs string+2524]
	push rax
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
	lea rax, linkerargc
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [abs string+2532]
	push rax
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
	lea rax, linkerargc
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 2
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-32]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
	lea rax, linkerargc
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 3
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [abs string+2535]
	push rax
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
	lea rax, linkerargc
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 4
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, linkerargc
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 5
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, linkerargc
	pop rcx
	mov [rax], rcx
	mov rax, rcx
.L276: ; while continue
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L277
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr localvar deref
	push rax
; lexpr()
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rax
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
	lea rax, linkerargc
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, linkerargc
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, linkerargc
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-8]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-16]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
jmp .L276
.L277: ; while break
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
	lea rax, linkerargc
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, fork
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-48]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-48]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L278
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+2541]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, execvp
	push r13
	mov r13, rax
; lexpr()
	lea rax, assemblerargv
	push rax
; lexpr()
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
; lexpr()
; lexpr()
	lea rax, assemblerargv
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
jmp .L279
.L278: ; if
; lexpr()
	lea rax, [rbp-48]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L280
; lexpr()
	lea rax, perror
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2562]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	mov rax, 1
	leave
	ret
.L280: ; if
.L279: ; else
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-56]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, waitpid
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-48]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; lexpr()
	lea rax, [rbp-56]
	push rsi
	mov rsi, rax
; lexpr()
	mov rax, 0
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
; lexpr()
; lexpr()
	lea rax, [rbp-56]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 0x7f
	mov rcx, rax
	pop rax
	and rax, rcx
	push rax
; lexpr()
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L282
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+2567]
	push rsi
	mov rsi, rax
; lexpr()
; lexpr()
	lea rax, [rbp-56]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 0xff00
	mov rcx, rax
	pop rax
	and rax, rcx
	push rax
; lexpr()
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
; lexpr()
	mov rax, 1
	leave
	ret
.L282: ; if
; lexpr()
	lea rax, fork
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
	lea rax, [rbp-48]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, [rbp-48]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L284
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+2600]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, execvp
	push r13
	mov r13, rax
; lexpr()
	lea rax, linkerargv
	push rax
; lexpr()
	mov rax, 0
	pop rcx
	mov rax, [rcx+rax*8]
	push rdi
	mov rdi, rax
; lexpr()
; lexpr()
	lea rax, linkerargv
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
jmp .L285
.L284: ; if
; lexpr()
	lea rax, [rbp-48]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L286
; lexpr()
	lea rax, perror
	push r13
	mov r13, rax
; lexpr()
	lea rax, [abs string+2618]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	mov rax, 1
	leave
	ret
.L286: ; if
.L285: ; else
; lexpr()
	mov rax, 0
	push rax
; lexpr()
	lea rax, [rbp-56]
	pop rcx
	mov [rax], rcx
	mov rax, rcx
; lexpr()
	lea rax, waitpid
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-48]
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; lexpr()
	lea rax, [rbp-56]
	push rsi
	mov rsi, rax
; lexpr()
	mov rax, 0
	push rdx
	mov rdx, rax
	xor rax, rax
	call r13
	pop rdx
	pop rsi
	pop rdi
	pop r13
; lexpr()
; lexpr()
	lea rax, [rbp-56]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 0x7f
	mov rcx, rax
	pop rax
	and rax, rcx
	push rax
; lexpr()
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L288
; lexpr()
	lea rax, fprintf
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [abs string+2623]
	push rsi
	mov rsi, rax
; lexpr()
; lexpr()
	lea rax, [rbp-56]
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	mov rax, 0xff00
	mov rcx, rax
	pop rax
	and rax, rcx
	push rax
; lexpr()
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
; lexpr()
	mov rax, 1
	leave
	ret
.L288: ; if
; lexpr()
	mov rax, 0
	leave
	ret
section .rodata
string: db 37,99,0,37,99,0,37,115,0,37,122,117,0,69,120,112,101,99,116,101,100,32,39,37,99,39,40,37,100,41,32,98,117,116,32,103,111,116,32,39,37,99,39,40,37,100,41,10,0,73,110,118,97,108,105,100,32,104,101,120,97,100,101,99,105,109,97,108,32,100,105,103,105,116,58,32,39,92,37,99,39,10,0,73,110,118,97,108,105,100,32,104,101,120,97,100,101,99,105,109,97,108,32,100,105,103,105,116,58,32,39,92,37,99,39,10,0,73,110,118,97,108,105,100,32,101,115,99,97,112,101,32,99,111,100,101,58,32,39,92,37,99,39,10,0,59,32,108,101,120,112,114,40,41,10,0,9,108,101,97,32,114,97,120,44,32,91,114,98,112,45,0,93,10,0,9,108,101,97,32,114,97,120,44,32,0,10,0,9,112,117,115,104,32,114,97,120,32,59,32,108,101,120,112,114,32,105,110,100,101,120,10,0,9,112,111,112,32,114,99,120,10,0,9,108,101,97,32,114,97,120,44,32,91,114,99,120,43,114,97,120,42,56,93,10,0,9,109,111,118,32,114,97,120,44,32,0,48,0,120,0,10,0,9,110,111,116,32,114,97,120,10,0,9,109,111,118,32,114,97,120,44,32,0,10,0,9,108,101,97,32,114,97,120,44,32,91,97,98,115,32,115,116,114,105,110,103,43,0,93,10,0,9,110,101,103,32,114,97,120,10,0,9,116,101,115,116,32,114,97,120,44,32,114,97,120,10,0,9,115,101,116,122,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,73,110,118,97,108,105,100,32,112,114,105,109,97,114,121,32,101,120,112,114,101,115,115,105,111,110,58,32,39,37,99,39,10,0,69,120,112,101,99,116,101,100,32,108,101,120,112,114,32,111,110,32,108,101,102,116,32,104,97,110,100,32,115,105,100,101,32,111,102,32,116,104,101,32,97,115,115,105,103,110,109,101,110,116,10,0,9,112,117,115,104,32,114,97,120,10,0,9,112,111,112,32,114,99,120,10,0,9,109,111,118,32,91,114,99,120,93,44,32,114,97,120,10,0,9,112,117,115,104,32,114,49,51,10,0,9,109,111,118,32,114,49,51,44,32,114,97,120,10,0,9,112,117,115,104,32,0,10,9,109,111,118,32,0,44,32,114,97,120,10,0,9,112,117,115,104,32,48,10,0,9,120,111,114,32,114,97,120,44,32,114,97,120,10,0,9,99,97,108,108,32,114,49,51,10,0,9,97,100,100,32,114,115,112,44,32,56,10,0,9,112,111,112,32,0,10,0,9,112,111,112,32,114,49,51,10,0,9,109,111,118,32,114,97,120,44,32,91,114,97,120,93,32,59,32,76,101,120,112,114,32,108,111,99,97,108,118,97,114,32,100,101,114,101,102,10,0,9,112,117,115,104,32,114,97,120,10,0,9,112,111,112,32,114,99,120,10,0,9,109,111,118,32,114,97,120,44,32,91,114,99,120,43,114,97,120,42,56,93,10,0,9,109,111,118,32,114,97,120,44,32,91,114,97,120,93,32,59,32,76,101,120,112,114,32,100,101,114,101,102,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,97,100,100,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,115,117,98,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,97,110,100,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,111,114,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,120,111,114,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,109,117,108,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,120,111,114,32,114,100,120,44,32,114,100,120,10,0,9,100,105,118,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,120,111,114,32,114,100,120,44,32,114,100,120,10,0,9,100,105,118,32,114,99,120,10,0,9,109,111,118,32,114,97,120,44,32,114,100,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,101,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,110,101,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,115,104,108,32,114,97,120,44,32,99,108,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,98,101,32,97,108,10,0,9,115,101,116,98,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,115,104,114,32,114,97,120,44,32,99,108,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,97,101,32,97,108,10,0,9,115,101,116,97,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,69,120,112,101,99,116,101,100,32,108,101,120,112,114,32,111,110,32,114,105,103,104,116,32,104,97,110,100,32,115,105,100,101,32,111,102,32,116,104,101,32,114,101,118,101,114,115,101,32,97,115,115,105,103,110,109,101,110,116,10,0,9,112,111,112,32,114,99,120,10,0,9,109,111,118,32,91,114,97,120,93,44,32,114,99,120,10,0,9,109,111,118,32,114,97,120,44,32,114,99,120,10,0,99,111,110,116,105,110,117,101,0,9,106,109,112,32,46,76,0,32,59,32,99,111,110,116,105,110,117,101,10,0,98,114,101,97,107,0,9,106,109,112,32,46,76,0,32,59,32,98,114,101,97,107,10,0,119,104,105,108,101,0,46,76,0,58,32,59,32,119,104,105,108,101,32,99,111,110,116,105,110,117,101,10,0,9,116,101,115,116,32,114,97,120,44,32,114,97,120,10,0,9,106,122,32,46,76,0,106,109,112,32,46,76,0,46,76,0,58,32,59,32,119,104,105,108,101,32,98,114,101,97,107,10,0,114,101,116,117,114,110,0,9,108,101,97,118,101,10,0,9,114,101,116,10,0,105,102,0,9,116,101,115,116,32,114,97,120,44,32,114,97,120,10,0,9,106,122,32,46,76,0,101,108,115,101,0,106,109,112,32,46,76,0,46,76,0,58,32,59,32,105,102,10,0,46,76,0,58,32,59,32,101,108,115,101,10,0,103,108,111,98,97,108,0,103,108,111,98,97,108,32,0,101,120,116,101,114,110,0,101,120,116,101,114,110,32,0,105,109,112,111,114,116,0,105,109,112,111,114,116,105,110,103,32,115,116,117,102,102,32,105,115,32,110,111,116,32,105,109,112,108,101,109,101,110,116,101,100,32,121,101,116,46,10,0,115,101,99,116,105,111,110,32,46,98,115,115,10,0,58,32,114,101,115,113,32,49,10,0,115,101,99,116,105,111,110,32,46,116,101,120,116,10,0,115,101,99,116,105,111,110,32,46,98,115,115,10,0,58,32,114,101,115,113,32,0,48,0,120,0,10,115,101,99,116,105,111,110,32,46,116,101,120,116,10,0,58,10,0,9,112,117,115,104,32,114,98,112,10,0,9,109,111,118,32,114,98,112,44,32,114,115,112,10,0,66,97,100,32,99,104,97,114,97,99,116,101,114,58,32,39,37,99,39,10,0,9,109,111,118,32,91,114,98,112,45,0,93,44,32,0,10,0,66,97,100,32,99,104,97,114,97,99,116,101,114,58,32,39,37,99,39,10,0,9,115,117,98,32,114,115,112,44,32,0,10,0,9,108,101,97,118,101,10,0,9,114,101,116,10,0,73,110,118,97,108,105,100,32,115,116,97,116,101,109,101,110,116,58,32,39,37,99,39,10,0,85,115,97,103,101,58,32,37,115,32,91,45,112,112,93,32,91,45,103,93,32,105,110,112,117,116,45,99,111,100,101,32,111,117,116,112,117,116,45,102,105,108,101,32,91,108,105,110,107,101,114,32,102,108,97,103,115,93,10,0,114,100,105,0,114,115,105,0,114,100,120,0,114,99,120,0,114,56,0,114,57,0,45,112,112,0,45,103,0,114,98,0,70,97,105,108,101,100,32,116,111,32,111,112,101,110,58,32,37,115,58,32,37,115,10,0,111,117,116,46,115,0,119,98,0,70,97,105,108,101,100,32,116,111,32,111,112,101,110,58,32,111,117,116,46,115,58,32,37,115,10,0,101,120,116,101,114,110,32,95,95,101,114,114,110,111,95,108,111,99,97,116,105,111,110,10,0,103,101,116,69,114,114,110,111,58,10,0,9,106,109,112,32,95,95,101,114,114,110,111,95,108,111,99,97,116,105,111,110,10,0,66,108,99,104,97,114,58,10,0,9,109,111,118,32,114,49,48,98,44,32,91,114,100,105,93,10,0,9,109,111,118,122,120,32,114,97,120,44,32,114,49,48,98,10,0,9,114,101,116,10,0,66,115,99,104,97,114,58,10,0,9,109,111,118,32,98,121,116,101,32,91,114,100,105,93,44,32,115,105,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,115,105,108,10,0,9,114,101,116,10,0,115,101,99,116,105,111,110,32,46,114,111,100,97,116,97,10,0,115,116,114,105,110,103,58,32,100,98,32,0,44,0,10,0,110,97,115,109,0,45,103,0,45,102,69,76,70,54,52,0,111,117,116,46,115,0,45,111,0,111,117,116,46,111,0,99,99,0,45,110,111,45,112,105,101,0,45,111,0,111,117,116,46,111,0,83,116,97,114,116,105,110,103,32,97,115,115,101,109,98,108,105,110,103,10,0,102,111,114,107,0,65,115,115,101,109,98,108,101,114,32,101,120,105,116,101,100,32,97,98,110,111,114,109,97,108,108,121,58,32,37,100,10,0,83,116,97,114,116,105,110,103,32,108,105,110,107,105,110,103,10,0,102,111,114,107,0,76,105,110,107,101,114,32,101,120,105,116,101,100,32,97,98,110,111,114,109,97,108,108,121,58,32,37,100,10,0
