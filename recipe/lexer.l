%option noyywrap noinput nounput nounistd never-interactive

%{
#include <stdlib.h>

#include "parser.h"
%}

%%

[0-9]+  { yylval = atoi(yytext); return NUMBER; }
"+"     { return '+'; }
\n      { return '\n'; }
[ \t]+   { /* Ignore horizontal whitespace. */ }
.        { return yytext[0]; }

%%
