#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

#include "emit.h"

void EmitPrologue(int frameSize)
{
	/************************
	pushl %ebp
	pushl %ebx
	pushl %esi
	pushl %edi
	movl %esp, %ebp
	subl $12, %esp
	**************************/
	EmitAssembly("pushl %%ebp");
	// We don't use these registers in our assembly now.
	// EmitAssembly("pushl %%ebx");
	// EmitAssembly("pushl %%esi");
	// EmitAssembly("pushl %%edi");
	EmitAssembly("movl %%esp, %%ebp");
	if (frameSize != 0)
	{
		EmitAssembly("subl $%d, %%esp", frameSize);
	}
}

void EmitEpilogue(void)
{
	/********************************
	//movl $0, %eax
	------------------
	movl %ebp, %esp
	popl %edi
	popl %esi
	popl %ebx
	popl %ebp
	ret
	*********************************/
	// EmitAssembly("movl $0, %%eax");
	//---------------------------------
	EmitAssembly("movl %%ebp, %%esp");
	// EmitAssembly("popl %%edi");
	// EmitAssembly("popl %%esi");
	// EmitAssembly("popl %%ebx");
	EmitAssembly("popl %%ebp");
	EmitAssembly("ret");
}

#ifdef GEN_ASSEMBLE_WITH_FILE_LINENO

void DoEmitAssembly(const char *fmt, ...)
{
	va_list ap;
	va_start(ap, fmt);
	vfprintf(stdout, fmt, ap);
	va_end(ap);
}

#else

void EmitAssembly(const char *fmt, ...)
{
	va_list ap;
	va_start(ap, fmt);
	fprintf(stdout, "\t");
	vfprintf(stdout, fmt, ap);
	fprintf(stdout, "\n");
	va_end(ap);
}
#endif

/**
 * @brief 生成编译语言中的（要跳转到的）label
 *
 * @param fmt
 * @param ...
 */
void EmitLabel(const char *fmt, ...)
{
	va_list ap;
	va_start(ap, fmt);
	vfprintf(stdout, fmt, ap);
	fprintf(stdout, "\n");
	va_end(ap);
}
