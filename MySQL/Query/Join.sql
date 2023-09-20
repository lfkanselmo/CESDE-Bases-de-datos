--JOIN (Consultas en multiples tablas)
/*
INNER JOIN: Muestra la información o las filas que coinciden en ambas tablas

LEFT JOIN: Muestra toda la información de la tabla de la izquierda(tabla 1) y en la información que coincide en la tabla de la derecha(tabla 2)

RIGHT JOIN: Muestra toda la información de la tabla de la derecha(tabla 1) y en la información que coincide en la tabla de la izquierda(tabla 2)

OUTER JOIN: Muestra toda la información de ambas tablas
*/

--NOTA: PARA CONSULTAR 2 O MÁS TABLAS ESTAS DEBEN TENER UN CAMPO QUE LAS RELACIONE (clave foranea)

/*
SINTAXIS: 
SELECT columnaNombre1, columnaNombre2... 
FROM nombreTabla1
INNER JOIN nombreTabla2
ON nombreTabla1.atributoComun = nombreTabla2.atributoComun
*/

USE CONSULTA

--INNER JOIN
--Usuarios que están afiliados a una ERP

SELECT U.NOMBRE, ERP.NOMBRE
FROM USUARIOS AS U
INNER JOIN ERP
ON U.ID_ERP = ERP.ID

SELECT * from USUARIOS
SELECT * from ERP

--DELETE FROM USUARIOS
--WHERE ID = 4

--LEFT JOIN
--ERP QUE TIENEN USUARIOS AFILIADOS
SELECT ERP.NOMBRE, U.NOMBRE
FROM ERP
LEFT JOIN USUARIOS AS U
ON ERP.ID = U.ID_ERP
ORDER BY ERP.NOMBRE

SELECT * FROM CITA

--RIGHT JOIN
--Consultar todas las especialidades y medicos asociados a esta


INSERT INTO ESPECIALIDAD(NOMBRE)
VALUES
('Pediatria')

--Agregar un usuario en la tabla usuario
SELECT * FROM USUARIOS

INSERT INTO USUARIOS(NOMBRE, APELLIDO, TELEFONO, ID_ERP)
VALUES
('Nicolas', 'Marin', 3245678210,2)

SELECT E.NOMBRE, M.NOMBRE
FROM MEDICO AS M
RIGHT JOIN ESPECIALIDAD AS E
ON M.ID_ESPECIALIDAD = E.ID_ESP 

--Consultar todos los usuarios y citas programadas

SELECT U.NOMBRE, U.APELLIDO, C.FECHA, C.HORA
FROM USUARIOS AS U
FULL OUTER JOIN CITA AS C
ON U.ID = C.ID_USUARIO
