DROP DATABASE IF EXISTS cdf_biblioteca;

/* # CREATE DATABASE cdf_biblioteca; */
CREATE DATABASE IF NOT EXISTS cdf_biblioteca CHARACTER
SET
  utf8mb4 COLLATE utf8mb4_unicode_ci;

USE cdf_biblioteca;

DROP TABLE IF EXISTS Autor;

CREATE TABLE
  Autor (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    apellido VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL
  );

DROP TABLE IF EXISTS Editorial;

CREATE TABLE
  Editorial (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    razon_social VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) NOT NULL
  );

DROP TABLE IF EXISTS Libro;

CREATE TABLE
  Libro (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    isbn VARCHAR(100) NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    anio_escritura YEAR NOT NULL,
    codigo_autor INT NOT NULL,
    anio_edicion YEAR NOT NULL,
    editorial_id INT NOT NULL,
    FOREIGN KEY (codigo_autor) REFERENCES Autor (codigo),
    FOREIGN KEY (editorial_id) REFERENCES Editorial (codigo)
  );

DROP TABLE IF EXISTS Volumen;

CREATE TABLE
  Volumen (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    deteriorado BOOLEAN NOT NULL,
    libro_id INT NOT NULL,
    FOREIGN KEY (libro_id) REFERENCES Libro (codigo)
  );

DROP TABLE IF EXISTS Socio;

CREATE TABLE
  Socio (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    dni INT,
    apellido VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    localidad VARCHAR(100) NOT NULL
  );

DROP TABLE IF EXISTS Prestamo;

CREATE TABLE
  Prestamo (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    socio_id INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    fecha_tope DATE NOT NULL,
    FOREIGN KEY (socio_id) REFERENCES Socio (codigo)
  );

DROP TABLE IF EXISTS Prestamo_Volumen;

CREATE TABLE
  Prestamo_Volumen (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    prestamo_id INT NOT NULL,
    volumen_id INT NOT NULL,
    FOREIGN KEY (prestamo_id) REFERENCES Prestamo (codigo),
    FOREIGN KEY (volumen_id) REFERENCES Volumen (codigo)
  );

INSERT INTO
  `cdf_biblioteca`.`Autor` (`codigo`, `apellido`, `nombre`)
VALUES
  ('01', 'Messi', 'Lionel');

INSERT INTO
  `cdf_biblioteca`.`Socio` (
    `codigo`,
    `dni`,
    `apellido`,
    `nombre`,
    `direccion`,
    `localidad`
  )
VALUES
  (
    '01',
    '25896325',
    'Belgrano',
    'Manuel',
    'Las Rosas 25',
    'Godoy Cruz'
  );

INSERT INTO
  `cdf_biblioteca`.`Editorial` (`codigo`, `razon_social`, `telefono`)
VALUES
  ('01', 'Capelus', '123654');

INSERT INTO
  Libro (
    codigo,
    isbn,
    titulo,
    anio_escritura,
    codigo_autor,
    anio_edicion,
    editorial_id
  )
VALUES
  (
    1,
    '123456AS',
    'La sombra del viento',
    '2001',
    1,
    '2001',
    1
  );

INSERT INTO
  `cdf_biblioteca`.`Prestamo` (
    `codigo`,
    `socio_id`,
    `fecha_prestamo`,
    `fecha_devolucion`,
    `fecha_tope`
  )
VALUES
  (
    '1',
    '1',
    '2024-05-01',
    '2024-06-01',
    '2024-01-07'
  );

INSERT INTO
  `cdf_biblioteca`.`Volumen` (`codigo`, `deteriorado`, `libro_id`)
VALUES
  ('1', '0', '1');

INSERT INTO
  `cdf_biblioteca`.`Prestamo_Volumen` (`codigo`, `prestamo_id`, `volumen_id`)
VALUES
  ('1', '1', '1');

INSERT INTO
  `Socio` (
    `dni`,
    `apellido`,
    `nombre`,
    `direccion`,
    `localidad`
  )
VALUES
  (
    3000000,
    "PATRICIA",
    "JOHNSON",
    "28 MySQL Boulevard",
    "QLD"
  ),
  (
    2988800,
    "LINDA",
    "WILLIAMS",
    "23 Workhaven Lane",
    "Alberta"
  ),
  (
    2500000,
    "BARBARA",
    "JONES",
    "1411 Lillydale Drive",
    "QLD"
  ),
  (
    32980002,
    "LOIS",
    "BUTLER",
    "1688 Okara Way",
    "Nothwest Border Prov"
  ),
  (
    2313909,
    "ROBIN",
    "HAYES",
    "262 A Corua (La Corua)",
    "Parkway Dhaka"
  );

INSERT INTO
  `Autor` (`codigo`, `apellido`, `nombre`)
VALUES
  (NULL, 'Rowling ', 'J. K.');

INSERT INTO
  `cdf_biblioteca`.`Editorial` (`razon_social`, `telefono`)
VALUES
  ("Bloomsbury Publishing", 54911564874),
  ("Scholastic", 223483646),
  ("Pottermore Limited", 5694839582),
  ("Editorial Salamandra", 0112392343);

INSERT INTO
  Libro (
    isbn,
    titulo,
    anio_escritura,
    codigo_Autor,
    anio_edicion,
    editorial_id
  )
VALUES
  (
    9781907545009,
    "Harry Potter y la piedra filosofal",
    '1997',
    2,
    '1997',
    5
  ),
  (
    9789878000114,
    "Harry Potter Y La Camara Secreta",
    '2020',
    2,
    '2020',
    5
  );

INSERT INTO
  `cdf_biblioteca`.`Prestamo` (
    `socio_id`,
    `fecha_prestamo`,
    `fecha_devolucion`,
    `fecha_tope`
  )
VALUES
  (1, '2020-1-1', '2020-1-7', '2020-1-7'),
  (1, '2020-1-7', '2020-1-15', '2020-1-14'),
  (2, '2020-3-4', '2020-3-8', '2020-3-11');

INSERT INTO
  `cdf_biblioteca`.`Prestamo` (
    `socio_id`,
    `fecha_prestamo`,
    `fecha_devolucion`,
    `fecha_tope`
  )
VALUES
  (1, '2020-1-1', '2020-1-7', '2020-1-7'),
  (1, '2020-1-7', '2020-1-15', '2020-1-14'),
  (2, '2020-3-4', '2020-3-8', '2020-3-11');