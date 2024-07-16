-- Tabla de Aeropuertos
CREATE TABLE aeropuertos (
    aeropuerto_ID INT NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(10) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    PRIMARY KEY (aeropuerto_ID)
);

-- Tabla de Modelos de Aviones
CREATE TABLE aviones (
    avion_ID INT NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(100) NOT NULL UNIQUE,
    numero_de_plazas INT NOT NULL,
    PRIMARY KEY (avion_ID)
);

-- Tabla de Líneas Aéreas
CREATE TABLE lineas_aereas (
    linea_aerea_ID INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (linea_aerea_ID)
);

-- Tabla de Programas de Vuelo
CREATE TABLE programas_de_vuelo (
    programa_de_vuelo_ID INT NOT NULL AUTO_INCREMENT,
    numero_vuelo VARCHAR(100) NOT NULL UNIQUE,
    linea_aerea_ID INT NOT NULL,
    aeropuerto_origen_ID INT NOT NULL,
    aeropuerto_destino_ID INT NOT NULL,
    PRIMARY KEY (programa_de_vuelo_ID),
    FOREIGN KEY (linea_aerea_ID) REFERENCES lineas_aereas(linea_aerea_ID),
    FOREIGN KEY (aeropuerto_origen_ID) REFERENCES aeropuertos(aeropuerto_ID),
    FOREIGN KEY (aeropuerto_destino_ID) REFERENCES aeropuertos(aeropuerto_ID)
);

-- Tabla de Días de la Semana
CREATE TABLE dias_semana (
    dia_semana_ID INT NOT NULL AUTO_INCREMENT,
    dia_semana VARCHAR(20) NOT NULL,
    PRIMARY KEY (dia_semana_ID)
);

-- Tabla de Programa y Días de la Semana
CREATE TABLE programa_dias_semana (
    programa_dia_semana_ID INT NOT NULL AUTO_INCREMENT,
    programa_de_vuelo_ID INT NOT NULL,
    dia_semana_ID INT NOT NULL,
    PRIMARY KEY (programa_dia_semana_ID),
    FOREIGN KEY (programa_de_vuelo_ID) REFERENCES programas_de_vuelo(programa_de_vuelo_ID),
    FOREIGN KEY (dia_semana_ID) REFERENCES dias_semana(dia_semana_ID)
);

-- Tabla de Vuelos
CREATE TABLE vuelos (
    vuelo_ID INT NOT NULL AUTO_INCREMENT,
    programa_de_vuelo_ID INT NOT NULL,
    fecha DATE NOT NULL,
    plazas_vacias INT NOT NULL,
    avion_ID INT NOT NULL,
    PRIMARY KEY (vuelo_ID),
    FOREIGN KEY (programa_de_vuelo_ID) REFERENCES programas_de_vuelo(programa_de_vuelo_ID),
    FOREIGN KEY (avion_ID) REFERENCES aviones(avion_ID)
);

-- Tabla de Escalas Técnicas
CREATE TABLE escalas_tecnicas (
    escala_tecnica_ID INT NOT NULL AUTO_INCREMENT,
    programa_de_vuelo_ID INT NOT NULL,
    aeropuerto_escala_ID INT NOT NULL,
    PRIMARY KEY (escala_tecnica_ID),
    FOREIGN KEY (programa_de_vuelo_ID) REFERENCES programas_de_vuelo(programa_de_vuelo_ID),
    FOREIGN KEY (aeropuerto_escala_ID) REFERENCES aeropuertos(aeropuerto_ID)
);
