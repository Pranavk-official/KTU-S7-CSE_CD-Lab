%{
#include<stdio.h>
int lc=0,sc,=0,tc=0,ch=0;
%}
%%
[\\n \\t]	{printf("");}
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
