#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include "lex.h"
#include "error.h"

typedef struct{
	TokenKind kind;
	char * name;
}KeywordInfo;

static char defaultNextChar(void);

static char curChar = ' ';
static NEXT_CHAR_FUNC NextChar = defaultNextChar;
static KeywordInfo keywords[] = {
	{TK_INT,"int"},
	{TK_IF,"if"},
	{TK_ELSE,"else"},
	{TK_WHILE,"while"},
	{TK_INPUT,"input"},
	{TK_OUTPUT,"output"},
	{TK_RETURN,"return"}
};
static char * tokenNames[] = {
	#define	TOKEN(kind,name)	name,
	#include "tokens.txt"
	#undef	TOKEN
};
Token curToken;

/**
 * @brief 将词法单元值的名字与关键词比对，返回词法单元的类型。
 * 
 * @param id token.value.name
 * @return TokenKind 
 */
static TokenKind GetKeywordKind(char * id){
	int i = 0; 
	for(i = 0; i < sizeof(keywords)/sizeof(keywords[0]); i++){
		if(strcmp(id,keywords[i].name) == 0){
			return keywords[i].kind;
		}
	}
	return TK_ID;
}
static int IsWhiteSpace(char ch){
	return ch == ' ' || ch == '\t' || ch == '\n' || ch == '\r';
}
static char defaultNextChar(void){
	return EOF_CH;
}

/**
 * @brief 比对tokens.txt中的词法单元，返回匹配上的词法单元类型
 * 
 * @param ch 被比对的字符
 * @return TokenKind 返回数字。TokenKind是enum类型。因此返回数字，之后也能找到相应的词法单元类型。
 */
static TokenKind GetTokenKindOfChar(char ch){
	int i = 0;
	for(i = 0; i < sizeof(tokenNames)/sizeof(tokenNames[0]); i++){
		if((strlen(tokenNames[i]) == 1) && (tokenNames[i][0] == ch)){
			return i;
		}
	}
	return TK_NA;
}
const char * GetTokenName(TokenKind tk){
	return tokenNames[tk];
}

/**
 * @brief 解析（读取整截）当前的字符，将当前字符对应的词法单元中的变量设置好后返回。
 * 
 * @return Token 返回词法单元
 */
Token GetToken(void){
	Token token;
	int len = 0;
	memset(&token,0,sizeof(token));
	// skip white space
	while(IsWhiteSpace(curChar)){
		curChar = NextChar();
	}
TryAgain:
	if(curChar == EOF_CH){
		token.kind = TK_EOF;
	}else if(isalpha(curChar)){//当前的词法单元是id(变量名) 或者 是 语言的 keyword
		// 读取完当前词法单元的 名字（直到下一个字符）不为：
		// 字母（a-z和A-Z）或数字（0-9）停止。
		len = 0;
		do{			
			token.value.name[len] = curChar;
			curChar = NextChar();
			len++;
		}while(isalnum(curChar) && len < MAX_ID_LEN);
		// 找到 当前 词法单元Token的 具体类型，然后 设置给当前的词法单元。
		token.kind = GetKeywordKind(token.value.name);
	}else if(isdigit(curChar)){//number
		// 不断通过Nexthar()从左到右读如数字，直到
		// 下一个 字符 不是数字为止。
		int numVal = 0;
		token.kind = TK_NUM;
		do{
			numVal = numVal*10 + (curChar-'0');
			curChar = NextChar();
		}while(isdigit(curChar));
		// 将数字赋到 词法单元的信息
		token.value.numVal = numVal;
	}else{
		// 当前的字符是tokens.txt当中的类型
		// 找到当前字符对应的词法单元类型，然后设置给当前的词法单元类型。
		token.kind = GetTokenKindOfChar(curChar);
		if(token.kind != TK_NA){// '+','-','*','/',...
			// 将词法单元类型对应的值副给名字。
			token.value.name[0] = curChar;

			curChar = NextChar();
		}else{
			Error("illegal char \'%x\' .  Found in  %s  line %d \n",curChar, __FILE__,__LINE__);
			curChar = NextChar();
			goto TryAgain;
		}
	}
	return token;
}

/**
 * @brief 初始化词法分析器
 * 
 * @param next typedef char (*NEXT_CHAR_FUNC)(void);
 */
void InitLexer(NEXT_CHAR_FUNC next){
	if(next){
		NextChar = next;
	}
}
