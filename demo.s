#Auto-Genereated by SE352
.data
	.input_fmtstr:	.string	"%d"			# (main.c, 122)
	.output_fmtstr:	.string	"%d\012"			# (main.c, 123)

.text
.globl  SQAless
SQAless:
	movl 8(%esp), %eax			# (main.c, 53)
	cmpl %eax, 4(%esp)			# (main.c, 54)
	setl    %al			# (main.c, 55)
	movzbl  %al, %eax			# (main.c, 56)
	ret			# (main.c, 57)

.text
.globl  SQAlarger
SQAlarger:
	movl 8(%esp), %eax			# (main.c, 53)
	cmpl %eax, 4(%esp)			# (main.c, 54)
	setg    %al			# (main.c, 55)
	movzbl  %al, %eax			# (main.c, 56)
	ret			# (main.c, 57)

.text
.globl  SQAequal
SQAequal:
	movl 8(%esp), %eax			# (main.c, 53)
	cmpl %eax, 4(%esp)			# (main.c, 54)
	sete    %al			# (main.c, 55)
	movzbl  %al, %eax			# (main.c, 56)
	ret			# (main.c, 57)

.text
.globl  SQAstore
SQAstore:
	movl 12(%esp), %eax			# (main.c, 77)
	movl 4(%esp), %ecx			# (main.c, 78)
	movl 8(%esp), %edx			# (main.c, 79)
	movl %eax, (%ecx,%edx)			# (main.c, 80)
	ret			# (main.c, 81)

.text
.globl  SQAload
SQAload:
	movl 4(%esp), %edx			# (main.c, 90)
	movl 8(%esp), %eax			# (main.c, 91)
	movl (%edx,%eax), %eax			# (main.c, 92)
	ret			# (main.c, 93)

.text
.globl	add
add:
	pushl %ebp			# (emit.c, 17)
	movl %esp, %ebp			# (emit.c, 22)
	subl $12, %esp			# (emit.c, 25)
	movl 8(%ebp), %eax			# (expr.c, 445)
	addl 12(%ebp), %eax			# (expr.c, 446)
	movl %eax, -8(%ebp)			# (expr.c, 447)
	movl -8(%ebp), %eax			# (stmt.c, 456)
	movl %ebp, %esp			# (emit.c, 43)
	popl %ebp			# (emit.c, 47)
	ret			# (emit.c, 48)

.text
.globl	main
main:
	pushl %ebp			# (emit.c, 17)
	movl %esp, %ebp			# (emit.c, 22)
	subl $12, %esp			# (emit.c, 25)
	pushl $4			# (expr.c, 420)
	pushl $6			# (expr.c, 420)
	call add			# (expr.c, 424)
	addl $8, %esp			# (expr.c, 427)
	movl %eax, -8(%ebp)			# (expr.c, 430)
	movl -8(%ebp), %eax			# (stmt.c, 413)
	movl %eax, -4(%ebp)			# (stmt.c, 414)
	leal .output_fmtstr, %eax			# (stmt.c, 443)
	pushl -4(%ebp)			# (stmt.c, 444)
	pushl %eax			# (stmt.c, 445)
	call printf			# (stmt.c, 446)
	addl $8, %esp			# (stmt.c, 447)
	movl $0, %eax			# (stmt.c, 456)
	movl %ebp, %esp			# (emit.c, 43)
	popl %ebp			# (emit.c, 47)
	ret			# (emit.c, 48)
