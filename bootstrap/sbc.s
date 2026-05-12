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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, stream
	push rax
; lexpr()
	lea rax, streamsize
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, streamsize
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
	leave
	ret
next:
	push rbp
	mov rbp, rsp
	sub rsp, 16
; lexpr()
	lea rax, streamsize
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L0
; lexpr()
	lea rax, activecharacter
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, Blchar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, stream
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, memmove
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, stream
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, stream
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, streamsize
; primary(); after a lexpr
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
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, streamsize
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L1
.L0: ; if
; lexpr()
	lea rax, nextr
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, activecharacter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, activecharacter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a non lexpr
	mov rax, 1
	test rax, rax
	jz .L5
; lexpr()
	lea rax, nextr
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, activecharacter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, activecharacter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
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
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a non lexpr
	mov rax, 1
	test rax, rax
	jz .L13
; lexpr()
	lea rax, nextr
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, activecharacter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, activecharacter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, activecharacter
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 47
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L16: ; else
.L10: ; else
.L2: ; if
.L1: ; else
; lexpr()
	lea rax, activecharacter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	leave
	ret
nextr:
	push rbp
	mov rbp, rsp
	sub rsp, 16
; lexpr()
	lea rax, fread
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, activecharacter
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	push rsi
	mov rsi, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	push rdx
	mov rdx, rax
; lexpr()
	lea rax, inputfile
; primary(); after a lexpr
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
; primary(); after a non lexpr
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L18
; lexpr()
	lea rax, activecharacter
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0xFF
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L18: ; if
; lexpr()
	lea rax, dooutputparse
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L20
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+0]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, activecharacter
; primary(); after a lexpr
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
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	leave
	ret
peek:
	push rbp
	mov rbp, rsp
	sub rsp, 16
; lexpr()
	lea rax, activecharacter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
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
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, outputfile
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+3]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, outputfile
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+6]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, outputfile
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+9]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, peek
; primary(); after a lexpr
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
; primary(); after a lexpr
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
; primary(); after a non lexpr
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
	push rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
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
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+13]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdx
	mov rdx, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rcx
	mov rcx, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push r8
	mov r8, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push r9
	mov r9, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	pop r13
; lexpr()
	lea rax, exit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
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
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 110
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L28
; lexpr()
; primary(); after a non lexpr
	mov rax, 10
jmp .L29
.L28: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 116
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L30
; lexpr()
; primary(); after a non lexpr
	mov rax, 9
jmp .L31
.L30: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 92
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L32
; lexpr()
; primary(); after a non lexpr
	mov rax, 92
jmp .L33
.L32: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 39
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L34
; lexpr()
; primary(); after a non lexpr
	mov rax, 39
jmp .L35
.L34: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 120
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L36
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, isxdigit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+49]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 57
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setbe al
	movzx rax, al
	test rax, rax
	jz .L39
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 48
	mov rcx, rax
	pop rax
	sub rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L40
.L39: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 70
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setbe al
	movzx rax, al
	test rax, rax
	jz .L41
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 65
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 10
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L42
.L41: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 102
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setbe al
	movzx rax, al
	test rax, rax
	jz .L43
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 97
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 10
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L43: ; if
.L42: ; else
.L40: ; else
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, isxdigit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+83]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 16
	mov rcx, rax
	pop rax
	mul rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 48
	mov rcx, rax
	pop rax
	sub rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L48
.L47: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 65
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 10
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L50
.L49: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 97
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 10
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L51: ; if
.L50: ; else
.L48: ; else
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
jmp .L53
.L36: ; if
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+117]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+145]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, isalpha
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L55: ; while continue
; lexpr()
	lea rax, isalnum
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, namebuffer
	push rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L55
.L56: ; while break
; lexpr()
	lea rax, Bschar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, namebuffer
	push rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
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
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L57: ; while continue
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, varcnt
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, namebuffer
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, variables
	push rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 5
	mov rcx, rax
	pop rax
	mul rcx
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 8
	mov rcx, rax
	pop rax
	mul rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+156]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, variables
	push rax ; lexpr index
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 5
	mov rcx, rax
	pop rax
	mul rcx
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+172]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	add rsp, 8
	pop rcx
	mov [rcx], rax
	jmp .L58 ; break
.L59: ; if
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L57
.L58: ; while break
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L61
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+175]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+186]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L61: ; if
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L63
; lexpr()
; primary(); after a non lexpr
	mov rax, 2
	leave
	ret
