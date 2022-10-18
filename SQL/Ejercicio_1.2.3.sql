DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados CHARACTER SET utf8mb4;
USE empleados;

CREATE TABLE departamento (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE UNSIGNED NOT NULL,
  gastos DOUBLE UNSIGNED NOT NULL
);

CREATE TABLE empleado (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  codigo_departamento INT UNSIGNED,
  FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

SELECT * FROM departamento;
SELECT * FROM empleado;

	-- 1.2.3 ---------------------------------------------------------------------------------------------------------------------------------

-- Lista el primer apellido de todos los empleados.

SELECT apellido1 
FROM empleado
;

-- Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.

SELECT DISTINCT(apellido1) 
FROM empleado
;

-- Lista todas las columnas de la tabla empleado.

SELECT codigo, nif, nombre, apellido1, apellido2, codigo_departamento
FROM empleado
;

-- Lista el nombre y los apellidos de todos los empleados.

SELECT nombre, apellido1, apellido2
FROM empleado
;

-- Lista el código de los departamentos de los empleados que aparecen en la tabla empleado.

SELECT codigo_departamento
FROM empleado
;

-- Lista el código de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los códigos que aparecen repetidos.

SELECT DISTINCT(codigo_departamento)
FROM empleado
;

-- Lista el nombre y apellidos de los empleados en una única columna.

SELECT concat_ws(' ', nombre, apellido1, apellido2) nombre_completo
FROM empleado
;

-- Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.

SELECT upper(CONCAT_WS(' ', nombre, apellido1, apellido2)) nombre_completo
FROM empleado
;

-- Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.

SELECT lower(CONCAT_WS(' ', nombre, apellido1, apellido2)) nombre_completo
FROM empleado
;

-- Lista el código de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.

SELECT codigo, left(nif,8), right(nif,1)
FROM empleado
;

SELECT nif
FROM empleado
;

-- Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. 
-- Para calcular este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) los gastos que se han generado (columna gastos). 
-- Tenga en cuenta que en algunos casos pueden existir valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.

SELECT nombre, (presupuesto - gastos) presupuesto_actual
FROM departamento
;

-- Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.

SELECT nombre, (presupuesto - gastos) presupuesto_actual
FROM departamento
ORDER BY presupuesto_actual asc
;

-- Lista el nombre de todos los departamentos ordenados de forma ascendente.

SELECT nombre
FROM departamento
ORDER BY nombre asc
;

-- Lista el nombre de todos los departamentos ordenados de forma desscendente.

SELECT nombre
FROM departamento
ORDER BY nombre desc
;

-- Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.

SELECT nombre, apellido1, apellido2
FROM empleado
ORDER BY apellido1, apellido2, nombre
;

-- Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.

SELECT nombre, presupuesto
FROM departamento
ORDER BY presupuesto desc
LIMIT 3
;

-- Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.

SELECT nombre, presupuesto
FROM departamento
ORDER BY presupuesto asc
LIMIT 3
;

-- Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.

SELECT nombre, gastos
FROM departamento
ORDER BY gastos desc
LIMIT 2
;

-- Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.

SELECT nombre, gastos
FROM departamento
ORDER BY gastos asc
LIMIT 2
;

-- Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. 
-- La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.

SELECT *
FROM empleado
LIMIT 2,5 
;

-- Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto > 150000
;

-- Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.

SELECT nombre, gastos
FROM departamento
WHERE gastos < 5000
;

-- Devuelve una lista con el nombre de los departamentos y el presupesto, de aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.

SELECT nombre, presupuesto
FROM departamento
WHERE 100000 <= presupuesto AND presupuesto <= 200000
;

-- Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.

SELECT nombre, presupuesto
FROM departamento
WHERE 100000 >= presupuesto OR presupuesto >= 200000
;

-- Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto BETWEEN 100000 AND 200000
;

-- Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto NOT BETWEEN 100000 AND 200000
;

-- Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de quellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.

SELECT nombre, gastos, presupuesto
FROM departamento
WHERE gastos > presupuesto
;

-- Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.

SELECT nombre, gastos, presupuesto
FROM departamento
WHERE gastos < presupuesto
;

-- Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.

SELECT nombre, gastos, presupuesto
FROM departamento
WHERE gastos = presupuesto
;

-- Lista todos los datos de los empleados cuyo segundo apellido sea NULL.

SELECT *
FROM empleado
WHERE apellido2 is NULL
;

-- Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.

SELECT *
FROM empleado
WHERE apellido2 is not NULL
;

-- Lista todos los datos de los empleados cuyo segundo apellido sea López.

SELECT *
FROM empleado
WHERE apellido2 = 'López'
;

-- Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.

SELECT *
FROM empleado
WHERE apellido2 = 'Díaz' OR apellido2 = 'Moreno'
;

-- Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.

SELECT *
FROM empleado
WHERE apellido2 IN('Díaz', 'Moreno')
;

-- Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.

SELECT nombre, apellido1, apellido2, nif
FROM empleado
WHERE codigo_departamento = 3
;

-- Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.

SELECT nombre, apellido1, apellido2, nif
FROM empleado
WHERE codigo_departamento IN (2,4,5)
;