# CD LAB PROGRAMS 

---

## Compilation and Run Commands

- `commands`
    
    **Compile LEX :** `lex file.l`
    
    **Run LEX file :** `gcc lex.yy.c -lfl` *lex file only*
    
    **Compile YACC :** `yacc -dy file.y`
    
    **Run YACC file** : `gcc lex.yy.c y.tab.c -lfl`  *lex & yacc*
    
    ***Optimization*** : `gcc -c -S -O2 file.c`
    ***convert to assembly code ??*** : `gcc -c -S file.c`
    

---

## CYCLE 1


### 1. To write a program for implementing a Lexical analyzer using LEX tool

- `Program`
    
    ```c

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

    ```   

### 2. LEX Program to count the number of lines and number of characters in an input.

- `Program`
    
    ```c

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
    	fp = fopen("a.txt", "r");
    	yyin = fp;
    	yylex();
    	printf("No of Lines :\\t %d\\n",lc);
    	printf("No of Spaces :\\t %d\\n",sc);
    	printf("No of Tab Spaces :\\t %d\\n",tc);
    	printf("No of Charecters :\\t %d\\n",ch);
    	return 0;
    }

    ```
    

### 3. LEX Program to remove space, tab or newline

- `Program`
    
    ```c

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
    	fp = fopen("a.txt", "r");
    	yyin = fp;
    	yylex();
    	return 0;
    }
    
    ```
    

### 4. Generate a YACC specification to recognize a valid identifier which starts with a letter followed by any number of letters or digits.

- `Program`
    
    > `LEX Code`
    > 
    
    ```c

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
    
    ```
    
    > `YACC Code`
    > 
    
    ```c
    %{
      #include<stdio.h>
      int valid=1;
    %}
    
    %token num id
    
    %%
    start 	:	id s
    s	:	id s|num s| ;
    %%
    
    int yyerror()
    {
      valid=0;
      printf("\\nInvalid identifier!\\n");
      return 0;
    }
    
    int main()
    {
      printf("\\nEnter the identifier:\\n");
      yyparse();
      if(valid)
      {
          printf("\\nValid identifier!\\n");
      }
    }
    
    ```
    

### 5. LEX Program to count the number of vowels and consonants

- `Program`
    
    ```c
    %{
        int vow_count=0;
        int const_count =0;
    %}
    
    %%
    [aeiouAEIOU] {vow_count++;}
    [a-zA-Z] {const_count++;}
    "\\n" {printf("Vowels = %d \\n Consonants =  %d",vow_count,const_count);}
    %%
    
    int main()
    {
        printf("Enter the string of vowels and consonents:");
        yylex();
        return 0;
    }
    int yywrap()
    {
    	return 0;
    }
    ```
    

### 6. Generate a YACC specification to recognize a valid arithmetic expression that uses operators +, – , *,/ and parenthesis.

- `Program`
    
    > `LEX Code`
    > 
    
    ```c
    %{
    	#include "y.tab.h"
    %}
    
    %%
    [a-zA-Z_][a-zA-Z_0-9]* return id;
    [0-9]+(\\.[0-9]*)?      return num;
    [+/*]                  return op;
    .                      return yytext[0];
    \\n                     return 0;
    %%
    
    int yywrap()
    {
    	return 1;
    }
    
    ```
    
    > `YACC Code`
    > 
    
    ```c
    %{
      #include<stdio.h>
      int valid=1;
    %}
    
    %token num id op
    
    %%
    start : id '=' s ';'
    s :id x | num x | '-' num x  | '(' s ')' x  ;
    x :op s | '-' s |   ;
    %%
    
    int yyerror()
    {
      valid=0;
      printf("\\nInvalid expression!\\n");
      return 0;
    }
    
    int main()
    {
      printf("\\nEnter the expression:\\n");
      yyparse();
      if(valid)
      {
          printf("\\nValid expression!\\n");
      }
    }
    
    ```

### 7. Implementation of Calculator using LEX and YACC