.L63: ; if
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	leave
	ret
jmp .L65
.L54: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 42
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L66
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, p6
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	leave
	ret
jmp .L67
.L66: ; if
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
.L67: ; else
.L65: ; else
	leave
	ret
lexpr:
	push rbp
	mov rbp, rsp
	sub rsp, 32
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, lprimary
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
	test rax, rax
	jz .L68
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 91
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L69
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 2
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L70
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+188]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L70: ; if
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+252]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expr
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 93
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+277]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+287]
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
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	leave
	ret
	leave
	ret
p6:
	push rbp
	mov rbp, rsp
	mov [rbp-8], rdi
	sub rsp, 80
; lexpr()
	lea rax, [rbp-56]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, lexpr
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-56]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L74
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+310]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L75
.L74: ; if
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+338]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L75: ; else
; lexpr()
	lea rax, [rbp-56]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L76
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L77
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L78
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L79
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	leave
	ret
jmp .L80
.L79: ; if
; lexpr()
	lea rax, push
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 61
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L80: ; else
.L78: ; if
.L77: ; if
.L76: ; if
; lexpr()
	lea rax, [rbp-56]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L84
; lexpr()
	lea rax, [rbp-48]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, isdigit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L85
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+370]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 48
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L86
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+381]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 120
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L87
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+383]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L88: ; while continue
; lexpr()
	lea rax, isxdigit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L89
; lexpr()
	lea rax, emit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L88
.L89: ; while break
.L87: ; if
jmp .L91
.L86: ; if
.L92: ; while continue
; lexpr()
	lea rax, isdigit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L93
; lexpr()
	lea rax, emit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L92
.L93: ; while break
.L91: ; else
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+385]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L94
.L85: ; if
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 123
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L95
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L96: ; while continue
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 125
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L97
; lexpr()
	lea rax, stmt
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L96
.L97: ; while break
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L98
.L95: ; if
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 40
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L99
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expr
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 41
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L100
.L99: ; if
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 38
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L101
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, lexpr
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L102
.L101: ; if
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 39
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L103
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 92
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L104
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, parseEscapeCode
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L104: ; if
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 39
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+387]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+398]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L106
.L103: ; if
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L107
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, strbufsz
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L108: ; while continue
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L109
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 92
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L110
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, parseEscapeCode
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L110: ; if
; lexpr()
	lea rax, Bschar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, strbuf
	push rax
; lexpr()
	lea rax, strbufsz
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, strbufsz
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, nextr
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L108
.L109: ; while break
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, Bschar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, strbuf
	push rax
; lexpr()
	lea rax, strbufsz
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, strbufsz
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+400]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+423]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L112
.L107: ; if
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+426]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L112: ; else
.L106: ; else
.L102: ; else
.L100: ; else
.L98: ; else
.L94: ; else
.L84: ; if
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+460]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+471]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 41
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L115
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L116: ; while continue
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 6
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L117
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, expr
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+486]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+493]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+500]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
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
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
	lea rax, [rbp-32]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L116
.L117: ; while break
.L115: ; if
; lexpr()
	lea rax, expect
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 41
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+507]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L123: ; if
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+516]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+531]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+542]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L125: ; if
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L127: ; while continue
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+555]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+561]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L127
.L128: ; while break
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+563]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-56]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L114: ; if
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-56]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L130
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+573]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L130: ; if
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
p5:
	push rbp
	mov rbp, rsp
	sub rsp, 64
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 126
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L132
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, p6
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+604]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L133
.L132: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 45
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L134
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, p6
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+614]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L135
.L134: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 43
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L136
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, p6
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L137
.L136: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 33
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L138
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, p6
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+624]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+640]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+650]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L139
.L138: ; if
; lexpr()
	lea rax, p6
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	leave
	ret
.L139: ; else
.L137: ; else
.L135: ; else
.L133: ; else
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
	leave
	ret
p4:
	push rbp
	mov rbp, rsp
	sub rsp, 32
; lexpr()
	lea rax, p5
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L140
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	leave
	ret
.L140: ; if
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L142: ; while continue
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	test rax, rax
	jz .L143
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 38
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L144
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+666]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, p5
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+677]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+692]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+702]
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
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 124
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L146
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+717]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, p5
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+728]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+743]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+753]
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
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 94
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L148
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+767]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, p5
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+778]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+793]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+803]
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
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 42
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L150
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+818]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, p5
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+829]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+844]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+854]
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
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 47
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L152
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+864]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, p5
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+875]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+890]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+900]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+915]
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
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 37
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L154
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+925]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, p5
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+936]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+951]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+961]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+976]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+986]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L155
.L154: ; if
	jmp .L143 ; break
