%{
#include <stdio.h>
%}

%%

"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|
"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|
"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|
"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|
"volatile"|"while"     { printf("KEYWORD: %s\n", yytext); }

"#define"|"#include"|"#undef"     { printf("PREPROCESSOR: %s\n", yytext); }

[a-zA-Z][a-zA-Z0-9_]* {
  printf("Identifier: %s\n", yytext);
}

"//".* {
  printf("Single-Line Comment: %s\n", yytext);
}

"/*".*"*/" {
  printf("Multi-Line Comment: %s\n", yytext);
}

[0-9]+ {
  printf("Number: %s\n", yytext);
}

[ \t\n]+ /* ignore whitespace */

. {
  printf("Unknown Token: %s\n", yytext);
}

%%

int main(int argc, char **argv)
{
    FILE *file;
    file=fopen("var.c","r");
    if(!file)
    {
        printf("could not open the file");
        exit(0);
    }
    yyin=file;
    yylex();
    printf("\\n");
    return(0);
}
int yywrap()
{
    return(1);
}