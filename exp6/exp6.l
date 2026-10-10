%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+ {
    yylval.num = atoi(yytext);
    return DIGIT; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
"+"     { return '+'; }
"-"     { return '-'; }
"*"     { return '*'; }
"/"     { return '/'; }
\n      { return NL; }
[ \t]   ;
.       { return yytext[0]; }

%%

int yywrap(){
    return 1;
}
