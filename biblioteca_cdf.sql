CREATE TABLE
	autor (
		codigo INT PRIMARY KEY AUTO_INCREMENT,
		apellido VARCHAR(100) NOT NULL,
		nombre VARCHAR(100) NOT NULL
	);

CREATE TABLE
	Editorial (
		codigo INT PRIMARY KEY AUTO_INCREMENT,
		razon_social VARCHAR(100) NOT NULL,
		nombre VARCHAR(200) NOT NULL,
		telefono VARCHAR(100) NOT NULL
	);

CREATE TABLE
	Libro (
		codigo INT PRIMARY KEY AUTO_INCREMENT,
		titulo VARCHAR(200) NOT NULL,
		anio_escritura DATE NOT NULL,
		codigo_autor INT NOT NULL,
		anio_edicion DATE NOT NULL,
		editorial_id INT NOT NULL,
		FOREIGN KEY (codigo_autor) REFERENCES autor (codigo),
		FOREIGN KEY (editorial_id) REFERENCES Editorial (codigo)
	);

CREATE TABLE
	Volumen (
		codigo INT PRIMARY KEY AUTO_INCREMENT,
		deteriorado BOOLEAN NOT NULL,
		libro_id INT NOT NULL,
		FOREIGN KEY (libro_id) REFERENCES Libro (codigo)
	);

CREATE TABLE
	Socio (
		codigo INT PRIMARY KEY AUTO_INCREMENT,
		dni INT,
		apellido VARCHAR(100) NOT NULL,
		nombre VARCHAR(100) NOT NULL,
		direccion VARCHAR(200) NOT NULL,
		localidad VARCHAR(100) NOT NULL
	);

CREATE TABLE
	Prestamo (
		codigo INT PRIMARY KEY AUTO_INCREMENT,
		socio_id INT NOT NULL,
		fecha_prestamo DATE NOT NULL,
		fecha_devolucion DATE NOT NULL,
		fecha_tope DATE NOT NULL,
		FOREIGN KEY (socio_id) REFERENCES Socio (codigo)
	);

CREATE TABLE
	Prestamo_Volumen (
		codigo INT PRIMARY KEY AUTO_INCREMENT,
		prestamo_id INT NOT NULL,
		volumen_id INT NOT NULL,
		FOREIGN KEY (prestamo_id) REFERENCES Prestamo (codigo),
		FOREIGN KEY (volumen_id) REFERENCES Volumen (codigo)
	);

INSERT INTO
	`cdf_biblioteca`.`autor` (`codigo`, `apellido`, `nombre`)
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
	`cdf_biblioteca`.`Editorial` (`codigo`, `razon_social`, `nombre`, `telefono`)
VALUES
	('01', '258741', 'Capelus', '123654');

INSERT INTO
	Libro (
		codigo,
		titulo,
		anio_escritura,
		codigo_autor,
		anio_edicion,
		editorial_id
	)
VALUES
	(
		1,
		'La sombra del viento',
		'2001-01-01',
		1,
		'2001-03-01',
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