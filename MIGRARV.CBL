       IDENTIFICATION DIVISION.
       PROGRAM-ID. MIGRARV.
      *-------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT VENDEDOR
             ASSIGN TO RANDOM "VENDEDOR.DAT"
             ORGANIZATION IS INDEXED
             ACCESS MODE IS DYNAMIC
             RECORD KEY IS CODIGO.
           SELECT PLANO
             ASSIGN TO RANDOM "VENDEDOR.TXT"
             ORGANIZATION IS LINE SEQUENTIAL.
      *---------------------------
       DATA DIVISION.
       FILE SECTION.
       FD VENDEDOR.
       01 REG-VENDEDOR.
           05 CODIGO PIC 9(4).
           05 NOMBRE PIC X(20).
           05 TELEFONO PIC X(10).
	         05 CORREO PIC X(20).
	         05 CONTACTO PIC x(30).
       FD PLANO.
       01 REG-PLANO PIC X(89).
       WORKING-STORAGE SECTION.
       01 REG-DETALLE.
           05 CODIGO-D PIC Z(4).
           05 FILLER PIC X VALUE "|".
           05 NOMBRE-D PIC X(20).
           05 FILLER PIC X VALUE "|".
           05 TELEFONO-D PIC X(10).
           05 FILLER PIC X VALUE "|".
           05 CORREO-D PIC X(20).
           05 FILLER PIC X VALUE "|".
           05 CONTACTO-D PIC X(30).
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
           OPEN INPUT VENDEDOR.
           OPEN OUTPUT PLANO.
       CERRAR-ARCHIVOS.
           CLOSE VENDEDOR PLANO.
       ARRANCAR-ARCHIVO.
           MOVE ZEROS TO CODIGO
           START VENDEDOR KEY IS >= CODIGO
           END-START.
       PROCESAR.
           READ VENDEDOR NEXT RECORD
             AT END
               MOVE 1 TO SW
             NOT AT END
               MOVE CODIGO TO CODIGO-D
               MOVE NOMBRE TO NOMBRE-D
               MOVE TELEFONO TO TELEFONO-D
               MOVE CORREO TO CORREO-D
               MOVE CONTACTO TO CONTACTO-D
               WRITE REG-PLANO FROM REG-DETALLE
            END-READ.
