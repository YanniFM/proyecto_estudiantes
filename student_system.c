#include <stdio.h>
#include <string.h>
#include "student_system.h"

typedef struct {
    char nombre[50];
    int id;
    int nota;
} Estudiante;

Estudiante estudiantes[100];
int num_estudiantes = 0;

void registrar_estudiante(char *nombre, int id) {
    strcpy(estudiantes[num_estudiantes].nombre, nombre);
    estudiantes[num_estudiantes].id = id;
    estudiantes[num_estudiantes].nota = -1;  // Nota por defecto, no asignada
    num_estudiantes++;
    printf("Estudiante %s registrado con ID %d.\n", nombre, id);
}

void asignar_nota(char *nombre, int id, int nota) {
    for (int i = 0; i < num_estudiantes; i++) {
        if (strcmp(estudiantes[i].nombre, nombre) == 0 && estudiantes[i].id == id) {
            estudiantes[i].nota = nota;
            printf("Nota %d asignada a %s.\n", nota, nombre);
            return;
        }
    }
    printf("Estudiante %s no encontrado.\n", nombre);
}

void mostrar_notas(char *nombre) {
    for (int i = 0; i < num_estudiantes; i++) {
        if (strcmp(estudiantes[i].nombre, nombre) == 0) {
            if (estudiantes[i].nota == -1) {
                printf("El estudiante %s no tiene nota asignada.\n", nombre);
            } else {
                printf("Nota de %s: %d\n", nombre, estudiantes[i].nota);
            }
            return;
        }
    }
    printf("Estudiante %s no encontrado.\n", nombre);
}

void calcular_promedio(char *nombre) {
    int suma = 0, count = 0;
    for (int i = 0; i < num_estudiantes; i++) {
        if (strcmp(estudiantes[i].nombre, nombre) == 0) {
            if (estudiantes[i].nota != -1) {
                suma += estudiantes[i].nota;
                count++;
            }
        }
    }
    if (count > 0) {
        printf("Promedio de %s: %.2f\n", nombre, (float)suma / count);
    } else {
        printf("No hay notas para el estudiante %s.\n", nombre);
    }
}

void mostrar_estudiantes() {
    printf("Lista de estudiantes:\n");
    for (int i = 0; i < num_estudiantes; i++) {
        printf("%s (ID: %d)\n", estudiantes[i].nombre, estudiantes[i].id);
    }
}
