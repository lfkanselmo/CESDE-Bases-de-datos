insert into autor (idAutor, nombre, nacionalidad)
values 
(100001, 'John Jons','Noruega'),
(100002, 'Marie Higs','USA'),
(100003, 'Joseph Martin','UK'),
(100004, 'Jules Anton','Australia'),
(100005, 'Genesis Luck','USA'),
(100006, 'Deisy McAllister','UK'),
(100007, 'Thomas Funckler','Alemania'),
(100008, 'Jon Stormberg','Suecia'),
(100010, 'José Martinez','Mexico'),
(100011, 'Vladimir Romanov','Rusia'),
(100012, 'Natasha Ivanova','Ucrania'),
(100013, 'Rui Fushiguro','Japon'),
(100014, 'Bernard Unkenke','Nigeria');

insert editorial(id,nombre)
values
(200001,'Millenium'),
(200002,'Tower'),
(200003,'Cascade'),
(200004,'Dark Place'),
(200005,'Sphere'),
(200006,'Spartan'),
(200007,'Venus'),
(200008,'Mountain'),
(200009,'Silver'),
(200010,'Rivers');

insert lector(idLector,dni,direccion,carrera,edad,telefono)
values
(300001, 1000151617,'carrera 23 #54-12','Medicina',25,314851169),
(300002, 1000151617,'calle 14 #75-19','Ingenieria',25,3033594669),
(300003, 1000151617,'calle 45 #25-14','Derecho',25,3115696621),
(300004, 1000151617,'calle 85 #26-41','Desarrollo Software',25,3007843211),
(300005, 1000151617,'carrera 120 #73-89','Medicina',25,32186947219),
(300006, 1000151617,'carrera 6 #43-15','Ingenieria',25,3236946514),
(300007, 1000151617,'calle 78 #51-82','Medicina',25,3189665542),
(300008, 1000151617,'carrera 10 #17-72','Diseño Grafico',25,3145683669),
(300009, 1000151617,'calle 69 #10-36','Desarrollo Software',25,3148515669),
(300010, 1000151617,'carrera 96 #78-94','Medicina',25,3138598669),
(300011, 1000151617,'carrera 52 #64-72','Ingenieria',25,3108321669),
(300012, 1000151617,'carrera 36 #5-18','Diseño Grafico',25,3128996769);

insert into libro(id,titulo,ideditorial,area)
values
(400001,'Entornos graficos',200005,'Artes'),
(400002,'Algebra euclidiana',200007,'Matematicas'),
(400003,'Java para principiantes',200005,'Tecnologia'),
(400004,'Calculo integral',200007,'Matematicas'),
(400005,'Conceptos del cuerpo',200002,'Medicina'),
(400006,'El cerebro',200002,'Medicina'),
(400007,'Varias variables',200003,'Matematicas'),
(400008,'Fisica mecanica',200009,'Matematicas'),
(400009,'Teoria del color',200009,'Artes'),
(400010,'Anatomia clasica',200004,'Medicina'),
(400011,'Formas',200003,'Artes'),
(400012,'Arquitectura i386',200005,'Tecnologia'),
(400013,'Orientada a objetos',200006,'Tecnologia'),
(400014,'Transformers',200010,'Tecnologia');

insert into libroAutor(idAutor,idLibro)
values
(100005,400001),
(100006,400002),
(100003,400003),
(100011,400004),
(100007,400005),
(100007,400006),
(100012,400007),
(100013,400008),
(100005,400009),
(100014,400010),
(100005,400011),
(100001,400012),
(100001,400013),
(100003,400014);


set dateformat dmy;

insert into prestamo(idLector,idLibros,fechaPrestamo,fechaDevolucion)
values
(300004, 400014, '14-5-2023','24-6-2023'),
(300005, 400006, '12-5-2023','25-6-2023'),
(300006, 400004, '17-5-2023','12-6-2023'),
(300010, 400010, '22-5-2023','3-6-2023'),
(300003, 400002, '25-4-2023','23-6-2023'),
(300003, 400006, '21-4-2023','14-5-2023'),
(300004, 400003, '11-5-2023','12-6-2023'),
(300004, 400013, '5-6-2023','16-6-2023'),
(300007, 400006, '9-5-2023','12-5-2023'),
(300009, 400012, '10-4-2023','12-5-2023');