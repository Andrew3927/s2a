#Auto-Genereated by SE352
.data
	.input_fmtstr:	.string	"%d"			# (main.c, 144)
	.output_fmtstr:	.string	"%d\012"			# (main.c, 145)
	.comm	year,4			# (decl.c, 157)
	.comm	month,4			# (decl.c, 157)
	.comm	day,4			# (decl.c, 157)

.text
.globl  SQAless
SQAless:
	movl 8(%esp), %eax			# (main.c, 35)
	cmpl %eax, 4(%esp)			# (main.c, 36)
	setl    %al			# (main.c, 37)
	movzbl  %al, %eax			# (main.c, 38)
	ret			# (main.c, 39)

.text
.globl  SQAlarger
SQAlarger:
	movl 8(%esp), %eax			# (main.c, 35)
	cmpl %eax, 4(%esp)			# (main.c, 36)
	setg    %al			# (main.c, 37)
	movzbl  %al, %eax			# (main.c, 38)
	ret			# (main.c, 39)

.text
.globl  SQAequal
SQAequal:
	movl 8(%esp), %eax			# (main.c, 35)
	cmpl %eax, 4(%esp)			# (main.c, 36)
	sete    %al			# (main.c, 37)
	movzbl  %al, %eax			# (main.c, 38)
	ret			# (main.c, 39)

.text
.globl  SQAstore
SQAstore:
	movl 12(%esp), %eax			# (main.c, 99)
	movl 4(%esp), %ecx			# (main.c, 100)
	movl 8(%esp), %edx			# (main.c, 101)
	movl %eax, (%ecx,%edx)			# (main.c, 102)
	ret			# (main.c, 103)

.text
.globl  SQAload
SQAload:
	movl 4(%esp), %edx			# (main.c, 119)
	movl 8(%esp), %eax			# (main.c, 120)
	movl (%edx,%eax), %eax			# (main.c, 121)
	ret			# (main.c, 122)

.text
.globl	f
f:
	pushl %ebp			# (emit.c, 17)
	movl %esp, %ebp			# (emit.c, 22)
	subl $124, %esp			# (emit.c, 24)
	cmpl $0, 8(%ebp)			# (stmt.c, 309)
	je Label_0			# (stmt.c, 310)
	movl 8(%ebp), %eax			# (expr.c, 346)
	subl $1, %eax			# (expr.c, 347)
	movl %eax, -8(%ebp)			# (expr.c, 348)
	pushl -8(%ebp)			# (expr.c, 321)
	call f			# (expr.c, 325)
	addl $4, %esp			# (expr.c, 327)
	movl %eax, -4(%ebp)			# (expr.c, 330)
	movl -4(%ebp), %eax			# (expr.c, 338)
	addl 8(%ebp), %eax			# (expr.c, 339)
	movl %eax, -16(%ebp)			# (expr.c, 340)
	movl -16(%ebp), %eax			# (stmt.c, 411)
	jmp Label_1			# (stmt.c, 312)
Label_0:
	movl 8(%ebp), %eax			# (stmt.c, 411)
Label_1:
	movl %ebp, %esp			# (emit.c, 41)
	popl %ebp			# (emit.c, 45)
	ret			# (emit.c, 46)

.text
.globl	g
g:
	pushl %ebp			# (emit.c, 17)
	movl %esp, %ebp			# (emit.c, 22)
	subl $124, %esp			# (emit.c, 24)
	movl $0, %eax			# (stmt.c, 368)
	movl %eax, -4(%ebp)			# (stmt.c, 369)
