	.intel_syntax noprefix
	.globl main
	.text
main:
	push	rbp
	mov	rbp,	rsp
	sub	rsp,	16
	lea	rsi,	[rbp - 8]
	lea	rdi,	scanf_str[rip]
	call	scanf@PLT
	mov	rdi,	QWORD PTR [rbp - 8]
	call	is_prime
	leave
	mov	rax,	0
	ret

is_prime:
	sub	rsp,	8
	test	rdi,	rdi
	jz	false
	cmp	rdi,	1
	je	false
	mov	rax,	0x8000000000000000
	test	rdi,	rax
	jnz	false
	cmp	rdi,	2
	je	true
	test	rdi,	1
	jz	false
	mov	rcx,	3
loop:
	xor	rax,	rax
	xor	rdx,	rdx
	mov	rax,	rcx
	mul	rcx
	test	rdx,	rdx
	jnz	true
	cmp	rax,	rdi
	jge	true
	xor	rax,	rax
	mov	rax,	rcx
	div	rdi
	test	rdx,	rdx
	jz	false
	inc	rcx
	inc	rcx
	jmp	loop
true:
	lea	rdi,	true_str[rip]
	call	puts@PLT
	add	rsp,	8
	ret
false:
	lea	rdi,	false_str[rip]
	call	puts@PLT
	add	rsp,	8
	ret

.section .rodata
scanf_str:
	.asciz	"%ld"

true_str:
	.asciz	"true"
false_str:
	.asciz	"false"

