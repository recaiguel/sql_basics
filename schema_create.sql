DROP DATABASE IF EXISTS filmdb;
CREATE DATABASE filmdb;
USE filmdb;

-- STAMMDATEN

-- FSK
CREATE TABLE fsk(
id INT AUTO_INCREMENT PRIMARY KEY,
mindest_alter INT
);

-- Rollen
CREATE TABLE rollen(
id INT AUTO_INCREMENT PRIMARY KEY,
rollen_bezeichnung VARCHAR(100)
);

-- Produktionsland
CREATE TABLE produktionsland (
id INT AUTO_INCREMENT PRIMARY KEY,
land VARCHAR(100) NOT NULL
);

-- Schauspieler
CREATE TABLE schauspieler (
id INT AUTO_INCREMENT PRIMARY KEY,
vorname VARCHAR(100),
nachname VARCHAR(100),
geburtsdatum YEAR,
geschlecht VARCHAR(100),
nationalität VARCHAR(100)
);

-- Regie
CREATE TABLE regie(
id INT AUTO_INCREMENT PRIMARY KEY,
vorname VARCHAR(100),
nachname VARCHAR(100),
geburtsdatum YEAR,
geschlecht VARCHAR(100),
nationalität VARCHAR(100)
);

-- Genre
CREATE TABLE genre(
id INT AUTO_INCREMENT PRIMARY KEY,
bezeichnung VARCHAR(100),
beschreibung TEXT
);

-- Medien
CREATE TABLE medien(
id INT AUTO_INCREMENT PRIMARY KEY,
bezeichnung VARCHAR(100)
);

-- Studio
CREATE TABLE studio(
id INT AUTO_INCREMENT PRIMARY KEY,
studio_name VARCHAR(100)
);

-- HAUPTDATEN

-- Filme
CREATE TABLE filme (
id INT AUTO_INCREMENT PRIMARY KEY,
titel VARCHAR(100) NOT NULL,
erscheinungsjahr YEAR,
laufzeit_min INT CHECK (laufzeit_min > 0),
fskID INT,
FOREIGN KEY (fskID) REFERENCES fsk(id)
);


-- VERBINDUNGSTABELLEN

-- Land
CREATE TABLE film_produktionsland (
PRIMARY KEY (filmeID, landID),
filmeID INT,
landID INT,
FOREIGN KEY (filmeID) REFERENCES filme(ID),
FOREIGN KEY (landID) REFERENCES produktionsland(ID)
);

-- Schauspieler
CREATE TABLE film_schauspieler(
PRIMARY KEY (filmeID, schauspielerID),
filmeID INT,
schauspielerID INT,
rollen_name VARCHAR(100),
gage DECIMAL(15, 2),
rollenID INT,
FOREIGN KEY (filmeID) REFERENCES filme(id),
FOREIGN KEY (schauspielerID) REFERENCES schauspieler(id),
FOREIGN KEY (rollenID) REFERENCES rollen(id)
);

-- Regie
CREATE TABLE film_regie(
PRIMARY KEY (filmeID, regieID),
filmeID INT,
regieID INT,
FOREIGN KEY (filmeID) REFERENCES filme(ID),
FOREIGN KEY (regieID) REFERENCES regie(ID)
);

-- Genre
CREATE TABLE film_genre(
PRIMARY KEY (filmeID, genreID),
filmeID INT,
genreID INT,
FOREIGN KEY (genreID) REFERENCES genre(ID),
FOREIGN KEY (filmeID) REFERENCES filme(ID)
);

-- Medien
CREATE TABLE film_medien(
PRIMARY KEY (filmeID, medienID),
filmeID INT,
medienID INT,
FOREIGN KEY (filmeID) REFERENCES filme(ID),
FOREIGN KEY (medienID) REFERENCES medien(ID)
);

-- Studio
CREATE TABLE film_studio(
PRIMARY KEY (filmeID, studioID),
filmeID INT,
studioID INT,
FOREIGN KEY (filmeID) REFERENCES filme(ID),
FOREIGN KEY (studioID) REFERENCES studio(ID)
);


