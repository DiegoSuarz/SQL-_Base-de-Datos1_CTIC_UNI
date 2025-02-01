/*
Anticombinación izquierda
La anticombinación izquierda (o LEFT ANTI JOIN) es una operación que se utiliza para obtener filas 
de una tabla que no tienen coincidencias en otra tabla.

SQL Server no tiene una sintaxis específica para la 
anticombinación izquierda, pero se puede lograr utilizando una combinación de LEFT JOIN 
y la cláusula WHERE.
*/

USE ConsultasAvanzadas
GO

SELECT * FROM departamento
GO
---
SELECT * FROM empleado
GO 

------------------------------------------------
SELECT *
FROM departamento d
LEFT JOIN empleado e
ON d.cod_dep_in = e.cod_dep_in
WHERE cod_emp_in IS NULL
GO

------------------------------------------------
SELECT d.*
FROM departamento d
LEFT JOIN empleado e
ON d.cod_dep_in = e.cod_dep_in
WHERE cod_emp_in IS NULL
GO