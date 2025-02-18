USE Northwind
GO
SELECT DISTINCT CustomerID --Obtiene valores únicos de la columna CustomerID, eliminando duplicados.
FROM Orders


--------------------------------------------------------------------------------
USE pvl
GO

----
SELECT
    cod_ben_in AS Código,
    pat_ben_vc AS Paterno,
    mat_ben_vc AS Materno,
    nom_ben_vc AS Nombres,
    fec_nac_ben_da AS [Fecha de Nacimiento],
    CONVERT(CHAR(10), fec_nac_ben_da, 103) AS [Fecha de Nacimiento], --CONVERTIR LA FECHA A FORMATO PERUANO
    dni_ben_ch AS DNI,
    cod_sex_bi AS Sexo
FROM Beneficiario
GO

----
SELECT
    cod_ben_in AS Código,
    pat_ben_vc AS Paterno,
    mat_ben_vc AS Materno,
    nom_ben_vc AS Nombres,
    CONVERT(CHAR(10), fec_nac_ben_da, 103) AS [Fecha de Nacimiento],
    dni_ben_ch AS DNI,
    cod_sex_bi AS Sexo,
    DATEDIFF(DAY, fec_nac_ben_da, '20040731') AS Días,
    DATEDIFF(DAY, fec_nac_ben_da, '20040731')/365.256363004 AS Edad1,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, '20040731')/365.256363004) AS [Edad Exacta],
    CONVERT(INT, DATEDIFF(YEAR, fec_nac_ben_da, '20040731')) AS Edad
	
FROM Beneficiario
WHERE
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, '20040731')/365.256363004)
    <>
    CONVERT(INT, DATEDIFF(YEAR, fec_nac_ben_da, '20040731'))
GO
----

SELECT
    cod_ben_in AS Código,
    pat_ben_vc AS Paterno,
    mat_ben_vc AS Materno,
    nom_ben_vc AS Nombres,
    CONVERT(CHAR(10), fec_nac_ben_da, 103) AS [Fecha de Nacimiento],
    dni_ben_ch AS DNI,
	cod_sex_bi,
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo_choose, --La función CHOOSE(index, value1, value2, ...) devuelve el valor correspondiente a la posición index.
	CASE cod_sex_bi WHEN 0 THEN 'FEMENINO' WHEN 1 THEN 'MASCULINO' END  AS Sexo_CASE,
	CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE
    fec_nac_ben_da = '20040115'
GO