Label_2:
	movl 12(%ebp), %eax			# (expr.c, 338)
	addl $1, %eax			# (expr.c, 339)
	movl %eax, -12(%ebp)			# (expr.c, 340)
	pushl -12(%ebp)			# (expr.c, 321)
	pushl 8(%ebp)			# (expr.c, 321)
	call SQAless			# (expr.c, 325)
	addl $8, %esp			# (expr.c, 327)
	movl %eax, -8(%ebp)			# (expr.c, 330)
	cmpl $0, -8(%ebp)			# (stmt.c, 346)
	je Label_3			# (stmt.c, 347)
	movl -4(%ebp), %eax			# (expr.c, 338)
	addl 8(%ebp), %eax			# (expr.c, 339)
	movl %eax, -16(%ebp)			# (expr.c, 340)
	movl -16(%ebp), %eax			# (stmt.c, 368)
	movl %eax, -4(%ebp)			# (stmt.c, 369)
	movl 8(%ebp), %eax			# (expr.c, 338)
	addl 16(%ebp), %eax			# (expr.c, 339)
	movl %eax, -20(%ebp)			# (expr.c, 340)
	movl -20(%ebp), %eax			# (stmt.c, 368)
	movl %eax, 8(%ebp)			# (stmt.c, 369)
	jmp Label_2			# (stmt.c, 349)
Label_3:
	movl -4(%ebp), %eax			# (stmt.c, 411)
	movl %ebp, %esp			# (emit.c, 41)
	popl %ebp			# (emit.c, 45)
	ret			# (emit.c, 46)

.text
.globl	printStrs
printStrs:
	pushl %ebp			# (emit.c, 17)
	movl %esp, %ebp			# (emit.c, 22)
	subl $124, %esp			# (emit.c, 24)
	movl $0, %eax			# (stmt.c, 368)
	movl %eax, -4(%ebp)			# (stmt.c, 369)
	movl -4(%ebp), %eax			# (expr.c, 354)
	imull $4, %eax			# (expr.c, 355)
	movl %eax, -16(%ebp)			# (expr.c, 356)
	pushl -16(%ebp)			# (expr.c, 321)
	pushl 8(%ebp)			# (expr.c, 321)
	call SQAload			# (expr.c, 325)
	addl $8, %esp			# (expr.c, 327)
	movl %eax, -12(%ebp)			# (expr.c, 330)
	movl -12(%ebp), %eax			# (stmt.c, 368)
	movl %eax, -8(%ebp)			# (stmt.c, 369)
Label_4:
	cmpl $0, -8(%ebp)			# (stmt.c, 346)
	je Label_5			# (stmt.c, 347)
	pushl -8(%ebp)			# (expr.c, 321)
	call puts			# (expr.c, 325)
	addl $4, %esp			# (expr.c, 327)
	movl %eax, -20(%ebp)			# (expr.c, 330)
	movl -4(%ebp), %eax			# (expr.c, 338)
	addl $1, %eax			# (expr.c, 339)
	movl %eax, -24(%ebp)			# (expr.c, 340)
	movl -24(%ebp), %eax			# (stmt.c, 368)
	movl %eax, -4(%ebp)			# (stmt.c, 369)
	movl -4(%ebp), %eax			# (expr.c, 354)
	imull $4, %eax			# (expr.c, 355)
	movl %eax, -32(%ebp)			# (expr.c, 356)
	pushl -32(%ebp)			# (expr.c, 321)
	pushl 8(%ebp)			# (expr.c, 321)
	call SQAload			# (expr.c, 325)
	addl $8, %esp			# (expr.c, 327)
	movl %eax, -28(%ebp)			# (expr.c, 330)
	movl -28(%ebp), %eax			# (stmt.c, 368)
	movl %eax, -8(%ebp)			# (stmt.c, 369)
	jmp Label_4			# (stmt.c, 349)
Label_5:
	movl %ebp, %esp			# (emit.c, 41)
	popl %ebp			# (emit.c, 45)
	ret			# (emit.c, 46)

