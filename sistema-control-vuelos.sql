CREATE TABLE aeropuertos (
    aeropuerto_ID INT NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(100) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    is_activo BOOLEAN NOT NULL DEFAULT 1,
    programa_de_vuelo_ID INT NOT NULL,
    PRIMARY KEY (aeropuerto_ID), 
    FOREIGN KEY (programa_de_vuelo_ID) REFERENCES programas_de_vuelos(programa_de_vuelo_ID)
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
    PRIMARY KEY (avion_ID)
);

CREATE TABLE vuelos (
    vuelo_ID INT NOT NULL AUTO_INCREMENT,
    numero_vuelo VARCHAR(100) NOT NULL UNIQUE,
    avion_ID INT NOT NULL,
    vuelo_dia_semana_ID INT NOT NULL,
    PRIMARY KEY (vuelo_ID),
    FOREIGN KEY (avion_ID) REFERENCES aviones(avion_ID)
);


CREATE TABLE programas_dias_semanales (
    programa_dia_semana_ID INT NOT NULL AUTO_INCREMENT,
    programa_de_vuelo_ID INT NOT NULL,
    dia_semana VARCHAR(100) NOT NULL,
    PRIMARY KEY (programa_dia_semana_ID),
    FOREIGN KEY (programa_de_vuelo_ID) REFERENCES programas_de_vuelos(programa_de_vuelo_ID),
    FOREIGN KEY (dia_semana) REFERENCES lineas_aereas(linea_aerea_ID)
);


CREATE TABLE escalas_tecnicas (
    escala_tecnica_ID INT NOT NULL AUTO_INCREMENT,
    programa_de_vuelo_ID INT NOT NULL,
    aeropuerto_escala INT NOT NULL,
    PRIMARY KEY (escala_tecnica_ID),
    FOREIGN KEY (programa_de_vuelo_ID) REFERENCES programas_de_vuelos(programa_de_vuelo_ID),
    FOREIGN KEY (aeropuerto_escala) REFERENCES aeropuertos(aeropuerto_ID)
);

CREATE TABLE programas_de_vuelos (
    programa_de_vuelo_ID INT NOT NULL AUTO_INCREMENT,
    vuelo_ID INT NOT NULL UNIQUE,
    linea_aerea_ID INT NOT NULL,
    escala_tecnica_ID INT,
    plazas_vacias INT NOT NULL,
    fecha DATE NOT NULL,
    aeropuerto_origen INT NOT NULL,
    aeropuerto_destino INT NOT NULL,
    PRIMARY KEY (programa_de_vuelo_ID),
    FOREIGN KEY (vuelo_ID) REFERENCES vuelos(vuelo_ID),
    FOREIGN KEY (linea_aerea_ID) REFERENCES lineas_aereas(linea_aerea_ID),
    FOREIGN KEY (escala_tecnica_ID) REFERENCES escalas_tecnicas(escala_tecnica_ID),
    FOREIGN KEY (aeropuerto_origen) REFERENCES aeropuertos(aeropuerto_ID),
    FOREIGN KEY (aeropuerto_destino) REFERENCES aeropuertos(aeropuerto_ID)
);

CREATE TABLE dia_semana (
    dia_semana_ID INT NOT NULL AUTO_INCREMENT,
    dia_semana VARCHAR(100) NOT NULL,
    PRIMARY KEY (dia_semana_ID)
    
);