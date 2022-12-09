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
 * @brief 被翻译代码在标准输入当中，此函数每次读取被翻译代码当中的一个字符
 *
 * @return char 代码当中的一个字符。
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

/**
 * @brief Declarations()执行词法分词, FunctionDefinitions()执行语法分析。语法词法分析结束之后，
 * 
 * @return int 
 */
int main()
{
	AstStmtNodePtr declarations = NULL;
	AstFuncDefNodePtr functions = NULL;

	// NextharFromStdin: 读取放在标准输入里面的被翻译代码的一个字符，然后
	// 传给 Initexer：将lex.c的NextChar设置位当前字符。
	InitLexer(NextCharFromStdin);

	// 读入并且分以一个词法单元，设置该词法单元的类型。设置给lex.h: curToken。
	NEXT_TOKEN;

	// 词法 & 语法 分析 在这两句完成
	declarations = Declarations();
	functions = FunctionDefinitions();

	Expect(TK_EOF); // 类C代码文末结束符

	// 生成翻译汇编文件的首四行
	EmitLabel("#Auto-Genereated by SE352");
	EmitLabel(".data");
	EmitAssembly("%s:	.string	\"%%d\"", INPUT_FORMAT_STR_NAME);
	EmitAssembly("%s:	.string	\"%%d\\012\"", OUTPUT_FORMAT_STR_NAME);
	
	// 生成类C代码所有全局变量对应的汇编码
	EmitStatementNode(declarations);
	/*********************************
	.text
	.globl	main
	main:
	**********************************/
	
	// 生成我们的库函数汇编码。由于我们没有 < > = <= >=，因此自定义库函数
	attach_our_library();

	// 生成类C代码所有函数定义对应的汇编代码
	EmitFuncDefNode(functions);

	// FIXME: TBD, free the heap memory.
	// To be simple, we only use malloc(), but never free() in this simple compiler.
	// Let the OS do it for us :)
	return 0;
}
