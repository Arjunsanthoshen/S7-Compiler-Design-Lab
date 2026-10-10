%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int yylex();
void yyerror(char *s);
%}

%token NUM

%left '+' '-'
%left '*' '/'
%right '^'

%%

input:
      expr '\n'
      {
          printf("Result = %d\n", $1);
      }
      ;

expr:
      expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   { $$ = $1 / $3; }
    | expr '^' expr   { $$ = (int)pow($1, $3); }
    | '(' expr ')'    { $$ = $2; }
    | NUM             { $$ = $1; }
    ;

%%

void yyerror(char *s)
{
    printf("Invalid Expression\n");
}

int main()
{
    printf("Enter expression: ");
    yyparse();
    return 0;
}
