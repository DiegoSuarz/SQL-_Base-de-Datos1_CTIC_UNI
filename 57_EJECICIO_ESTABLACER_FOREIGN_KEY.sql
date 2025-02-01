
/*
    Agregar la clave alterna a la base de datos NorthwindSQL
*/
USE NorthwindSQL
GO

SELECT [C�digo de producto] FROM Almacen.Productos GO

SELECT
    [C�digo de producto], COUNT(*)
FROM Almacen.Productos
GROUP BY [C�digo de producto]
ORDER BY 2 DESC
GO

----------------------------------------------------------------------------------
--NO SE PUEDE CREAR LLAVE ALTERNA SI SE REPITEN 2 COGIDO
SELECT        Id, [C�digo de producto], Categor�a, [Nombre del producto]
FROM            Almacen.Productos
WHERE        ([C�digo de producto] = 'NWTJP-6')

SELECT        Id, [C�digo de producto], Categor�a, [Nombre del producto]
FROM            Almacen.Productos
WHERE        ([C�digo de producto] = 'NWTC-82')

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
UNIQUE ([C�digo de producto])
GO

SELECT name
FROM sysobjects
WHERE
    xtype = 'UQ'
AND
    name = 'ak_almacen_productos_codigo_de_producto'
GO