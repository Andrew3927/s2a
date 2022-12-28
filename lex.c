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
	// {kind, name}
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
 * @brief 如果当前词法单元的名字是(int, if, else, while, input, output, return)其中
 * 	任意一种，那就返回对应的 TK_<类型>。否则就直接返回变量名。如year，month等。
 * 
 * @param id token.value.name
 * @return TokenKind 
 */
static TokenKind GetKeywordKind(char * tokenName){
	int i = 0; 
	for(i = 0; i < sizeof(keywords)/sizeof(keywords[0]); i++){
		if(strcmp(tokenName,keywords[i].name) == 0){
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
 * @brief 一次读入一个词法单元。判断当前的Char是 空格/字母&数字（变量名）/纯数字/符号
 * 
 * 	NextChar()对应在main.c中的 
 * 	NextCharFromStdin：每次读入一个被翻译代码中的字符。
 * 
 * @return Token 返回的词法单元
 */
Token GetToken(void){
	Token token;
	int len = 0;
	memset(&token,0,sizeof(token));
	/**
	 * @brief 跳过类C代码里面的空格
	 */
	while(IsWhiteSpace(curChar)){ 
		curChar = NextChar();
	}
TryAgain:
	/**
	 * @brief 根据每个词法单元首个字符，根据情况
	 * 	对词法单元整个进行读入，然后设置该词法单元的类型。 
	 */
	if(curChar == EOF_CH){ // 0xff = 1111 1111 = 256
		token.kind = TK_EOF;
	}else if(isalpha(curChar)){
		/**
		 * @brief 当前的词法单元是id(变量名) 或者 是 语言的 keyword
		 * 	读取完当前词法单元的 名字（直到下一个字符）不为：
		 * 	字母（a-z和A-Z）或数字（0-9）停止。
		 */
		len = 0;
		do{			
			token.value.name[len] = curChar;
			curChar = NextChar();
			len++;
		}while(isalnum(curChar) && len < MAX_ID_LEN);
		token.kind = GetKeywordKind(token.value.name);
	}else if(isdigit(curChar)){//number
		/**
		 * @brief 不断通过Nexthar()从左到右读如数字，直到
		 * 	下一个 字符 不是数字为止。
		 */
		int numVal = 0;
		token.kind = TK_NUM;
		do{
			numVal = numVal*10 + (curChar-'0');
			curChar = NextChar();
		}while(isdigit(curChar));
		token.value.numVal = numVal; // 将数字赋到 词法单元的信息
	}else{
		/**
		 * @brief 当前的字符是tokens.txt当中的类型
		 * 	找到当前字符对应的词法单元类型，然后设置给当前的词法单元类型。
		 * 
		 */
		token.kind = GetTokenKindOfChar(curChar);
		if(token.kind != TK_NA){ // '+','-','*','/',...
			token.value.name[0] = curChar; // 将词法单元类型对应的值副给名字。
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
 * @param next 
 */
void InitLexer(NEXT_CHAR_FUNC next){
	if(next){
		NextChar = next;
	}
}
