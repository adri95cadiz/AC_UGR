	.file	"SumaVectores.c"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC0:
	.string	"Faltan n\302\272 componentes del vector"
	.align 4
.LC1:
	.string	"Error en la reserva de espacio para los vectores"
	.align 4
.LC4:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Vectores:%u\t/ V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / /V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB34:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	addl	$-128, %esp
	cmpl	$1, 8(%ebp)
	jle	.L13
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	movl	12(%ebp), %eax
	movl	$10, 8(%esp)
	movl	$0, 4(%esp)
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	strtol
	leal	0(,%eax,8), %edx
	movl	%eax, %edi
	movl	%edx, (%esp)
	movl	%edx, 84(%esp)
	call	malloc
	movl	84(%esp), %edx
	movl	%edx, (%esp)
	movl	%eax, %ebx
	call	malloc
	movl	84(%esp), %edx
	movl	%edx, (%esp)
	movl	%eax, %esi
	call	malloc
	testl	%esi, %esi
	movl	%eax, %edx
	je	.L3
	testl	%ebx, %ebx
	je	.L3
	testl	%eax, %eax
	.p2align 4,,3
	je	.L3
	testl	%edi, %edi
	.p2align 4,,5
	je	.L14
	movl	%edi, 88(%esp)
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	movl	$0, 92(%esp)
	fildq	88(%esp)
	fldl	.LC2
	fmul	%st, %st(1)
	.p2align 4,,7
	.p2align 3
.L6:
	movl	%eax, 108(%esp)
	addl	$1, %eax
	fildl	108(%esp)
	cmpl	%edi, %eax
	fmul	%st(1), %st
	fld	%st(0)
	fadd	%st(3), %st
	fstpl	(%ebx,%ecx,8)
	fsubr	%st(2), %st
	fstpl	(%esi,%ecx,8)
	movl	%eax, %ecx
	jne	.L6
	fstp	%st(0)
	fstp	%st(0)
	leal	112(%esp), %eax
	movl	%edx, 84(%esp)
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	clock_gettime
	movl	84(%esp), %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L7:
	fldl	(%ebx,%ecx,8)
	addl	$1, %eax
	faddl	(%esi,%ecx,8)
	cmpl	%edi, %eax
	fstpl	(%edx,%ecx,8)
	movl	%eax, %ecx
	jne	.L7
.L8:
	leal	120(%esp), %eax
	movl	%edx, 84(%esp)
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	clock_gettime
	movl	84(%esp), %edx
	leal	-1(%edi), %eax
	fldl	(%edx,%eax,8)
	fstpl	72(%esp)
	fldl	(%esi,%eax,8)
	fstpl	64(%esp)
	fldl	(%ebx,%eax,8)
	movl	%eax, 52(%esp)
	fstpl	56(%esp)
	movl	%eax, 48(%esp)
	movl	%eax, 44(%esp)
	movl	120(%esp), %eax
	subl	112(%esp), %eax
	fldl	(%edx)
	fstpl	36(%esp)
	movl	%eax, 108(%esp)
	fldl	(%esi)
	movl	124(%esp), %eax
	fstpl	28(%esp)
	subl	116(%esp), %eax
	fldl	(%ebx)
	fstpl	20(%esp)
	fildl	108(%esp)
	movl	%eax, 108(%esp)
	fildl	108(%esp)
	fdivs	.LC3
	movl	%edi, 16(%esp)
	movl	$.LC4, 4(%esp)
	movl	$1, (%esp)
	faddp	%st, %st(1)
	fstpl	8(%esp)
	call	__printf_chk
	movl	%ebx, (%esp)
	call	free
	movl	%esi, (%esp)
	call	free
	movl	84(%esp), %edx
	movl	%edx, (%esp)
	call	free
	leal	-12(%ebp), %esp
	xorl	%eax, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_def_cfa 4, 4
	.cfi_restore 5
	ret
.L14:
	.cfi_restore_state
	leal	112(%esp), %eax
	movl	%edx, 84(%esp)
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	clock_gettime
	movl	84(%esp), %edx
	jmp	.L8
.L3:
	movl	$.LC1, (%esp)
	call	puts
	movl	$-2, (%esp)
	call	exit
.L13:
	movl	$.LC0, (%esp)
	call	puts
	movl	$-1, (%esp)
	call	exit
	.cfi_endproc
.LFE34:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	-1717986918
	.long	1069128089
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC3:
	.long	1315859240
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
