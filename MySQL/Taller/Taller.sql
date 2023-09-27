/*
Nicolas Marin
Juan Carlos Buitrago
Felipe Olaya
Anselmo Ortega

SURA G-2
*/

-- CREACION DE BASE DE DATOS
CREATE DATABASE CONTROL_LIBROS
GO
USE CONTROL_LIBROS
GO

-- CREACION DE TABLAS

CREATE TABLE EDITORIAL(
EDITORIAL VARCHAR(50) PRIMARY KEY NOT NULL,
NOMBRE VARCHAR(50) NOT NULL,
PAIS NVARCHAR(50) NOT NULL
)

CREATE TABLE LIBRO(
COD_LIBRO varchar(50) primary key not null,
TITULO varchar(50) not null,
ISBN nvarchar(50) UNIQUE not null,
A�O_EDICION int CHECK(A�O_EDICION > 1) not null,
COD_EDITORIAL varchar(50) not null


FOREIGN KEY (COD_EDITORIAL) REFERENCES EDITORIAL(EDITORIAL)
ON DELETE CASCADE
ON UPDATE CASCADE
)

create table AUTOR(
COD_AUTOR varchar(50) primary key not null,
P_NOMBRE varchar(50) not null,
P_APELLIDO varchar(50) not null,
FECHA_NAC date ,
NACIONALIDAD nvarchar(50) DEFAULT('Desconocida'),
EDAD INT
 )

 CREATE TABLE DETALLE_AUTORLIBRO(
ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
COD_AUTOR VARCHAR(50) NOT NULL,
COD_LIBRO VARCHAR(50) NOT NULL

FOREIGN KEY (COD_AUTOR) REFERENCES AUTOR(COD_AUTOR)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (COD_LIBRO) REFERENCES LIBRO(COD_LIBRO)
ON DELETE CASCADE
ON UPDATE CASCADE
)

 -- INGRESO DE DATOS EN TABLAS
 SET DATEFORMAT dmy
 insert into AUTOR(COD_AUTOR, P_NOMBRE , P_APELLIDO, FECHA_NAC, NACIONALIDAD, EDAD)VALUES
 ( 'CB101', 'Consuelo','Buitrago', '19/08/1960','Colombiana', 63),
 ( 'LB002', 'Luis','Bustamante', '10/06/1970','Salvadore�o', 53),
 ( 'CC003', 'Carlos','Correa', '12/12/1967','Espa�ol', 56),
 ( 'SG004', 'Santiago','Garcia', '3/09/1980','Colombiano', 43),
 ( 'RG005', 'Rafael','Garcia', '22/11/1980','Espa�ol', 43),
 ( 'EO006', 'Enya','Orozco', '13/09/1967','Colombiano', 56)

 INSERT INTO EDITORIAL(EDITORIAL, NOMBRE, PAIS)
VALUES
('EDITO01','Omega2000','Colombia'),
('EDITO02','Anaya Multimedia','Espa�a'),
('EDITO03','McGrawhill','Inglaterra'),
('EDITO04','Reyes','M�xico'),
('EDITO05','Prentice Hall','Inglaterra')

INSERT INTO LIBRO (COD_LIBRO, TITULO, ISBN, A�O_EDICION, COD_EDITORIAL)
VALUES
('COL00001', 'FUNDAMENTOS DE BASES DE DATOS', '12333-1234567', 2004, 'EDITO01'),
('COL00002', 'LA BIBLIA DE SQL SERVER 2008', '12333-1234568', 2008, 'EDITO02'),
('COL00003', 'PROGRAMACION ORIENTADA A OBJETOS', '12333-1234569', 2011, 'EDITO01'),
('COL00004', 'DISE�O WEB', '12333-1234570', 2010, 'EDITO03'),
('COL00005', 'PROGRAMACION CC++', '12333-1234571', 2009, 'EDITO05'),
('COL00006', 'USO DE HOJAS DE ESTILO JAVASCRIPT ', '12333-1234572', 2008, 'EDITO04'),
('COL00007', 'ADMINISTRACION DE BASES DE DATOS', '12333-1234573', 2010, 'EDITO02');


