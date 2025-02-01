/*
Combinaci�n interna

La combinaci�n interna (o INNER JOIN) en SQL Server es una operaci�n que 
permite combinar filas de dos o m�s tablas basadas en una relaci�n entre ellas.

Esta combinaci�n incluye �nicamente las filas que tienen coincidencias en 
ambas tablas seg�n una condici�n especificada.
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