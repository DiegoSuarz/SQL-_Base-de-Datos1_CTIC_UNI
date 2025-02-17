/*
Formas de colocar la fecha en una consulta
*/

USE pvl
GO


SELECT
    nom_ben_vc AS Nombres,
	fec_nac_ben_da AS Fecha,
    CONVERT(CHAR(10), fec_nac_ben_da, 103) AS [Fecha de Nacimiento],
	DATEDIFF(DAY, fec_nac_ben_da, '2004-07-31')/365.256363004 AS Edad1,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, '2004-07-31')/365.256363004) AS [Edad Exacta],
	CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS [Edad Exacta FP] --FP formato peruano
FROM Beneficiario
GO
