--Consultas
use biblioteca
-- Consultar todos los registros de la tabla lector
select * 
from lector

-- Consultar solamente nombre y email de los lectores
select nombre, email 
from lector

-- Consultar nombre de los autores que tienen nacionalidad que comienza con "A"  % (Resto de la palabra) 
select nombre, nacionalidad
from autor 
where nacionalidad like 'A%'

-- Consultar libros que pertenezcan al area "Matematicas"
select *
from libro
where area = 'Matematicas'

-- Consultar nombre de lectores que tengan carrera "Ingenieria" y sea mayor de "20" años
select nombre
from lector
where carrera = 'Ingenieria' and edad > 20

select * from lector

-- Ordenar los autores por nombre de forma descendente
select * 
from autor
order by nombre desc

-- Consultar autores que no tengan nacionalidad "USA"
select * 
from autor
where nacionalidad <> 'USA'

-- Consultar editoriales que no sean iguales a "Venus"
select * 
from editorial
where nombre <> 'Venus'

-- Consultar autores con nacionalidad "USA" o "UK"
select * 
from autor
where nacionalidad = 'USA' or nacionalidad = 'UK'

-- Agrupar autores según su nacionalidad
select nacionalidad, count(idAutor) as 'autores por pais'
from autor
group by nacionalidad

--Consultar lectores con edades entre 18 y 23
select * 
from lector
where edad >= 18 and edad <= 23
