%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'

%%

start : expr { printf("Result = %d\n", $1); }
      ;

expr : expr '+' expr { $$ = $1 + $3; }
     | expr '-' expr { $$ = $1 - $3; }
     | NUMBER        { $$ = $1; }
     ;

%%

void yyerror(const char *s)
{
    printf("Invalid Expression\n");
}

int main()
{
    printf("Enter expression: ");
    yyparse();
    return 0;
}
