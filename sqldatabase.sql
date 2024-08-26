CREATE DATABASE PreguntadOrt;


USE PreguntadOrt;

-- CREACIÓN DE TABLAS

CREATE TABLE Categorias (
    IdCategoria INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    Nombre VARCHAR(255) NOT NULL,
    Foto VARCHAR(255)
);

CREATE TABLE Dificultades (
    IdDificultad INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Preguntas (
    IdPregunta INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    IdCategoria INT NOT NULL FOREIGN KEY REFERENCES Categorias(IdCategoria),
    IdDificultad INT NOT NULL FOREIGN KEY REFERENCES Dificultades(IdDificultad),
    Enunciado VARCHAR(500) NOT NULL,
    Foto VARCHAR(255),
);

CREATE TABLE Respuestas (
    IdRespuesta INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    IdPregunta INT NOT NULL FOREIGN KEY REFERENCES Preguntas(IdPregunta),
    Opcion INT NOT NULL,
    Contenido VARCHAR(500) NOT NULL,
    Correcta BIT NOT NULL,
    Foto VARCHAR(255),
);

-- INSERTS

-- Insertar categorías
INSERT INTO Categorias (Nombre) VALUES 
('Ciencia'), 
('Historia'), 
('Deportes'), 
('Cine'), 
('Geografía'), 
('Arte'), 
('Cultura General');

-- Insertar dificultades
INSERT INTO Dificultades (Nombre) VALUES 
('Fácil'), 
('Media'), 
('Difícil');

-- Insertar preguntas y respuestas

INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado) VALUES
-- Ciencia
(1, 1, '¿Cuál es el elemento químico más abundante en la atmósfera terrestre?'),
(1, 1, '¿Qué órgano del cuerpo humano produce la insulina?'),
(1, 2, '¿Cuál es el planeta más cercano al Sol?'),
(1, 1, '¿Qué gas es esencial para la respiración?'),
(1, 1, '¿Qué tipo de animal es un tiburón?'),

(1, 2, '¿Cuál es el órgano principal del sistema circulatorio humano?'),
(1, 2, '¿Qué tipo de energía es producida por el sol?'),
(1, 2, '¿Qué partícula subatómica tiene carga negativa?'),
(1, 2, '¿Qué célula del sistema nervioso transmite impulsos eléctricos?'),
(1, 2, '¿Qué tipo de molécula almacena información genética?'),

(1, 3, '¿Qué es la fotosíntesis?'),
(1, 3, '¿Cómo se llama el proceso por el cual las plantas producen oxígeno?'),
(1, 3, '¿Cuál es la función principal de la clorofila en las plantas?'),
(1, 3, '¿Qué tipo de energía se transforma en energía química durante la fotosíntesis?'),
(1, 3, '¿Qué gas es un producto de la fotosíntesis?'),
-- Historia
(2, 1, '¿En qué año comenzó la Segunda Guerra Mundial?'),
(2, 1, '¿Quién fue el primer presidente de los Estados Unidos?'),
(2, 1, '¿En qué país tuvo lugar la Revolución Francesa?'),
(2, 1, '¿Cuál fue el primer hombre en pisar la Luna?'),
(2, 1, '¿Qué imperio construyó el Coliseo?'),

(2, 2, '¿Quién fue el líder de la Revolución Rusa de 1917?'),
(2, 2, '¿Cuál fue la causa principal de la Primera Guerra Mundial?'),
(2, 2, '¿Qué tratado puso fin a la Primera Guerra Mundial?'),
(2, 2, '¿Quién fue el emperador romano durante la mayor parte de la Pax Romana?'),
(2, 2, '¿Cuál fue la primera civilización que utilizó la escritura cuneiforme?'),

(2, 3, '¿Qué evento marcó el comienzo de la Edad Media?'),
(2, 3, '¿Quién fue el emperador de Francia durante las Guerras Napoleónicas?'),
(2, 3, '¿En qué año se descubrió América?'),
(2, 3, '¿Qué evento histórico se conoce como la caída del Imperio Romano de Occidente?'),
(2, 3, '¿Cuál fue el conflicto principal en la Guerra de Secesión Americana?'),
-- Deportes
(3, 1, '¿En qué deporte se utiliza una pelota y un bate?'),
(3, 1, '¿Cuál es el país con más copas mundiales de fútbol ganadas?'),
(3, 1, '¿Quién es conocido como "El Rey del Fútbol"?'),
(3, 1, '¿En qué deporte se utiliza una raqueta y una pelota pequeña?'),
(3, 1, '¿Qué deporte es conocido como "el deporte rey"?'),

(3, 2, '¿Quién tiene el récord de más goles en una temporada de la Liga de Campeones de la UEFA?'),
(3, 2, '¿En qué año se celebró el primer Juego Olímpico moderno?'),
(3, 2, '¿Qué equipo ganó la última Copa del Mundo de la FIFA?'),
(3, 2, '¿Cuál es el nombre del estadio donde juega el FC Barcelona?'),
(3, 2, '¿Cuál es el deporte nacional de Japón?'),

(3, 3, '¿Quién es el atleta con más medallas olímpicas de todos los tiempos?'),
(3, 3, '¿En qué deporte se realiza la prueba de decatlón?'),
(3, 3, '¿Qué país ha ganado más medallas en los Juegos Olímpicos de invierno?'),
(3, 3, '¿Cuál es el récord mundial de los 100 metros lisos?'),
(3, 3, '¿Qué deportista es conocido como "El Hombre Araña" del baloncesto?'),
-- Cine
(4, 1, '¿Quién protagonizó la película "Titanic" de 1997?'),
(4, 1, '¿Cuál es el nombre del mago protagonista de la saga de libros escrita por J.K. Rowling?'),
(4, 1, '¿Qué película animada cuenta la historia de un león llamado Simba?'),
(4, 1, '¿En qué película aparece el personaje "Darth Vader"?'),
(4, 1, '¿Quién es el director de la película "Jurassic Park"?'),

