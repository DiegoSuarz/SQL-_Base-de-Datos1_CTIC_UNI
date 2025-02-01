
/*
    Agregar la clave alterna a la base de datos NorthwindSQL
*/
USE NorthwindSQL
GO

SELECT [Código de producto] FROM Almacen.Productos GO

SELECT
    [Código de producto], COUNT(*)
FROM Almacen.Productos
GROUP BY [Código de producto]
ORDER BY 2 DESC
GO

----------------------------------------------------------------------------------
--NO SE PUEDE CREAR LLAVE ALTERNA SI SE REPITEN 2 COGIDO
SELECT        Id, [Código de producto], Categoría, [Nombre del producto]
FROM            Almacen.Productos
WHERE        ([Código de producto] = 'NWTJP-6')

SELECT        Id, [Código de producto], Categoría, [Nombre del producto]
FROM            Almacen.Productos
WHERE        ([Código de producto] = 'NWTC-82')

----------------------------------------------------------------------------------
--AGREGAMOS LA CLAVE ALTERNA

USE NorthwindSQL
GO
IF EXISTS
(
    SELECT name
    FROM sysobjects
    WHERE
        xtype = 'UQ' --UNIQUE
    AND
        name = 'ak_almacen_productos_codigo_de_producto' --NOMBRE DE LA CLAVE ALTERNA
)

ALTER TABLE Almacen.Productos
DROP CONSTRAINT ak_almacen_productos_codigo_de_producto
GO

ALTER TABLE Almacen.Productos
ADD CONSTRAINT ak_almacen_productos_codigo_de_producto
UNIQUE ([Código de producto])
GO

SELECT name
FROM sysobjects
WHERE
    xtype = 'UQ'
AND
    name = 'ak_almacen_productos_codigo_de_producto'
GO