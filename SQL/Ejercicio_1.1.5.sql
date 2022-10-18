-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. 
-- El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.

SELECT fab.codigo, fab.nombre, pro.codigo codigo_producto, pro.nombre nombre_producto, pro.precio
FROM fabricante fab LEFT JOIN producto pro ON fab.codigo = pro.codigo_fabricante
;

-- Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

SELECT *
FROM fabricante fab LEFT JOIN producto pro ON fab.codigo = pro.codigo_fabricante
WHERE pro.codigo is NULL;

-- ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.

SELECT *
FROM producto pro LEFT JOIN fabricante fab ON fab.codigo = pro.codigo_fabricante
WHERE pro.codigo_fabricante is NULL;