.L155: ; else
.L153: ; else
.L151: ; else
.L149: ; else
.L147: ; else
.L145: ; else
jmp .L142
.L143: ; while break
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
	leave
	ret
p3:
	push rbp
	mov rbp, rsp
	sub rsp, 32
; lexpr()
	lea rax, p4
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L156
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	leave
	ret
.L156: ; if
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L158: ; while continue
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	test rax, rax
	jz .L159
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 43
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L160
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1001]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, p4
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1012]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1027]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1037]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L161
.L160: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 45
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L162
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1052]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, p4
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1063]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1078]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1088]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L163
.L162: ; if
	jmp .L159 ; break
.L163: ; else
.L161: ; else
jmp .L158
.L159: ; while break
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
	leave
	ret
p2:
	push rbp
	mov rbp, rsp
	sub rsp, 32
; lexpr()
	lea rax, p3
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L164
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	leave
	ret
.L164: ; if
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L166: ; while continue
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	test rax, rax
	jz .L167
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L168
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 61
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1103]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, p3
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1114]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1129]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1139]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1154]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1164]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L169
.L168: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 33
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L170
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 61
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1180]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, p3
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1191]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1206]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1216]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1231]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1242]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L171
.L170: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 60
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L172
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L173
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L174
.L173: ; if
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 60
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L175
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 2
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L175: ; if
.L174: ; else
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1258]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, p3
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1269]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1284]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 2
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L177
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1294]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L178
.L177: ; if
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1308]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L179
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1323]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L180
.L179: ; if
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1334]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L180: ; else
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1344]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L178: ; else
jmp .L181
.L172: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 62
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L182
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L183
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L184
.L183: ; if
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 62
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L185
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 2
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L185: ; if
.L184: ; else
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1360]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, p3
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1371]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1386]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 2
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L187
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1396]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L188
.L187: ; if
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1410]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L189
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1425]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L190
.L189: ; if
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1436]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L190: ; else
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1446]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L188: ; else
jmp .L191
.L182: ; if
	jmp .L167 ; break
.L191: ; else
.L181: ; else
.L171: ; else
.L169: ; else
jmp .L166
.L167: ; while break
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
	leave
	ret
p1:
	push rbp
	mov rbp, rsp
	sub rsp, 32
; lexpr()
	lea rax, p2
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L192
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1462]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1473]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, p1
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1482]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1495]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1505]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
.L192: ; if
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L194: ; while continue
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	test rax, rax
	jz .L195
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 58
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L196
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1522]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, lexpr
; primary(); after a lexpr
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
	jz .L197
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1571]
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L197: ; if
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1693]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1703]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1720]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L199
.L196: ; if
	jmp .L195 ; break
.L199: ; else
jmp .L194
.L195: ; while break
	leave
	ret
expr:
	push rbp
	mov rbp, rsp
	sub rsp, 16
; lexpr()
	lea rax, p1
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
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
	lea rax, [rbp-24]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, Blchar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
	jz .L200
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
.L200: ; if
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L202: ; while continue
; lexpr()
	lea rax, Blchar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L203
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, Blchar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
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
	jz .L204
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L205: ; while continue
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L206
; lexpr()
	lea rax, push
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L205
.L206: ; while break
; lexpr()
	lea rax, push
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
.L204: ; if
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L202
.L203: ; while break
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, isalnum
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L208
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L209: ; while continue
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L210
; lexpr()
	lea rax, push
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L209
.L210: ; while break
; lexpr()
	lea rax, push
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
.L208: ; if
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 123
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L212
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
.L213: ; while continue
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 125
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L214
; lexpr()
	lea rax, stmt
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L213
.L214: ; while break
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
jmp .L215
.L212: ; if
; lexpr()
	lea rax, tryword
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1735]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L216
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1744]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, continueaddress
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1752]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, expect
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 59
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
jmp .L217
.L216: ; if
; lexpr()
	lea rax, tryword
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1765]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L218
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1771]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, breakaddress
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1779]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, expect
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 59
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
jmp .L219
.L218: ; if
; lexpr()
	lea rax, tryword
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1789]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L220
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, continueaddress
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-48]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, breakaddress
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, continueaddress
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, addrcounter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, breakaddress
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, addrcounter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, addrcounter
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, addrcounter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 2
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1795]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1798]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, expr
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1818]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1834]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, stmt
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1841]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1848]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1851]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, continueaddress
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, breakaddress
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-48]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
jmp .L221
.L220: ; if
; lexpr()
	lea rax, tryword
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1868]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L222
; lexpr()
	lea rax, expr
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1875]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1883]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 59
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
jmp .L223
.L222: ; if
; lexpr()
	lea rax, tryword
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1889]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L224
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, addrcounter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, addrcounter
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, addrcounter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, expr
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1892]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1908]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, stmt
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, tryword
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1915]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, addrcounter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, addrcounter
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, addrcounter
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L225
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1920]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L225: ; if
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1927]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1930]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L227
; lexpr()
	lea rax, stmt
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1938]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1941]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L227: ; if
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
.L224: ; if
.L223: ; else
.L221: ; else
.L219: ; else
.L217: ; else
.L215: ; else
; lexpr()
	lea rax, expr
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
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
.L230: ; while continue
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	test rax, rax
	jz .L231
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, isalpha
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L232
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L233: ; while continue
; lexpr()
	lea rax, isalnum
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L234
; lexpr()
	lea rax, Bschar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, namebuffer
	push rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L233
