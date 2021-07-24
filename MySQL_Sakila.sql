# Nota : Anteriormente en esta sección, recomendamos que los estudiantes nombren sus tablas en minúsculas
# y tengan una clave principal llamada 'id' en cada tabla. Estas son las reglas que seguimos, sin embargo,
# no todos los desarrolladores siguen estas reglas. El archivo SQL con el que trabajará NO sigue las 
# reglas que discutimos, incluida la denominación de los campos en minúsculas. Todavía queremos que siga
# las reglas que enseñamos, pero use esto como una oportunidad para sentirse cómodo con otros archivos 
# SQL que no siguen completamente las reglas de normalización.

USE sakila

# Consultas
# 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? 
# Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente. 
SELECT a.city_id, city.city, cli.first_name, cli.last_name, cli.email, a.address FROM customer cli  
        JOIN address a ON a.address_id = cli.address_id
        JOIN city ON city.city_id = a.city_id
        WHERE a.city_id = 312;

# 2. ¿Qué consulta harías para obtener todas las películas de comedia? 
# Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).
SELECT f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, c.name AS Genero from film f
       JOIN film_category fc ON fc.film_id = f.film_id
       JOIN category c ON c.category_id = fc.category_id
       WHERE c.name = 'comedy';

# 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? 
# Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, la descripción y el año de lanzamiento.
SELECT a.actor_id, a.first_name, a.last_name, f.title, f.description, f.release_year from actor a
       JOIN film_actor fa ON fa.actor_id = a.actor_id
       JOIN film f ON fa.film_id = f.film_id
       WHERE a.actor_id = 5;

# 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? 
# Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.
SELECT c.store_id, a.city_id, c.first_name, c.last_name, c.email, a.address FROM customer c
       JOIN store s ON s.store_id = c.store_id
       JOIN address a ON c.address_id = a.address_id
       WHERE c.store_id = 1 AND (a.city_id = 1 OR a.city_id = 42 OR a.city_id = 312 OR a.city_id = 459);

# 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", unidas por actor_id = 15? 
# Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y la función especial. Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.
SELECT f.title, f.description, f.release_year, f.rating, f.special_features from film f
       JOIN film_actor fa ON fa.film_id = f.film_id
       WHERE f.rating = 'G' AND f.special_features LIKE "%behind%" AND fa.actor_id = 15;

# 6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? 
# Su consulta debe devolver film_id, title, actor_id y actor_name.
SELECT f.film_id, f.title, a.actor_id, CONCAT(a.first_name, a.last_name) AS 'Nombre Actor' from film f 
       JOIN film_actor fa ON fa.film_id = f.film_id
       JOIN actor a ON fa.actor_id = a.actor_id
       WHERE f.film_id = 369;

# 7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? 
# Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).
SELECT f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, c.name AS Genero, f.rental_rate from film f
       JOIN film_category fc ON fc.film_id = f.film_id
       JOIN category c ON c.category_id = fc.category_id
       WHERE f.rental_rate = 2.99 AND c.name = 'drama';

# 8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? 
# Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales, el género (categoría) y el nombre y apellido del actor.
SELECT a.actor_id, CONCAT(a.first_name, " ", a.last_name) AS nombre_actor, f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, c.name AS Genero from film f
       JOIN film_actor fa ON f.film_id = fa.film_id
       JOIN actor a ON fa.actor_id = a.actor_id
       JOIN film_category fc ON fc.film_id = f.film_id
       JOIN category c ON c.category_id = fc.category_id
       WHERE a.first_name = 'SANDRA' AND a.last_name = 'KILMER' AND c.name = 'action'; 