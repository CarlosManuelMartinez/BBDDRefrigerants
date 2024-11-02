-- Script bbdd gestor de refrigerantes inserts
-- Carlos Manuel Martinez Pomares 
-- DAM Semipresencial Proyecto final
-- BBDD REFRIGERANTES

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
	
--TIPO EQUIPO
INSERT INTO Tipo_equipo (tipo_equipo) VALUES
    ('PARTIDA DOMESTICO'),
    ('PARTIDA INDUSTRIAL'),
    ('COMPACTA DOMESTICO'),
    ('COMPACTA INDUSTRIAL');

--CATEGORIA PROFESIONAL
INSERT INTO Categoria_profesional (categoria_profesional) VALUES
    ('OFICIAL_PRIMERA'),
    ('OFICIAL_SEGUNDA'),
    ('OFICIAL_TERCERA');

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

--OPERARIOS
INSERT INTO Operario (dni, nombre, apellido1, apellido2, id_categoria_profesional) VALUES
    ('12345678A', 'Carlos', 'Martinez', 'Lopez', 1),
    ('23456789B', 'Ana', 'Gomez', 'Garcia', 2),
    ('34567890C', 'Luis', 'Hernandez', 'Sanchez', 3),
    ('45678901D', 'Maria', 'Diaz', NULL, 1),
    ('56789012E', 'Jose', 'Perez', 'Martinez', 2),
    ('67890123F', 'Laura', 'Moreno', 'Lopez', 3),
    ('78901234G', 'Javier', 'Santos', 'Jimenez', 1),
    ('89012345H', 'Raquel', 'Romero', 'Cruz', 2),
    ('90123456I', 'David', 'Navarro', NULL, 3),
    ('01234567J', 'Sandra', 'Ortega', 'Marin', 1);


