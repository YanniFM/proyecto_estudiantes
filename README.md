# proyecto_estudiantes
Sistema de Registro de Estudiantes y Notas
Este proyecto es un sistema básico de registro de estudiantes y gestión de sus notas, desarrollado en C utilizando Flex y Bison para implementar el intérprete.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Descripción del Proyecto
El Sistema de Registro de Estudiantes y Notas permite registrar estudiantes, asignarles notas, y calcular promedios. Este sistema está pensado como un ejercicio práctico de cómo utilizar Flex y Bison para implementar un intérprete.

El proyecto utiliza C para la lógica del sistema y las herramientas Flex y Bison para manejar el análisis léxico y sintáctico de los comandos que gestionan el registro y manejo de las notas de los estudiantes.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Requisitos
Para poder ejecutar el proyecto, necesitarás lo siguiente:

Sistema Operativo: Linux, MacOS, Windows con WSL (o Docker)
Compilador GCC
Flex: para el análisis léxico.
Bison: para el análisis sintáctico.
Docker (opcional): Para ejecutar el proyecto en un contenedor.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Instalación
Instalación en un entorno local:

Clona el repositorio:
git clone https://github.com/YanniFM/proyecto_estudiantes.git
cd proyecto_estudiantes


Instala las dependencias requeridas:

Flex:
-sudo apt install flex
-sudo apt install bison

Compila el código fuente:
-flex scanner.l
-bison -d parser.y
-gcc -o sistema_estudiantes lex.yy.c parser.tab.c student_system.c -lfl

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Instalación con Docker:

Asegúrate de tener Docker instalado.
Construye la imagen Docker:

-docker build -t sistema_estudiantes .
-docker run -it sistema_estudiantes

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Comandos Disponibles
Estos son los comandos que puedes utilizar en el sistema:

-registrar_estudiante("nombre", id): Registra un nuevo estudiante con un nombre y un ID.
-asignar_nota("nombre", id, nota): Asigna una nota a un estudiante.
-mostrar_notas("nombre"): Muestra la nota asignada a un estudiante.
-calcular_promedio("nombre"): Calcula el promedio de las notas del estudiante.
-mostrar_estudiantes(): Muestra la lista de todos los estudiantes registrados.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Uso
Ejecución en entorno local:
Ejecuta el archivo compilado:
