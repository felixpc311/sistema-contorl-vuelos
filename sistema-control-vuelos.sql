CREATE TABLE aeropuestos {
    aeropuerto_ID INT AUTOINCREMENT NOT NULL,
    codigo VARCHAR NOT NULL UNIQUE,
    nombre VARCHAR NOT NULL UNIQUE,
    ciudad VARCHAR NOT NULL,
    pais VARCHAR NOT NULL,
    PRIMARY KEY (aeropuerto_ID),
    FOREIGN KEY (programaciones_de_vuelos_ID) REFERENCES programaciones_de_vuelos(programaciones_de_vuelos_ID)
}

CREATE TABLE aviones{
    avion_ID INT AUTOINCREMENT NOT NULL,
    modelo VARCHAR UNIQUE NOT NULL,
    capacidad INT NOT NULL,
    PRIMARY KEY (avion_ID)
}

CREATE TABLE programaciones_de_vuelos {
    programaciones_de_vuelos_ID INT NOT NULL AUTOINCREMENT,
    numero_vuelo VARCHAR NOT NULL UNIQUE,
    linea_aerea VARCHAR NOT NULL,
    frecuencia_semanal INT NOT NULL,
    PRIMARY KEY (programaciones_de_vuelos_ID)
}

