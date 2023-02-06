%{
#include <stdio.h>
#include <stdlib.h>

int valid = 1;

extern int yylex();
void yyerror();
%}



%union {
	float f;
}

%token <f> NUM
%type <f> E T F

%%

S : E			    { valid = 1; } 
  ;

E : E '+' T		
  | E '-' T		
  | T			
  ;

T : T '*' F		
  | T '/' F		
  | F			
  ;

F : '(' E ')'	{ }
  | '-' F		  { }
  | NUM			
  ;

%%


void yyerror() {
  valid = 0;
  printf("\n Invalid expression! \n");	
  exit(1);
}

int main(){
  printf("\nEnter the expression: ");
	yyparse();
  if(valid)
  {
      printf("\n Valid expression! \n");
  }
  /*press ctrl + d to print the result*/
	return 0;
}