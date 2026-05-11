
SELECT  *  FROM fsk;

SELECT * FROM produktionsland;

SELECT * FROM schauspieler;

SELECT * FROM regie;

SELECT * FROM genre;

SELECT * FROM medien;

SELECT * FROM studio;

SELECT * FROM rollen;

SELECT titel, erscheinungsjahr
FROM filme
WHERE erscheinungsjahr >2005
ORDER BY erscheinungsjahr DESC
LIMIT 10;

-- Zeigt die schauspieler,
-- in welchem film die mitspielen
-- und in welcher genre an
select schauspieler.vorname, schauspieler.nachname, filme.titel, GROUP_CONCAT(genre.bezeichnung)
from schauspieler 
JOIN film_schauspieler ON schauspieler.id = film_schauspieler.schauspielerID
JOIN filme ON filme.id = film_schauspieler.filmeID
JOIN film_genre ON filme.id = film_genre.filmeID
JOIN genre ON genre.id = film_genre.genreID
group BY schauspieler.vorname, schauspieler.nachname, filme.titel;

-- Zeigt die Film-Titel und ihre Alterfreigaben an
SELECT filme.titel, fsk.mindest_alter
FROM filme
JOIN fsk on filme.`fskID` = fsk.id;

-- Alle Film-Titel und die Nachnamen der Schauspieler, 
-- die eine Rolle in dem Film besetzen, 
-- gruppiert bei Film-Titel
SELECT filme.titel, GROUP_CONCAT(CONCAT(schauspieler.vorname, ' ', schauspieler.nachname) SEPARATOR ', ') AS Besetzung
from filme
JOIN film_schauspieler ON filme.id = film_schauspieler.filmeID
JOIN schauspieler ON schauspieler.id = film_schauspieler.schauspielerID
GROUP BY filme.titel;