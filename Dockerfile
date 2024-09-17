# Usa una imagen base con GCC
FROM gcc:latest

# Instala las dependencias necesarias: Flex, Bison, y Make
RUN apt-get update && apt-get install -y \
    flex \
    bison \
    make \
    && rm -rf /var/lib/apt/lists/*

# Crea un directorio en el contenedor para la aplicación
WORKDIR /usr/src/app

# Copia el contenido del directorio actual al contenedor
COPY . .

# Ejecutar los comandos necesarios para compilar el proyecto
RUN flex scanner.l && \
    bison -d parser.y && \
    gcc -o sistema_estudiantes lex.yy.c parser.tab.c student_system.c -lfl

# Comando por defecto para ejecutar el sistema
CMD ["./sistema_estudiantes"]
