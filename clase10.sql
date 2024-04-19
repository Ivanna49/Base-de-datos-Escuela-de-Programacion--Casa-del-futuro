SELECT * FROM movies_db.movies;

SELECT *
FROM movies;

SELECT first_name, last_name, rating
FROM actors;

SELECT title
FROM series;

SELECT title, rating, length
FROM movies;

SELECT first_name, last_name, rating
FROM actors
WHERE rating > 7.5;

#Mostrar el título de las películas, el rating y los premios de las películas con un rating mayor a 7,5 y con más de dos premios
SELECT title, rating, awards
FROM movies
WHERE rating > 7.5 and awards > 2;

#Mostrar el título de las películas y el rating ordenadas por rating en forma ascendente.
SELECT title, rating
FROM movies
ORDER BY rating;

#Mostrar actores cuyo rating se encuentre entre 4.0 y 10.0.


SELECT first_name, last_name, rating
FROM actors
WHERE rating BETWEEN 4.0 AND 10.0;

#Muestra los títulos y las fechas de lanzamiento de las películas cuya duración sea más de 150 minutos.

SELECT title, release_date, length
FROM movies
WHERE length > 150;

#Mostrar el título y rating de todas las películas cuyo título incluya Toy Story.

SELECT title, rating
FROM movies
WHERE title LIKE "toy story%";

#Mostrar a todos los actores cuyos nombres empiecen con Sam.
SELECT first_name, last_name
FROM actors
WHERE first_name LIKE "sam%";

#Muestra los nombres y apellidos de los actores ordenados por su rating de forma descendente.

SELECT first_name, last_name, rating
FROM actors
ORDER BY rating DESC;

#Muestra los títulos y las fechas de lanzamiento de las películas ordenadas por su rating de forma descendente.

SELECT title, release_date, rating
FROM movies
ORDER BY rating DESC;

#Muestra los nombres y apellidos de los actores cuyos nombres contienen la letra "a".

SELECT first_name, last_name
FROM actors
WHERE first_name LIKE "%A%";

#Mostrar el título de las películas que salieron entre el ‘2004-01-01’ y ‘2008-12-31’.

SELECT title, release_date
FROM movies
WHERE release_date BETWEEN "2004-01-01"AND "2008-12-31";