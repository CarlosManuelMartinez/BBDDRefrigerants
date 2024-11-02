-- Script bbdd gestor de refrigerantes
-- Carlos Manuel Martinez Pomares 
-- DAM Semipresencial Proyecto final
-- BBDD REFRIGERANTES

USE master;
GO

-- Eliminar la base de datos si existe
IF EXISTS(SELECT * FROM sys.databases WHERE name = 'Refrigerantes')
BEGIN
    DROP DATABASE Refrigerantes;
END
GO

-- Crear la base de datos
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

-- Crear la tabla Tipo_Equipo
CREATE TABLE Tipo_equipo (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tipo_eqipo NVARCHAR(15) NOT NULL
   
);



-- Crear la tabla Cliente
CREATE TABLE Cliente (
    id INT IDENTITY(1,1) PRIMARY KEY,
    cif NVARCHAR(15) NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    direccion_facturacion NVARCHAR(200) NOT NULL
);

-- TABLA CATEGORIA OPERARIO

CREATE TABLE CategoriaOperario (
    id INT IDENTITY(1,1) PRIMARY KEY,
    Categoria_operario NVARCHAR(15) NOT NULL
   
);

-- TABLA OPERARIO

CREATE TABLE Operario (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id categoria_operario INT NOT NULL,
    dni NVARCHAR(15) NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    Apellido1 NVARCHAR(100) NOT NULL,
    Apellido2 NVARCHAR(100),
    Categoria_profesional NVARCHAR(200) NOT NULL

    CONSTRAINT UQ_Operario_DNI UNIQUE (dni)
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


-- TABLA OPERACION DE CARGA

CREATE TABLE OperacionDeCarga (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_operario INT NOT NULL,
    id_equipo INT NOT NULL,
    decripcion NVARCHAR(500) NOT NULL,
    refrigerante_manipulado
    recuperacion BIT NOT NULL
    
    CONSTRAINT FK_OperacionDeCarga_Operario FOREIGN KEY (id_operario)
        REFERENCES Operario(id)
        ON DELETE CASCADE,

    CONSTRAINT FK_OperacionDeCarga_Equipo FOREIGN KEY (id_equipo)
        REFERENCES Equipo(id)
        ON DELETE CASCADE    
);


