%{
int yylex(void);
void yyerror(const char *message);
%}

%token NUMBER
%left '+'

%%

input:
  expression '\n' { if ($1 != 42) YYABORT; }
;

expression:
  NUMBER
| expression '+' expression { $$ = $1 + $3; }
;

%%

void yyerror(const char *message) {
  (void)message;
}

int main(void) {
  return yyparse();
}
