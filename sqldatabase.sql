CREATE DATABASE PreguntadOrt;


USE PreguntadOrt;

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

-- Respuestas para Ciencia
INSERT INTO Respuestas (IdPregunta, Opcion, Contenido, Correcta) VALUES
(1, 1, 'Oxígeno', 0),
(1, 2, 'Nitrógeno', 1), -- Correcta
(1, 3, 'Carbono', 0),
(1, 4, 'Hidrógeno', 0),
(2, 1, 'Hígado', 0),
(2, 2, 'Páncreas', 1), -- Correcta
(2, 3, 'Riñones', 0),
(2, 4, 'Corazón', 0),
(3, 1, 'Venus', 0),
(3, 2, 'Mercurio', 1), -- Correcta
(3, 3, 'Marte', 0),
(3, 4, 'Júpiter', 0),
(4, 1, 'Oxígeno', 1), -- Correcta
(4, 2, 'Nitrógeno', 0),
(4, 3, 'Dióxido de carbono', 0),
(4, 4, 'Hidrógeno', 0),
(5, 1, 'Mamífero', 0),
(5, 2, 'Ave', 0),
(5, 3, 'Pez', 1), -- Correcta
(5, 4, 'Reptil', 0),
(6, 1, 'Pulmones', 0),
(6, 2, 'Corazón', 1), -- Correcta
(6, 3, 'Hígado', 0),
(6, 4, 'Cerebro', 0),
(7, 1, 'Energía Térmica', 0),
(7, 2, 'Energía Nuclear', 0),
(7, 3, 'Energía Química', 0),
(7, 4, 'Energía Solar', 1), -- Correcta
(8, 1, 'Protón', 0),
(8, 2, 'Neutrón', 0),
(8, 3, 'Electrón', 1), -- Correcta
(8, 4, 'Quark', 0),
(9, 1, 'Células gliales', 0),
(9, 2, 'Neuronas', 1), -- Correcta
(9, 3, 'Eritrocitos', 0),
(9, 4, 'Linfocitos', 0),
(10, 1, 'Proteínas', 0),
(10, 2, 'Carbohidratos', 0),
(10, 3, 'Ácidos nucleicos', 1), -- Correcta
(10, 4, 'Lípidos', 0),
(11, 1, 'La respiración de los animales', 0),
(11, 2, 'La producción de energía en células', 0),
(11, 3, 'El proceso por el cual las plantas producen su alimento', 1), -- Correcta
(11, 4, 'La descomposición de materia orgánica', 0),
(12, 1, 'Fermentación', 0),
(12, 2, 'Fotosíntesis', 1), -- Correcta
(12, 3, 'Oxidación', 0),
(12, 4, 'Respiración celular', 0),
(13, 1, 'Captura luz solar', 1), -- Correcta
(13, 2, 'Absorbe nutrientes del suelo', 0),
(13, 3, 'Transforma CO2 en O2', 0),
(13, 4, 'Almacena agua', 0),
(14, 1, 'Energía química', 0),
(14, 2, 'Energía cinética', 0),
(14, 3, 'Energía lumínica', 1), -- Correcta
(14, 4, 'Energía térmica', 0),
(15, 1, 'Nitrógeno', 0),
(15, 2, 'Dióxido de carbono', 0),
(15, 3, 'Oxígeno', 1), -- Correcta
(15, 4, 'Metano', 0),
-- Historia
(16, 1, '1937', 0),
(16, 2, '1939', 1), -- Correcta
(16, 3, '1941', 0),
(16, 4, '1945', 0),
(17, 1, 'Thomas Jefferson', 0),
(17, 2, 'John Adams', 0),
(17, 3, 'George Washington', 1), -- Correcta
(17, 4, 'James Madison', 0),
(18, 1, 'Alemania', 0),
(18, 2, 'Italia', 0),
(18, 3, 'Francia', 1), -- Correcta
(18, 4, 'España', 0),
(19, 1, 'Buzz Aldrin', 0),
(19, 2, 'Yuri Gagarin', 0),
(19, 3, 'Neil Armstrong', 1), -- Correcta
(19, 4, 'Michael Collins', 0),
(20, 1, 'Imperio Griego', 0),
(20, 2, 'Imperio Romano', 1), -- Correcta
(20, 3, 'Imperio Egipcio', 0),
(20, 4, 'Imperio Bizantino', 0),
(21, 1, 'Vladimir Lenin', 1), -- Correcta
(21, 2, 'Joseph Stalin', 0),
(21, 3, 'Leon Trotsky', 0),
(21, 4, 'Mikhail Gorbachev', 0),
(22, 1, 'El asesinato de Franz Ferdinand', 1), -- Correcta
(22, 2, 'El Tratado de Versalles', 0),
(22, 3, 'La Guerra Civil Española', 0),
(22, 4, 'El Pacto de No Agresión', 0),
(23, 1, 'Tratado de París', 0),
(23, 2, 'Tratado de Versalles', 1), -- Correcta
(23, 3, 'Tratado de Tordesillas', 0),
(23, 4, 'Tratado de Utrecht', 0),
(24, 1, 'Julio César', 0),
(24, 2, 'Nerón', 0),
(24, 3, 'Marco Aurelio', 1), -- Correcta
(24, 4, 'Trajano', 0),
(25, 1, 'Imperio Egipcio', 0),
(25, 2, 'Imperio Mesopotámico', 0),
(25, 3, 'Imperio Sumerio', 1), -- Correcta
(25, 4, 'Imperio Babilónico', 0),
(26, 1, 'El Renacimiento', 0),
(26, 2, 'La caída del Imperio Romano', 1), -- Correcta
(26, 3, 'La Revolución Francesa', 0),
(26, 4, 'La Guerra de los Cien Años', 0),
(27, 1, 'Napoleón Bonaparte', 1), -- Correcta
(27, 2, 'Luis XIV', 0),
(27, 3, 'Carlos V', 0),
(27, 4, 'Enrique VIII', 0),
(28, 1, '1492', 1), -- Correcta
(28, 2, '1500', 0),
(28, 3, '1519', 0),
(28, 4, '1532', 0),
(29, 1, 'La Revolución Industrial', 0),
(29, 2, 'La caída del Imperio Romano de Occidente', 1), -- Correcta
(29, 3, 'La Primera Guerra Mundial', 0),
(29, 4, 'El Renacimiento', 0),
(30, 1, 'La esclavitud', 1), -- Correcta
(30, 2, 'Los derechos de los inmigrantes', 0),
(30, 3, 'La expansión hacia el oeste', 0),
(30, 4, 'El derecho al voto', 0),
-- Deportes
(31, 1, 'Tenis', 0),
(31, 2, 'Fútbol', 0),
(31, 3, 'Béisbol', 1), -- Correcta
(31, 4, 'Rugby', 0),
(32, 1, 'Brasil', 1), -- Correcta
(32, 2, 'Alemania', 0),
(32, 3, 'Argentina', 0),
(32, 4, 'Italia', 0),
(33, 1, 'Pelé', 1), -- Correcta
(33, 2, 'Maradona', 0),
(33, 3, 'Messi', 0),
(33, 4, 'Cristiano Ronaldo', 0),
(34, 1, 'Squash', 0),
(34, 2, 'Tenis', 1), -- Correcta
(34, 3, 'Bádminton', 0),
(34, 4, 'Ping pong', 0),
(35, 1, 'Tenis', 0),
(35, 2, 'Baloncesto', 0),
(35, 3, 'Fútbol', 1), -- Correcta
(35, 4, 'Ciclismo', 0),
(36, 1, 'Lionel Messi', 1), -- Correcta
(36, 2, 'Cristiano Ronaldo', 0),
(36, 3, 'Robert Lewandowski', 0),
(36, 4, 'Erling Haaland', 0),
(37, 1, '1896', 1), -- Correcta
(37, 2, '1900', 0),
(37, 3, '1904', 0),
(37, 4, '1920', 0),
(38, 1, 'Argentina', 1), -- Correcta
(38, 2, 'Brasil', 0),
(38, 3, 'Francia', 0),
(38, 4, 'Alemania', 0),
(39, 1, 'Wembley', 0),
(39, 2, 'Santiago Bernabéu', 0),
(39, 3, 'Camp Nou', 1), -- Correcta
(39, 4, 'Anfield', 0),
(40, 1, 'Sumo', 1), -- Correcta
(40, 2, 'Judo', 0),
(40, 3, 'Karate', 0),
(40, 4, 'Kendo', 0),
(41, 1, 'Michael Phelps', 1), -- Correcta
(41, 2, 'Usain Bolt', 0),
(41, 3, 'Carl Lewis', 0),
(41, 4, 'Larisa Latynina', 0),
(42, 1, 'Atletismo', 0),
(42, 2, 'Decatlón', 1), -- Correcta
(42, 3, 'Natación', 0),
(42, 4, 'Gimnasia', 0),
(43, 1, 'Rusia', 1), -- Correcta
(43, 2, 'Estados Unidos', 0),
(43, 3, 'Alemania', 0),
(43, 4, 'Noruega', 0),
(44, 1, '9.58 segundos', 1), -- Correcta
(44, 2, '9.69 segundos', 0),
(44, 3, '9.72 segundos', 0),
(44, 4, '9.74 segundos', 0),
(45, 1, 'Kareem Abdul-Jabbar', 0),
(45, 2, 'Michael Jordan', 0),
(45, 3, 'Dennis Rodman', 0),
(45, 4, 'Vince Carter', 1), -- Correcta
-- Cine
(46, 1, 'Leonardo DiCaprio', 1), -- Correcta
(46, 2, 'Tom Hanks', 0),
(46, 3, 'Brad Pitt', 0),
(46, 4, 'Johnny Depp', 0),
(47, 1, 'Harry Potter', 1), -- Correcta
(47, 2, 'Frodo Baggins', 0),
(47, 3, 'Bilbo Baggins', 0),
(47, 4, 'Gandalf', 0),
(48, 1, 'El Rey León', 1), -- Correcta
(48, 2, 'La Sirenita', 0),
(48, 3, 'Pocahontas', 0),
(48, 4, 'Mulan', 0),
(49, 1, 'El Señor de los Anillos', 0),
(49, 2, 'Star Wars', 1), -- Correcta
(49, 3, 'Matrix', 0),
(49, 4, 'Indiana Jones', 0),
(50, 1, 'Steven Spielberg', 1), -- Correcta
(50, 2, 'George Lucas', 0),
(50, 3, 'James Cameron', 0),
(50, 4, 'Ridley Scott', 0),
(51, 1, 'Forrest Gump', 1), -- Correcta
(51, 2, 'Bubba', 0),
(51, 3, 'Teniente Dan', 0),
(51, 4, 'Jenny', 0),
(52, 1, 'Johnny Depp', 1), -- Correcta
(52, 2, 'Orlando Bloom', 0),
(52, 3, 'Geoffrey Rush', 0),
(52, 4, 'Keira Knightley', 0),
(53, 1, '1977', 1), -- Correcta
(53, 2, '1980', 0),
(53, 3, '1983', 0),
(53, 4, '1986', 0),
(54, 1, 'Everything Everywhere All at Once', 1), -- Correcta
(54, 2, 'The Fabelmans', 0),
(54, 3, 'Avatar: The Way of Water', 0),
(54, 4, 'Top Gun: Maverick', 0),
(55, 1, 'Avatar', 1), -- Correcta
(55, 2, 'Titanic', 0),
(55, 3, 'Avengers: Endgame', 0),
(55, 4, 'Star Wars: The Force Awakens', 0),
(56, 1, 'Martin Scorsese', 1), -- Correcta
(56, 2, 'Alfonso Cuarón', 0),
(56, 3, 'Greta Gerwig', 0),
(56, 4, 'Quentin Tarantino', 0),
(57, 1, 'Blade Runner', 1), -- Correcta
(57, 2, 'Inception', 0),
(57, 3, 'Interstellar', 0),
(57, 4, 'The Matrix', 0),
(58, 1, 'Alfred Hitchcock', 1), -- Correcta
(58, 2, 'Stanley Kubrick', 0),
(58, 3, 'Francis Ford Coppola', 0),
(58, 4, 'Orson Welles', 0),
(59, 1, 'Michael Corleone', 1), -- Correcta
(59, 2, 'Vito Corleone', 0),
(59, 3, 'Sonny Corleone', 0),
(59, 4, 'Fredo Corleone', 0),
(60, 1, 'Psicosis', 1), -- Correcta
(60, 2, 'Los Pájaros', 0),
(60, 3, 'Vértigo', 0),
(60, 4, 'La Ventana Indiscreta', 0),
-- Geografía
(61, 1, 'París', 1), -- Correcta
(61, 2, 'Londres', 0),
(61, 3, 'Madrid', 0),
(61, 4, 'Roma', 0),
(62, 1, 'África', 1), -- Correcta
(62, 2, 'Asia', 0),
(62, 3, 'América del Sur', 0),
(62, 4, 'Australia', 0),
(63, 1, 'Río Amazonas', 0),
(63, 2, 'Río Nilo', 1), -- Correcta
(63, 3, 'Río Yangtsé', 0),
(63, 4, 'Río Misisipi', 0),
(64, 1, 'Pekín', 0),
(64, 2, 'Tokio', 1), -- Correcta
(64, 3, 'Seúl', 0),
(64, 4, 'Kioto', 0),
(65, 1, 'Océano Atlántico', 0),
(65, 2, 'Océano Índico', 0),
(65, 3, 'Océano Pacífico', 1), -- Correcta
(65, 4, 'Océano Ártico', 0),
(66, 1, 'Rusia', 1), -- Correcta
(66, 2, 'Canadá', 0),
(66, 3, 'China', 0),
(66, 4, 'Estados Unidos', 0),
(67, 1, 'Tokio', 1), -- Correcta
(67, 2, 'Nueva York', 0),
(67, 3, 'Shanghai', 0),
(67, 4, 'Mumbai', 0),
(68, 1, 'Suecia', 1), -- Correcta
(68, 2, 'Noruega', 0),
(68, 3, 'Filipinas', 0),
(68, 4, 'Indonesia', 0),
(69, 1, 'Monte Everest', 1), -- Correcta
(69, 2, 'K2', 0),
(69, 3, 'Mont Blanc', 0),
(69, 4, 'Monte Kilimanjaro', 0),
(70, 1, 'Nepal', 1), -- Correcta
(70, 2, 'India', 0),
(70, 3, 'China', 0),
(70, 4, 'Pakistán', 0),
(71, 1, 'Argelia', 1), -- Correcta
(71, 2, 'Sudán', 0),
(71, 3, 'Libia', 0),
(71, 4, 'Chad', 0),
(72, 1, 'China', 1), -- Correcta
(72, 2, 'Rusia', 0),
(72, 3, 'Brasil', 0),
(72, 4, 'India', 0),
(73, 1, 'Río Amazonas', 1), -- Correcta
(73, 2, 'Río Orinoco', 0),
(73, 3, 'Río Paraná', 0),
(73, 4, 'Río Magdalena', 0),
(74, 1, 'África', 1), -- Correcta
(74, 2, 'Asia', 0),
(74, 3, 'América del Sur', 0),
(74, 4, 'Europa', 0),
(75, 1, 'San Petersburgo', 1), -- Correcta
(75, 2, 'Estocolmo', 0),
(75, 3, 'Copenhague', 0),
(75, 4, 'Helsinki', 0),
(76, 1, 'Leonardo da Vinci', 1), -- Correcta
(76, 2, 'Miguel Ángel', 0),
(76, 3, 'Rafael', 0),
(76, 4, 'Donatello', 0),
(77, 1, 'Vincent van Gogh', 1), -- Correcta
(77, 2, 'Pablo Picasso', 0),
(77, 3, 'Salvador Dalí', 0),
(77, 4, 'Claude Monet', 0),
(78, 1, 'Museo de Arte Moderno (MoMA)', 0),
(78, 2, 'Museo de Orsay', 0),
(78, 3, 'Museo del Prado', 0),
(78, 4, 'Museo de Arte Moderno (MoMA)', 1), -- Correcta
(79, 1, 'Pablo Picasso', 1), -- Correcta
(79, 2, 'Joan Miró', 0),
(79, 3, 'Diego Rivera', 0),
(79, 4, 'José Clemente Orozco', 0),
(80, 1, 'Pablo Picasso', 1), -- Correcta
(80, 2, 'Georges Braque', 0),
(80, 3, 'Juan Gris', 0),
(80, 4, 'Salvador Dalí', 0),
(81, 1, 'Barroco', 1), -- Correcta
(81, 2, 'Renacimiento', 0),
(81, 3, 'Gótico', 0),
(81, 4, 'Manierismo', 0),
(82, 1, 'Salvador Dalí', 1), -- Correcta
(82, 2, 'René Magritte', 0),
(82, 3, 'Joan Miró', 0),
(82, 4, 'Max Ernst', 0),
(83, 1, 'Andy Warhol', 1), -- Correcta
(83, 2, 'Roy Lichtenstein', 0),
(83, 3, 'Keith Haring', 0),
(83, 4, 'Jean-Michel Basquiat', 0),
(84, 1, 'Hieronymus Bosch', 1), -- Correcta
(84, 2, 'Pieter Brueghel el Viejo', 0),
(84, 3, 'El Bosco', 0),
(84, 4, 'Albrecht Dürer', 0),
(85, 1, 'Siglo XVII', 1), -- Correcta
(85, 2, 'Siglo XVI', 0),
(85, 3, 'Siglo XVIII', 0),
(85, 4, 'Siglo XIX', 0),
(86, 1, 'Expresionismo Abstracto', 1), -- Correcta
(86, 2, 'Cubismo', 0),
(86, 3, 'Impresionismo', 0),
(86, 4, 'Futurismo', 0),
(87, 1, 'La Historia de México', 1), -- Correcta
(87, 2, 'Sueño de una tarde dominical en la Alameda Central', 0),
(87, 3, 'El hombre en la encrucijada', 0),
(87, 4, 'El levantamiento', 0),
(88, 1, 'Miguel Ángel', 1), -- Correcta
(88, 2, 'Bernini', 0),
(88, 3, 'Donatello', 0),
(88, 4, 'Rodin', 0),
(89, 1, 'Técnica del mosaico', 0),
(89, 2, 'Fresco', 0),
(89, 3, 'Técnica del mosaico', 1), -- Correcta
(89, 4, 'Óleo', 0),
(90, 1, 'Gótico', 1), -- Correcta
(90, 2, 'Románico', 0),
(90, 3, 'Barroco', 0),
(90, 4, 'Renacimiento', 0),
(91, 1, 'Madrid', 1), -- Correcta
(91, 2, 'Barcelona', 0),
(91, 3, 'Valencia', 0),
(91, 4, 'Sevilla', 0),
(92, 1, 'Portugués', 1), -- Correcta
(92, 2, 'Español', 0),
(92, 3, 'Inglés', 0),
(92, 4, 'Francés', 0),
(93, 1, 'Gabriel García Márquez', 1), -- Correcta
(93, 2, 'Mario Vargas Llosa', 0),
(93, 3, 'Julio Cortázar', 0),
(93, 4, 'Jorge Luis Borges', 0),
(94, 1, 'Marte', 1), -- Correcta
(94, 2, 'Júpiter', 0),
(94, 3, 'Saturno', 0),
(94, 4, 'Venus', 0),
(95, 1, 'León', 1), -- Correcta
(95, 2, 'Tigre', 0),
(95, 3, 'Elefante', 0),
(95, 4, 'Jaguar', 0),
(96, 1, 'Au', 1), -- Correcta
(96, 2, 'Ag', 0),
(96, 3, 'Fe', 0),
(96, 4, 'Cu', 0),
(97, 1, 'Francia', 1), -- Correcta
(97, 2, 'España', 0),
(97, 3, 'Italia', 0),
(97, 4, 'Alemania', 0),
(98, 1, 'Leonardo da Vinci', 1), -- Correcta
(98, 2, 'Rafael', 0),
(98, 3, 'Miguel Ángel', 0),
(98, 4, 'Tiziano', 0),
(99, 1, 'Roma', 1), -- Correcta
(99, 2, 'Atenas', 0),
(99, 3, 'Jerusalén', 0),
(99, 4, 'Constantinopla', 0),
(100, 1, 'Océano Pacífico', 1), -- Correcta
(100, 2, 'Océano Atlántico', 0),
(100, 3, 'Océano Índico', 0),
(100, 4, 'Océano Ártico', 0),
(101, 1, '1945', 1), -- Correcta
(101, 2, '1918', 0),
(101, 3, '1920', 0),
(101, 4, '1939', 0),
(102, 1, 'La Biblia', 1), -- Correcta
(102, 2, 'El Corán', 0),
(102, 3, 'Don Quijote', 0),
(102, 4, 'El Principito', 0),
(103, 1, 'Albert Einstein', 1), -- Correcta
(103, 2, 'Isaac Newton', 0),
(103, 3, 'Galileo Galilei', 0),
(103, 4, 'Niels Bohr', 0),
(104, 1, 'Reino Unido', 1), -- Correcta
(104, 2, 'Japón', 0),
(104, 3, 'Suecia', 0),
(104, 4, 'España', 0),
(105, 1, 'Ottawa', 1), -- Correcta
(105, 2, 'Toronto', 0),
(105, 3, 'Vancouver', 0),
(105, 4, 'Montreal', 0);
