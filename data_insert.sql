-- Datasets

-- Schauspieler
INSERT INTO schauspieler (vorname, nachname, geburtsdatum, geschlecht, nationalität) VALUES 
('Johnny', 'Depp', '1963-06-09', 'männlich', 'USA'),
('Geoffrey', 'Rush', '1951-07-06', 'männlich', 'Australien'),
('Orlando', 'Bloom', '1977-01-13', 'männlich', 'Großbritannien'),
('Keira', 'Knightley', '1985-03-26', 'weiblich', 'Großbritannien'),
('Kevin', 'McNally', '1956-04-27', 'männlich', 'Großbritannien'),
('Bill', 'Nighy', '1949-12-12', 'männlich', 'Großbritannien'),
('Stellan', 'Skarsgård', '1951-06-13', 'männlich', 'Schweden'),
('Naomie', 'Harris', '1976-09-06', 'weiblich', 'Großbritannien'),
('Jack', 'Davenport', '1973-03-01', 'männlich', 'Großbritannien'),
('Penélope', 'Cruz', '1974-04-28', 'weiblich', 'Spanien'),
('Matthew', 'McConaughey', '1969-11-04', 'männlich', 'USA'),
('Anne', 'Hathaway', '1982-11-12', 'weiblich', 'USA'),
('Jessica', 'Chastain', '1977-03-24', 'weiblich', 'USA'),
('Michael', 'Caine', '1933-03-14', 'männlich', 'Großbritannien'),
('Leonardo', 'DiCaprio', '1974-11-11', 'männlich', 'USA'),
('Joseph', 'Gordon-Levitt', '1981-02-17', 'männlich', 'USA'),
('Elliot', 'Page', '1987-02-21', 'divers', 'Kanada'),
('Tom', 'Hardy', '1977-09-15', 'männlich', 'Großbritannien'),
('Cillian', 'Murphy', '1976-05-25', 'männlich', 'Irland'),
('Christian', 'Bale', '1974-01-30', 'männlich', 'Großbritannien'),
('Heath', 'Ledger', '1979-04-04', 'männlich', 'Australien'),
('Gary', 'Oldman', '1958-03-21', 'männlich', 'Großbritannien'),
('Maggie', 'Gyllenhaal', '1977-11-16', 'weiblich', 'USA'),
('Albert', 'Brooks', '1947-07-22', 'männlich', 'USA'),
('Ellen', 'DeGeneres', '1958-01-26', 'weiblich', 'USA'),
('Alexander', 'Gould', '1994-05-04', 'männlich', 'USA'),
('Willem', 'Dafoe', '1955-07-22', 'männlich', 'USA')
;

-- FSK
INSERT INTO fsk (mindest_alter) VALUES 
(0), (6), (12), (16), (18), (21);

-- Land
INSERT INTO produktionsland (land) VALUES 
('Deutschland'), ('USA'), ('Großbritannien'), ('Frankreich'), 
('Italien'), ('Spanien'), ('Kanada'), ('Japan'), 
('Südkorea'), ('Australien'), ('Indien'), ('China'), 
('Brasilien'), ('Mexiko'), ('Dänemark'), ('Schweden'), 
('Norwegen'), ('Österreich'), ('Schweiz'), ('Niederlande');

-- Regie
INSERT INTO regie (vorname, nachname, geburtsdatum, geschlecht, nationalität) VALUES 
('Gore', 'Verbinski', '1964-03-16', 'männlich', 'USA'),
('Steven', 'Spielberg', '1946-12-18', 'männlich', 'USA'),
('Christopher', 'Nolan', '1970-07-30', 'männlich', 'Großbritannien'),
('James', 'Cameron', '1954-08-16', 'männlich', 'Kanada'),
('Quentin', 'Tarantino', '1963-03-27', 'männlich', 'USA'),
('Greta', 'Gerwig', '1983-08-04', 'weiblich', 'USA'),
('Andrew', 'Stanton', '1965-12-03', 'männlich', 'USA'),
('Lee', 'Unkrich', '1967-08-08', 'männlich', 'USA')
;

