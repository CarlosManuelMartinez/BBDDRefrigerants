-- Carlos Manuel Martinez Pomares
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

-- Usar la nueva base de datos
USE Refrigerantes;
GO
----------------------------------------------CREACION DE LAS TABLAS------------------------------------------
-- Crear la tabla Refrigerantes
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



-- Crear la tabla Operario
CREATE TABLE Operario (
    id INT IDENTITY(1,1) PRIMARY KEY,
    dni NVARCHAR(15) NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    Apellido1 NVARCHAR(100) NOT NULL,
    Apellido2 NVARCHAR(100),
    Categoria_profesional NVARCHAR(200) NOT NULL

    CONSTRAINT UQ_Operario_DNI UNIQUE (dni)
);

-- Crear la tabla Equipo
CREATE TABLE Equipo (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_instalacion INT NOT NULL,
    id_refrigerante INT NOT NULL,  
    id_tipo_equipo INT NOT NULL,
    marca NVARCHAR(100) NOT NULL,
    modelo NVARCHAR(200) NOT NULL,
    carga_refrigerante DECIMAL(10,3) NOT NULL, -- Ajustar a (10,3) para manejar valores más grandes
    
    -- Claves externas
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


-- Crear la tabla Instalacion
CREATE TABLE Instalacion (
    id_instalacion INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    direccion NVARCHAR(200) NOT NULL,
    horario NVARCHAR(50) NOT NULL,
    
    CONSTRAINT FK_Instalacion_Cliente FOREIGN KEY (id_cliente)
        REFERENCES Cliente(id)
        ON DELETE CASCADE
);

















----------------------------------------------CREACION DE LOS INSERTS------------------------------------------

-- Inserts
-- GASES
INSERT INTO Refrigerantes (nombre, CO2eq, clase, grupo)
VALUES 
    ('R22', 1810.00, 'HCFC', 'A1'),
    ('R134a', 1430.00, 'HFC', 'A1'),
    ('R410A', 2088.00, 'HFC', 'A1'),
    ('R32', 675.00, 'HFC', 'A2L'),
    ('R404A', 3922.00, 'HFC', 'A1'),
    ('R407C', 1774.00, 'HFC', 'A1'),
    ('R1234yf', 4.00, 'HFO', 'A2L'),
    ('R290', 3.00, 'HC', 'A3'),
    ('R600a', 3.00, 'HC', 'A3'),
    ('R744', 1.00, 'CO2', 'A1'); -- R744 es CO2
	
-- CLIENTES
INSERT INTO Cliente (cif, nombre, direccion_facturacion) VALUES
    ('A12345678', 'Clínica Salud Vistahermosa', 'Calle Mayor 123, Madrid'),
    ('B23456789', 'Cine Yelmo', 'Avenida de la Libertad 45, Barcelona'),
    ('C34567890', 'Gimnasio AmaFit', 'Calle del Deporte 89, Valencia'),
    ('D45678901', 'Fábrica de Plásticos Borden', 'Polígono Industrial Norte 12, Benidorm'),
    ('E56789012', 'Clínica Dental Adeslas', 'Paseo de los Olmos 7, Bilbao'),
    ('F67890123', 'Cine Panoramis', 'Calle Cineastas 56, Benidorm'),
    ('G78901234', 'Gimnasio FitnessPark', 'Avenida de la Salud 23, Zaragoza'),
    ('H89012345', 'Fábrica Actiu', 'Polígono Sur 88, Castalla'),
    ('I90123456', 'Clínica de Fisioterapia Fisios', 'Calle del Río 34, San Vicente Del Raspeig'),
    ('J01234567', 'Cine La Esperanza', 'Plaza del Cine 2, Agost');
