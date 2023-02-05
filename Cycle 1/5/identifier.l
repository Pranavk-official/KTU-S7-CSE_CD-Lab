%{
	#include "y.tab.h"
%}

%%
[a-zA-Z_][a-zA-Z_0-9]* return id;
[0-9]      return num;
.                      return yytext[0];
\\n                     return 0;
%%

int yywrap()
{
	return 1;
}
