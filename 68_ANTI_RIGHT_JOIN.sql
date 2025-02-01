/*
Anticombinación derecha
La anticombinación derecha (o RIGHT ANTI JOIN) es una operación que se utiliza para obtener
filas de la tabla de la derecha que no tienen coincidencias en la tabla de la izquierda.

Al igual que con la anticombinación izquierda, SQL Server no tiene una sintaxis explícita 
para esto, pero se puede lograr utilizando una combinación de RIGHT JOIN y la cláusula WHERE.
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
RIGHT JOIN empleado e
ON d.cod_dep_in = e.cod_dep_in
WHERE d.cod_dep_in IS NULL
GO

------------------------------------------------
USE ConsultasAvanzadas
GO
SELECT e.*
FROM departamento d
RIGHT JOIN empleado e
ON d.cod_dep_in = e.cod_dep_in
WHERE d.cod_dep_in IS NULL
GO