/*
Combinaci�n externa completa
imagen.png

La combinaci�n externa completa (o FULL OUTER JOIN) en SQL Server es una 
operaci�n que permite combinar filas de dos tablas basadas en una relaci�n entre ellas.

Esta combinaci�n incluye todas las filas de ambas tablas: las filas que tienen 
coincidencias se combinan, y las filas que no tienen coincidencias en una de las
tablas se llenan con valores NULL.
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
FULL OUTER JOIN empleado e
ON d.cod_dep_in = e.cod_dep_in
GO

------------------------------------------------
USE ConsultasAvanzadas
GO
SELECT *
FROM departamento d
FULL JOIN empleado e
ON d.cod_dep_in = e.cod_dep_in
GO