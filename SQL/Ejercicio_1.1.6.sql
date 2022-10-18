-- Calcula el número total de productos que hay en la tabla productos.

SELECT COUNT(codigo) cantidad_productos
FROM producto
;

-- Calcula el número total de fabricantes que hay en la tabla fabricante.

SELECT COUNT(codigo) cantidad_fabricantes
FROM fabricante
;

-- Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.

SELECT COUNT(DISTINCT(codigo_fabricante)) cantidad_fabricantesProducto
FROM producto
;

-- Calcula la media del precio de todos los productos.

SELECT AVG(precio) promedio
FROM producto
;

-- Calcula el precio más barato de todos los productos.

SELECT MIN(precio)
FROM producto
;

-- Calcula el precio más caro de todos los productos.

SELECT MAX(precio)
FROM producto
;

-- Lista el nombre y el precio del producto más barato.

SELECT nombre, precio
FROM producto
WHERE precio = (SELECT MIN(precio) FROM producto);

-- Lista el nombre y el precio del producto más caro.

SELECT nombre, precio
FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto);

-- Calcula la suma de los precios de todos los productos.

SELECT SUM(precio) 
FROM producto
;

-- Calcula el número de productos que tiene el fabricante Asus.

SELECT COUNT(pro.codigo) cantidad_productos_Asus
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre = 'Asus'
;

-- Calcula la media del precio de todos los productos del fabricante Asus.

SELECT AVG(pro.precio) precio_productos_Asus
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre = 'Asus'
;

-- Calcula el precio más barato de todos los productos del fabricante Asus.

SELECT MIN(pro.precio) precio_barato_Asus
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre = 'Asus'
;

-- Calcula el precio más caro de todos los productos del fabricante Asus.

SELECT MAX(pro.precio) precio_caro_Asus
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre = 'Asus'
;

-- Calcula la suma de todos los productos del fabricante Asus.

SELECT SUM(pro.precio) suma_precios_Asus
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre = 'Asus'
;

-- Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.

SELECT MAX(pro.precio), MIN(pro.precio), AVG(pro.precio), COUNT(pro.codigo)
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre = 'Crucial'
;

-- Muestra el número total de productos que tiene cada uno de los fabricantes. 
-- El listado también debe incluir los fabricantes que no tienen ningún producto. 
-- El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. 
-- Ordene el resultado descendentemente por el número de productos.

SELECT fab.nombre, COUNT(pro.codigo) cantidad_productos
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo
group by fab.nombre
ORDER BY cantidad_productos DESC
; 

-- Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. 
-- El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.

SELECT fab.nombre, MAX(pro.precio), MIN(pro.precio), AVG(pro.precio)
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo
GROUP BY fab.nombre
;

-- Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
-- No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.

SELECT fab.codigo codigo_fabricante, MAX(pro.precio), MIN(pro.precio), AVG(pro.precio), COUNT(pro.codigo)
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo
GROUP BY codigo_fabricante
HAVING AVG(pro.precio) > 200
;

-- Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
-- Es necesario mostrar el nombre del fabricante.

SELECT fab.nombre, MAX(pro.precio), MIN(pro.precio), AVG(pro.precio), COUNT(pro.codigo)
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo
GROUP BY fab.nombre
HAVING AVG(pro.precio) > 200
;

-- Calcula el número de productos que tienen un precio mayor o igual a 180€.

SELECT COUNT(codigo) cantidad_productos
FROM producto
WHERE precio >= 180
;

-- Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.

SELECT fab.nombre, COUNT(pro.codigo) cantidad_productos
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo
WHERE pro.precio >= 180
GROUP BY fab.nombre
;

-- Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.

SELECT fab.codigo, AVG(pro.precio) precio_medio
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo
GROUP BY fab.codigo
;

SELECT fab.codigo
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo
GROUP BY fab.codigo
ORDER BY AVG(pro.precio) DESC
;

-- Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.

SELECT fab.nombre, AVG(pro.precio) precio_medio
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo
GROUP BY fab.nombre
;

SELECT fab.nombre
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo
GROUP BY fab.nombre
ORDER BY AVG(pro.precio) DESC
;

-- Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.

SELECT fab.nombre
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo
GROUP BY fab.nombre
HAVING AVG(pro.precio) >= 150
;

-- Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.

SELECT fab.nombre
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo
GROUP BY fab.nombre
HAVING COUNT(pro.codigo) >= 2 
;

-- Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €.
-- No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.

SELECT fab.nombre, COUNT(pro.codigo) total
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo
WHERE pro.precio >= 220 
GROUP BY fab.nombre
ORDER BY total DESC
;

-- Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
-- El listado debe mostrar el nombre de todos los fabricantes, es decir, 
-- si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.

SELECT fab.nombre, COUNT(CASE WHEN pro.precio >= 220 THEN fab.nombre ELSE NULL END) total
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo
GROUP BY fab.nombre
ORDER BY total DESC
;

-- Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.

SELECT fab.nombre, SUM(pro.precio)
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo
GROUP BY fab.nombre
HAVING SUM(pro.precio) > 1000
;

-- Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. 
-- El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. 
-- El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.

SELECT nombre_fabricante, nombre_producto, precio 
FROM (SELECT  fab.nombre nombre_fabricante, pro.nombre nombre_producto, pro.precio, RANK() OVER (partition by fab.nombre ORDER BY precio DESC)  mayor
FROM fabricante fab LEFT JOIN producto pro ON pro.codigo_fabricante = fab.codigo) WindowsFunctionMayor
WHERE mayor = 1
;