INSERT INTO DETALLE_AUTORLIBRO(COD_AUTOR,COD_LIBRO)
VALUES('CB101','COL00001'),
      ('SG004','COL00001'),
	  ('LB002','COL00002'),
	  ('CC003','COL00002'),
	  ('CC003','COL00003'),
	  ('RG005','COL00005'),
	  ('LB002','COL00006'),
	  ('SG004','COL00005'),
	  ('EO006','COL00003')

/*        Crear las siguientes consultas:        */

-- Mostrar el primer nombre, primer apellido de los autores junto con el t�tulo de libro que estos han escrito.

SELECT AUTOR.P_NOMBRE, AUTOR.P_APELLIDO, LIBRO.TITULO
FROM DETALLE_AUTORLIBRO AS DA
INNER JOIN AUTOR ON DA.COD_AUTOR = AUTOR.COD_AUTOR
INNER JOIN LIBRO ON DA.COD_LIBRO = LIBRO.COD_LIBRO

-- Mostrar el nombre de la editorial y el t�tulo del libro
SELECT LIBRO.TITULO, EDITORIAL.NOMBRE
FROM LIBRO
INNER JOIN EDITORIAL ON LIBRO.COD_EDITORIAL = EDITORIAL.EDITORIAL

-- Mostrar los t�tulos de los libros y el nombre de la editorial, donde esta sea del pa�s de Inglaterra,

SELECT LIBRO.TITULO, EDITORIAL.NOMBRE
FROM LIBRO
INNER JOIN EDITORIAL ON LIBRO.COD_EDITORIAL = EDITORIAL.EDITORIAL
WHERE EDITORIAL.PAIS = 'Inglaterra'

-- Mostrar los nombres de los autores y el t�tulo del libro donde el a�o de edici�n sea el m�s actual.
SELECT TOP 1 AUTOR.P_NOMBRE, LIBRO.TITULO, LIBRO.A�O_EDICION
FROM DETALLE_AUTORLIBRO AS DA
LEFT JOIN AUTOR ON DA.COD_AUTOR = AUTOR.COD_AUTOR
LEFT JOIN LIBRO ON DA.COD_LIBRO = LIBRO.COD_LIBRO
ORDER BY LIBRO.A�O_EDICION DESC

-- Mostrar los nombres de los autores y el t�tulo del libro donde el a�o de edici�n sea el menos actual.

SELECT TOP 1 AUTOR.P_NOMBRE, LIBRO.TITULO, LIBRO.A�O_EDICION
FROM DETALLE_AUTORLIBRO AS DA
LEFT JOIN AUTOR ON DA.COD_AUTOR = AUTOR.COD_AUTOR
LEFT JOIN LIBRO ON DA.COD_LIBRO = LIBRO.COD_LIBRO
ORDER BY LIBRO.A�O_EDICION ASC

/*  Agregue los datos necesarios a las tablas, para luego implementar
las instrucciones LEFT JOIN, RIGHT JOIN Y FULL JOIN, como por
ejemplo autores que no han escrito un libro todav�a, editoriales que
no han editado libros etc.  */

-- AGREGAR NUEVOS VALORES EN AUTOR
 SET DATEFORMAT dmy
 insert into AUTOR(COD_AUTOR, P_NOMBRE , P_APELLIDO, FECHA_NAC, NACIONALIDAD, EDAD)VALUES
 ( 'RM003', 'Robert','Martin', '19/03/1978','Britanico', 45),
 ( 'FB002', 'Frederick','Brooks', '17/09/1965','Britanico', 58)

 -- TABLA LIBROS
 
INSERT INTO LIBRO (COD_LIBRO, TITULO, ISBN, A�O_EDICION, COD_EDITORIAL)
VALUES
('COL00008', 'CLEAN CODE', '12333-1237867', 2007, 'EDITO01'),
('COL00009', 'THE MYTHICAL MAN-MONTH', '15543-1234438', 2010, 'EDITO02')

-- TABLA EDITORIAL
 INSERT INTO EDITORIAL(EDITORIAL, NOMBRE, PAIS)
VALUES
('EDITO06','Austral','Alemania')

select * from LIBRO

SELECT EDITORIAL.NOMBRE, LIBRO.TITULO
FROM LIBRO
RIGHT JOIN EDITORIAL ON LIBRO.COD_EDITORIAL = EDITORIAL.EDITORIAL

