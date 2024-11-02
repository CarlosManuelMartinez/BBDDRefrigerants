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
