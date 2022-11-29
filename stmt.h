#ifndef	STMT_H
#define	STMT_H
#include "lex.h"
#include "expr.h"


/**
 * @brief Statement类型的抽象语法解析数的节点。
 *  抽象语法树表达式节点。
 * （函数体也会用这这个表示）
 * 	
 * @param op (TokenKind) operation,包括运算符、括号之类的、if else while等关键词
 * @param value (Value): name:Char, numVal:int
 * @param kids[] (satNode pointer) 
 * @param expr (astNode pointer) expression 
 * @param thenStmt (astStmtNode pointer) thenStatement。if成功后跳到的表达式
 * @param elseStmt (astStmtNode pointer) elseStatement。if成功后跳到的表达式
 * @param next (astStmtNode pointer) 抽象语法树表达式节点指针。指向一个抽象语法树表达式节点
 * 
 */
typedef struct astStmtNode{
	TokenKind op;
	Value value;
	struct astNode * kids[2];
	/////////////////////////////
	struct astNode * expr;
	struct astStmtNode * thenStmt;
	struct astStmtNode * elseStmt;
	struct astStmtNode * next;

} * AstStmtNodePtr;



AstStmtNodePtr CompoundStatement(void);
AstStmtNodePtr Declarations(void);
AstStmtNodePtr Statement(void);
void VisitStatementNode(AstStmtNodePtr stmt);
void EmitStatementNode(AstStmtNodePtr stmt);
#endif