.text
.globl	main
main:
	pushl %ebp			# (emit.c, 17)
	movl %esp, %ebp			# (emit.c, 22)
	subl $124, %esp			# (emit.c, 24)
	pushl $40			# (expr.c, 321)
	call malloc			# (expr.c, 325)
	addl $4, %esp			# (expr.c, 327)
	movl %eax, -20(%ebp)			# (expr.c, 330)
	movl -20(%ebp), %eax			# (stmt.c, 368)
	movl %eax, -8(%ebp)			# (stmt.c, 369)
	movl $0, %eax			# (stmt.c, 368)
	movl %eax, -12(%ebp)			# (stmt.c, 369)
Label_6:
	pushl $10			# (expr.c, 321)
	pushl -12(%ebp)			# (expr.c, 321)
	call SQAless			# (expr.c, 325)
	addl $8, %esp			# (expr.c, 327)
	movl %eax, -24(%ebp)			# (expr.c, 330)
	cmpl $0, -24(%ebp)			# (stmt.c, 346)
	je Label_7			# (stmt.c, 347)
	movl -12(%ebp), %eax			# (expr.c, 354)
	imull $4, %eax			# (expr.c, 355)
	movl %eax, -32(%ebp)			# (expr.c, 356)
	pushl -12(%ebp)			# (expr.c, 321)
	pushl -32(%ebp)			# (expr.c, 321)
	pushl -8(%ebp)			# (expr.c, 321)
	call SQAstore			# (expr.c, 325)
	addl $12, %esp			# (expr.c, 327)
	movl %eax, -28(%ebp)			# (expr.c, 330)
	movl -12(%ebp), %eax			# (expr.c, 338)
	addl $1, %eax			# (expr.c, 339)
	movl %eax, -36(%ebp)			# (expr.c, 340)
	movl -36(%ebp), %eax			# (stmt.c, 368)
	movl %eax, -12(%ebp)			# (stmt.c, 369)
	jmp Label_6			# (stmt.c, 349)
Label_7:
	movl $0, %eax			# (stmt.c, 368)
	movl %eax, -12(%ebp)			# (stmt.c, 369)
Label_8:
	pushl $10			# (expr.c, 321)
	pushl -12(%ebp)			# (expr.c, 321)
	call SQAless			# (expr.c, 325)
	addl $8, %esp			# (expr.c, 327)
	movl %eax, -40(%ebp)			# (expr.c, 330)
	cmpl $0, -40(%ebp)			# (stmt.c, 346)
	je Label_9			# (stmt.c, 347)
	movl -12(%ebp), %eax			# (expr.c, 354)
	imull $4, %eax			# (expr.c, 355)
	movl %eax, -48(%ebp)			# (expr.c, 356)
	pushl -48(%ebp)			# (expr.c, 321)
	pushl -8(%ebp)			# (expr.c, 321)
	call SQAload			# (expr.c, 325)
	addl $8, %esp			# (expr.c, 327)
	movl %eax, -44(%ebp)			# (expr.c, 330)
	movl -44(%ebp), %eax			# (stmt.c, 368)
	movl %eax, -16(%ebp)			# (stmt.c, 369)
	leal .output_fmtstr, %eax			# (stmt.c, 398)
	pushl -16(%ebp)			# (stmt.c, 399)
	pushl %eax			# (stmt.c, 400)
	call printf			# (stmt.c, 401)
	addl $8, %esp			# (stmt.c, 402)
	movl -12(%ebp), %eax			# (expr.c, 338)
	addl $1, %eax			# (expr.c, 339)
	movl %eax, -52(%ebp)			# (expr.c, 340)
	movl -52(%ebp), %eax			# (stmt.c, 368)
	movl %eax, -12(%ebp)			# (stmt.c, 369)
	jmp Label_8			# (stmt.c, 349)
Label_9:
	movl $97, %eax			# (stmt.c, 368)
	movl %eax, -16(%ebp)			# (stmt.c, 369)
	movl $0, %eax			# (stmt.c, 368)
	movl %eax, -12(%ebp)			# (stmt.c, 369)