(4, 2, '¿Cuál es el nombre del personaje principal en "Forrest Gump"?'),
(4, 2, '¿Qué actor interpretó a Jack Sparrow en la saga de "Piratas del Caribe"?'),
(4, 2, '¿En qué año se estrenó la primera película de "Star Wars"?'),
(4, 2, '¿Qué película ganó el Oscar a la Mejor Película en 2023?'),
(4, 2, '¿Cuál es la película de mayor recaudación de todos los tiempos?'),

(4, 3, '¿Quién ganó el premio al Mejor Director en los Oscar de 2024?'),
(4, 3, '¿Qué película es considerada como el mejor filme de ciencia ficción de la década?'),
(4, 3, '¿Qué director es conocido por sus películas en blanco y negro?'),
(4, 3, '¿Cuál es el nombre del protagonista en la película "El Padrino"?'),
(4, 3, '¿Qué película de Alfred Hitchcock es famosa por su escena de la ducha?'),
-- Geografía
(5, 1, '¿Cuál es la capital de Francia?'),
(5, 1, '¿En qué continente se encuentra el desierto del Sahara?'),
(5, 1, '¿Cuál es el río más largo del mundo?'),
(5, 1, '¿Cuál es la capital de Japón?'),
(5, 1, '¿Qué océano es el más grande del mundo?'),

(5, 2, '¿Qué país tiene la mayor superficie terrestre?'),
(5, 2, '¿Cuál es la ciudad más poblada del mundo?'),
(5, 2, '¿Qué país tiene más islas?'),
(5, 2, '¿Cuál es el punto más alto de la Tierra?'),
(5, 2, '¿En qué país se encuentra el monte Everest?'),

(5, 3, '¿Cuál es el país más grande de África por superficie?'),
(5, 3, '¿Qué país tiene la mayor cantidad de fronteras internacionales?'),
(5, 3, '¿Cuál es el río más largo de América del Sur?'),
(5, 3, '¿En qué continente se encuentra el lago Victoria?'),
(5, 3, '¿Qué ciudad es conocida como la "Venecia del Norte"?'),
-- Arte
(6, 1, '¿Quién pintó la Mona Lisa?'),
(6, 1, '¿Qué famoso pintor cortó su propia oreja?'),
(6, 1, '¿En qué museo se encuentra "La noche estrellada"?'),
(6, 1, '¿Quién pintó el mural "Guernica"?'),
(6, 1, '¿Qué artista es conocido por sus obras en cubismo?'),

(6, 2, '¿Cuál es el estilo artístico de "Las Meninas" de Velázquez?'),
(6, 2, '¿Qué pintor es famoso por sus obras de arte surrealistas?'),
(6, 2, '¿Qué artista es conocido por su serie de "Campbell’s Soup Cans"?'),
(6, 2, '¿Cuál es el nombre del pintor que creó la serie de obras "El Jardín de las Delicias"?'),
(6, 2, '¿En qué siglo vivió Rembrandt?'),

(6, 3, '¿Qué movimiento artístico se asocia con el pintor Jackson Pollock?'),
(6, 3, '¿Cuál es el nombre del famoso mural de Diego Rivera en el Palacio Nacional de Ciudad de México?'),
(6, 3, '¿Qué artista es conocido por sus esculturas en mármol, como "David"?'),
(6, 3, '¿Qué técnica artística se utiliza en la creación de mosaicos?'),
(6, 3, '¿Cuál es el nombre del estilo arquitectónico que caracterizó las iglesias góticas?'),
-- Cultura General
(7, 1, '¿Cuál es la capital de España?'),
(7, 1, '¿Qué idioma se habla en Brasil?'),
(7, 1, '¿Quién escribió "Cien años de soledad"?'),
(7, 1, '¿Qué planeta es conocido como el "planeta rojo"?'),
(7, 1, '¿Qué animal es conocido como el rey de la selva?'),

(7, 2, '¿Cuál es el símbolo químico del oro?'),
(7, 2, '¿En qué país se encuentra la Torre Eiffel?'),
(7, 2, '¿Quién pintó "La última cena"?'),
(7, 2, '¿Qué ciudad es conocida como la "ciudad eterna"?'),
(7, 2, '¿Qué océano se encuentra al oeste de América del Norte?'),

(7, 3, '¿Qué año se fundó la Organización de las Naciones Unidas?'),
(7, 3, '¿Cuál es el libro más vendido de todos los tiempos?'),
(7, 3, '¿Quién es el autor de la teoría de la relatividad?'),
(7, 3, '¿Qué país es conocido por su sistema de monarquía constitucional?'),
(7, 3, '¿Cuál es la capital de Canadá?');

-- SP

GO;
CREATE PROCEDURE SP_ObtenerPreguntas
	@idDificultad INT = -1,
	@idCategoria INT = -1
AS
BEGIN
	IF (@idDificultad = -1 AND @idCategoria = -1)
		SELECT * FROM Preguntas;
	ELSE IF (@idDificultad = -1)
		SELECT * FROM Preguntas WHERE IdCategoria = @idCategoria;
	ELSE IF (@idCategoria = -1)
		SELECT * FROM Preguntas WHERE IdDificultad = @idDificultad;
	ELSE
		SELECT * FROM Preguntas WHERE IdDificultad = @idDificultad AND IdCategoria = @idCategoria;
END;

SELECT * FROM Respuestas