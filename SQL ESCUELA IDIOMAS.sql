CREATE DATABASE Escuela_Idiomas;
USE Escuela_Idiomas;

CREATE TABLE Usuarios (
Usuario_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
Apellidos varchar (100) NOT NULL,
Nombre varchar (100) NOT NULL,
Mail varchar (150) NOT NULL,
Contraseña INT NOT NULL,
Tipo varchar (50) NOT NULL,
Curso_ID INT NOT NULL,
FOREIGN KEY (Curso_ID) REFERENCES Cursos (Curso_ID)
);

ALTER TABLE Usuarios DROP COLUMN Curso_ID;

CREATE TABLE Cursos (
Curso_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
Tipo varchar (100) NOT NULL,
Coste int NOT NULL,
Nivel varchar (100) NOT NULL,
Fecha_Inscripcion date NOT NULL,
Fecha_Finalizacion date NOT NULL,
Usuario_ID INT NOT NULL,
FOREIGN KEY (Usuario_ID) REFERENCES Usuarios (Usuario_ID)
);

CREATE TABLE Lecciones (
Leccion_ID INT NOT NULL PRIMARY KEY,
Nivel varchar (100) NOT NULL,
Etapa varchar (100) NOT NULL,
Curso_ID int not null,
foreign key (Curso_ID) REFERENCES Cursos (Curso_ID)
);

CREATE TABLE Pagos (
Pago_ID INT NOT NULL PRIMARY KEY,
Estado varchar (100) NOT NULL,
Vía_Pago varchar (100) NOT NULL,
Curso_ID int not null,
Usuario_ID int not null,
FOREIGN KEY (Curso_ID) REFERENCES Cursos (Curso_Id),
FOREIGN KEY (Usuario_ID) REFERENCES Usuarios (Usuario_ID)
);

CREATE TABLE Procesos (
Proceso_ID int not null PRIMARY KEY,
Curso_ID int not null,
Leccion_ID int not null,
Completado_ID varchar (100) not null,
FOREIGN KEY (Curso_ID) REFERENCES Cursos (Curso_ID),
FOREIGN KEY (Leccion_ID) REFERENCES Lecciones (Leccion_ID)
);

ALTER TABLE Procesos RENAME COLUMN Proceso_ID TO Usuario_ID;
DROP TABLE Procesos;

CREATE TABLE Procesos (
Usuario_ID int not null,
Proceso_ID int not null PRIMARY KEY,
Curso_ID int not null,
Leccion_ID int not null,
Completado_ID varchar (100) not null,
FOREIGN KEY (Curso_ID) REFERENCES Cursos (Curso_ID),
FOREIGN KEY (Leccion_ID) REFERENCES Lecciones (Leccion_ID),
FOREIGN KEY (Usuario_ID) REFERENCES Usuarios (Usuario_ID)
);



INSERT INTO Usuarios (Usuario_ID, Apellidos, Nombre, Mail, Contraseña, Tipo) VALUES
(1, 'Martin', 'Carlos', 'carlos@gmail.es', 1221, 'Estudiante'),
(2, 'Vega', 'Julián', 'julian@gmail.es', 4554, 'Estudiante'),
(3, 'Gómez', 'Elena', 'elena@gmail.es', 7887, 'Estudiante'),
(4, 'Martinez', 'Maria', 'maria@gmail.es', 9669, 'Estudiante'),
(5, 'Alvarez', 'Estebán', 'esteban@gmail.es', 1001, 'Estudiante'),
(6, 'Ramirez', 'Lucia', 'lucia@gmail.es', 1805, 'Docente'),
(7, 'Garcia', 'Alejandro', 'alejandro@gmail.es', 1945, 'Docente'),
(8, 'Jimenez', 'Victor', 'victor@gmail.es', 7845, 'Docente'),
(9, 'Gonzalez', 'Rocio', 'rocio@gmail.es', 6512, 'Docente'),
(10, 'Carrasco', 'Jennifer', 'jennifer@gmail.es', 8841, 'Docente'),
(11, 'Muñoz', 'Elena', 'elena@gmail.es', 2624, 'Administradora');

INSERT INTO Cursos (Curso_ID, Tipo, Coste, Nivel, Fecha_Inscripcion, Fecha_Finalizacion, Usuario_ID) VALUES
(20, 'Castellano', 100, 'A1', '2016-09-22', '2020-06-22', 6),
(21, 'Ingles', 150, 'A2', '2017-09-22', '2021-06-22', 7),
(22, 'Aleman', 200, 'B1', '2018-09-22', '2022-06-22', 8),
(23, 'Chino', 180, 'B2', '2019-09-22', '2023-06-22', 9),
(24, 'Frances', 120, 'C1', '2020-09-22', '2024-06-22', 10);

INSERT INTO Lecciones (Leccion_ID, Nivel, Etapa, Curso_ID) VALUES
(10, 'Basico', 'Primera', 20),
(11, 'Intermedio', 'Segunda', 21),
(12, 'Avanzado', 'Tercera', 22),
(13, 'Profesional', 'Cuarta', 23);

INSERT INTO Pagos (Pago_ID, Estado, Vía_Pago, Curso_ID, Usuario_ID) VALUES
(00, 'Pagado', 'Efectivo', 20, 1),
(01, 'No Pagado', 'PayPal', 21, 2),
(02, 'A Plazos', 'Tarjeta Credito', 22, 3);

INSERT INTO Procesos (Proceso_ID, Curso_ID, Leccion_ID, Completado_ID) VALUES
(1, 20, 12, 'True'),
(2, 20, 13, 'False'),
(3, 21, 12, 'False'),
(4, 23, 11, 'True'),
(5, 24, 10, 'True');

SELECT * FROM Usuarios;






