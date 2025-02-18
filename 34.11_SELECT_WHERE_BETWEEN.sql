/*
BETWEEN
El operador BETWEEN se utiliza en SQL para filtrar resultados basados 
en un rango de valores.

Permite seleccionar registros donde un valor se encuentra dentro de 
un rango específico, incluyendo los límites del rango.
*/


-- Mostrar todos los productos cuyo precio es de 10 a 30 dólares
USE deltron
GO

SELECT 
	cod_prd_in AS Codigo, 
	nom_prd_vc AS Producto, 
	pre_ven_prd_mo AS Monto
FROM Almacen.producto
WHERE pre_ven_prd_mo BETWEEN 10 AND 30
ORDER BY 3 DESC
GO

--------------------------------------------------------------------
--mostrar los beneficiarios que nacieron entre 15 de enero  y 15 de febrero del 2004
USE pvl
GO
SELECT
    nom_ben_vc AS Nombres,
	CONVERT(CHAR,fec_nac_ben_da,103) AS Fecha, 
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE fec_nac_ben_da BETWEEN '20040115' AND '20040215'
ORDER BY fec_nac_ben_da
GO