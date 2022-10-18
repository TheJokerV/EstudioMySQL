	-- 1.1.7.1 Con operadores básicos de comparación

-- Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT *
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo')
;

-- Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

-- 						NO SE ENTIENDE LA PREGUNTA

-- Lista el nombre del producto más caro del fabricante Lenovo.

SELECT pro.nombre, MAX(pro.precio)
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre = 'Lenovo'
;

SELECT nombre, MAX(precio)
FROM producto
WHERE codigo_fabricante = 2
;

-- Lista el nombre del producto más barato del fabricante Hewlett-Packard.

SELECT pro.nombre, MIN(pro.precio)
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre = 'Hewlett-Packard'
;

SELECT nombre, MIN(precio)
FROM producto
WHERE codigo_fabricante = 3
;

-- Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

SELECT *
FROM producto
WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2)
;

-- Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.

SELECT *
FROM producto
WHERE codigo_fabricante = 1 AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = 1) 
;

	-- 1.1.7.2 Subconsultas con ALL y ANY
    
-- Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.

SELECT *
FROM producto
WHERE precio >= ALL(SELECT precio FROM producto )
;

-- Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.

SELECT *
FROM producto
WHERE precio <= ALL(SELECT precio FROM producto)
;

-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).

SELECT nombre 
FROM fabricante
WHERE codigo = ANY(SELECT codigo_fabricante FROM producto)
;

-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).

SELECT nombre
FROM fabricante
WHERE codigo <> ALL(SELECT codigo_fabricante FROM producto)
;

	-- 1.1.7.3 Subconsultas con IN y NOT IN
    
-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).

SELECT nombre
FROM fabricante
WHERE codigo IN(SELECT codigo_fabricante FROM producto)
;

-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).

SELECT nombre
FROM fabricante
WHERE codigo NOT IN(SELECT codigo_fabricante FROM producto)
;

	-- 1.1.7.4 Subconsultas con EXISTS y NOT EXISTS
    
-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT nombre
FROM fabricante fab
WHERE EXISTS(SELECT * FROM producto pro WHERE pro.codigo_fabricante = fab.codigo)
;

-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT nombre
FROM fabricante fab
WHERE NOT EXISTS(SELECT * FROM producto pro WHERE pro.codigo_fabricante = fab.codigo)
;

	-- 1.1.7.5 Subconsultas correlacionadas
    
-- Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

SELECT fab.nombre, pro.nombre, pro.precio
FROM fabricante fab INNER JOIN producto pro ON pro.codigo_fabricante = fab.codigo
WHERE pro.precio = ANY(SELECT MAX(precio) FROM producto pro2 WHERE pro2.codigo_fabricante = pro.codigo_fabricante)
ORDER BY fab.nombre;
;

-- Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.

SELECT fab.nombre, pro.nombre, pro.precio
FROM fabricante fab INNER JOIN producto pro ON pro.codigo_fabricante = fab.codigo
WHERE pro.precio >= ALL(SELECT AVG(precio) FROM producto pro2 WHERE pro2.codigo_fabricante = pro.codigo_fabricante)
ORDER BY fab.nombre;
;

-- Lista el nombre del producto más caro del fabricante Lenovo.

SELECT pro.nombre, MAX(pro.precio)
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre = 'Lenovo'
;

		-- 1.1.8 Subconsultas (En la cláusula HAVING)
        
-- Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.

SELECT fab.nombre, COUNT(pro.nombre) cantidad
FROM fabricante fab INNER JOIN producto pro ON pro.codigo_fabricante = fab.codigo
GROUP BY fab.nombre
HAVING cantidad = (SELECT COUNT(nombre) FROM producto WHERE codigo_fabricante = 2)
;