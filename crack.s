	.section .data
p0:	.int	0x65746e45,0x6f792072,0x6e207275,0x3a656d61,0x20
p1:	.int	0x65746e45,0x6f792072,0x73207275,0x61697265,0x203a6c
m0:	.int	0x72726f43,0x21746365,0xa
m1:	.int	0x6f636e49,0x63657272,0xa2174
	.section .text
	.globl crack
crack:	movl	$1,%edi
	leaq	p0,%rsi
	movl	$0x11,%edx
	movl	$1,%eax
	syscall
	movl	$0,%edi
	leaq	0xffffffffffffffe0(%rsp),%rsi
	movl	$0x13,%edx
	movl	$0,%eax
	syscall
	cmpl	$0x14,%eax
	jl	.L0
	movl	$1,%eax
	jmp	.L1
.L0:	movb	$0,0xfffffffffffffff7(%rsp)
	leaq	0xffffffffffffffe0(%rsp),%rdi
	movl	$0xa,%eax
	repne scasb
	dec	%rdi
	movb	$0,(%rdi)
	movl	$1,%edi
	leaq	p1,%rsi
	movl	$0x13,%edx
	movl	$1,%eax
	syscall
	movl	$0,%edi
	leaq	0xffffffffffffffd0(%rsp),%rsi
	movl	$0xa,%edx
	movl	$0,%eax
	syscall
	cmpl	$0xb,%eax
	jl	.L2
	movl	$1,%eax
	jmp	.L1
.L2:	movb	$0,0xffffffffffffffdb(%rsp)
	leaq	0xffffffffffffffd0(%rsp),%rdi
	movl	$0xa,%eax
	repne scasb
	dec	%rdi
	movb	$0,(%rdi)
	movl	$0x27,%eax
	syscall
	movl	%eax,0xffffffffffffffa4(%rsp)
	movq	$0x2f636f72702f,%rax
	movq	%rax,0xffffffffffffffb0(%rsp)
	movb	$0,0xffffffffffffff65(%rsp)
	leaq	0xffffffffffffff64(%rsp),%rdi
	movl	0xffffffffffffffa4(%rsp),%eax
.L3:	cmpl	$0,%eax
	je	.L10
	cdq
	movl	$0xa,%ecx
	idiv	%ecx
	addb	$0x30,%dl
	movb	%dl,(%rdi)
	dec	%rdi
	jmp	.L3
.L10:	inc	%rdi
	movq	%rdi,%rsi
	leaq	0xffffffffffffffb6(%rsp),%rdi
.L13:	movsb	(%rsi),(%rdi)
	cmpb	$0,(%rsi)
	jne	.L13
	movb	$0x2f,(%rdi)
	inc	%rdi
	movl	$0x7370616d,(%rdi)
	addq	$4,%rdi
	movb	$0,(%rdi)
	leaq	0xffffffffffffffb0(%rsp),%rdi
	xorl	%esi,%esi
	xorl	%edx,%edx
	movl	$2,%eax
	syscall
	movl	%eax,0xffffffffffffffac(%rsp)
	movl	0xffffffffffffffac(%rsp),%edi
	leaq	0xffffffffffffff80(%rsp),%rsi
	movb	$0,0xffffffffffffff8f(%rsp)
	movl	$0xf,%edx
	movl	$0,%eax
	syscall
	movb	$0x2d,%al
	leaq	0xffffffffffffff80(%rsp),%rdi
	repne scasb
	dec	%rdi
	movb	$0,(%rdi)
	movl	0xffffffffffffffac(%rsp),%edi
	movl	$3,%eax
	syscall
	xorl	%eax,%eax
	xorl	%edx,%edx
	leaq	0xffffffffffffff80(%rsp),%rdi
.L12:	cmpb	$0,(%rdi)
	je	.L11
	movb	(%rdi),%dl
	addl	%edx,%eax
	inc	%rdi
	jmp	.L12
.L11:	movl	%eax,0xffffffffffffff7c(%rsp)
	xorl	%eax,%eax
	leaq	0xffffffffffffffd0(%rsp),%rdi
.L4:	cmpb	$0,(%rdi)
	je	.L5
	cdq
	movl	$0xa,%ecx
	imul	%ecx
	xorl	%edx,%edx
	movb	(%rdi),%dl
	addl	$0xffffffd0,%edx
	addb	%dl,%al
	inc	%rdi
	jmp	.L4
.L5:	movl	%eax,0xffffffffffffff9c(%rsp)
	xorl	%eax,%eax
	xorl	%edx,%edx
	movl	0xffffffffffffff7c(%rsp),%ecx
	leaq	0xffffffffffffffe0(%rsp),%rsi
.L6:	cmpb	$0,(%rsi)
	je	.L7
	movb	(%rsi),%dl
	xorl	%ecx,%edx
	addl	%edx,%eax
	inc	%rsi
	jmp	.L6
.L7:	movl	%eax,0xffffffffffffff94(%rsp)
	movl	0xffffffffffffff94(%rsp),%eax
	movl	0xffffffffffffff9c(%rsp),%edx
	cmpl	%eax,%edx
	jne	.L8
	leaq	m0,%rsi
	movl	$9,%edx
	jmp	.L9
.L8:	leaq	m1,%rsi
	movl	$0xb,%edx
.L9:	movl	$1,%edi
	movl	$1,%eax
	syscall
	xorl	%edi,%edi
.L1:	movl	$0x3c,%eax
	syscall
