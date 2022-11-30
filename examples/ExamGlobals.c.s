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
.globl	main
main:
	pushl %ebp			# (emit.c, 17)
	movl %esp, %ebp			# (emit.c, 22)
	subl $4, %esp			# (emit.c, 24)
	movl $2022, %eax			# (stmt.c, 354)
	movl %eax, year			# (stmt.c, 355)
	movl $11, %eax			# (stmt.c, 354)
	movl %eax, month			# (stmt.c, 355)
	movl $14, %eax			# (stmt.c, 354)
	movl %eax, day			# (stmt.c, 355)
	leal .output_fmtstr, %eax			# (stmt.c, 384)
	pushl year			# (stmt.c, 385)
	pushl %eax			# (stmt.c, 386)
	call printf			# (stmt.c, 387)
	addl $8, %esp			# (stmt.c, 388)
	leal .output_fmtstr, %eax			# (stmt.c, 384)
	pushl month			# (stmt.c, 385)
	pushl %eax			# (stmt.c, 386)
	call printf			# (stmt.c, 387)
	addl $8, %esp			# (stmt.c, 388)
	leal .output_fmtstr, %eax			# (stmt.c, 384)
	pushl day			# (stmt.c, 385)
	pushl %eax			# (stmt.c, 386)
	call printf			# (stmt.c, 387)
	addl $8, %esp			# (stmt.c, 388)
	movl $0, %eax			# (stmt.c, 397)
	movl %ebp, %esp			# (emit.c, 41)
	popl %ebp			# (emit.c, 45)
	ret			# (emit.c, 46)
