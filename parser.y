%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "student_system.h"

// Declaración de funciones externas
extern int yylex();
extern int yyparse();
extern FILE *yyin;
void yyerror(const char *s);
%}

// Definición de tipos de datos para los tokens
%union {
    int iValue;     // Valor entero
    char* sValue;   // Cadena de caracteres
}

// Definición de tokens
%token <sValue> STRING
%token <iValue> NUMBER
%token REGISTRAR_ESTUDIANTE ASIGNAR_NOTA MOSTRAR_NOTAS CALCULAR_PROMEDIO MOSTRAR_ESTUDIANTES
%token PAR_IZQ PAR_DER COMA

%%
// Reglas de gramática que define los comandos permitidos en el sistema
input:
    input command
    | command
    ;

// Cada comando representa una acción dentro del sistema de registro de estudiantes
command:
    // Registro de un estudiante
    REGISTRAR_ESTUDIANTE PAR_IZQ STRING COMA NUMBER PAR_DER { registrar_estudiante($3, $5); }

    // Asignación de una nota
    | ASIGNAR_NOTA PAR_IZQ STRING COMA NUMBER COMA NUMBER PAR_DER { asignar_nota($3, $5, $7); }

    // Mostrar las notas de un estudiante
    | MOSTRAR_NOTAS PAR_IZQ STRING PAR_DER { mostrar_notas($3); }

    // Calcular el promedio de un estudiante
    | CALCULAR_PROMEDIO PAR_IZQ STRING PAR_DER { calcular_promedio($3); }

    // Mostrar la lista de todos los estudiantes
    | MOSTRAR_ESTUDIANTES PAR_IZQ PAR_DER { mostrar_estudiantes(); }
    ;

%%
// Función que imprime los errores de parsing
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

// Función principal para iniciar el parser
int main(void) {
    yyin = stdin;
    do {
        yyparse();
    } while (!feof(yyin));
    return 0;
}