-- ---------------------------------------------------------------------------

SELECT  LIBRO.TITULO, AUTOR.P_NOMBRE, AUTOR.P_APELLIDO
FROM LIBRO
LEFT JOIN DETALLE_AUTORLIBRO ON LIBRO.COD_LIBRO = DETALLE_AUTORLIBRO.COD_LIBRO
LEFT JOIN AUTOR ON DETALLE_AUTORLIBRO.COD_AUTOR = AUTOR.COD_AUTOR

-- ----------------------------------------------------------------------------

SELECT LIBRO.TITULO, EDITORIAL.NOMBRE
FROM LIBRO
FULL JOIN EDITORIAL ON LIBRO.COD_EDITORIAL = EDITORIAL.EDITORIAL

------------------------------ Pendiente ---------------------------------------


--Pregunta 6 
--�C�mo se usan los procedimientos almacenados con par�metros de entrada y salida?

--Creaci�n: Primero, debes crear el procedimiento almacenado en la base de datos. Esto se hace generalmente mediante SQL

--Ejecuci�n: Luego, puedes ejecutar el procedimiento almacenado y pasar los par�metros de entrada. Tambi�n puedes especificar par�metros de salida si es necesario.

--Resultados: Los procedimientos almacenados pueden devolver valores a trav�s de los par�metros de salida que puedes utilizar en tu aplicaci�n


---------------------------------------------------//----------------------------------------

--�Por qu� son importantes los procedimientos almacenados?

--Los procedimientos almacenados ofrecen varias ventajas importantes:

--Optimizaci�n del rendimiento: Los procedimientos almacenados se almacenan en la base de datos, lo que significa que se compilan una vez y se pueden reutilizar muchas veces. Esto reduce la necesidad de transmitir grandes cantidades de datos entre la aplicaci�n y la base de datos, lo que mejora el rendimiento.

--Seguridad: Los procedimientos almacenados permiten controlar qui�n tiene acceso a la base de datos y qu� operaciones pueden realizar. Esto ayuda a proteger la integridad y seguridad de los datos.

--Mantenimiento: Los cambios en la l�gica de la base de datos se pueden realizar en un solo lugar (el procedimiento almacenado) en lugar de en m�ltiples lugares dispersos en el c�digo de la aplicaci�n.

--Reutilizaci�n de c�digo: Los procedimientos almacenados se pueden llamar desde m�ltiples partes de una aplicaci�n, lo que fomenta la reutilizaci�n del c�digo y evita duplicaci�n innecesaria.

--Facilita la administraci�n de transacciones: Los procedimientos almacenados pueden incluir transacciones SQL, lo que facilita la administraci�n de operaciones complejas que deben ser at�micas (es decir, que se ejecutan completamente o no se ejecutan en absoluto).


--------------------------------------------------//---------------------------------------------

-- PROCEDIMIENTO PARA BUSCAR AUTORES QUE TENGAN EDAD MENOR O IGUAL A LA DADA COMO PARAMETRO
CREATE PROCEDURE autoresMenoresQue (@edad int)
AS
BEGIN
	SELECT AUTOR.P_NOMBRE, AUTOR.P_APELLIDO, AUTOR.EDAD
	FROM AUTOR
	WHERE AUTOR.EDAD <= @edad
END
GO

EXECUTE autoresMenoresQue 50


-- PROCEDIMIENTO PARA SABER CUANTOS LIBROS HA ESCRITO UN AUTOR ESPECIFICO
CREATE PROCEDURE cuantosLibrosPorAutor(
@autor VARCHAR(50)
,@conta INT OUTPUT)
AS
BEGIN
	SELECT @conta = COUNT(LIBRO.TITULO)
	FROM LIBRO
	LEFT JOIN DETALLE_AUTORLIBRO ON LIBRO.COD_LIBRO = DETALLE_AUTORLIBRO.COD_LIBRO
	LEFT JOIN AUTOR ON DETALLE_AUTORLIBRO.COD_AUTOR = AUTOR.COD_AUTOR
	WHERE AUTOR.COD_AUTOR = @autor
END
GO

DECLARE @counta AS INT
EXECUTE cuantosLibrosPorAutor 'CC003', @counta OUTPUT
SELECT @counta AS 'Cantidad de libros'