.L234: ; while break
; lexpr()
	lea rax, Bschar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, namebuffer
	push rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, namebuffer
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1951]
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
; primary(); after a non lexpr
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L235
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1958]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L236: ; while continue
; lexpr()
	lea rax, isalnum
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L236
.L237: ; while break
; lexpr()
	lea rax, emit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L238
.L235: ; if
; lexpr()
	lea rax, strcmp
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, namebuffer
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1966]
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
; primary(); after a non lexpr
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L239
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1973]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L240: ; while continue
; lexpr()
	lea rax, isalnum
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L241
; lexpr()
	lea rax, emit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L240
.L241: ; while break
; lexpr()
	lea rax, emit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 10
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L242
.L239: ; if
; lexpr()
	lea rax, strcmp
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, namebuffer
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1981]
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
; primary(); after a non lexpr
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L243
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+1988]
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L244
.L243: ; if
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 59
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L245
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2029]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2043]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2053]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L246
.L245: ; if
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 91
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L247
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2068]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2082]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 48
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L248
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2090]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 120
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L249
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2092]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L250: ; while continue
; lexpr()
	lea rax, isxdigit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L251
; lexpr()
	lea rax, emit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L250
.L251: ; while break
.L249: ; if
jmp .L253
.L248: ; if
.L254: ; while continue
; lexpr()
	lea rax, isdigit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L255
; lexpr()
	lea rax, emit
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L254
.L255: ; while break
.L253: ; else
; lexpr()
	lea rax, expect
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 93
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, expect
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 59
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2094]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
jmp .L256
.L247: ; if
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2110]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 40
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, varcnt
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2113]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2124]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L257: ; while continue
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 6
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L258
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 41
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L259
	jmp .L258 ; break
.L259: ; if
; lexpr()
	lea rax, isalpha
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
	jz .L261
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2139]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L261: ; if
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, variables
	push rax ; lexpr index
; lexpr()
	lea rax, varcnt
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 5
	mov rcx, rax
	pop rax
	mul rcx
	pop rcx
	lea rax, [rcx+rax*8]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, varcnt
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, varcnt
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L263: ; while continue
; lexpr()
	lea rax, isalnum
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L264
; lexpr()
	lea rax, Bschar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L263
.L264: ; while break
; lexpr()
	lea rax, Bschar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2160]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2171]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2175]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 44
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L265
	jmp .L258 ; break
.L265: ; if
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L257
.L258: ; while break
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, expect
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 41
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L267: ; while continue
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	test rax, rax
	jz .L268
; lexpr()
	lea rax, whitespace
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 33
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L269
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	jmp .L268 ; break
.L269: ; if
; lexpr()
	lea rax, isalpha
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
	jz .L271
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2177]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L271: ; if
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, variables
	push rax ; lexpr index
; lexpr()
	lea rax, varcnt
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 5
	mov rcx, rax
	pop rax
	mul rcx
	pop rcx
	lea rax, [rcx+rax*8]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, varcnt
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, varcnt
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L273: ; while continue
; lexpr()
	lea rax, isalnum
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
	test rax, rax
	jz .L274
; lexpr()
	lea rax, Bschar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L273
.L274: ; while break
; lexpr()
	lea rax, Bschar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	add rax, rcx
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, peek
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 44
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L275
	jmp .L268 ; break
