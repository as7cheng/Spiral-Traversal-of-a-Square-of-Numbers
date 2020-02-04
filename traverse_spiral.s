	.file	"traverse_spiral.c"
	.text
	.globl	COMMA
	.section	.rodata
.LC0:
	.string	","
	.section	.data.rel.local,"aw",@progbits
	.align 4
	.type	COMMA, @object
	.size	COMMA, 4
COMMA:
	.long	.LC0
	.section	.rodata
.LC1:
	.string	"Error while reading the file"
	.text
	.globl	get_dimensions
	.type	get_dimensions, @function
get_dimensions:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	8(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	movl	$0, -20(%ebp)
	movl	$0, -16(%ebp)
	subl	$4, %esp
	pushl	-28(%ebp)
	leal	-16(%ebp), %eax
	pushl	%eax
	leal	-20(%ebp), %eax
	pushl	%eax
	call	getline@PLT
	addl	$16, %esp
	cmpl	$-1, %eax
	jne	.L2
	subl	$12, %esp
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	$1
	call	exit@PLT
.L2:
	movl	-20(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	atoi@PLT
	addl	$16, %esp
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	movl	%edx, (%eax)
	nop
	movl	-12(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L3
	call	__stack_chk_fail_local
.L3:
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	get_dimensions, .-get_dimensions
	.section	.rodata
.LC2:
	.string	"%d\n"
.LC3:
	.string	"%d "
	.text
	.globl	traverse_layer
	.type	traverse_layer, @function
traverse_layer:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	12(%ebp), %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	cmpl	$1, %eax
	jne	.L5
	movl	12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	subl	$1, %eax
	cmpl	%eax, 16(%ebp)
	jne	.L5
	movl	16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	20(%ebp)
	call	fprintf@PLT
	addl	$16, %esp
	jmp	.L4
.L5:
	movl	16(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	$0, -20(%ebp)
	jmp	.L7
.L8:
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %ecx
	movl	-20(%ebp), %edx
	addl	%ecx, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	20(%ebp)
	call	fprintf@PLT
	addl	$16, %esp
	addl	$1, -20(%ebp)
.L7:
	movl	16(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	12(%ebp), %eax
	subl	%edx, %eax
	cmpl	%eax, -20(%ebp)
	jl	.L8
	movl	12(%ebp), %eax
	subl	16(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -12(%ebp)
	movl	$0, -20(%ebp)
	jmp	.L9
.L10:
	movl	16(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	addl	$1, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	20(%ebp)
	call	fprintf@PLT
	addl	$16, %esp
	addl	$1, -20(%ebp)
.L9:
	movl	16(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	12(%ebp), %eax
	subl	%edx, %eax
	subl	$1, %eax
	cmpl	%eax, -20(%ebp)
	jl	.L10
	movl	12(%ebp), %eax
	subl	16(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	movl	16(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	12(%ebp), %eax
	subl	%edx, %eax
	subl	$1, %eax
	movl	%eax, -20(%ebp)
	jmp	.L11
.L12:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	addl	$1073741823, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	20(%ebp)
	call	fprintf@PLT
	addl	$16, %esp
	subl	$1, -20(%ebp)
.L11:
	cmpl	$0, -20(%ebp)
	jg	.L12
	movl	16(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	$0, -20(%ebp)
	jmp	.L13
.L14:
	movl	12(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$1073741822, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	20(%ebp)
	call	fprintf@PLT
	addl	$16, %esp
	addl	$1, -20(%ebp)
.L13:
	movl	16(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	12(%ebp), %eax
	subl	%edx, %eax
	subl	$2, %eax
	cmpl	%eax, -20(%ebp)
	jl	.L14
.L4:
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	traverse_layer, .-traverse_layer
	.globl	traverse_spirally
	.type	traverse_spirally, @function
traverse_spirally:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	$0, -20(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -20(%ebp)
	movl	-12(%ebp), %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	cmpl	$1, %eax
	jne	.L16
	addl	$1, -20(%ebp)
.L16:
	movl	$0, -16(%ebp)
	jmp	.L17
.L18:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	pushl	12(%ebp)
	pushl	-16(%ebp)
	pushl	-12(%ebp)
	pushl	%eax
	call	traverse_layer
	addl	$16, %esp
	addl	$1, -16(%ebp)
.L17:
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jl	.L18
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	traverse_spirally, .-traverse_spirally
	.section	.rodata
	.align 4
.LC4:
	.string	"Usage: ./traverse_spiral <input_filename> <output_filename>"
.LC5:
	.string	"r"
.LC6:
	.string	"Cannot open file for reading."
.LC7:
	.string	"w"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x74,0x6
	.cfi_escape 0x10,0x6,0x2,0x75,0x7c
	.cfi_escape 0x10,0x3,0x2,0x75,0x78
	subl	$92, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	%ecx, %eax
	movl	4(%eax), %edx
	movl	%edx, -92(%ebp)
	movl	%gs:20, %ecx
	movl	%ecx, -28(%ebp)
	xorl	%ecx, %ecx
	cmpl	$3, (%eax)
	je	.L20
	subl	$12, %esp
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
.L20:
	movl	-92(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	subl	$8, %esp
	leal	.LC5@GOTOFF(%ebx), %edx
	pushl	%edx
	pushl	%eax
	call	fopen@PLT
	addl	$16, %esp
	movl	%eax, -44(%ebp)
	cmpl	$0, -44(%ebp)
	jne	.L21
	movl	stderr@GOT(%ebx), %eax
	movl	(%eax), %eax
	pushl	%eax
	pushl	$29
	pushl	$1
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	call	fwrite@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	$1
	call	exit@PLT
.L21:
	movl	$0, -76(%ebp)
	subl	$8, %esp
	leal	-76(%ebp), %eax
	pushl	%eax
	pushl	-44(%ebp)
	call	get_dimensions
	addl	$16, %esp
	movl	-76(%ebp), %eax
	sall	$2, %eax
	subl	$12, %esp
	pushl	%eax
	call	malloc@PLT
	addl	$16, %esp
	movl	%eax, -40(%ebp)
	movl	$0, -64(%ebp)
	jmp	.L22
.L23:
	movl	-76(%ebp), %eax
	sall	$2, %eax
	movl	-64(%ebp), %edx
	leal	0(,%edx,4), %ecx
	movl	-40(%ebp), %edx
	leal	(%ecx,%edx), %esi
	subl	$12, %esp
	pushl	%eax
	call	malloc@PLT
	addl	$16, %esp
	movl	%eax, (%esi)
	addl	$1, -64(%ebp)
.L22:
	movl	-76(%ebp), %eax
	cmpl	%eax, -64(%ebp)
	jl	.L23
	movl	$0, -72(%ebp)
	movl	$0, -68(%ebp)
	movl	$0, -60(%ebp)
	movl	$0, -56(%ebp)
	jmp	.L24
.L28:
	subl	$4, %esp
	pushl	-44(%ebp)
	leal	-68(%ebp), %eax
	pushl	%eax
	leal	-72(%ebp), %eax
	pushl	%eax
	call	getline@PLT
	addl	$16, %esp
	cmpl	$-1, %eax
	jne	.L25
	subl	$12, %esp
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	$1
	call	exit@PLT
.L25:
	movl	COMMA@GOTOFF(%ebx), %edx
	movl	-72(%ebp), %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	strtok@PLT
	addl	$16, %esp
	movl	%eax, -60(%ebp)
	movl	$0, -52(%ebp)
	jmp	.L26
.L27:
	movl	-56(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-52(%ebp), %edx
	sall	$2, %edx
	leal	(%eax,%edx), %esi
	subl	$12, %esp
	pushl	-60(%ebp)
	call	atoi@PLT
	addl	$16, %esp
	movl	%eax, (%esi)
	movl	COMMA@GOTOFF(%ebx), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$0
	call	strtok@PLT
	addl	$16, %esp
	movl	%eax, -60(%ebp)
	addl	$1, -52(%ebp)
.L26:
	movl	-76(%ebp), %eax
	cmpl	%eax, -52(%ebp)
	jl	.L27
	addl	$1, -56(%ebp)
.L24:
	movl	-76(%ebp), %eax
	cmpl	%eax, -56(%ebp)
	jl	.L28
	subl	$12, %esp
	pushl	$8
	call	malloc@PLT
	addl	$16, %esp
	movl	%eax, -36(%ebp)
	movl	-76(%ebp), %edx
	movl	-36(%ebp), %eax
	movl	%edx, (%eax)
	movl	-36(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-92(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	subl	$8, %esp
	leal	.LC7@GOTOFF(%ebx), %edx
	pushl	%edx
	pushl	%eax
	call	fopen@PLT
	addl	$16, %esp
	movl	%eax, -32(%ebp)
	cmpl	$0, -32(%ebp)
	jne	.L29
	movl	stderr@GOT(%ebx), %eax
	movl	(%eax), %eax
	pushl	%eax
	pushl	$29
	pushl	$1
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	call	fwrite@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	$1
	call	exit@PLT
.L29:
	subl	$8, %esp
	pushl	-32(%ebp)
	pushl	-36(%ebp)
	call	traverse_spirally
	addl	$16, %esp
	movl	$0, -48(%ebp)
	jmp	.L30
.L31:
	movl	-48(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	free@PLT
	addl	$16, %esp
	addl	$1, -48(%ebp)
.L30:
	movl	-76(%ebp), %eax
	cmpl	%eax, -48(%ebp)
	jl	.L31
	subl	$12, %esp
	pushl	-40(%ebp)
	call	free@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	-44(%ebp)
	call	fclose@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	-32(%ebp)
	call	fclose@PLT
	addl	$16, %esp
	movl	$0, %eax
	movl	-28(%ebp), %ecx
	xorl	%gs:20, %ecx
	je	.L33
	call	__stack_chk_fail_local
.L33:
	leal	-12(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB9:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE9:
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB10:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE10:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
