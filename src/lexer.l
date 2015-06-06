%{
#define ECHO fwrite(yytext, yyleng, 1, yyout)
%}

%%

("IF"|"THEN"|"ELSE THEN"|"IFF"|"AND"|"OR"|"NOT") printf("KEYWORD!!!\n");
([a-z]+)	printf("Should be okay\n");

%%

int yywrap(void)
{
	return 1;
}

int main(void)
{
	yylex();
	return 0;
}