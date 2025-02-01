/*
Anticombinaci�n izquierda
La anticombinaci�n izquierda (o LEFT ANTI JOIN) es una operaci�n que se utiliza para obtener filas 
de una tabla que no tienen coincidencias en otra tabla.

SQL Server no tiene una sintaxis espec�fica para la 
anticombinaci�n izquierda, pero se puede lograr utilizando una combinaci�n de LEFT JOIN 
y la cl�usula WHERE.
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