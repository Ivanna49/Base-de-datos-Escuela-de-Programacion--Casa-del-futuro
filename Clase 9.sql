CREATE DATABASE Universo_Lector;
USE Universo_Lector;

CREATE TABLE Autor(
    codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Editorial (
    codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    razon_social VARCHAR(200) NOT NULL,
    telefono VARCHAR(100) NOT NULL
);

CREATE TABLE Socio (
    codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    dni INT NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    localidad VARCHAR(100)
);

CREATE TABLE Prestamo (
    codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha DATETIME NOT NULL,
    fecha_devolucion DATE NOT NULL,
    fecha_tope DATE
);

CREATE TABLE Volumen (
    codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    deteriorado BOOL NOT NULL
);

CREATE TABLE PrestamosxVolumen (
    codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL
);

CREATE TABLE Libro (
    codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    isbn VARCHAR(13) NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    anio_escritura DATE NOT NULL,
    anio_edicion DATE NOT NULL
);



ALTER TABLE Libro MODIFY COLUMN anio_edicion VARCHAR(4);

ALTER TABLE Libro MODIFY COLUMN anio_escritura VARCHAR(4);

ALTER TABLE Prestamo MODIFY COLUMN  fecha DATE;

