#Utilizando la base de datos de movies, queremos conocer, por un lado, los títulos y el nombre del género de todas las series de la base de datos.
SELECT series.title AS titulo, genres.name AS genero
FROM series, genres
WHERE genres.id = series.ID;

#Por otro, necesitamos listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.
SELECT episodes.title AS episodios, actors.first_name as nombre, 
actors.last_name AS apellido
FROM episodes, actors, actor_episode
WHERE episodes.id = actor_episode.episode_id AND actors.id = actor_episode.actor_id;

#Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices (mostrar nombre y apellido) que han trabajado en cualquier película de la saga de La Guerra de las galaxias.
SELECT actors.first_name AS nombre, actors.last_name AS apellido, movies.title AS pelicula
FROM actors, movies, actor_movie
WHERE actors.id = actor_movie.actor_id AND movies.id = actor_movie.movie_id
AND movies.title LIKE 'La Guerra de las galaxias%';

#Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género.
SELECT g.name AS genre_name,
       (SELECT COUNT(*)
FROM movies m
WHERE m.genre_id = g.id) AS movie_count
FROM genres g;