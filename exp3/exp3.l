%{
#include <stdio.h>

int lines = 0, words = 0, chars = 0;
int lastNewline = 1;
%}

%%

[ \t]+          { chars += yyleng; lastNewline = 0; }
\n              { lines++; chars++; lastNewline = 1; }
[a-zA-Z0-9]+    { words++; chars += yyleng; lastNewline = 0; }
.               { chars++; lastNewline = 0; }

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter the text (Press Ctrl+D when finished):\n");

    yylex();

    /* Count the last line if it doesn't end with a newline */
    if (chars > 0 && !lastNewline)
        lines++;

    printf("\nNumber of Lines      : %d\n", lines);
    printf("Number of Words      : %d\n", words);
    printf("Number of Characters : %d\n", chars);

    return 0;
}
