#Auto-Genereated by SE352
.data
	.input_fmtstr:	.string	"%d"		# (main.c, 144)
	.output_fmtstr:	.string	"%d\012"		# (main.c, 145)

.text
.globl  SQAless
SQAless:
	movl 8(%esp), %eax		# (main.c, 35)
	cmpl %eax, 4(%esp)		# (main.c, 36)
	setl    %al		# (main.c, 37)
	movzbl  %al, %eax		# (main.c, 38)
	ret		# (main.c, 39)

.text
.globl  SQAlarger
SQAlarger:
	movl 8(%esp), %eax		# (main.c, 35)
	cmpl %eax, 4(%esp)		# (main.c, 36)
	setg    %al		# (main.c, 37)
	movzbl  %al, %eax		# (main.c, 38)
	ret		# (main.c, 39)

.text
.globl  SQAequal
SQAequal:
	movl 8(%esp), %eax		# (main.c, 35)
	cmpl %eax, 4(%esp)		# (main.c, 36)
	sete    %al		# (main.c, 37)
	movzbl  %al, %eax		# (main.c, 38)
	ret		# (main.c, 39)

.text
.globl  SQAstore
SQAstore:
	movl 12(%esp), %eax		# (main.c, 99)
	movl 4(%esp), %ecx		# (main.c, 100)
	movl 8(%esp), %edx		# (main.c, 101)
	movl %eax, (%ecx,%edx)		# (main.c, 102)
	ret		# (main.c, 103)

.text
.globl  SQAload
SQAload:
	movl 4(%esp), %edx		# (main.c, 119)
	movl 8(%esp), %eax		# (main.c, 120)
	movl (%edx,%eax), %eax		# (main.c, 121)
	ret		# (main.c, 122)

.text
.globl	main
main:
	pushl %ebp		# (emit.c, 17)
	pushl %ebx		# (emit.c, 18)
	pushl %esi		# (emit.c, 19)
	pushl %edi		# (emit.c, 20)
	movl %esp, %ebp		# (emit.c, 21)
	subl $48, %esp		# (emit.c, 23)
	pushl $40		# (expr.c, 296)
	call malloc		# (expr.c, 300)
	addl $4, %esp		# (expr.c, 302)
	movl %eax, -16(%ebp)		# (expr.c, 305)
	movl -16(%ebp), %eax		# (stmt.c, 354)
	movl %eax, -12(%ebp)		# (stmt.c, 355)
	movl $97, %eax		# (stmt.c, 354)
	movl %eax, -8(%ebp)		# (stmt.c, 355)
	movl $0, %eax		# (stmt.c, 354)
	movl %eax, -4(%ebp)		# (stmt.c, 355)
Label_0:
	pushl $26		# (expr.c, 296)
	pushl -4(%ebp)		# (expr.c, 296)
	call SQAless		# (expr.c, 300)
	addl $8, %esp		# (expr.c, 302)
	movl %eax, -20(%ebp)		# (expr.c, 305)
	cmpl $0, -20(%ebp)		# (stmt.c, 332)
	je Label_1		# (stmt.c, 333)
	movl -8(%ebp), %eax		# (expr.c, 313)
	addl -4(%ebp), %eax		# (expr.c, 314)
	movl %eax, -28(%ebp)		# (expr.c, 315)
	pushl -28(%ebp)		# (expr.c, 296)
	pushl -4(%ebp)		# (expr.c, 296)
	pushl -12(%ebp)		# (expr.c, 296)
	call SQAstore		# (expr.c, 300)
	addl $12, %esp		# (expr.c, 302)
	movl %eax, -24(%ebp)		# (expr.c, 305)
	movl -4(%ebp), %eax		# (expr.c, 313)
	addl $1, %eax		# (expr.c, 314)
	movl %eax, -32(%ebp)		# (expr.c, 315)
	movl -32(%ebp), %eax		# (stmt.c, 354)
	movl %eax, -4(%ebp)		# (stmt.c, 355)
	jmp Label_0		# (stmt.c, 335)
Label_1:
	pushl $0		# (expr.c, 296)
	pushl $26		# (expr.c, 296)
	pushl -12(%ebp)		# (expr.c, 296)
	call SQAstore		# (expr.c, 300)
	addl $12, %esp		# (expr.c, 302)
	movl %eax, -36(%ebp)		# (expr.c, 305)
	pushl -12(%ebp)		# (expr.c, 296)
	call puts		# (expr.c, 300)
	addl $4, %esp		# (expr.c, 302)
	movl %eax, -40(%ebp)		# (expr.c, 305)
	pushl -12(%ebp)		# (expr.c, 296)
	call free		# (expr.c, 300)
	addl $4, %esp		# (expr.c, 302)
	movl %eax, -44(%ebp)		# (expr.c, 305)
	movl $0, %eax		# (stmt.c, 397)
	movl %ebp, %esp		# (emit.c, 40)
	popl %edi		# (emit.c, 41)
	popl %esi		# (emit.c, 42)
	popl %ebx		# (emit.c, 43)
	popl %ebp		# (emit.c, 44)
	ret		# (emit.c, 45)
