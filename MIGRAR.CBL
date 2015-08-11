       IDENTIFICATION DIVISION.
       PROGRAM-ID. MIGRAR.
      *-------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT AMIGOS
             ASSIGN TO RANDOM "AMIGOS.DAT"
             ORGANIZATION IS INDEXED
             ACCESS MODE IS DYNAMIC
             RECORD KEY IS CODIGO.
           SELECT PLANO
             ASSIGN TO RANDOM "AMIGOS.TXT"
             ORGANIZATION IS LINE SEQUENTIAL.
      *---------------------------
       DATA DIVISION.
       FILE SECTION.
       FD AMIGOS.
       01 REG-AMIGOS.
           05 CODIGO PIC 9(5).
           05 NOMBRE PIC X(30).
           05 TELEFONO PIC X(20).
       FD PLANO.
       01 REG-PLANO PIC X(58).

       WORKING-STORAGE SECTION.
       01 REG-DETALLE.
           05 CODIGO-D PIC Z(5).
           05 FILLER PIC X VALUE "|".
           05 NOMBRE-D PIC X(30).
           05 FILLER PIC X VALUE "|".
           05 TELEFONO-D PIC X(20).
           05 FILLER PIC X VALUE "|".
       01 VARIABLES.
           05 SW PIC 9.
           05 TECLA PIC X.
      *----------------------------
       PROCEDURE DIVISION.
       PRINCIPAL.
           PERFORM ABRIR-ARCHIVOS.
           PERFORM ARRANCAR-ARCHIVO.
           PERFORM PROCESAR UNTIL SW = 1.
           PERFORM CERRAR-ARCHIVOS.
           STOP RUN.

       ABRIR-ARCHIVOS.
           OPEN INPUT AMIGOS.
           OPEN OUTPUT PLANO.

       CERRAR-ARCHIVOS.
           CLOSE AMIGOS PLANO.

       ARRANCAR-ARCHIVO.
           MOVE ZEROS TO CODIGO
           START AMIGOS KEY IS >= CODIGO
           END-START.

       PROCESAR.
           READ AMIGOS NEXT RECORD
             AT END
               MOVE 1 TO SW
             NOT AT END
               MOVE CODIGO TO CODIGO-D
               MOVE NOMBRE TO NOMBRE-D
               MOVE TELEFONO TO TELEFONO-D
               WRITE REG-PLANO FROM REG-DETALLE
            END-READ.
