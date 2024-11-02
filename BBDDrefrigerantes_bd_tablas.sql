-- Script bbdd gestor de refrigerantes creacion base y tablas.
-- Carlos Manuel Martinez Pomares 
-- DAM Semipresencial Proyecto final
-- BBDD REFRIGERANTES

USE master;
GO


IF EXISTS(SELECT * FROM sys.databases WHERE name = 'Refrigerantes')
BEGIN
    DROP DATABASE Refrigerantes;
END
GO

CREATE DATABASE Refrigerantes ON
(NAME = Refrigerantes_dat,
    FILENAME = 'C:\Users\carlo\AppData\Local\Microsoft\Microsoft 
    SQL Server Local DB\Instances\MSSQLLocalDB\refrigerantes.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
(NAME = Refrigerantes_log,
    FILENAME = 'C:\Users\carlo\AppData\Local\Microsoft\Microsoft 
    SQL Server Local DB\Instances\MSSQLLocalDB\refrigerantes.ldf',
    SIZE = 5 MB,
    MAXSIZE = 25 MB,
    FILEGROWTH = 5 MB);
GO


USE Refrigerantes;
GO
----------------------------------------------CREACION DE LAS TABLAS------------------------------------------

-- TABLA REFRIGERANTES

CREATE TABLE Refrigerantes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL,
    CO2eq DECIMAL(10,2) NOT NULL,
    clase NVARCHAR(50) NOT NULL,
    grupo NVARCHAR(50) NOT NULL
);

-- TABLA TIPO EQUIPO

CREATE TABLE Tipo_equipo (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tipo_equipo NVARCHAR(50) NOT NULL
   
);

-- TABLA CATEGORIA PROFESIONAL

CREATE TABLE Categoria_profesional (
    id INT IDENTITY(1,1) PRIMARY KEY,
    categoria_profesional NVARCHAR(50) NOT NULL
   
);

--TABLA CLIENTE

CREATE TABLE Cliente (
    id INT IDENTITY(1,1) PRIMARY KEY,
    cif NVARCHAR(15) NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    direccion_facturacion NVARCHAR(200) NOT NULL
);

-- TABLA OPERARIO

CREATE TABLE Operario (
    id INT IDENTITY(1,1) PRIMARY KEY,
    dni NVARCHAR(15) NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    apellido1 NVARCHAR(100) NOT NULL,
    apellido2 NVARCHAR(100)
    id_categoria_profesional INT NOT NULL,
    

    CONSTRAINT UQ_Operario_DNI UNIQUE (dni),

    CONSTRAINT FK_Operario_Categoria_profesional FOREIGN KEY (id_categoria_profesional)
        REFERENCES Categoria_profesionals(id)
        ON DELETE CASCADE,
);

-- TABLA INSTALACION

CREATE TABLE Instalacion (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    direccion NVARCHAR(200) NOT NULL,
    horario NVARCHAR(50) NOT NULL,
    
    CONSTRAINT FK_Instalacion_Cliente FOREIGN KEY (id_cliente)
        REFERENCES Cliente(id)
        ON DELETE CASCADE
);

-- TABLA EQUIPO

CREATE TABLE Equipo (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_instalacion INT NOT NULL,
    id_refrigerante INT NOT NULL,  
    id_tipo_equipo INT NOT NULL,
    marca NVARCHAR(100) NOT NULL,
    modelo NVARCHAR(200) NOT NULL,
    carga_refrigerante_grs INT NOT NULL, 
    
    -- Claves ajenas
    CONSTRAINT FK_Equipo_Instalacion FOREIGN KEY (id_instalacion)
        REFERENCES Instalacion(id)
        ON DELETE CASCADE,
    
    CONSTRAINT FK_Equipo_Refrigerante FOREIGN KEY (id_refrigerante)
        REFERENCES Refrigerantes(id)
        ON DELETE CASCADE,  
    
    CONSTRAINT FK_Equipo_Tipo_equipo FOREIGN KEY (id_tipo_equipo)
        REFERENCES Tipo_equipo(id)
        ON DELETE CASCADE
);

-- TABLA OPERACION DE CARGA

CREATE TABLE Operacion_carga (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_operario INT NOT NULL,
    id_equipo INT NOT NULL,
    decripcion NVARCHAR(500) NOT NULL,
    refrigerante_manipulado DECIMAL(3,3) NOT NULL,
    recuperacion BIT NOT NULL
    
    CONSTRAINT FK_Operacion_carga_Operario FOREIGN KEY (id_operario)
        REFERENCES Operario(id)
        ON DELETE CASCADE,

    CONSTRAINT FK_Operacion_carga_Equipo FOREIGN KEY (id_equipo)
        REFERENCES Equipo(id)
        ON DELETE CASCADE    
);


