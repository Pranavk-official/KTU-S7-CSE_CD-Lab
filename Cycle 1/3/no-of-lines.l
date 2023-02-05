%{
#include<stdio.h>
int lc=0,sc,=0,tc=0,ch=0;
%}
%%
\\n	lc++;
([ ])+	sc++;
\\t	tc++;
.	ch++;
%%

int main()
{
	FILE *fp;
	fp = fopen("input.c", "r");
	yyin = fp;
	yylex();
	printf("No of Lines :\\t %d\\n",lc);
	printf("No of Spaces :\\t %d\\n",sc);
	printf("No of Tab Spaces :\\t %d\\n",tc);
	printf("No of Charecters :\\t %d\\n",ch);
	return 0;
}