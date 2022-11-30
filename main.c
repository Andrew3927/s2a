#include <stdio.h>
#include "lex.h"
#include "expr.h"
#include "decl.h"
#include "stmt.h"
#include "emit.h"
#include "func.h"

static const char *srcCode = "{int (*f(int,int,int))[4];}";
static char NextCharFromMem(void)
{
	int ch = *srcCode;
	srcCode++;
	if (ch == 0)
	{
		return (char)EOF_CH;
	}
	else
	{
		return (char)ch;
	}
}

/**
 * @brief 读取标准IO输入的下一个字符
 *
 * @return char 返回下一个IO流里面的字符
 */
static char NextCharFromStdin(void)
{
	int ch = fgetc(stdin);
	if (ch == EOF)
	{
		return (char)EOF_CH;
	}
	else
	{
		return (char)ch;
	}
}

/**
 * @brief 调用来生成客制化定义库函数对应的汇编语言。由attach_our_library(main.c)调用,生成汇编SQAless, SQAlarger, SQAequal。
 *
 * @param setCmd 汇编对应执行我们客制化库函数的汇编指令。例如 setl
 * @param funcName 例如 call SQAless，funcName是SQAless
 */
static void output_library_func(char *setCmd, char *funcName)
{
	EmitLabel("\n.text");
	EmitLabel(".globl  %s", funcName);
	EmitLabel("%s:", funcName);
	EmitAssembly("movl 8(%%esp), %%eax");
	EmitAssembly("cmpl %%eax, 4(%%esp)");
	EmitAssembly("%s    %%al", setCmd);
	EmitAssembly("movzbl  %%al, %%eax");
	EmitAssembly("ret");
}

/**
 * @brief 生成客制化定义库函数对应的汇编码。调用函数生成SQAless, SQAlarger, SQAequal。并且额外实现SQAstore, SQAload汇编码逻辑。
 *
 */
static void attach_our_library(void)
{
	output_library_func("setl", "SQAless");
	output_library_func("setg", "SQAlarger");
	output_library_func("sete", "SQAequal");

	//	生成SQAstore汇编码:
	EmitLabel("\n.text");
	EmitLabel(".globl  %s", "SQAstore");
	EmitLabel("%s:", "SQAstore");
	EmitAssembly("movl 12(%%esp), %%eax");
	EmitAssembly("movl 4(%%esp), %%ecx");
	EmitAssembly("movl 8(%%esp), %%edx");
	EmitAssembly("movl %%eax, (%%ecx,%%edx)");
	EmitAssembly("ret");

	// 生成SQAload汇编码:
	EmitLabel("\n.text");
	EmitLabel(".globl  %s", "SQAload");
	EmitLabel("%s:", "SQAload");
	EmitAssembly("movl 4(%%esp), %%edx");
	EmitAssembly("movl 8(%%esp), %%eax");
	EmitAssembly("movl (%%edx,%%eax), %%eax");
	EmitAssembly("ret");
}

int main()
{
	AstStmtNodePtr declarations = NULL;
	AstFuncDefNodePtr functions = NULL;

	InitLexer(NextCharFromStdin);
	NEXT_TOKEN;
	declarations = Declarations();
	functions = FunctionDefinitions();
	Expect(TK_EOF);

	// 生成翻译汇编文件的首四行
	EmitLabel("#Auto-Genereated by SE352");
	EmitLabel(".data");
	EmitAssembly("%s:	.string	\"%%d\"", INPUT_FORMAT_STR_NAME);
	EmitAssembly("%s:	.string	\"%%d\\012\"", OUTPUT_FORMAT_STR_NAME);
	EmitStatementNode(declarations);
	/*********************************
	.text
	.globl	main
	main:
	**********************************/
	attach_our_library();
	EmitFuncDefNode(functions);
	// FIXME: TBD, free the heap memory.
	// To be simple, we only use malloc(), but never free() in this simple compiler.
	// Let the OS do it for us :)
	return 0;
}
