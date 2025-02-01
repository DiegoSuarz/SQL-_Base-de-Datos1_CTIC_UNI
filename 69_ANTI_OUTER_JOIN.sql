/*
Anticombinaci�n completa
La anticombinaci�n completa (o FULL ANTI JOIN) es un concepto que se refiere 
a la combinaci�n de resultados de anticombinaciones izquierda y derecha.

Aunque SQL Server no tiene una sintaxis espec�fica para la anticombinaci�n completa, 
puedes lograr este resultado combinando la l�gica de las anticombinaciones izquierda y derecha.
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
FULL OUTER JOIN empleado e
ON d.cod_dep_in = e.cod_dep_in
WHERE d.cod_dep_in IS NULL OR e.cod_emp_in IS NULL
GO