-- Genre
INSERT INTO genre (bezeichnung, beschreibung) VALUES 
('Action', 'Filme mit physischer Action, Verfolgungsjagden und Kämpfen.'),
('Abenteuer', 'Reisen, Entdeckungen und Heldenreisen in fernen Ländern.'),
('Sci-Fi', 'Zukunftsszenarien, Technologie und Weltraumthemen.'),
('Fantasy', 'Magie, Fabelwesen und übernatürliche Welten.'),
('Drama', 'Fokus auf tiefgreifende Charakterentwicklung und Konflikte.'),
('Komödie', 'Filme, die primär zur Unterhaltung und zum Lachen dienen.'),
('Horror', 'Zielt darauf ab, beim Zuschauer Angst und Schrecken zu erzeugen.'),
('Thriller', 'Adrenalinbetonte Handlung mit Fokus auf Verbrechen, Gefahr und Nervenkitzel.'),
('Krimi', 'Thematisiert die Aufklärung eines Verbrechens durch die Suche nach Tätern und Motiven.');


-- Medien
INSERT INTO medien (bezeichnung) VALUES 
('DVD'), 
('Blu-ray'), 
('4K Ultra HD'), 
('Streaming'), 
('Kino'),
('VHS');

INSERT INTO rollen (rollen_bezeichnung) VALUES 
('Hauptrolle'), 
('Nebenrolle'), 
('Gastrolle'), 
('Statist'), 
('Cameo');

INSERT INTO filme (titel, erscheinungsjahr, laufzeit_min, fskID) 
VALUES (
    'Inception',
    2010,
    148,
    (SELECT id from fsk WHERE mindest_alter = 12 LIMIT 1)
);

INSERT INTO filme (titel, erscheinungsjahr, laufzeit_min, fskID) 
VALUES (
    'The Dark Knight',
    2008,
    152,
    (SELECT id from fsk WHERE mindest_alter = 16 LIMIT 1)
);

INSERT INTO filme (titel, erscheinungsjahr, laufzeit_min, fskID) 
VALUES (
    'Findet Nemo', 
    2003, 
    100, 
    (SELECT id FROM fsk WHERE mindest_alter = 0 LIMIT 1)
);

-- Verbindungen

INSERT INTO film_genre (filmeID, genreID)
VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 3),
(3, 1),
(3, 3),
(3, 8),
(4, 1),
(4, 8),
(4, 9),
(5, 2)
;

INSERT INTO film_medien (filmeID, medienID)
VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 5),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6)
;

INSERT INTO film_produktionsland (filmeID, landID)
VALUES
(1, 2),
(2, 2),
(2, 3),
(3, 2),
(3, 3),
(4, 2),
(5, 2)
;

INSERT INTO film_regie (filmeID, regieID)
VALUES
(1, 1),
(2, 3),
(3, 3),
(4, 3),
(5, 7),
(5, 8)
;

