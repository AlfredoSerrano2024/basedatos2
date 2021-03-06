--Crearemos una tabla para probar  el poder de pl sql

create table dance(id_dance integer, nombre varchar2(40), edad integer);

--PRENDEMOS EL SERVIDOR EN MODO DESARROLLADOR

SET SERVEROUTPUT ON;

--VAMOS A EMPEZAR UN BLOQUE LS SQL

DECLARE 
--AQUI SE DECLARAN LAS VARIABLES A USARSE 

EDAD INTEGER;
YEARS INTEGER;
BEGIN
--AQUI VA LA LOGICA DEL PROGRAMA

YEARS:=24;
EDAD:=YEARS*365;


--PARA IMPRIMIR:
DBMS_OUTPUT.PUT_LINE('TU EDAD EN DIAS ES' ||EDAD);

END;
/

--crear un bloque SQL que genere 200,0000registros en secuencia ascendiente en la table dance
BEGIN

FOR I IN 1..200000 LOOP
INSERT INTO DANCE VALUES(I,'julio',21);
END LOOP;
END;
/
--HACER UN SELECT 
SELECT * FROM DANCE;

--sistema de peliculas la de sala sera de tarea
CREATE TABLE PELICULA(ID_PELICULA INTEGER,
TITULO VARCHAR2(120),
SIPNOSIS VARCHAR2(500),
CLASIFICACION VARCHAR2(5),
CONSTRAINT PK_ID_PELICULA PRIMARY KEY(ID_PELICULA));
DESCRIBE PELICULA;

CREATE TABLE HORARIO (ID_HORARIO INTEGER,
ID_PELICULA INTEGER,
HORARIO VARCHAR2(8),
CONSTRAINT PK_ID_HORARIO PRIMARY KEY(ID_HORARIO),
CONSTRAINT FK1_ID_PELICULA FOREIGN KEY(ID_PELICULA) REFERENCES PELICULA(ID_PELICULA));

create sequence sec_pelicula
start with 1
increment by 1
nomaxvalue; 

--para asociarla se necesita un nuevo objeto de base de datos, este objeto va a ser el que insertara el o los nuevos registros en la tabla pelicula:
--JAMAS se usara un insert into en oracle cuando tiene un orimary key auto-generado