- `Program`
    
    > `LEX Code`
    > 
    
    ```c
    %{
      #include "y.tab.h"
      extern yylval;
    %}
    
    %%
    	[0-9]+	{ yylval = atoi(yytext); return NUMBER; }
    	[a-zA-Z]+	{return ID;}
    	[\\t]+	;
    	\\n	{return 0;}
    	. 	{return yytext[0];}
    %%
    
    ```
    
    > `YACC Code`
    > 
    
    ```c
    %{
    	#include<stdio.h>
    %}
      %token NUMBER ID
      %left '+''-'
      %left '*''/'
    %%
    E:	T	{ printf("Result = %d",$$); return 0; }
    T:	T'+'T {$$=$1+$3;}
    	|T'-'T {$$=$1-$3;}
    	|T'*'T {$$=$1*$3;}
    	|T'/'T {$$=$1/$3;}
    	|'-'NUMBER {$$=-$2;}
    	|'-'ID {$$=-$2;}
    	|'('T')' {$$=$2;}
        |ID {$$=$1;}
        |NUMBER {$$=$1;}
        ;
    
    %%
    
    int main()
    {
    	printf("Enter expression: ");
    	yyparse();
    }
    
    int yyerror(char*s)
    {
    	printf("Expression is invalid");
    }
    
    ```
    

### 8. Write a LEX Program to convert the substring abc to ABC from the given input string

- `Program`
    
    ```c
    %{
      FILE *fp;
      FILE *fp1;
    %}
    
    %%
    [a-z]	fprintf(fp1,"%c",toupper(yytext[0]));
    .	fprintf(fp1,"%C",yytext[0]);
    %%
    
    int main(int args,char **argv)
    {
    	fp1=fopen("b.txt","w");
        if(!fp1){
          printf("file not exists\\n");
          return(0);
          }
    
    	fp=fopen("a.txt","r");
    
    	if(!fp){
          printf("file not exists\\n");
          return(0);
        }
        yyin=fp1;
        yyin=fp;
        yylex();
        return(0);
    }
    
    ```
    

### 9. Implementation of DFA

- `Program`
    
    ```c
    %{
    
    %}
    
    %s A B C DEAD
    
    %%
    <INITIAL>1 BEGIN A;
    <INITIAL>0 BEGIN B;
    <INITIAL>[^01\\n] BEGIN DEAD;
    <INITIAL>\\n BEGIN INITIAL; {printf("Not Accepted\\n");}

    <A>1 BEGIN INITIAL;
    <A>0 BEGIN C;
    <A>[^01\\n] BEGIN DEAD;
    <A>\\n BEGIN INITIAL; {printf("Not Accepted\\n");}

    <B>1 BEGIN C;
    <B>0 BEGIN INITIAL;
    <B>[^01\\n] BEGIN DEAD;
    <B>\\n BEGIN INITIAL; {printf("Accepted\\n");}

    <C>1 BEGIN B;
    <C>0 BEGIN A;
    <C>[^01\\n] BEGIN DEAD;
    <C>\\n BEGIN INITIAL; {printf("Not Accepted\\n");}
    
    <DEAD>[^\\n] BEGIN DEAD;
    <DEAD>\\n BEGIN INITIAL; {printf("Invalid\\n");}

    %%
    
    int main()
    {
        printf("Enter String: \n");
        yylex();
        return 0;
    }
    
    ```
 
### 10. Implement backend of the compiler

- `Program`
    
    ```c
    #include<stdio.h>
    #include<string.h>
    void main()
    {
        char icode[10][30], str[20], opr[10];
        int i = 0;
        printf("\\n Enter the set of intermediate code (terminated by exit):\\n");
        do {
            scanf("%s", icode[i]);
           } while (strcmp(icode[i++], "exit") != 0);
        printf("\\n target code generation");
        printf("\\n*************");
        i = 0;
        do{
            strcpy(str, icode[i]);
            switch (str[3])
            {
            case '+':
                strcpy(opr, "ADD");
                break;
            case '-':
                strcpy(opr, "SUB ");
                break;
            case '*':
                strcpy(opr, "MUL");
                break;
            case '/':
                strcpy(opr, "DIV");
                break;
            }
        printf("\\n\\tMov %c,R%d", str[2], i);
        printf("\\n\\t%s%c,R%d", opr, str[4], i);
        printf("\\n\\tMov R%d, %c", i, str[0]);
        } while (strcmp(icode[++i], "exit") != 0);
    }
    
    ```
