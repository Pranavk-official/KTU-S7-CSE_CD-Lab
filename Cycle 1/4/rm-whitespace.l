%{
#include<stdio.h>
%}
%%
[ \n\t]	{printf("");}
.	{printf("%s",yytext);}
%%

int main()
{
	FILE *fp;
	fp = fopen("input.c", "r");
	yyin = fp;
	yylex();
	return 0;
}
