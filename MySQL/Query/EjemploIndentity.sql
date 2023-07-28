--identity: autoincremento

create database ejemplo
go
use ejemplo
go

create table cliente(
id int primary key identity(1,1) not null,
nombre varchar(30) not null,
apellido varchar(30) not null,
telefono char(10),
email nvarchar(40)
)

insert into cliente(nombre, apellido, telefono, email)
values 
('José','Martinez','3148510869','josema@dominio.com'),
('Sebastian','Giraldo','3199630869','sebastiangi@dominio.com'),
('Laura','Rendon','3189610869','laurare@dominio.com'),
('Miguel','Ospina','3148512549','miguelos@dominio.com');

