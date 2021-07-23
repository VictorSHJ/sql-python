select * from countries;
select * from cities;
select * from languages;

#1. ¿Qué consulta harías para obtener todos los países que hablan esloveno? 
#Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma. 
#Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente. (1)
SELECT countries.name, languages.language, languages.percentage FROM languages 
       JOIN countries ON countries.id = languages.country_id
       WHERE languages.language LIKE "%sloven%"
       ORDER BY languages.percentage DESC;
       
SELECT c.name, l.language, l.percentage FROM languages l
       JOIN countries c ON c.id = l.country_id
       WHERE l.language LIKE "%sloven%"
       ORDER BY l.percentage DESC;

#2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? 
# Su consulta debe devolver el nombre del país y el número total de ciudades. 
# Tu consulta debe organizar el resultado por el número de ciudades en orden descendente. (3)
SELECT countries.name, COUNT(*) FROM cities
       JOIN countries ON countries.id = cities.country_id
       GROUP BY countries.name
       ORDER BY COUNT(*) DESC;

#3. ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000? 
#Tu consulta debe organizar el resultado por población en orden descendente. (1)
SELECT c.name, c.population, c.country_id FROM cities c      
       WHERE c.country_code = "MEX" AND c.population > 500000
       ORDER BY c.population DESC;

#4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? 
#Tu consulta debe organizar el resultado por porcentaje en orden descendente. (1)
SELECT c.name, l.language, l.percentage FROM languages l
       JOIN countries c ON c.id = l.country_id
       WHERE l.percentage > 89
       ORDER BY l.percentage DESC;

#5. ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 
# y una población superior a 100,000? (2)
SELECT c.name, c.surface_area, c.population FROM countries c 
       WHERE c.surface_area < 501 AND c.population > 100000;

#6. ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 
# y una esperanza de vida superior a 75 años? (1)
SELECT c.name, c.government_form, c.capital, c.life_expectancy FROM countries c 
       WHERE c.government_form = "Constitutional Monarchy" AND c.life_expectancy > 75;

#7. ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires 
# y tener una población superior a 500,000? 
# La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población. (2)
SELECT countries.name, c.name, c.district, c.population FROM cities c      
       JOIN countries on countries.id = c.country_id
       WHERE c.country_code = "ARG" AND c.district = "Buenos Aires" AND c.population > 500000
       ORDER BY c.population DESC;
       
#8. ¿Qué consulta harías para resumir el número de países en cada región? La consulta debe mostrar el nombre de la región y el número de países. Además, la 
#consulta debe organizar el resultado por el número de países en orden descendente. (2)
SELECT c.region, COUNT(*) as "countries" FROM countries c
       GROUP BY c.region
       ORDER BY COUNT(*) DESC;

#Nota: Puedes descargar este archivo PDF que muestra los resultados esperados de las consultas - 
#Resultados esperados (https://s3.amazonaws.com/General_V88/boomyeah2015/codingdojo/curriculum/content/chapter/mysql_countries_expected_output.pdf)