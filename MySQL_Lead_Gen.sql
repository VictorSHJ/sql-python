# Lead Gen Business
# Objetivos : Practica tus consultas SQL.
# Completa las consultas SQL a continuación utilizando la base de datos lead-gen-business-new y la siguiente estructura.
# Nota : 
# Si está por delante, le recomendamos encarecidamente que trabaje en esta tarea, ya que esto realmente lo ayudaría a comprender cómo funciona GROUP BY y cuán poderoso puede ser MySQL. Si ya ha pasado más de 2 días completos estudiando ERD y MySQL, simplemente omita esta tarea y regrese más tarde cuando haya terminado con el bootcamp.
# Si ya tiene una base de datos llamada lead-gen-business, continúe y elimine esa base de datos y vuelva a crearla importando el archivo lead-gen-business-new.sql. La base de datos que se crea será diferente a la del archivo morepractice.sql que usamos durante los videos. 
# Sugerencia: Aquí hay un ejemplo de una consulta que selecciona datos entre un rango de fechas
# SELECT Date,TotalAllowance FROM Calculation WHERE EmployeeId=1 AND Date >= '2011/02/25' AND Date < '2011/02/28'      
USE lead_gen_business;
SELECT * from clients;
SELECT * from billing;
SELECT * from leads;
SELECT * from sites;

#Consultas
# 1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012?
SELECT "Marzo 2012" AS Período, SUM(b.amount) AS Ingresos FROM billing b
       WHERE b.charged_datetime LIKE "2012-03%";
       
# 2. ¿Qué consulta ejecutaría para obtener los ingresos totales recaudados del cliente con una identificación de 2?
SELECT "2" AS Client_Id, SUM(b.amount)  AS Total_Ingresos from clients c
       JOIN billing b ON b.client_id = c.client_id
       WHERE c.client_id = 2;

# 3. ¿Qué consulta ejecutaría para obtener todos los sitios que posee client = 10?
SELECT s.domain_name AS website, c.client_id FROM clients c 
       JOIN sites s ON s.client_id = c.client_id
       WHERE c.client_id = 10;

# 4. ¿Qué consulta ejecutaría para obtener el número total de sitios creados por mes por año para el cliente con una identificación de 1? ¿Qué pasa con el cliente = 20?
SELECT c.client_id, COUNT(s.site_id) AS Websites, MONTHNAME(s.created_datetime) AS Mes_creado, YEAR(s.created_datetime) AS Anno_creado FROM clients c 
       JOIN sites s ON s.client_id = c.client_id
       WHERE c.client_id = 1
       GROUP BY s.site_id;
       
SELECT c.client_id, COUNT(s.site_id) AS Websites, MONTHNAME(s.created_datetime) AS Mes_creado, YEAR(s.created_datetime) AS Anno_creado FROM clients c 
       JOIN sites s ON s.client_id = c.client_id
       WHERE c.client_id = 20
       GROUP BY s.site_id;       

# 5. ¿Qué consulta ejecutaría para obtener el número total de clientes potenciales generados para cada uno de los sitios entre el 1 de enero de 2011 y el 15 de febrero de 2011?
SELECT s.domain_name AS website, COUNT(l.leads_id) AS Nro_Potenciales, CONCAT( MONTHNAME(s.created_datetime), DAY(s.created_datetime), ", ", YEAR(s.created_datetime)) AS fecha_generacion from sites s
       JOIN leads l ON l.site_id = s.site_id
       WHERE l.registered_datetime BETWEEN 20110101 AND 20110215
       GROUP BY l.site_id;
      
# 6. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada uno de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011?
  SELECT CONCAT(c.first_name, " ", c.last_name) AS Nombre_Cliente, COUNT(*) AS Nro_Guias from sites s
       JOIN leads l ON l.site_id = s.site_id
       JOIN clients c ON s.client_id = c.client_id
       WHERE l.registered_datetime BETWEEN 20110101 AND 20111231
       GROUP BY c.client_id;

# 7. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada cliente cada mes entre los meses 1 y 6 del año 2011?
  SELECT CONCAT(c.first_name, " ", c.last_name) AS Nombre_Cliente, COUNT(c.client_id) AS Nro_Potenciales, MIN(MONTHNAME(l.registered_datetime)) AS Mes_generado
       FROM sites s
       JOIN leads l ON l.site_id = s.site_id
       JOIN clients c ON s.client_id = c.client_id
       WHERE l.registered_datetime BETWEEN 20110101 AND 20110631
       GROUP BY c.client_id, MONTH(l.registered_datetime)
       ORDER BY MONTH(l.registered_datetime);

# &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
# 8. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada uno de los sitios de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011? Solicite esta consulta por ID de cliente. 
# Presente una segunda consulta que muestre todos los clientes, los nombres del sitio y el número total de clientes potenciales generados en cada sitio en todo momento.
  SELECT CONCAT(c.first_name, " ", c.last_name) AS Nombre_Cliente, s.domain_name AS website, COUNT(c.client_id) as Total, 
  CONCAT(MIN(MONTHNAME(l.registered_datetime)), " ", MIN(DAY(l.registered_datetime)), ";", MIN(YEAR(l.registered_datetime))) AS Fecha_generacion  
       FROM clients c
       JOIN sites s ON s.client_id = c.client_id
       JOIN leads l ON l.site_id = s.site_id
       WHERE l.registered_datetime BETWEEN "20110101" AND "20111231"
       GROUP BY c.client_id, s.domain_name;
       
 SELECT CONCAT(c.first_name, " ", c.last_name) AS Nombre_Cliente, s.domain_name AS website, COUNT(c.client_id) as Total
       FROM clients c
       JOIN sites s ON s.client_id = c.client_id
       JOIN leads l ON l.site_id = s.site_id
       GROUP BY c.client_id, s.domain_name;       
       
# 9. Escriba una sola consulta que obtenga los ingresos totales recaudados de cada cliente para cada mes del año. Pídalo por ID de cliente.
SELECT CONCAT(c.first_name, " ", c.last_name) AS Nombre_Cliente, b.amount AS Total_Ingresos, MONTHNAME(b.charged_datetime) AS Mes, YEAR(b.charged_datetime) AS Anno from clients c 
       JOIN billing b ON b.client_id = c.client_id
#       GROUP BY Nombre_Cliente, Mes, Anno
       ORDER BY c.client_id, YEAR(b.charged_datetime), MONTH(b.charged_datetime);

# 10. Escriba una sola consulta que obtenga todos los sitios que posee cada cliente. Agrupe los resultados para que cada fila muestre un nuevo cliente. 
# Se volverá más claro cuando agregue un nuevo campo llamado 'sitios' que tiene todos los sitios que posee el cliente. (SUGERENCIA: use GROUP_CONCAT)
  
  SELECT CONCAT(c.first_name, " ", c.last_name) AS Nombre_Cliente, GROUP_CONCAT(s.domain_name, " / ") AS Sitios FROM clients c 
       JOIN sites s ON s.client_id = c.client_id
       GROUP BY c.client_id;       
      
# Nota: Puede descargar este archivo PDF que muestra los resultados esperados de las preguntas anteriores - Expected Result (Leads)