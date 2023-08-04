--     TALLER EVALUATIVO

/* ------------ PUNTO 1 ------------ */


-- Crear base de datos ventas
create database venta
go
use venta
go

/* ------------ PUNTO 2 ------------ */

-- Crear tabla de clientes
create table cliente(
id_cliente int primary key identity(10001,1) not null,
cedula varchar(10) unique not null,
direccion nvarchar(40),
numero_celular char(10),
email nvarchar(30) default 'Desconocido',
saldo_trim1 decimal(10,2),
saldo_trim2 decimal(10,2),
saldo_trim3 decimal(10,2)
)

-- Crear tabla de vendedores
create table vendedor(
id_vendedor int primary key identity(20001,1) not null,
nombre varchar(20) not null,
apellido varchar(20) not null,
direccion nvarchar(40),
telefono varchar(10),
email nvarchar(30) default 'Desconocido',
cuota decimal(10,2),
ventas decimal(10,2)
)

-- Crear tabla de articulos
create table articulo(
id_articulo int primary key identity(30001,1) not null,
descripcion varchar(50),
precio decimal(10,2) check(precio >= 0) not null,
existencia int,
categoria varchar(20) not null
)

-- Crear tabla de pedidos
create table pedido(
id_pedido int primary key identity(40001,1) not null,
id_cliente int not null,
fecha date,
id_vendedor int not null

foreign key (id_cliente) references cliente(id_cliente),
foreign key (id_vendedor) references vendedor(id_vendedor)
)

-- Crear tabla de detalles de pedidos
create table detalle_pedido(
id_pedido int not null,
id_articulo int not null,
cantidad int check(cantidad >= 0),

foreign key (id_pedido) references pedido(id_pedido),
foreign key (id_articulo) references articulo(id_articulo)
)

/* ------------ PUNTO 4 ------------ */


-- Insertar 10 registros en la tabla clientes
insert into cliente (cedula,direccion,numero_celular,email,saldo_trim1,saldo_trim2,saldo_trim3)
values
 ('1154896574','calle 3 #43-21', '3256987458', 'correo1@dominio.com', 99999.99, 32426.87, 98365.41),
('1165496574','calle 34 #49-20', '3256327458', 'correo2@dominio.com', 99999.99, 87426.77, 32515.47),
('1154832474','carrera 3 #52-32', '3251477458', 'correo3@dominio.com', 99999.99, 88426.54, 74365.42),
('1154324474','calle 2 #14-26', '3269877458', 'correo4@dominio.com', 99999.99, 85426.32, 23565.81),
('1123476574','carrera 87 #63-89', '3256321458', 'correo5@dominio.com', 99999.99, 85485.15, 63965.61),
('1213896574','calle 65 #15-41', '3256859658', 'correo6@dominio.com', 99999.99, 85741.96, 85365.85),
('1877656574','carrera 12 #21-16', '3258987458', 'correo7@dominio.com', 99999.99, 89636.45, 97465.36),
('1234236574','calle 78 #69-14', '3147987458', 'correo8@dominio.com', 99999.99, 88546.25, 98365.21),
('1987544574','calle 8 #74-21', '3369187458', 'correo9@dominio.com', 99999.99, 81256.96, 98635.20),
('1122346574','calle 15 #32-87', '3178987458', 'correo10@dominio.com', 99999.99, 96326.75, 96965.96)


-- Insertar 10 registros en la tabla vendedores
insert into vendedor (nombre,apellido,direccion,telefono,email,cuota,ventas)
values
('Jose', 'Arbelaez', 'calle 34 #49-20', '3256859658', 'vendedor1@dominio.com', 25000.45, 26745.42),
('Maria', 'Monsalve', 'carrera 23 #44-65', '3986649658', 'vendedor2@dominio.com', 25096.45, 86365.42),
('Juan', 'Mancuso', 'calle 54 #12-23', '3015559658', 'vendedor3@dominio.com', 26500.45, 39745.42),
('Luis', 'martinez', 'carrera 41 #87-78', '3005859658', 'vendedor4@dominio.com', 35600.45, 14745.42),
('Sara', 'Giraldo', 'calle 95 #12-30', '3987542258', 'vendedor5@dominio.com', 27960.45, 23655.42),
('Johana', 'Saldarriaga', 'calle 93 #23-32', '3685465658', 'vendedor6@dominio.com', 28963.45, 76745.42),
('Geraldine', 'Perez', 'carrera 14 #29-65', '3256832147', 'vendedor7@dominio.com', 25741.45, 57745.42),
('Lina', 'Ibarra', 'calle 39 #23-76', '3202149658', 'vendedor8@dominio.com', 25004.49, 22105.42),
('Carlos', 'Clavijo', 'calle 4 #10-11', '3256800215', 'vendedor9@dominio.com', 27840.45, 20325.41),
('Felipe', 'Uribe', 'carrera 94 #29-21', '3200396658', 'vendedor10@dominio.com', 21000.45, 69745.42)

-- Insertar 10 registros en la tabla articulos
insert into articulo (descripcion, precio,existencia, categoria)
values
('jabon de cocina', 450087, 5, 'aseo'),
('salsa de tomate', 896647, 47, 'enlatados'),
('maiz precocido', 640036, 25, 'enlatados'),
('arroz 500g', 465087, 9, 'granos'),
('lentejas 500g', 374087, 11, 'granos'),
('crema dental', 580036, 36, 'aseo'),
('mantequilla 250g', 456387, 15, 'cocina'),
('aceite de oliva', 160457, 63, 'cocina'),
('salchichas rellenas', 980036, 29, 'enlatados'),
('garbanzos 500g', 400087, 4, 'granos')

-- Insertar 10 registros en la tabla pedidos

set dateformat dmy
insert into pedido(id_cliente,fecha,id_vendedor)
values
(10006, '05-05-2023',20007),
(10004, '26-03-2023',20003),
(10009, '21-04-2023',20004),
(10003, '16-03-2023',20003),
(10007, '14-01-2023',20002),
(10010, '11-05-2023',20009),
(10009, '23-04-2023',20008),
(10005, '04-06-2023',20004),
(10003, '07-05-2023',20010),
(10007, '08-04-2023',20002)

-- Insertar 10 registros en la tabla detalles de pedidos
insert into detalle_pedido(id_pedido, id_articulo, cantidad)
values
(40001, 30001, 3),
(40008, 30005, 1),
(40004, 30004, 5),
(40007, 30003, 3),
(40005, 30007, 1),
(40007, 30009, 2),
(40007, 30004, 4),
(40004, 30005, 2),
(40005, 30010, 1),
(40005, 30007, 2)


/* ------------ PUNTO 5 ------------ */

-- Modificar la tabla cliente (nombre, apellido, tel_fijo)
alter table cliente
add nombre varchar(20) default 'pendiente' not null,
apellido varchar(20) default 'pendiente' not null,
tel_fijo varchar(7)

-- modificar la tabla articulo (nombre)
alter table articulo
add nombre varchar(20)


/* ------------ PUNTO 6 ------------ */

-- Consultar todos las columnas y filas de cliente
select * 
from cliente

-- Seleccionar columnas nombre e email de la tabla clientes
select nombre, email
from cliente

-- Seleccionar el id de articulos que han sido pedidos
select id_articulo
from detalle_pedido