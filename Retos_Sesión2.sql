# RETO 1 SESIÓN 2
USE tienda;
SHOW TABLES;
# ¿Qué artículos incluyen la palabra Pasta en su nombre?
DESCRIBE articulo;
SELECT * FROM articulo WHERE nombre LIKE "Pas%";

#¿Qué artículos incluyen la palabra Cannelloni en su nombre?

SELECT * FROM articulo WHERE nombre LIKE "%Cannelloni%";

# ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT * FROM articulo WHERE nombre LIKE "%-%";

# ¿Qué puestos incluyen la palabra Designer?
SHOW TABLES;
SHOW DATABASES;
USE tienda;
SHOW TABLES;
SELECT * FROM puesto WHERE nombre LIKE "%Designer%";
SELECT * FROM puesto WHERE nombre LIKE "%Developer%";

# RETO 2 SESIÓN 2 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# ¿Cuál es el promedio de salario de los puestos?
USE tienda;
SHOW TABLES;
DESCRIBE puesto;
SELECT avg(salario) AS "Promedio de los salarios" FROM puesto;

#¿Cuántos artículos incluyen la palabra Pasta en su nombre?
DESCRIBE articulo;
select count(*) AS "Número de pastas" FROM articulo WHERE nombre LIKE "Pasta%";

#¿Cuál es el salario mínimo y máximo?
SHOW TABLES;
DESCRIBE empleado;
DESCRIBE puesto;
SELECT min(salario), max(salario) FROM puesto;

# ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT sum(salario) FROM puesto WHERE id_puesto > 995;

# RETO 3 SESIÓN 2 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
USE tienda;
DESCRIBE puesto;
SHOW TABLES;
# ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, count(*) FROM puesto group by nombre;

#¿Cuánto dinero se paga en total por puesto?
describe puesto;
SELECT nombre, sum(salario) FROM puesto group by nombre;

# ¿Cuál es el número total de ventas por vendedor?
SHOW TABLES;
DESCRIBE venta;
SELECT id_empleado, count(id_venta) AS ventas_totales FROM venta GROUP BY id_empleado;

# ¿Cuál es el número total de ventas por artículo?
SHOW TABLES;
DESCRIBE venta;
SELECT * FROM venta;
SELECT id_articulo, count(id_articulo) AS VENTAS_POR_ARTICULO FROM venta GROUP BY id_articulo;