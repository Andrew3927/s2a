#ifndef	FUNC_H
#define	FUNC_H
#include "stmt.h"

#define MAX_PARAMETERS_CNT   10
#define MAX_LOCAL_VARS_CNT   30

/**
 * @brief 抽象语法树函数定义节点
 * 
 * @param op (TokenKind) operation,包括运算符、括号之类的、if else while等关键词
 * @param value (Value): name:Char, numVal:int
 * @param paras[] (astNode): 传入函数的参数
 * @param para_cnt (int): 传入参数列表中参数的个数
 * @param local_vars[] (astNode): 函数内部的本地变量
 * @param local_vars_cnt (int): 本地变量的个数
 * @param funcBody (AstStmtNodePtr) 函数体
 * @param next (astFunDefNode * ):本函数可能会调用别的函数，那么别的函数节点被next连接
 */
typedef struct astFuncDefNode{
	TokenKind op;
	Value value;
	/////////////////////////////
	// for parameters
	struct astNode paras[MAX_PARAMETERS_CNT];
	int para_cnt;
	// for local variables
		// for parameters
	struct astNode local_vars[MAX_LOCAL_VARS_CNT];
	int local_vars_cnt;

    // funcBody
    AstStmtNodePtr funcBody;
    // next function
	struct astFuncDefNode * next;

} * AstFuncDefNodePtr;

AstFuncDefNodePtr FunctionDefinitions(void);
void EmitFuncDefNode(AstFuncDefNodePtr func);

AstFuncDefNodePtr GetCurFuncDef(void);
void SetCurFuncDef(AstFuncDefNodePtr func);

#endif