Label_10:
	pushl $26			# (expr.c, 321)
	pushl -12(%ebp)			# (expr.c, 321)
	call SQAless			# (expr.c, 325)
	addl $8, %esp			# (expr.c, 327)
	movl %eax, -56(%ebp)			# (expr.c, 330)
	cmpl $0, -56(%ebp)			# (stmt.c, 346)
	je Label_11			# (stmt.c, 347)
	movl -16(%ebp), %eax			# (expr.c, 338)
	addl -12(%ebp), %eax			# (expr.c, 339)
	movl %eax, -64(%ebp)			# (expr.c, 340)
	pushl -64(%ebp)			# (expr.c, 321)
	pushl -12(%ebp)			# (expr.c, 321)
	pushl -8(%ebp)			# (expr.c, 321)
	call SQAstore			# (expr.c, 325)
	addl $12, %esp			# (expr.c, 327)
	movl %eax, -60(%ebp)			# (expr.c, 330)
	movl -12(%ebp), %eax			# (expr.c, 338)
	addl $1, %eax			# (expr.c, 339)
	movl %eax, -68(%ebp)			# (expr.c, 340)
	movl -68(%ebp), %eax			# (stmt.c, 368)
	movl %eax, -12(%ebp)			# (stmt.c, 369)
	jmp Label_10			# (stmt.c, 349)
Label_11:
	pushl $0			# (expr.c, 321)
	pushl $26			# (expr.c, 321)
	pushl -8(%ebp)			# (expr.c, 321)
	call SQAstore			# (expr.c, 325)
	addl $12, %esp			# (expr.c, 327)
	movl %eax, -72(%ebp)			# (expr.c, 330)
	pushl -8(%ebp)			# (expr.c, 321)
	call puts			# (expr.c, 325)
	addl $4, %esp			# (expr.c, 327)
	movl %eax, -76(%ebp)			# (expr.c, 330)
	pushl -8(%ebp)			# (expr.c, 321)
	call free			# (expr.c, 325)
	addl $4, %esp			# (expr.c, 327)
	movl %eax, -80(%ebp)			# (expr.c, 330)
	pushl 12(%ebp)			# (expr.c, 321)
	call printStrs			# (expr.c, 325)
	addl $4, %esp			# (expr.c, 327)
	movl %eax, -84(%ebp)			# (expr.c, 330)
	pushl 16(%ebp)			# (expr.c, 321)
	call printStrs			# (expr.c, 325)
	addl $4, %esp			# (expr.c, 327)
	movl %eax, -88(%ebp)			# (expr.c, 330)
	movl $2022, %eax			# (stmt.c, 368)
	movl %eax, year			# (stmt.c, 369)
	movl $11, %eax			# (stmt.c, 368)
	movl %eax, month			# (stmt.c, 369)
	movl $14, %eax			# (stmt.c, 368)
	movl %eax, day			# (stmt.c, 369)
	pushl $100			# (expr.c, 321)
	call f			# (expr.c, 325)
	addl $4, %esp			# (expr.c, 327)
	movl %eax, -96(%ebp)			# (expr.c, 330)
	movl -96(%ebp), %eax			# (stmt.c, 368)
	movl %eax, -92(%ebp)			# (stmt.c, 369)
	leal .output_fmtstr, %eax			# (stmt.c, 398)
	pushl -92(%ebp)			# (stmt.c, 399)
	pushl %eax			# (stmt.c, 400)
	call printf			# (stmt.c, 401)
	addl $8, %esp			# (stmt.c, 402)
	pushl $1			# (expr.c, 321)
	pushl $100			# (expr.c, 321)
	pushl $1			# (expr.c, 321)
	call g			# (expr.c, 325)
	addl $12, %esp			# (expr.c, 327)
	movl %eax, -100(%ebp)			# (expr.c, 330)
	movl -100(%ebp), %eax			# (stmt.c, 368)
	movl %eax, -92(%ebp)			# (stmt.c, 369)
	leal .output_fmtstr, %eax			# (stmt.c, 398)
	pushl -92(%ebp)			# (stmt.c, 399)
	pushl %eax			# (stmt.c, 400)
	call printf			# (stmt.c, 401)
	addl $8, %esp			# (stmt.c, 402)
	leal .output_fmtstr, %eax			# (stmt.c, 398)
	pushl year			# (stmt.c, 399)
	pushl %eax			# (stmt.c, 400)
	call printf			# (stmt.c, 401)
	addl $8, %esp			# (stmt.c, 402)
	leal .output_fmtstr, %eax			# (stmt.c, 398)
	pushl month			# (stmt.c, 399)
	pushl %eax			# (stmt.c, 400)
	call printf			# (stmt.c, 401)
	addl $8, %esp			# (stmt.c, 402)
	leal .output_fmtstr, %eax			# (stmt.c, 398)
	pushl day			# (stmt.c, 399)
	pushl %eax			# (stmt.c, 400)
	call printf			# (stmt.c, 401)
	addl $8, %esp			# (stmt.c, 402)
	leal .output_fmtstr, %eax			# (stmt.c, 398)
	pushl 8(%ebp)			# (stmt.c, 399)
	pushl %eax			# (stmt.c, 400)
	call printf			# (stmt.c, 401)
	addl $8, %esp			# (stmt.c, 402)
	call fork			# (expr.c, 325)
	movl %eax, -108(%ebp)			# (expr.c, 330)
	movl -108(%ebp), %eax			# (stmt.c, 368)
	movl %eax, -104(%ebp)			# (stmt.c, 369)
	pushl $0			# (expr.c, 321)
	pushl -104(%ebp)			# (expr.c, 321)
	call SQAless			# (expr.c, 325)
	addl $8, %esp			# (expr.c, 327)
	movl %eax, -112(%ebp)			# (expr.c, 330)
	cmpl $0, -112(%ebp)			# (stmt.c, 309)
	je Label_12			# (stmt.c, 310)
	leal .output_fmtstr, %eax			# (stmt.c, 398)
	pushl -104(%ebp)			# (stmt.c, 399)
	pushl %eax			# (stmt.c, 400)
	call printf			# (stmt.c, 401)
	addl $8, %esp			# (stmt.c, 402)
	jmp Label_15			# (stmt.c, 312)
