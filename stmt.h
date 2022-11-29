#ifndef	STMT_H
#define	STMT_H
#include "lex.h"
#include "expr.h"


/**
 * @brief 抽象语法树表达式节点
 * 	
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

