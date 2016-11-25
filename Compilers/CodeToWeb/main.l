%{
#include <stdio.h>
int yywrap();
int yylex();
%}

CONDITIONAL     if|else|case|switch
BUCLE           for|while|do
DECLARATION     int|float|double|char|string|bool|void|static|const|public|private|signed|short|unsigned
DINAMICMEMORY   delete|new|\[\]
INCLUDE         #(include|ifdef|ifndef|define|if|else|elif)
BREAK           break|return

%%
\<                                  {printf("\\\<");}
\>                                  {printf("\\\>");}
{CONDITIONAL}/[^A-Za-z]          {printf("<font color=\"red\"> %s </font>",yytext);}
{BUCLE}/[^A-Za-z]                 {printf("<font color=\"blue\"> %s </font>",yytext);}
{DECLARATION}/[^A-Za-z]           {printf("<font color=\"green\"> %s </font>",yytext);}
{DINAMICMEMORY}/[^A-Za-z]         {printf("<font color=\"purple\"> %s </font>",yytext);}
{INCLUDE}/[^A-Za-z]              {printf("<font color=\"yellow\"> %s </font>",yytext);}
{BREAK}/[^A-Za-z]                {printf("<font color=\"red\"> %s </font>",yytext);}

%%
int yywrap(){
    return 1;
}

int main(){
    printf("<!DOCTYPE html>\n" );
    printf("<html>\n" );
    printf("<head>\n" );
    printf("<title>Page Title</title>\n" );
    printf("</head>\n");
    printf("<body>\n");
    printf("<pre>");

    yylex();

    //printf("<\\pre>\n");

    printf("</body>\n" );
    printf("</html>\n" );
    return 0;
}
