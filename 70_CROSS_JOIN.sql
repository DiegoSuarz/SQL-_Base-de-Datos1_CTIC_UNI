/*
Combinación cruzada
La combinación cruzada (o CROSS JOIN) en SQL Server es una operación que produce
el producto cartesiano de dos tablas.

Esto significa que cada fila de la primera tabla se combina con cada fila de
la segunda tabla, resultando en un conjunto de datos que contiene todas las 
combinaciones posibles de las filas de ambas tablas.
*/

USE ConsultasAvanzadas
GO
----------------------------
SELECT *
FROM departamento
SELECT *
FROM empleado
------------------------------

SELECT nom_dep_vc, nom_emp_vc
FROM departamento
CROSS JOIN empleado
ORDER BY 1
GO