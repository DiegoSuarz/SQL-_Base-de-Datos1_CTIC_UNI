/*
Combinaciones
UNION
La cláusula UNION en SQL Server se utiliza para combinar los resultados de dos o más
consultas SELECT en una sola.

Esta combinación se realiza de manera que los resultados de cada consulta se apilan uno sobre otro, 
eliminando duplicados. Si deseas incluir duplicados, puedes usar UNION ALL.

Se unen tablas de forma vertical

Elimina filas repetidas
*/

USE master
GO 
IF EXISTS  --existe la base de datos  ConsultasAvanzadas?
(
    SELECT name
    FROM sysdatabases
    WHERE name ='ConsultasAvanzadas' 
)
DROP DATABASE ConsultasAvanzadas
GO
----
CREATE DATABASE ConsultasAvanzadas
GO

---
USE ConsultasAvanzadas
GO
---
CREATE TABLE Superior
(
    A INT,
    B INT,
    C INT,
)
GO
---
CREATE TABLE Inferior
(
    A INT,
    B INT,
    D INT,
)
GO
INSERT INTO Superior(A, B, C)
Values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3)
GO
INSERT INTO Inferior(A, B, D)
Values
(4, 4, 4),
(5, 5, 5)
GO
---

SELECT A, B, C FROM Superior
SELECT A, B, D FROM Inferior
GO

---
SELECT A, B, C FROM Superior
UNION
SELECT A, B, D FROM Inferior
GO

---------------------------------------------------------------------------------------------------

