CREATE DATABASE CONSULTA
GO
USE CONSULTA
GO

--TABLAS:

/*
ERP: ID, NOMBRE
USUARIO: ID, NOMBRE, APELLIDO, TELEFONO, ID_ERP
ESPECIALIDAD: ID_ESP, NOMBRE
MEDICO: ID, NOMBRE, APELLIDO, ID_ESPECIALIDAD
CITA: ID, FECHA, HORA, ID_USUARIO, ID_MEDICO
*/

--CREACI�N DE TABLAS:
CREATE TABLE ERP(
ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
NOMBRE VARCHAR(20) NOT NULL
)

CREATE TABLE USUARIOS(
ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
NOMBRE NVARCHAR(20) NOT NULL,
APELLIDO NVARCHAR(20) NOT NULL,
TELEFONO CHAR(10),
ID_ERP INT NOT NULL
FOREIGN KEY (ID_ERP) REFERENCES ERP(ID)
)

CREATE TABLE ESPECIALIDAD(
ID_ESP INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
NOMBRE VARCHAR(30) NOT NULL
)

CREATE TABLE MEDICO(
ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
NOMBRE VARCHAR(30) NOT NULL,
APELLIDO VARCHAR(30) NOT NULL,
ID_ESPECIALIDAD INT NOT NULL
FOREIGN KEY (ID_ESPECIALIDAD) REFERENCES ESPECIALIDAD(ID_ESP)
)

CREATE TABLE CITA(
ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
FECHA DATE NOT NULL,
HORA TIME NOT NULL,
ID_USUARIO INT NOT NULL,
ID_MEDICO INT NOT NULL
FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID),
FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(ID)
)


--CONSULTAS:
--TABLA ERP
SELECT * 
FROM ERP

--TABLA USUARIOS
SELECT *
FROM USUARIOS

--TABLA ESPECIALIDAD
SELECT * 
FROM ESPECIALIDAD

--TABLA MEDICO
SELECT *
FROM MEDICO

--TABLA CITAS
SELECT *
FROM CITA

--INGRESO DE DATOS:
--USUARIOS
INSERT INTO USUARIOS(NOMBRE, APELLIDO, TELEFONO, ID_ERP)
VALUES
('Juan','Buitrago', 3123456789, 1),
('Felipe','Olaya', 3987654321, 1)

--ESPECIALIDAD
INSERT INTO ESPECIALIDAD(NOMBRE)
VALUES
('Cardiologia'),
('Neurologia'),
('Reumatologia')

--MEDICO
INSERT INTO MEDICO(NOMBRE, APELLIDO,ID_ESPECIALIDAD)
VALUES 
('Armando', 'Casas', 1),
('Maria', 'Cata�o', 2),
('Lina', 'Ramirez', 3),
('Mark', 'Larsson', 1)

--CITA
INSERT INTO CITA (FECHA, HORA, ID_USUARIO, ID_MEDICO)
VALUES
('2023-09-26', '12:45:00',1,2),
('2023-09-28', '8:30:00',2,1),
('2023-09-12', '10:45:00',2,1)