
# RETO 1
# ¿Cuál es el nombre de los empleados cuyo sueldo es mayor a $10,000?
SHOW TABLES;
USE tienda;
SELECT * FROM empleado;
SELECT * FROM puesto;
SELECT concat(nombre,' ',apellido_paterno,' ',apellido_materno) AS Nombre_empleado FROM empleado WHERE id_puesto IN (SELECT id_puesto FROM puesto WHERE salario > 10000);

# ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT count(*) AS NUM_VENTAS_POR_EMPLEADO, id_empleado  FROM venta GROUP BY id_empleado;

SELECT id_empleado ,max(NUM_VENTAS_POR_EMPLEADO), min(NUM_VENTAS_POR_EMPLEADO) 
FROM (SELECT count(*) AS NUM_VENTAS_POR_EMPLEADO, id_empleado  FROM venta GROUP BY id_empleado) 
AS LLORA GROUP BY id_empleado;

# ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?

SELECT clave
FROM venta WHERE id_articulo IN(
SELECT id_articulo FROM articulo WHERE precio > 5000);

# RETO 2 JOINS
# ¿Cuál es el nombre de los empleados que realizaron cada venta?

SELECT concat(nombre,' ',apellido_paterno) AS Nombre_empleado, id_venta 
FROM empleado AS e
JOIN venta AS v ON e.id_empleado=v.id_empleado;

#SELECT nombre, apellido_paterno FROM(SELECT clave, nombre, apellido_paterno
#FROM venta AS v
#JOIN empleado AS e
 # ON v.id_empleado = e.id_empleado
#ORDER BY clave) AS hola where nombre LIKE "Morey" AND apellido_paterno like "Bowskill"; COMPROBACIÓN

# ¿Cuál es el nombre de los artículos que se han vendido?

SELECT nombre AS "Artículos vendidos",id_venta
FROM articulo AS a
JOIN venta AS v ON a.id_articulo=v.id_articulo;

#SELECT nombre AS "Artículos vendidos",count(nombre) AS 
#"Número_de_artículos_vendidos"
#FROM articulo AS a
#JOIN venta AS v ON a.id_articulo=v.id_articulo 
#group by nombre; 	OTRA FORMA

#¿Cuál es el total de cada venta?
SELECT sum(precio) as total, clave FROM articulo AS a
JOIN venta AS v ON a.id_articulo=v.id_articulo
GROUP BY clave;

# Reto 3

# 1 Obtener el puesto de un empleado.

create view TRABAJOS AS
SELECT e.nombre, e.apellido_paterno, p.nombre Puesto 
FROM empleado AS e
JOIN puesto AS p
ON p.id_puesto=e.id_puesto;
SELECT * FROM TRABAJOS;

# 2 Saber qué artículos ha vendido cada empleado.
SELECT * FROM venta;
SELECT * FROM articulo;
SELECT * FROM empleado;
select concat(e.nombre,' ',e.apellido_paterno) Nombre_empleado,
 a.nombre articulo_vendido FROM venta AS v
 JOIN empleado AS e
 on v.id_empleado=e.id_empleado
 JOIN articulo a ON v.id_articulo = a.id_articulo;
 
 # 3 Saber qué puesto ha tenido más ventas.
 USE tienda;
 
 CREATE VIEW max_ventas_por_puesto AS
 SELECT max(no_puesto) FROM (SELECT p.nombre ,count(v.id_empleado) AS "no_puesto"
 FROM venta AS v
 JOIN empleado e
 on e.id_empleado = v.id_empleado
 JOIN puesto p
 on p.id_puesto = e.id_puesto group by p.nombre) AS max;
 
 SELECT * FROM max_ventas_por_puesto;
 
