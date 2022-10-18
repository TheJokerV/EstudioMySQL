-- 1.1.4 ---------------------------------------------------------------------------------------------------------------------------------

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

SELECT pro.nombre, pro.precio, fab.nombre nombre_fabricante
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. 
-- Ordene el resultado por el nombre del fabricante, por orden alfabético.

SELECT pro.nombre, pro.precio, fab.nombre nombre_fabricante
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
ORDER BY fab.nombre asc
;

-- Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.

SELECT pro.codigo, pro.nombre, fab.codigo codigo_fabricante, fab.nombre nombre_fabricante
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

SELECT pro.nombre, pro.precio, fab.nombre nombre_fabricante
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE pro.precio = (SELECT Min(precio) FROM producto)
;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

SELECT pro.nombre, pro.precio, fab.nombre nombre_fabricante
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE pro.precio = (SELECT Max(precio) FROM producto)
;

-- Devuelve una lista de todos los productos del fabricante Lenovo.

SELECT pro.codigo, pro.nombre, fab.nombre nombre_fabricante
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre = 'Lenovo'
;

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

SELECT pro.codigo, pro.nombre, pro.precio, fab.nombre nombre_fabricante
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre = 'Crucial' AND pro.precio > 200
;

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.

SELECT pro.codigo, pro.nombre, pro.precio, fab.nombre nombre_fabricante
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre = 'Asus' OR fab.nombre = 'Hewlett-Packard' OR fab.nombre = 'Seagate'
;

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Utilizando el operador IN.

SELECT pro.codigo, pro.nombre, pro.precio, fab.nombre nombre_fabricante
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre IN('Asus', 'Hewlett-Packard', 'Seagate')
;

-- Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

SELECT pro.nombre, pro.precio, fab.nombre nombre_fabricante
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre LIKE '%e'
;

-- Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.

SELECT pro.nombre, pro.precio, fab.nombre nombre_fabricante
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE fab.nombre LIKE '%w%'
;

-- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. 
-- Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

SELECT pro.nombre, pro.precio, fab.nombre nombre_fabricante
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE pro.precio >= 180
ORDER BY pro.precio desc, pro.nombre asc
;

-- Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

SELECT fab.codigo, fab.nombre, pro.nombre
FROM producto pro INNER JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
ORDER BY fab.codigo
;