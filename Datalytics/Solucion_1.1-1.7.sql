use prueba;

CREATE TABLE IF NOT EXISTS `GG20 (Grupos G20)` (
	
	grupo varchar(45) NOT NULL PRIMARY KEY,
    continente varchar(45) NOT NULL UNIQUE
);

INSERT INTO `GG20 (Grupos G20)` (grupo, continente)
VALUES
	('Grupo 1', 'Europa'),
    ('Grupo 2', 'América'),
    ('Grupo 3', 'Asia'),
    ('Grupo 4', 'África'),
    ('Grupo 5', 'Oceanía');
    
CREATE TABLE IF NOT EXISTS `PG20 (Paises del G20)` (

	pais varchar(45) NOT NULL PRIMARY KEY,
    continente varchar(45) NOT NULL,
    poblacion FLOAT NOT NULL,
    area FLOAT NOT NULL,
	
    FOREIGN KEY (continente) REFERENCES `GG20 (grupos G20)`(continente)

);

INSERT INTO `PG20 (Paises del G20)`(pais, continente, poblacion, area)
VALUES
	('Alemania','Europa', 82293457, 348560),
    ('Arabia Saudita','Asia', 33, 2),
    ('Argentina','América', 1, 3),
    ('Australia','Oceanía', 2, 4),
    ('Brazil','América', 3, 5),
    ('Canadá','América', 4, 6),
    ('China','Asia', 5, 7),
    ('Estados Unidos','América', 6, 8),
    ('Francia','Europa', 7, 9),
    ('India','Asia', 8, 10),
    ('Indonesia','Asia', 9, 11),
    ('Italia','Europa', 10, 12),
    ('Japón','Asia', 11, 13),
    ('Korea','Asia', 12, 14),
    ('México','América', 13, 15),
    ('Rusia','Asia', 14, 16),
    ('Sudáfrica','África', 15, 17);
    
-- ----------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM `PG20 (Paises del G20)`;
SELECT * FROM `GG20 (Grupos G20)`;

DROP TABLE `PG20 (Paises del G20)`;
DROP TABLE `GG20 (Grupos G20)`;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- 1.1. 1.1) Escribe una consulta que devuelva
-- el detalle de Argentina (columnas: país, población, área, continente).

SELECT pg20.pais, pg20.poblacion, pg20.area, pg20.continente
FROM `PG20 (Paises del G20)` pg20
WHERE pg20.pais IN ('Argentina')
;

SELECT pais, poblacion, area, continente
FROM `PG20 (Paises del G20)`
WHERE pais = 'Argentina'
;

-- 1.2. Modificando la consulta anterior, agrega la columna “grupo”.

SELECT pg20.pais, pg20.poblacion, pg20.area, pg20.continente, gg20.grupo
FROM `PG20 (Paises del G20)` pg20 LEFT JOIN `GG20 (Grupos G20)` gg20 ON gg20.continente = pg20.continente
WHERE pg20.pais IN ('Argentina')
;

SELECT pg20.pais, pg20.poblacion, pg20.area, pg20.continente, gg20.grupo
FROM `PG20 (Paises del G20)` pg20 LEFT JOIN `GG20 (Grupos G20)` gg20 ON gg20.continente = pg20.continente
WHERE pg20.pais = 'Argentina'
;
    
-- 1.3. Escribe una consulta que devuelva los países de 
-- latinoamérica (Argentina, Mexico y Brazil) y su detalle (columnas: población y área).

SELECT pg20.pais, pg20.poblacion, pg20.area
FROM `PG20 (Paises del G20)` pg20
WHERE pg20.pais IN ('Argentina', 'Mexico', 'Brazil')
;

SELECT pais, poblacion, area
FROM `PG20 (Paises del G20)`
WHERE pais IN ('Argentina', 'México', 'Brazil')
;

    
-- 1.4. Escribe una consulta que calcule la densidad 
-- poblacional (población / área) y nombre la columna “densidad”.

SELECT pg20.pais, (pg20.poblacion/pg20.area) densidad
FROM `PG20 (Paises del G20)` pg20
;

SELECT pais, (poblacion/area) densidad
FROM `PG20 (Paises del G20)`
;

-- 1.5. Escribe la consulta que calcule la población 
-- para cada continente ordenada por población descendente.

SELECT pg20.continente, SUM(pg20.poblacion) AS poblacion_total
FROM `PG20 (Paises del G20)` pg20
GROUP BY pg20.continente
ORDER BY poblacion_total DESC
;

SELECT continente, SUM(poblacion) AS poblacion_total
FROM `PG20 (Paises del G20)`
GROUP BY continente
ORDER BY poblacion_total DESC
;
    
-- 1.6. Escribe la consulta que calcule la población total 
-- de los países Latinoamerica (Argentina, Mexico y Brazil).

SELECT SUM(pg20.poblacion) AS poblacion_total_latinoamerica
FROM `PG20 (Paises del G20)` pg20
WHERE pg20.pais IN('Argentina','Brazil','Mexico')
;

SELECT SUM(poblacion) poblacion_total_latinoamerica
FROM `PG20 (Paises del G20)`
WHERE pais IN('Argentina', 'Brazil', 'México')
;
    
-- 1.7. Escribe la consulta que devuelva el listado de todos 
-- los continentes con la cantidad de países donde esa cantidad sea mayor a 1.

SELECT pg20.continente, COUNT(pg20.continente) AS cantidad_paises
FROM `PG20 (Paises del G20)` pg20
GROUP BY pg20.continente
HAVING cantidad_paises > 1
;

SELECT continente, COUNT(continente) AS cantidad_paises
FROM `PG20 (Paises del G20)`
GROUP BY continente
HAVING cantidad_paises > 1
;