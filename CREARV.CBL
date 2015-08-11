       IDENTIFICATION DIVISION.
       PROGRAM-ID. CREARV.
      *-------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
             SELECT VENDEDOR
                ASSIGN TO RANDOM "VENDEDOR.DAT"
                ORGANIZATION IS INDEXED
                ACCESS MODE IS DYNAMIC
                RECORD KEY IS CODIGO.
      *-------------------------
       DATA DIVISION.
       FILE SECTION.
       FD VENDEDOR.
       01 REG-VENDEDOR.
        05 CODIGO PIC 9(4).
        05 NOMBRE PIC X(20).
        05 TELEFONO PIC X(10).
        05 CORREO PIC X(20).
        05 CONTACTO PIC X(30).
      *-------------------------
       PROCEDURE DIVISION.
       PRINCIPAL.
             OPEN OUTPUT VENDEDOR.
             CLOSE VENDEDOR.
             STOP RUN.







                
