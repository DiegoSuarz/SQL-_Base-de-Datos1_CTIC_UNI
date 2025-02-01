/*
Combinación externa izquierda
La combinación externa izquierda (o LEFT JOIN) en SQL Server es una operación que 
permite combinar filas de dos o más tablas basadas en una relación entre ellas.

Esta combinación incluye todas las filas de la tabla de la izquierda y solo las filas 
coincidentes de la tabla de la derecha.

Si no hay coincidencias, las columnas de la tabla de la derecha se llenan con valores NULL.
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
LEFT OUTER JOIN empleado e
ON d.cod_dep_in = e.cod_dep_in
GO

------------------------------------------------
USE ConsultasAvanzadas
GO
SELECT *
FROM departamento d
LEFT JOIN empleado e
ON d.cod_dep_in = e.cod_dep_in
GO