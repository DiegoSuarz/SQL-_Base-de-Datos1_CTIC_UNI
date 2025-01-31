/*
GROUP BY
El operador GROUP BY en SQL Server se utiliza para agrupar filas que tienen
valores id�nticos en columnas espec�ficas.

Es especialmente �til cuando se desea realizar funciones de agregaci�n 
(como SUM, COUNT, AVG, etc.) sobre esos grupos.

SUBCONSULTA
Una subconsulta en SQL es una consulta anidada dentro de otra consulta.

Se utiliza para realizar operaciones m�s complejas, permitiendo que una
consulta dependa de los resultados de otra.

Las subconsultas pueden aparecer en diferentes partes de una consulta 
principal, como en la cl�usula SELECT, FROM, o WHERE.
*/


/*

Ejemplos
    Mostrar los 5 apellidos que mas se repiten
	en la base de datos PVL.
	
	Considerar los apellidos paternos
    y maternos
*/


USE pvl
GO

SELECT pat_ben_vc --UNIR LOS APELLIDOS MATERNO Y PATERNOS INCLUYENDO LOS REPETIDOS
FROM Beneficiario
UNION ALL
SELECT  mat_ben_vc
FROM  Beneficiario
GO
---------------------------------------


USE pvl
GO
-- SUBCONSULTA
SELECT TOP 5  --LOS 5 APELLIDOS QUE MAS SE REPITEN
    pat_ben_vc AS Apellido,
    COUNT(*) AS Cantidad
FROM --SUBCONSULTA
(
    SELECT pat_ben_vc
    FROM Beneficiario
    UNION ALL
    SELECT mat_ben_vc
    FROM Beneficiario
) AS Apellidos
WHERE LEN(pat_ben_vc)>1
GROUP BY pat_ben_vc
ORDER BY 2 DESC --COLUMNA
GO

--------------------------------------------------------------------
--SOLO MOSTRAR LOS APELLIDOS:
USE pvl
GO
-- SUBCONSULTA
SELECT TOP 5
    pat_ben_vc AS Apellido
FROM
(
    SELECT pat_ben_vc
    FROM Beneficiario
    UNION ALL
    SELECT mat_ben_vc
    FROM Beneficiario
) AS Apellidos
WHERE LEN(pat_ben_vc)>1
GROUP BY pat_ben_vc
ORDER BY COUNT(*) DESC
GO

