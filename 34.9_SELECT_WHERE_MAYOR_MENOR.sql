/*
Operadores de relación
Operador			Descripción
>					Mayor que: comprueba si el valor de la izquierda es mayor que el de la derecha.
<					Menor que: comprueba si el valor de la izquierda es menor que el de la derecha.
>=					Mayor o igual que: comprueba si el valor de la izquierda es mayor o igual al de la derecha.
<=					Menor o igual que: comprueba si el valor de la izquierda es menor o igual al de la derecha.
*/

--Consultas usando >=

-- Mostrar todos los productos cuyo precio es >= 6000
USE deltron
GO
SELECT 
		cod_prd_in AS Codigo, 
		nom_prd_vc AS Producto, 
		pre_ven_prd_mo Valor
FROM Almacen.producto
WHERE pre_ven_prd_mo >= 6000
ORDER BY 3 DESC
GO


--Consultas usando <

-- Mostrar todos los productos cuyo precio es < 1
USE deltron
GO
SELECT 
		cod_prd_in AS Codigo, 
		nom_prd_vc AS Producto, 
		pre_ven_prd_mo Valor
FROM Almacen.producto
WHERE pre_ven_prd_mo < 1
ORDER BY 3 DESC
GO

