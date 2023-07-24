CREATE DATABASE prueba;

use prueba;

-- 1.8. Usando las siguientes tablas de referencia, escribe la consulta que devuelva el 
-- SEGUNDO producto más caro de cada local (es decir, la respuesta tiene que traer los registros correspondientes de Prod A y Prod D).

CREATE TABLE `LOCAL` (

	id_local INT NOT NULL PRIMARY KEY auto_increment,
    nombre varchar(45)
);

INSERT INTO `LOCAL`(id_local, nombre)
VALUES
	(1, 'Local 1'),
    (2, 'Local 2');

CREATE TABLE `PRODUCTO` (

	id INT NOT NULL PRIMARY KEY auto_increment,
    producto varchar(45) NOT NULL,
    monto FLOAT NOT NULL,
    id_local INT NOT NULL,
    
    FOREIGN KEY(id_local) references local(id_local) 

);

INSERT INTO `PRODUCTO`(id, producto, monto, id_local)
VALUES
	(1, 'Prod A', 70000, 1), 
    (2, 'Prod B', 90000, 1),
    (3, 'Prod C', 80000, 2),
    (4, 'Prod D', 60000, 2),
    (5, 'Prod E', 90000, 1)
;

SELECT * FROM (
	SELECT id_local, producto,
	DENSE_RANK() over (partition by id_local order by monto desc) AS rank_monto
	FROM PRODUCTO) ranking
WHERE ranking.rank_monto = 2;

-- -----------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM LOCAL;
SELECT * FROM PRODUCTO;

DROP TABLE LOCAL;
DROP TABLE PRODUCTO;