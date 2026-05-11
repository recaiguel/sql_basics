
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

