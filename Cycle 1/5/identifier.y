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
