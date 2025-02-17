/*
Vistas
Las vistas en SQL Server son objetos de base de datos que almacenan
consultas SQL.

Actúan como una tabla virtual, permitiendo a los usuarios seleccionar 
y manipular datos de una o más tablas subyacentes sin necesidad de acceder 
directamente a esas tablas.

Características
Consulta Almacenada: Una vista es esencialmente una consulta SQL que se 
guarda en la base de datos. Puede incluir complejas uniones, filtros y 
agregaciones.

Personalización de Datos: Las vistas permiten a los usuarios ver datos en 
un formato específico, facilitando la personalización y simplificación de 
las consultas.

Seguridad: Se pueden utilizar vistas para restringir el acceso a ciertos 
datos, mostrando solo las columnas y filas necesarias a los usuarios.

Facilidad de Uso: Ayudan a simplificar las consultas complejas, permitiendo
a los desarrolladores y analistas acceder a los datos sin tener que recordar
la estructura de la base de datos.

Actualizables: Algunas vistas son actualizables, lo que significa que los 
usuarios pueden realizar operaciones de inserción, actualización y eliminación
a través de la vista, y los cambios se reflejan en las tablas subyacentes.
*/


USE Northwind
GO
CREATE OR ALTER VIEW v_sctock
AS
SELECT
    ProductID AS Código,
    ProductName AS Producto,
    UnitsInStock AS Stock
FROM Products
GO
------------------
SELECT * FROM v_sctock
GO

--------------------------------------------------------------------

-- Crear una vista que muestra la cantidad de productos diferentes
-- por categoria
USE Northwind
GO
IF EXISTS
(
    SELECT name
    FROM sys.views
    WHERE name = 'v_categoria_x_cnt_de_productos'
)
DROP VIEW v_categoria_x_cnt_de_productos
GO
CREATE VIEW v_categoria_x_cnt_de_productos
AS
    SELECT c.CategoryID, CategoryName, COUNT(*) AS Cantidad
    FROM Categories c
    INNER JOIN Products p
    ON c.CategoryID = p.CategoryID
    GROUP BY c.CategoryID, CategoryName
GO

-----------------
SELECT *
FROM v_categoria_x_cnt_de_productos
GO


--------------------------------------------------------------------

USE NorthwindSQL
GO
CREATE OR ALTER VIEW v_stock
AS
SELECT TOP 99.99 PERCENT
    Id, [Nombre del producto],
    SUM
    (
        CONVERT
        (
            INT,
            CASE ti.[Tipo de transacción]
                WHEN 1 THEN '+'
                WHEN 2 THEN '-'
                WHEN 3 THEN '-'
                WHEN 4 THEN '+'
            END + LTRIM(ti.Cantidad)
        )
    ) AS Stock
FROM Almacen.Productos p
INNER JOIN Almacen.[Transacciones de inventario] ti
ON p.Id = ti.[Id de producto]
GROUP BY Id, [Nombre del producto]
ORDER BY 3 DESC
GO
SELECT * FROM v_stock
GO