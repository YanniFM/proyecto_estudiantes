%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%%
"registrar_estudiante"     { return REGISTRAR_ESTUDIANTE; }
"asignar_nota"             { return ASIGNAR_NOTA; }
"mostrar_notas"            { return MOSTRAR_NOTAS; }
"calcular_promedio"        { return CALCULAR_PROMEDIO; }
"mostrar_estudiantes"      { return MOSTRAR_ESTUDIANTES; }
"("                        { return PAR_IZQ; }
")"                        { return PAR_DER; }
","                        { return COMA; }
[0-9]+                     { yylval.iValue = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*      { yylval.sValue = strdup(yytext); return STRING; }
\n                         { return 0; }
.                          { return yytext[0]; }
%%
