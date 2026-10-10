%{
	#include<stdio.h>
	int count = 0;
%}
%%
[0-9] {count++; }
. ;
%%
int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter input:\n");
    yylex();
    printf("Total digits = %d\n", count);
    return 0;
}