INSERT INTO film_schauspieler (filmeID, schauspielerID, rollenID, rollen_name, gage)
VALUES
(
    (SELECT id FROM filme WHERE titel = 'Fluch der Karibik' LIMIT 1),
    (SELECT id FROM schauspieler WHERE nachname = 'Depp' AND vorname = 'Johnny' LIMIT 1),
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1),
    'Jack Sparrow', 10000000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Fluch der Karibik' LIMIT 1),
    (SELECT id FROM schauspieler WHERE nachname = 'Rush' AND vorname = 'Geoffrey' LIMIT 1),
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1),
    'Hector Barbossa', 5000000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Fluch der Karibik' LIMIT 1),
    (SELECT id FROM schauspieler WHERE nachname = 'Bloom' AND vorname = 'Orlando' LIMIT 1),
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1),
    'Will Turner', 2000000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Fluch der Karibik' LIMIT 1),
    (SELECT id FROM schauspieler WHERE nachname = 'Knightley' AND vorname = 'Keira' LIMIT 1),
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1),
    'Elizabeth Swann', 2000000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Fluch der Karibik' LIMIT 1),
    (SELECT id FROM schauspieler WHERE nachname = 'McNally' AND vorname = 'Kevin' LIMIT 1),
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Nebenrolle' LIMIT 1),
    'Joshamee Gibbs', 500000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Fluch der Karibik' LIMIT 1),
    (SELECT id FROM schauspieler WHERE nachname = 'Nighy' AND vorname = 'Bill' LIMIT 1),
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1),
    'Davy Jones', 2500000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Fluch der Karibik' LIMIT 1),
    (SELECT id FROM schauspieler WHERE nachname = 'Skarsgård' AND vorname = 'Stellan' LIMIT 1),
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Nebenrolle' LIMIT 1),
    'Bootstrap Bill', 1200000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Fluch der Karibik' LIMIT 1),
    (SELECT id FROM schauspieler WHERE nachname = 'Harris' AND vorname = 'Naomie' LIMIT 1),
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Nebenrolle' LIMIT 1),
    'Tia Dalma', 750000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Fluch der Karibik' LIMIT 1),
    (SELECT id FROM schauspieler WHERE nachname = 'Davenport' AND vorname = 'Jack' LIMIT 1),
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Nebenrolle' LIMIT 1),
    'James Norrington', 600000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Fluch der Karibik' LIMIT 1),
    (SELECT id FROM schauspieler WHERE nachname = 'Cruz' AND vorname = 'Penélope' LIMIT 1),
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1),
    'Angelica', 3000000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Inception' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'DiCaprio' LIMIT 1),
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1),
    'Dom Cobb', 20000000.00 
),
(
    (SELECT id FROM filme WHERE titel = 'Inception' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Gordon-Levitt' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1),
    'Arthur', 5000000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Inception' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Page' LIMIT 1),  
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1),
    'Ariadne', 3500000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Inception' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Hardy' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Nebenrolle' LIMIT 1),
    'Eames', 2500000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Inception' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Murphy' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Nebenrolle' LIMIT 1), 
    'Robert Fischer', 1500000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Inception' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Caine' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Nebenrolle' LIMIT 1), 
    'Stephen Miles', 1000000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Interstellar' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'McConaughey' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1), 
    'Joseph Cooper', 18000000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Interstellar' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Hathaway' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1), 
    'Dr. Amelia Brand', 6000000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Interstellar' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Chastain' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1), 
    'Murphy Cooper', 5000000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Interstellar' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Caine' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Nebenrolle' LIMIT 1), 
    'Professor Brand', 1200000.00
),
(
    (SELECT id FROM filme WHERE titel = 'The Dark Knight' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Bale' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1), 
    'Bruce Wayne / Batman', 10000000.00
),
(
    (SELECT id FROM filme WHERE titel = 'The Dark Knight' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Ledger' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1), 
    'Joker', 1000000.00
),
(
    (SELECT id FROM filme WHERE titel = 'The Dark Knight' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Oldman' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1), 
    'James Gordon', 3000000.00
),
(
    (SELECT id FROM filme WHERE titel = 'The Dark Knight' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Gyllenhaal' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Hauptrolle' LIMIT 1), 
    'Rachel Dawes', 2000000.00
),
(
    (SELECT id FROM filme WHERE titel = 'The Dark Knight' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Caine' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Nebenrolle' LIMIT 1), 
    'Alfred Pennyworth', 2500000.00
),
(
    (SELECT id FROM filme WHERE titel = 'The Dark Knight' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Murphy' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Cameo' LIMIT 1), 
    'Dr. Jonathan Crane / Scarecrow', 500000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Findet Nemo' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Brooks' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Synchronsprecher' LIMIT 1), 
    'Marlin', 250000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Findet Nemo' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'DeGeneres' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Synchronsprecher' LIMIT 1), 
    'Dory', 375000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Findet Nemo' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Gould' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Synchronsprecher' LIMIT 1), 
    'Nemo', 50000.00
),
(
    (SELECT id FROM filme WHERE titel = 'Findet Nemo' LIMIT 1), 
    (SELECT id FROM schauspieler WHERE nachname = 'Dafoe' LIMIT 1), 
    (SELECT id FROM rollen WHERE rollen_bezeichnung = 'Synchronsprecher' LIMIT 1), 
    'Khan', 150000.00
);

INSERT INTO film_studio (filmeID, studioID)
VALUES
-- Fluch der Karibik -> Walt Disney Pictures
(
    (SELECT id FROM filme WHERE titel = 'Fluch der Karibik' LIMIT 1), 
    (SELECT id FROM studio WHERE studio_name = 'Walt Disney Pictures' LIMIT 1)
),
-- Inception -> Warner Bros.
(
    (SELECT id FROM filme WHERE titel = 'Inception' LIMIT 1), 
    (SELECT id FROM studio WHERE studio_name = 'Warner Bros.' LIMIT 1)
),
-- Interstellar -> Warner Bros. (zusammen mit Paramount)
(
    (SELECT id FROM filme WHERE titel = 'Interstellar' LIMIT 1), 
    (SELECT id FROM studio WHERE studio_name = 'Warner Bros.' LIMIT 1)
),
-- The Dark Knight -> Warner Bros.
(
    (SELECT id FROM filme WHERE titel = 'The Dark Knight' LIMIT 1), 
    (SELECT id FROM studio WHERE studio_name = 'Warner Bros.' LIMIT 1)
),
-- Findet Nemo -> Walt Disney Pictures (Pixar)
(
    (SELECT id FROM filme WHERE titel = 'Findet Nemo' LIMIT 1), 
    (SELECT id FROM studio WHERE studio_name = 'Walt Disney Pictures' LIMIT 1)
);