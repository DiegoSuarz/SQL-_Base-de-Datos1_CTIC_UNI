/*
Combinación interna

La combinación interna (o INNER JOIN) en SQL Server es una operación que 
permite combinar filas de dos o más tablas basadas en una relación entre ellas.

Esta combinación incluye únicamente las filas que tienen coincidencias en 
ambas tablas según una condición especificada.
*/
USE ConsultasAvanzadas
GO

SELECT * FROM departamento
GO
---
SELECT * FROM empleado
GO 

------------------------------------------------

USE ConsultasAvanzadas
GO
SELECT *
FROM departamento d
INNER JOIN empleado e
ON d.cod_dep_in = e.cod_dep_in
GO