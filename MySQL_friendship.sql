# Friendships
# Objetivos : Practica creando tus base de datos. Practica consultas SQL y SELF JOIN.
# Crea una base de datos llamada "amigos" y luego importe friends.sql. Esto creará dos nuevas tablas: usuarios y amistades.
# Escribe una consulta SQL que devuelva una lista de usuarios junto con los nombres de sus amigos.
# Sus resultados deberían verse a continuación:
# first_name 	last_name 	friend_first_name 	friend_last_name
# Amy 	Giver 	Eli 	Byers
# Amy	Giver 	Big 	Bird
# Amy 	Giver 	Kermit 	The Frog
# Eli 	Byers 	Kermit 	The Frog
# Eli  	Byers 	Marky 	Mark
# Marky  	Mark 	Big 	Bird
# Su consulta real tendrá un aspecto similar a este:

USE amigos;
SELECT * FROM users;
SELECT * FROM friendships;

SELECT u.id as user_id, CONCAT(u.first_name, " ", u.last_name) AS usuario, user2.id AS amigo_id, CONCAT(user2.first_name, " ", user2.last_name) AS amigo FROM users u
LEFT JOIN friendships f ON f.user_id = u.id
LEFT JOIN users as user2 ON user2.id = f.friend_id

# Tenga en cuenta que nos estamos uniendo a la tabla de usuarios nuevamente, pero estamos especificando la segunda tabla de usuarios como user2. Luego puede hacer referencia a los segundos usuarios llamando a user2 (por ejemplo, user2.id, user2.first_name, etc.).
# También puede cambiar el nombre de los campos que se seleccionan en el resultado usando la palabra clave como, como en el siguiente ejemplo:
# SELECT user2.first_name as friend_first_name, user2.last_name as friend_last_name, ...  FROM ...
# Saber cómo hacer uniones puede ser complicado, pero se usa con bastante frecuencia y lo más probable es que vuelva a aparecer en el examen belt.
# Ejercicio Adicional. También escriba las consultas SQL necesarias para realizar las siguientes tareas:
#    Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.
#    Devuelve el recuento de todas las amistades.
#    Descubre quién tiene más amigos y devuelve el recuento de sus amigos.
#    Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.
#    Devuelve a los amigos de Eli en orden alfabético.
#    Eliminar a Marky Mark de los amigos de Eli.
#    Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos

