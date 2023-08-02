/* --------------- Restricciones --------------- */
/*

Utilizada para limitar o validar el ingreso de información a las tablas.

Check: Limitar el rango de valores que puede ser ingresado en una columna.

Unique: Para evitar el ingreso de datos duplicados en una columna.

Default: Determina un valor por defecto para la columna cuando no se ingresa nada.

on update cascade y on delete cascade: actualiza y elimina respectivamente valores en las tablas principales, 
y afecta a las tablas secundarias con las que está relacionada.

*/

--Crear base de datos restricciones
create database restricciones
go
use restricciones
go

--Crear tabla cliente
create table cliente(
id_cliente int primary key identity(1,1) not null,
cedula varchar(10) unique not null,  --validamos que todas las cedulas sean unicas con unique
edad tinyint check(edad > 18),  --validamos que las personas deben ser mayores de edad con check
email nvarchar(30) default 'no registra' --ingresa valor predeterminado "no registra" en caso de quedar vacio
)

--Agregar el nombre que faltó ponerlo
alter table cliente
add nombre varchar(40) not null

insert into cliente(cedula, nombre ,edad,email)
values
('11749634', 'Pepe Peperoni' ,25, 'ejemplo3@dominio.com'),
('11659874','Pepito Perez' ,31, 'ejemplo@dominio.com'),
('11659634', 'Juana Ruana' ,40, 'ejemplo2@dominio.com')

select *
from cliente