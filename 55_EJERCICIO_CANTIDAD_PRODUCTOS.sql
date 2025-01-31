/*
Mostrar la cantidad de productos registrados por categoria
usando la base de datos AdventureWorks2022
*/

USE AdventureWorks2022
GO
CREATE OR ALTER VIEW v_categorias_x_productos_cantidad_registrada
AS
SELECT
    TOP 99.999 PERCENT
    c.Name AS nombreCategoria,
	COUNT(*) AS Cantidad
FROM Production.ProductCategory c
INNER JOIN Production.ProductSubcategory sc
ON c.ProductCategoryID = sc.ProductCategoryID
INNER JOIN Production.Product p
ON sc.ProductSubcategoryID = p.ProductSubcategoryID
GROUP BY c.Name
ORDER BY 2 DESC
GO
SELECT * FROM v_categorias_x_productos_cantidad_registrada
GO