.L275: ; if
; lexpr()
	lea rax, next
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
jmp .L267
.L268: ; while break
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2198]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 16
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2209]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, stmt
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2211]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2219]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L256: ; else
.L246: ; else
.L244: ; else
.L242: ; else
.L238: ; else
jmp .L277
.L232: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0xFF
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L278
	jmp .L231 ; break
jmp .L279
.L278: ; if
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2225]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
.L279: ; else
.L277: ; else
jmp .L230
.L231: ; while break
	leave
	ret
usage:
	push rbp
	mov rbp, rsp
	mov [rbp-8], rdi
	sub rsp, 32
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2250]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
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
	lea rax, ra
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2310]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2314]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 2
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2318]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 3
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2322]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 4
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2326]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, ra
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 5
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2329]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 3
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L280
; lexpr()
	lea rax, usage
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr localvar deref within the lexpr itself
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
; primary(); after a non lexpr
	mov rax, 2
	leave
	ret
.L280: ; if
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, strcmp
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr localvar deref within the lexpr itself
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2332]
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
; primary(); after a non lexpr
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L282
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, dooutputparse
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L282: ; if
; lexpr()
	lea rax, strcmp
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr localvar deref within the lexpr itself
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2336]
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
; primary(); after a non lexpr
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L284
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L284: ; if
; lexpr()
	lea rax, inputfile
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, fopen
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr localvar deref within the lexpr itself
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2339]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, inputfile
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L286
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2342]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr localvar deref within the lexpr itself
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdx
	mov rdx, rax
; lexpr()
	lea rax, strerror
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, getErrno
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; primary(); after a lexpr
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
; primary(); after a non lexpr
	mov rax, 2
	leave
	ret
.L286: ; if
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr localvar deref within the lexpr itself
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 2
	mov rcx, rax
	pop rax
	sub rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 16
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, outputfile
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, fopen
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2366]
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2372]
	push rsi
	mov rsi, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop rsi
	pop rdi
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, outputfile
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	setz al
	movzx rax, al
	test rax, rax
	jz .L288
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2375]
	push rsi
	mov rsi, rax
; lexpr()
	lea rax, strerror
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; lexpr()
	lea rax, getErrno
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; primary(); after a lexpr
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
; primary(); after a non lexpr
	mov rax, 2
	leave
	ret
.L288: ; if
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2402]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2427]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2438]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2461]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2470]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2488]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2506]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2512]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2521]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2543]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2560]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, top
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2566]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2583]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, Blchar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, strbuf
	push rax
; lexpr()
; primary(); after a non lexpr
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
	lea rax, [rbp-40]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L290: ; while continue
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
	lea rax, strbufsz
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L291
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2595]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, emitd
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, Blchar
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, strbuf
	push rax
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
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
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-40]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L290
.L291: ; while break
; lexpr()
	lea rax, emits
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2597]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, fclose
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, inputfile
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, fclose
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, outputfile
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
	lea rax, assemblerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2599]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, assemblerargc
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, assemblerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-24]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L292
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
	lea rax, assemblerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2604]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, assemblerargc
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, assemblerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L292: ; if
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
	lea rax, assemblerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2607]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
	lea rax, assemblerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2615]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
	lea rax, assemblerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 2
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2621]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
	lea rax, assemblerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 3
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2624]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
	lea rax, assemblerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 4
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
	lea rax, linkerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2630]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
	lea rax, linkerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2633]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
	lea rax, linkerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 2
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2641]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
	lea rax, linkerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 3
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-32]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
	lea rax, linkerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 4
	mov rcx, rax
	pop rax
	add rax, rcx
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2644]
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, linkerargc
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, linkerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 5
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
.L294: ; while continue
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	test rax, rax
	jz .L295
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
	lea rax, linkerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
	mov rax, [rax] ; Lexpr localvar deref within the lexpr itself
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, linkerargc
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, linkerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, [rbp-16]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	add rsp, 8
	pop rcx
	mov [rcx], rax
jmp .L294
.L295: ; while break
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
	lea rax, linkerargc
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-48]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, fork
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-48]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L296
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2650]
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, assemblerargv
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
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
jmp .L297
.L296: ; if
; lexpr()
	lea rax, [rbp-48]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L298
; lexpr()
	lea rax, perror
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2671]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	leave
	ret
.L298: ; if
.L297: ; else
; lexpr()
	lea rax, [rbp-56]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, waitpid
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-48]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, [rbp-56]
	push rsi
	mov rsi, rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a non lexpr
