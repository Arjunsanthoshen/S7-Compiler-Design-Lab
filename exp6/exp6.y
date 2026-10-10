%{
#include <stdio.h>
#include <stdlib.h>

int hasID = 0;

void yyerror(char *s);
int yylex();
%}

%union{
    int num;
}

%token <num> DIGIT
%token ID NL

%type <num> exp

%right '='
%left '+' '-'
%left '*' '/'

%%

stmt : exp NL
      {
          printf("Valid Expression\n");
          if(!hasID)
              printf("Result = %d\n", $1);
          exit(0);
      }
    | ID '=' exp NL
      {
          printf("Valid Expression\n");
          exit(0);
      }
    ;

exp : exp '+' exp      { $$ = $1 + $3; }
    | exp '-' exp      { $$ = $1 - $3; }
    | exp '*' exp      { $$ = $1 * $3; }
    | exp '/' exp      { $$ = $1 / $3; }
    | '(' exp ')'      { $$ = $2; }
    | DIGIT            { $$ = $1; }
    | ID               { hasID = 1; $$ = 0; }
    ;

%%

void yyerror(char *s){
    printf("Invalid Expression\n");
}

int main(){
    printf("Enter Expression: ");
    yyparse();
    return 0;
}
