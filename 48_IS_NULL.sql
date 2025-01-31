/*
Operador IS NULL
El operador IS NULL en SQL Server se utiliza para verificar si una columna o e
xpresión tiene un valor nulo (NULL).

Es especialmente útil en consultas para filtrar o identificar registros que no 
tienen un valor asignado.
*/

-- Northwind: ¿Que registros de la orden de pedidos no han sido entregados?

USE Northwind
GO
SELECT *
FROM Orders
WHERE ShippedDate IS NULL
GO

--------------------------------------------------------------------------
-- PVL: ¿Mostrar los beneficiarios registrados como madres gestantes?

USE pvl
GO
SELECT *
FROM Beneficiario
WHERE fec_emb_ben_da IS NOT NULL
GO