; lexpr()
	lea rax, [rbp-56]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0x7f
	mov rcx, rax
	pop rax
	and rax, rcx
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L300
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2676]
	push rsi
	mov rsi, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, [rbp-56]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0xff00
	mov rcx, rax
	pop rax
	and rax, rcx
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a non lexpr
	mov rax, 1
	leave
	ret
.L300: ; if
; lexpr()
	lea rax, [rbp-48]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
	lea rax, fork
; primary(); after a lexpr
	push r13
	mov r13, rax
	push 0
	xor rax, rax
	call r13
	add rsp, 8
	pop r13
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, [rbp-48]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .L302
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2709]
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
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, linkerargv
	push rax ; lexpr index
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	pop rcx
	lea rax, [rcx+rax*8]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
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
jmp .L303
.L302: ; if
; lexpr()
	lea rax, [rbp-48]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .L304
; lexpr()
	lea rax, perror
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2727]
	push rdi
	mov rdi, rax
	xor rax, rax
	call r13
	pop rdi
	pop r13
; lexpr()
; primary(); after a non lexpr
	mov rax, 1
	leave
	ret
.L304: ; if
.L303: ; else
; lexpr()
	lea rax, [rbp-56]
; primary(); after a lexpr
	push rax
	push 0
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	add rsp, 8
	pop rcx
	mov [rcx], rax
; lexpr()
	lea rax, waitpid
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, [rbp-48]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, [rbp-56]
	push rsi
	mov rsi, rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a non lexpr
; lexpr()
	lea rax, [rbp-56]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0x7f
	mov rcx, rax
	pop rax
	and rax, rcx
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .L306
; lexpr()
	lea rax, fprintf
; primary(); after a lexpr
	push r13
	mov r13, rax
; lexpr()
	lea rax, stderr
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rdi
	mov rdi, rax
; lexpr()
; primary(); after a non lexpr
	lea rax, [abs string+2732]
	push rsi
	mov rsi, rax
; lexpr()
; primary(); after a non lexpr
; lexpr()
	lea rax, [rbp-56]
; primary(); after a lexpr
	mov rax, [rax] ; Lexpr deref
	push rax
; lexpr()
; primary(); after a non lexpr
	mov rax, 0xff00
	mov rcx, rax
	pop rax
	and rax, rcx
	push rax
; lexpr()
; primary(); after a non lexpr
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
; primary(); after a non lexpr
	mov rax, 1
	leave
	ret
.L306: ; if
; lexpr()
; primary(); after a non lexpr
	mov rax, 0
	leave
	ret
