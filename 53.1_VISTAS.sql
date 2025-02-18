/*
VISTAS
En SQL Server, una vista es un objeto de base de datos que actúa como una tabla virtual.

Características
Definición: Una vista se define mediante una consulta SQL que puede incluir una 
			o más tablas. No almacena datos por sí misma; en cambio, muestra 
			los datos de las tablas subyacentes.
Simplicidad: Las vistas pueden simplificar consultas complejas. Puedes encapsular 
			una consulta complicada en una vista y luego acceder a ella como si 
			fuera una tabla normal.
Seguridad: Las vistas pueden usarse para restringir el acceso a ciertos datos. 
			Por ejemplo, puedes crear una vista que muestre solo algunas columnas 
			de una tabla, permitiendo a los usuarios ver solo la información que necesitan.
Mantenimiento: Cambiar la estructura de las tablas subyacentes puede ser más fácil 
			si utilizas vistas, ya que puedes ajustar la vista sin afectar a las 
			consultas que dependen de ella.
Actualizables: Algunas vistas son actualizables, lo que significa que puedes realizar 
			operaciones de inserción, actualización y eliminación a través de ellas, 
			siempre que se cumplan ciertas condiciones.
*/

--CREACION DE UNA VISTA:

/*
    Mostrar la cantidad de productos registrados
    por categoría usando la base de datos Northwind.
*/
USE Northwind
GO
SELECT
    c.CategoryName AS Categoría,
    COUNT(*) AS Cantidad
FROM Categories c
INNER JOIN Products p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY 2 DESC
GO

---------------------------------------------------------------------
/*
    Mostrar la cantidad de productos registrados
    por categoría usando la base de datos Northwind.
*/
USE Northwind
GO
IF EXISTS
(
    SELECT name
    FROM sys.views
    WHERE name = 'v_categoria_x_producto_cantidad_registrada'
)
DROP VIEW v_categoria_x_producto_cantidad_registrada
GO
CREATE VIEW v_categoria_x_producto_cantidad_registrada
AS
    SELECT TOP 99.9 PERCENT --PARA ORDENAR LA TABLA
        c.CategoryName AS Categoría,
        COUNT(*) AS Cantidad
    FROM Categories c
    INNER JOIN Products p
    ON c.CategoryID = p.CategoryID
    GROUP BY c.CategoryName
    ORDER BY 2 DESC
GO

---------------------------------------------------------
SELECT * FROM v_categoria_x_producto_cantidad_registrada
GO