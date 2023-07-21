/*Creacion base de datos*/
create database biblioteca
use biblioteca

/*crear tabla de Editorial*/
create table editorial(
id int primary key not null,
nombre varchar(30) not null
)

/*crear tabla de Libros*/
create table libro(
id int primary key not null,
titulo varchar(30) not null,
ideditorial int not null,
area varchar(30)
foreign key (ideditorial) references editorial(id)
)

/*crear tabla de Autor*/
create table autor(
idAutor int primary key not null,
nombre varchar(30) not null,
nacionalidad varchar(20) not null
)

/*crear tabla de libroAutor*/
create table libroAutor(
idAutor int not null,
idLibro int not null
foreign key (idAutor) references autor(idAutor),
foreign key (idLibro) references libro(id)
)

/*crear tabla de Lector*/
create table lector(
idLector int primary key not null,
dni int not null,
direccion nvarchar(50),
carrera varchar(30),
edad tinyint,
telefono char(10)
)

/*crear tabla de prestamo*/
create table prestamo(
idLector int not null,
idLibros int not null,
fechaPrestamo date not null,
fechaDevolucion date not null
foreign key (idLector) references lector(idLector),
foreign key (idLibros) references libro(id)
)