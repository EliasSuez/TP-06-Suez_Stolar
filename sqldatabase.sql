
CREATE DATABASE PreguntadOrt;

USE PreguntadOrt;

CREATE TABLE Categorias (
    IdCategoria INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Foto VARCHAR(255)
);

CREATE TABLE Dificultades (
    IdDificultad INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Preguntas (
    IdPregunta INT PRIMARY KEY AUTO_INCREMENT,
    IdCategoria INT,
    IdDificultad INT,
    Enunciado VARCHAR(500) NOT NULL,
    Foto VARCHAR(255),
    FOREIGN KEY (IdCategoria) REFERENCES Categorias(IdCategoria),
    FOREIGN KEY (IdDificultad) REFERENCES Dificultades(IdDificultad)
);

CREATE TABLE Respuestas (
    IdRespuesta INT PRIMARY KEY AUTO_INCREMENT,
    IdPregunta INT,
    Opcion INT,
    Contenido VARCHAR(500) NOT NULL,
    Correcta BIT NOT NULL,
    Foto VARCHAR(255),
    FOREIGN KEY (IdPregunta) REFERENCES Preguntas(IdPregunta)
);

INSERT INTO Categorias (Nombre) VALUES ('Ciencia'), ('Historia'), ('Deportes'), ('Cine'), ('Geografía'), ('Arte'), ('Cultura General');

INSERT INTO Dificultades (Nombre) VALUES ('Fácil'), ('Media'), ('Difícil');

INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado) VALUES
(1, 1, '¿Cuál es el planeta más cercano al Sol?'),
(1, 1, '¿Cómo se llama la capa externa de la Tierra?'),
(1, 1, '¿Qué gas es esencial para la respiración humana?'),
(1, 1, '¿Cómo se llama el proceso por el cual las plantas producen su alimento?'),
(1, 1, '¿Qué órgano del cuerpo humano bombea sangre?');

INSERT INTO Respuestas (IdPregunta, Opcion, Contenido, Correcta) VALUES
(1, 1, 'Mercurio', 1),
(1, 2, 'Venus', 0),
(1, 3, 'Tierra', 0),
(1, 4, 'Marte', 0),
(2, 1, 'Corteza', 1),
(2, 2, 'Manto', 0),
(2, 3, 'Núcleo', 0),
(2, 4, 'Litosfera', 0),
(3, 1, 'Oxígeno', 1),
(3, 2, 'Nitrógeno', 0),
(3, 3, 'Dióxido de carbono', 0),
(3, 4, 'Helio', 0),
(4, 1, 'Fotosíntesis', 1),
(4, 2, 'Respiración', 0),
(4, 3, 'Digestión', 0),
(4, 4, 'Evaporación', 0),
(5, 1, 'Corazón', 1),
(5, 2, 'Cerebro', 0),
(5, 3, 'Pulmón', 0),
(5, 4, 'Hígado', 0);
