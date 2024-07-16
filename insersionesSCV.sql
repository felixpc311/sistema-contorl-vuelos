INSERT INTO aeropuertos (codigo, nombre, ciudad, pais)
VALUES
('BOG', 'Aeropuerto El Dorado', 'Bogotá', 'Colombia'),
('MEX', 'Aeropuerto Internacional de la Ciudad de México', 'Ciudad de México', 'México'),
('MIA', 'Aeropuerto Internacional de Miami', 'Miami', 'Estados Unidos');

INSERT INTO aviones (modelo, numero_de_plazas)
VALUES
('Boeing 737', 150),
('Airbus A320', 180),
('Boeing 787', 240);

INSERT INTO lineas_aereas (nombre)
VALUES
('Avianca'),
('Aeroméxico'),
('American Airlines');

INSERT INTO dias_semana (dia_semana)
VALUES
('Lunes'),
('Martes'),
('Miércoles'),
('Jueves'),
('Viernes'),
('Sábado'),
('Domingo');

INSERT INTO programas_de_vuelo (numero_vuelo, linea_aerea_ID, aeropuerto_origen_ID, aeropuerto_destino_ID)
VALUES
('AV123', 1, 1, 2),
('AM456', 2, 2, 3),
('AA789', 3, 3, 1);

INSERT INTO programa_dias_semana (programa_de_vuelo_ID, dia_semana_ID)
VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 5);

INSERT INTO vuelos (programa_de_vuelo_ID, fecha, plazas_vacias, avion_ID)
VALUES
(1, '2024-07-20', 50, 1),
(2, '2024-07-21', 20, 2),
(3, '2024-07-22', 100, 3);

INSERT INTO escalas_tecnicas (programa_de_vuelo_ID, aeropuerto_escala_ID)
VALUES
(1, 3),
(2, 1),
(3, 2);
