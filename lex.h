/**
 * @file lex.h
 * @author Zach Chan (1260805505c@gmail.com)
 * @brief 定义词法处理代码的头文件。
 * @version 0.1
 * @date 2022-11-29
 *
 * @copyright Copyright (c) 2022
 *
 */
#ifndef LEX_H
#define LEX_H
//
#define MAX_ID_LEN 63

/**
 * @brief 词法单元的值。词法单元可能是变量名字/ID，可能是数字。
 * 	C语言的共用体，通过'.'来访问
 *
 * @param name (char) name是当词法单元是变量/ID时设置/关键词 时设置
 * @param numVal (int) numVal是当词法单元是数字时设置
 *
 */
typedef union
{
	char name[MAX_ID_LEN + 1];
	int numVal;

} Value;

/**
 * @brief 当前词法单元当中的类型。具体见tokens.txt。
 * 
 */
typedef enum
{
#define TOKEN(kind, name) kind,
#include "tokens.txt"
#undef TOKEN
} TokenKind;

/**
 * @brief Token是词法单元
 * 
 * @param kind (TokenKind)：词法单元的类型。见tokens.txt
 * @param value (Value)：词法单元的值。底下有名字name以及numVal。
 * 
 */
typedef struct
{
	TokenKind kind;
	Value value;
} Token;

/**
 * @brief 个人感觉这种像是java里面的interface的写法
 *
 */
typedef char (*NEXT_CHAR_FUNC)(void);

#define EOF_CH ((char)0xFF) // 0xff = 1111 1111

extern Token curToken;

/**
 * @brief 找到字符对应的具体的词法单元，然后设置给当前的词法单元。
 * 	这里不需要do while(0)这种写法
 * 
 */
#define NEXT_TOKEN curToken = GetToken();

Token GetToken(void);

const char *GetTokenName(TokenKind tk);

void InitLexer(NEXT_CHAR_FUNC next);

#endif