Label_12:
	pushl $0			# (expr.c, 321)
	pushl -104(%ebp)			# (expr.c, 321)
	call SQAequal			# (expr.c, 325)
	addl $8, %esp			# (expr.c, 327)
	movl %eax, -116(%ebp)			# (expr.c, 330)
	cmpl $0, -116(%ebp)			# (stmt.c, 309)
	je Label_13			# (stmt.c, 310)
	leal .output_fmtstr, %eax			# (stmt.c, 398)
	pushl -104(%ebp)			# (stmt.c, 399)
	pushl %eax			# (stmt.c, 400)
	call printf			# (stmt.c, 401)
	addl $8, %esp			# (stmt.c, 402)
	jmp Label_14			# (stmt.c, 312)
Label_13:
	pushl $0			# (expr.c, 321)
	call wait			# (expr.c, 325)
	addl $4, %esp			# (expr.c, 327)
	movl %eax, -120(%ebp)			# (expr.c, 330)
	leal .output_fmtstr, %eax			# (stmt.c, 398)
	pushl -104(%ebp)			# (stmt.c, 399)
	pushl %eax			# (stmt.c, 400)
	call printf			# (stmt.c, 401)
	addl $8, %esp			# (stmt.c, 402)
Label_14:
Label_15:
	movl $0, %eax			# (stmt.c, 411)
	movl %ebp, %esp			# (emit.c, 41)
	popl %ebp			# (emit.c, 45)
	ret			# (emit.c, 46)
