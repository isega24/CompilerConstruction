%{
#include <stdio.h>
int yywrap();
int yylex();
%}

%s  del

%%

<del>\"    BEGIN(0);
<del>(.|[^\\\"])    ;
\"  BEGIN(del);

%%

int yywrap(void){
    return 0;
}

int main(){
    return yylex();
}
