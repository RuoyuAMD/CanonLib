	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	leaq	L_.str(%rip), %rax
	leaq	-20(%rbp), %rcx
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	-20(%rbp), %edx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	movb	$0, %al
	callq	_printf
	leaq	L_.str(%rip), %rdi
	leaq	-20(%rbp), %rsi
	movl	$723, -20(%rbp)         ## imm = 0x2D3
	movl	-20(%rbp), %edx
	movl	%eax, -76(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.1(%rip), %rdi
	leaq	-20(%rbp), %rsi
	movl	%eax, -80(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.2(%rip), %rdi
	leaq	-32(%rbp), %rsi
	movq	-32(%rbp), %rdx
	movl	%eax, -84(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.3(%rip), %rdi
	leaq	-32(%rbp), %rsi
	leaq	-20(%rbp), %rcx
	movq	%rcx, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movl	(%rcx), %ecx
	movl	%eax, -88(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.4(%rip), %rdi
	leaq	-40(%rbp), %rsi
	movq	-40(%rbp), %rdx
	movl	%eax, -92(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.5(%rip), %rdi
	leaq	-40(%rbp), %rsi
	leaq	-32(%rbp), %rdx
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rdx
	movq	-40(%rbp), %r8
	movq	(%r8), %rcx
	movq	-40(%rbp), %r8
	movq	(%r8), %r8
	movl	(%r8), %r8d
	movl	%eax, -96(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.6(%rip), %rdi
	leaq	-48(%rbp), %rsi
	movq	-48(%rbp), %rdx
	movl	%eax, -100(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.7(%rip), %rdi
	leaq	-48(%rbp), %rsi
	leaq	-40(%rbp), %rcx
	movq	%rcx, -48(%rbp)
	movq	-48(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	-48(%rbp), %r9
	movq	(%r9), %r9
	movq	(%r9), %r8
	movq	-48(%rbp), %r9
	movq	(%r9), %r9
	movq	(%r9), %r9
	movl	(%r9), %r9d
	movl	%eax, -104(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	$8, %r9d
	movl	%r9d, %edi
	movl	%eax, -108(%rbp)        ## 4-byte Spill
	callq	_malloc
	leaq	L_.str.3(%rip), %rdi
	leaq	-32(%rbp), %rsi
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	$327, (%rax)            ## imm = 0x147
	movq	-32(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	(%rax), %ecx
	movb	$0, %al
	callq	_printf
	movl	$8, %ecx
	movl	%ecx, %edi
	movl	%eax, -112(%rbp)        ## 4-byte Spill
	callq	_malloc
	leaq	L_.str.8(%rip), %rdi
	leaq	-56(%rbp), %rsi
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rdx
	movq	-56(%rbp), %rax
	movl	(%rax), %ecx
	movb	$0, %al
	callq	_printf
	leaq	L_.str.9(%rip), %rdi
	leaq	-64(%rbp), %rsi
	movq	-64(%rbp), %rdx
	movq	-64(%rbp), %r8
	movl	(%r8), %ecx
	movl	%eax, -116(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	$8, %ecx
	movl	%ecx, %edi
	movl	%eax, -120(%rbp)        ## 4-byte Spill
	callq	_malloc
	leaq	L_.str.10(%rip), %rdi
	leaq	-72(%rbp), %rsi
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rdx
	movq	-72(%rbp), %rax
	movl	(%rax), %ecx
	movb	$0, %al
	callq	_printf
	xorl	%ecx, %ecx
	movl	%eax, -124(%rbp)        ## 4-byte Spill
	movl	%ecx, %eax
	addq	$128, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"&a = %d    a = %d\n"

L_.str.1:                               ## @.str.1
	.asciz	"%d"

L_.str.2:                               ## @.str.2
	.asciz	"&b = %d    b = %d\n"

L_.str.3:                               ## @.str.3
	.asciz	"&b = %d    b = %d    *b = %d\n"

L_.str.4:                               ## @.str.4
	.asciz	"&c = %d    c = %d\n"

L_.str.5:                               ## @.str.5
	.asciz	"&c = %d    c = %d    *c = %d    **c = %d\n"

L_.str.6:                               ## @.str.6
	.asciz	"&d = %d    d = %d\n"

L_.str.7:                               ## @.str.7
	.asciz	"&d = %d    d = %d    *d = %d    **d = %d    ***d = %d\n"

L_.str.8:                               ## @.str.8
	.asciz	"&p1 = %d    p1 = %d    *p1 = %d\n"

L_.str.9:                               ## @.str.9
	.asciz	"&p2 = %    p2 = %d    *p2 = %d\n"

L_.str.10:                              ## @.str.10
	.asciz	"&p3 = %     p3 = %d    *p3 = %d\n"


.subsections_via_symbols
