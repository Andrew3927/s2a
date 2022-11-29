#ifndef	EXPR_H
#define	EXPR_H
#include "lex.h"

#define MAX_ARG_CNT	10
#define CPU_WORD_SIZE_IN_BYTES   4

/**
 * @brief 除了Statement类型外 抽象语法解析数的节点。
 * 	抽象语法树节点
 * 
 * @param op (TokenKind) operation,包括运算符、括号之类的、if else while等关键词
 * @param value (Value): name:Char, numVal:int
 * @param accessName[] (char)当前节点的汇编名字。在GetAccessName里面被设置。
 * @param kids (astNode)：课件当中 抽象语法树 只有2个branches
 * 
 */
typedef struct astNode{
	TokenKind op;
	Value value;

	// assembly  name  for this node
	char accessName[MAX_ID_LEN+1];

	struct astNode * kids[2];
	int offset;

	// for function call
	struct astNode *args[MAX_ARG_CNT];

	int arg_cnt;
} * AstNodePtr;




#define		Expect(tk)		DoExpect(__LINE__,__FILE__,tk)
//void Expect(TokenKind tk);
void DoExpect(int line, char * fileName, TokenKind  tk);
AstNodePtr Expression(void);
void VisitArithmeticNode(AstNodePtr pNode);
void EmitArithmeticNode(AstNodePtr pNode);
char  *  GetAccessName(AstNodePtr pNode);
int GetFrameSize(void);
void ResetFrameSize(void);
int GetFrameOffset(void);
AstNodePtr CreateAstNode(TokenKind tk,Value * pVal,AstNodePtr left,AstNodePtr right);
AstNodePtr FunctionCallExpression(Token savedToken);

#endif
