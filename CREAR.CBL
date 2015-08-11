       IDENTIFICATION DIVISION.
       PROGRAM-ID. CREAR.
      *-------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
             SELECT AMIGOS
                ASSIGN TO RANDOM "AMIGOS.DAT"
                ORGANIZATION IS INDEXED
                ACCESS MODE IS DYNAMIC
                RECORD KEY IS CODIGO.
      *-------------------------
       DATA DIVISION.
       FILE SECTION.
       FD AMIGOS.
       01 REG-AMIGOS.
         05 CODIGO PIC 9(5).
         05 NOMBRE PIC X(30).
         05 TELEFONO PIC X(20).
      *-------------------------
       PROCEDURE DIVISION.
       PRINCIPAL.
             OPEN OUTPUT AMIGOS.
             CLOSE AMIGOS.
             STOP RUN.