section .rodata
string: db 37,99,0,37,99,0,37,115,0,37,122,117,0,69,120,112,101,99,116,101,100,32,39,37,99,39,40,37,100,41,32,98,117,116,32,103,111,116,32,39,37,99,39,40,37,100,41,10,0,73,110,118,97,108,105,100,32,104,101,120,97,100,101,99,105,109,97,108,32,100,105,103,105,116,58,32,39,92,37,99,39,10,0,73,110,118,97,108,105,100,32,104,101,120,97,100,101,99,105,109,97,108,32,100,105,103,105,116,58,32,39,92,37,99,39,10,0,73,110,118,97,108,105,100,32,101,115,99,97,112,101,32,99,111,100,101,58,32,39,92,37,99,39,10,0,59,32,108,101,120,112,114,40,41,10,0,9,108,101,97,32,114,97,120,44,32,91,114,98,112,45,0,93,10,0,9,108,101,97,32,114,97,120,44,32,0,10,0,9,109,111,118,32,114,97,120,44,32,91,114,97,120,93,32,59,32,76,101,120,112,114,32,108,111,99,97,108,118,97,114,32,100,101,114,101,102,32,119,105,116,104,105,110,32,116,104,101,32,108,101,120,112,114,32,105,116,115,101,108,102,10,0,9,112,117,115,104,32,114,97,120,32,59,32,108,101,120,112,114,32,105,110,100,101,120,10,0,9,112,111,112,32,114,99,120,10,0,9,108,101,97,32,114,97,120,44,32,91,114,99,120,43,114,97,120,42,56,93,10,0,59,32,112,114,105,109,97,114,121,40,41,59,32,97,102,116,101,114,32,97,32,108,101,120,112,114,10,0,59,32,112,114,105,109,97,114,121,40,41,59,32,97,102,116,101,114,32,97,32,110,111,110,32,108,101,120,112,114,10,0,9,109,111,118,32,114,97,120,44,32,0,48,0,120,0,10,0,9,109,111,118,32,114,97,120,44,32,0,10,0,9,108,101,97,32,114,97,120,44,32,91,97,98,115,32,115,116,114,105,110,103,43,0,93,10,0,73,110,118,97,108,105,100,32,112,114,105,109,97,114,121,32,101,120,112,114,101,115,115,105,111,110,58,32,39,37,99,39,10,0,9,112,117,115,104,32,114,49,51,10,0,9,109,111,118,32,114,49,51,44,32,114,97,120,10,0,9,112,117,115,104,32,0,10,9,109,111,118,32,0,44,32,114,97,120,10,0,9,112,117,115,104,32,48,10,0,9,120,111,114,32,114,97,120,44,32,114,97,120,10,0,9,99,97,108,108,32,114,49,51,10,0,9,97,100,100,32,114,115,112,44,32,56,10,0,9,112,111,112,32,0,10,0,9,112,111,112,32,114,49,51,10,0,9,109,111,118,32,114,97,120,44,32,91,114,97,120,93,32,59,32,76,101,120,112,114,32,100,101,114,101,102,10,0,9,110,111,116,32,114,97,120,10,0,9,110,101,103,32,114,97,120,10,0,9,116,101,115,116,32,114,97,120,44,32,114,97,120,10,0,9,115,101,116,122,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,97,110,100,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,111,114,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,120,111,114,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,109,117,108,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,120,111,114,32,114,100,120,44,32,114,100,120,10,0,9,100,105,118,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,120,111,114,32,114,100,120,44,32,114,100,120,10,0,9,100,105,118,32,114,99,120,10,0,9,109,111,118,32,114,97,120,44,32,114,100,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,97,100,100,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,115,117,98,32,114,97,120,44,32,114,99,120,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,101,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,110,101,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,115,104,108,32,114,97,120,44,32,99,108,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,98,101,32,97,108,10,0,9,115,101,116,98,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,109,111,118,32,114,99,120,44,32,114,97,120,10,0,9,112,111,112,32,114,97,120,10,0,9,115,104,114,32,114,97,120,44,32,99,108,10,0,9,99,109,112,32,114,97,120,44,32,114,99,120,10,0,9,115,101,116,97,101,32,97,108,10,0,9,115,101,116,97,32,97,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,97,108,10,0,9,112,117,115,104,32,114,97,120,10,0,9,112,117,115,104,32,48,10,0,9,97,100,100,32,114,115,112,44,32,56,10,0,9,112,111,112,32,114,99,120,10,0,9,109,111,118,32,91,114,99,120,93,44,32,114,97,120,10,0,9,112,117,115,104,32,114,97,120,32,59,59,32,68,101,112,114,101,99,97,116,101,100,32,114,101,118,101,114,115,101,32,97,115,115,105,103,110,109,101,110,116,58,32,39,58,39,10,0,69,120,112,101,99,116,101,100,32,108,101,120,112,114,32,111,110,32,114,105,103,104,116,32,104,97,110,100,32,115,105,100,101,32,111,102,32,116,104,101,32,114,101,118,101,114,115,101,32,97,115,115,105,103,110,109,101,110,116,46,10,77,97,121,98,101,32,121,111,117,32,115,104,111,117,108,100,32,99,111,110,115,105,100,101,114,32,110,111,116,32,117,115,105,110,103,32,97,32,100,101,99,114,101,99,97,116,101,100,32,102,101,97,116,117,114,101,63,33,33,10,0,9,112,111,112,32,114,99,120,10,0,9,109,111,118,32,91,114,97,120,93,44,32,114,99,120,10,0,9,109,111,118,32,114,97,120,44,32,114,99,120,10,0,99,111,110,116,105,110,117,101,0,9,106,109,112,32,46,76,0,32,59,32,99,111,110,116,105,110,117,101,10,0,98,114,101,97,107,0,9,106,109,112,32,46,76,0,32,59,32,98,114,101,97,107,10,0,119,104,105,108,101,0,46,76,0,58,32,59,32,119,104,105,108,101,32,99,111,110,116,105,110,117,101,10,0,9,116,101,115,116,32,114,97,120,44,32,114,97,120,10,0,9,106,122,32,46,76,0,106,109,112,32,46,76,0,46,76,0,58,32,59,32,119,104,105,108,101,32,98,114,101,97,107,10,0,114,101,116,117,114,110,0,9,108,101,97,118,101,10,0,9,114,101,116,10,0,105,102,0,9,116,101,115,116,32,114,97,120,44,32,114,97,120,10,0,9,106,122,32,46,76,0,101,108,115,101,0,106,109,112,32,46,76,0,46,76,0,58,32,59,32,105,102,10,0,46,76,0,58,32,59,32,101,108,115,101,10,0,103,108,111,98,97,108,0,103,108,111,98,97,108,32,0,101,120,116,101,114,110,0,101,120,116,101,114,110,32,0,105,109,112,111,114,116,0,105,109,112,111,114,116,105,110,103,32,115,116,117,102,102,32,105,115,32,110,111,116,32,105,109,112,108,101,109,101,110,116,101,100,32,121,101,116,46,10,0,115,101,99,116,105,111,110,32,46,98,115,115,10,0,58,32,114,101,115,113,32,49,10,0,115,101,99,116,105,111,110,32,46,116,101,120,116,10,0,115,101,99,116,105,111,110,32,46,98,115,115,10,0,58,32,114,101,115,113,32,0,48,0,120,0,10,115,101,99,116,105,111,110,32,46,116,101,120,116,10,0,58,10,0,9,112,117,115,104,32,114,98,112,10,0,9,109,111,118,32,114,98,112,44,32,114,115,112,10,0,66,97,100,32,99,104,97,114,97,99,116,101,114,58,32,39,37,99,39,10,0,9,109,111,118,32,91,114,98,112,45,0,93,44,32,0,10,0,66,97,100,32,99,104,97,114,97,99,116,101,114,58,32,39,37,99,39,10,0,9,115,117,98,32,114,115,112,44,32,0,10,0,9,108,101,97,118,101,10,0,9,114,101,116,10,0,73,110,118,97,108,105,100,32,115,116,97,116,101,109,101,110,116,58,32,39,37,99,39,10,0,85,115,97,103,101,58,32,37,115,32,91,45,112,112,93,32,91,45,103,93,32,105,110,112,117,116,45,99,111,100,101,32,111,117,116,112,117,116,45,102,105,108,101,32,91,108,105,110,107,101,114,32,102,108,97,103,115,93,10,0,114,100,105,0,114,115,105,0,114,100,120,0,114,99,120,0,114,56,0,114,57,0,45,112,112,0,45,103,0,114,98,0,70,97,105,108,101,100,32,116,111,32,111,112,101,110,58,32,37,115,58,32,37,115,10,0,111,117,116,46,115,0,119,98,0,70,97,105,108,101,100,32,116,111,32,111,112,101,110,58,32,111,117,116,46,115,58,32,37,115,10,0,101,120,116,101,114,110,32,95,95,101,114,114,110,111,95,108,111,99,97,116,105,111,110,10,0,103,101,116,69,114,114,110,111,58,10,0,9,106,109,112,32,95,95,101,114,114,110,111,95,108,111,99,97,116,105,111,110,10,0,66,108,99,104,97,114,58,10,0,9,109,111,118,32,114,49,48,98,44,32,91,114,100,105,93,10,0,9,109,111,118,122,120,32,114,97,120,44,32,114,49,48,98,10,0,9,114,101,116,10,0,66,115,99,104,97,114,58,10,0,9,109,111,118,32,98,121,116,101,32,91,114,100,105,93,44,32,115,105,108,10,0,9,109,111,118,122,120,32,114,97,120,44,32,115,105,108,10,0,9,114,101,116,10,0,115,101,99,116,105,111,110,32,46,114,111,100,97,116,97,10,0,115,116,114,105,110,103,58,32,100,98,32,0,44,0,10,0,110,97,115,109,0,45,103,0,45,102,69,76,70,54,52,0,111,117,116,46,115,0,45,111,0,111,117,116,46,111,0,99,99,0,45,110,111,45,112,105,101,0,45,111,0,111,117,116,46,111,0,83,116,97,114,116,105,110,103,32,97,115,115,101,109,98,108,105,110,103,10,0,102,111,114,107,0,65,115,115,101,109,98,108,101,114,32,101,120,105,116,101,100,32,97,98,110,111,114,109,97,108,108,121,58,32,37,100,10,0,83,116,97,114,116,105,110,103,32,108,105,110,107,105,110,103,10,0,102,111,114,107,0,76,105,110,107,101,114,32,101,120,105,116,101,100,32,97,98,110,111,114,109,97,108,108,121,58,32,37,100,10,0
