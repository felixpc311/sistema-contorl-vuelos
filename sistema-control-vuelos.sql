CREATE TABLE aeropuertos (
    aeropuerto_ID INT NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(100) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    is_activo BOOLEAN NOT NULL DEFAULT 1,
    PRIMARY KEY (aeropuerto_ID)
);

CREATE TABLE lineas_aereas (
    linea_aerea_ID INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (linea_aerea_ID)
);

CREATE TABLE aviones(
    avion_ID INT NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(100) UNIQUE NOT NULL,
    numero_de_plazas INT NOT NULL,
    linea_aerea_ID INT NOT NULL,
    PRIMARY KEY (avion_ID),
    FOREIGN KEY (linea_aerea_ID) REFERENCES lineas_aereas(linea_aerea_ID)
);

CREATE TABLE vuelos (
    vuelo_ID INT NOT NULL AUTO_INCREMENT,
    numero_vuelo VARCHAR(100) NOT NULL UNIQUE,
    aeropuerto_origen INT NOT NULL,
    aeropuerto_destino INT NOT NULL,
    avion_ID INT NOT NULL,
    vuelo_dia_semana_ID INT NOT NULL,
    PRIMARY KEY (vuelo_ID),
    FOREIGN KEY (avion_ID) REFERENCES aviones(avion_ID)
);


CREATE TABLE vuelos_dias_semanales (
    vuelo_dia_semana_ID INT NOT NULL AUTO_INCREMENT,
    vuelo_ID INT NOT NULL,
    dia_semana VARCHAR(100) NOT NULL
    CHECK (dia_semana IN ('LUNES', 'MARTES', 'MIÉRCOLES', 'JUEVES', 'VIERNES', 'SABADO', 'DOMINGO')),
    PRIMARY KEY (vuelo_dia_semana_ID)
);


CREATE TABLE escalas_tecnicas (
    escala_tecnica_ID INT NOT NULL AUTO_INCREMENT,
    programa_de_vuelo_ID INT NOT NULL,
    aeropuerto_intermedio INT NOT NULL,
    PRIMARY KEY (escala_tecnica_ID)
);

CREATE TABLE programas_de_vuelos (
    programa_de_vuelo_ID INT NOT NULL AUTO_INCREMENT,
    vuelo_ID INT NOT NULL UNIQUE,
    escala_tecnica_ID INT,
    plazas_vacias INT NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (programa_de_vuelo_ID)
);

ALTER TABLE vuelos
ADD FOREIGN KEY (aeropuerto_origen) REFERENCES aeropuertos(aeropuerto_ID);
ALTER TABLE vuelos
ADD FOREIGN KEY (aeropuerto_destino) REFERENCES aeropuertos(aeropuerto_ID);
ALTER TABLE vuelos
ADD fOREIGN KEY (vuelo_dia_semana_ID) REFERENCES vuelos_dias_semanales(vuelo_dia_semana_ID);

ALTER TABLE vuelos_dias_semanales
ADD FOREIGN KEY (vuelo_ID) REFERENCES vuelos(vuelo_ID);
ALTER TABLE vuelos_dias_semanales
ADD UNIQUE (vuelo_ID, dia_semana);
    
ALTER TABLE escalas_tecnicas    
ADD FOREIGN KEY (programa_de_vuelo_ID) REFERENCES programas_de_vuelos(programa_de_vuelo_ID);
ALTER TABLE escalas_tecnicas
ADD FOREIGN KEY (aeropuerto_intermedio) REFERENCES aeropuertos(aeropuerto_ID);
ALTER TABLE escalas_tecnicas
ADD UNIQUE (programa_de_vuelo_ID, aeropuerto_intermedio);
    
ALTER TABLE programas_de_vuelos    
ADD FOREIGN KEY (vuelo_ID) REFERENCES vuelos(vuelo_ID);
ALTER TABLE programas_de_vuelos    
ADD FOREIGN KEY (escala_tecnica_ID) REFERENCES escalas_tecnicas(escala_tecnica_ID);

