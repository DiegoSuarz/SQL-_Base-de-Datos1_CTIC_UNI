--C�lculo de la edad del beneficiario al 31/07/2004

USE pvl
GO
SELECT pat_ben_vc, mat_ben_vc, nom_ben_vc, fec_nac_ben_da,
DATEDIFF(DAY, fec_nac_ben_da, '20040731')/365.256363004,
CONVERT(INT,DATEDIFF(DAY, fec_nac_ben_da, '20040731')/365.256363004) AS EDAD
FROM Beneficiario
GO

-----------------------------------------------------------------------------------
/*Calcula la cantidad de ni�os menores a 1 a�o*/
USE pvl
GO
SELECT
COUNT(*) AS 'NI�OS MENORES DE 1 A�O'
FROM Beneficiario
WHERE CONVERT(INT,DATEDIFF(DAY, fec_nac_ben_da, '20040731')/365.256363004) = 0
GO

-----------------------------------------------------------------------------------
/* Ni�os menores a 1 a 6 a�os*/
USE pvl
GO
SELECT
COUNT(*) AS 'NI�OS MENORES DE 1 A�O'
FROM Beneficiario
WHERE CONVERT(INT,DATEDIFF(DAY, fec_nac_ben_da, '20040731')/365.256363004) BETWEEN 1 AND 6
GO

-----------------------------------------------------------------------------------
/* Ni�os menores a 7 a 13 a�os*/
USE pvl
GO
SELECT
COUNT(*) AS 'NI�OS MENORES DE 1 A�O'
FROM Beneficiario
WHERE CONVERT(INT,DATEDIFF(DAY, fec_nac_ben_da, '20040731')/365.256363004) BETWEEN 7 AND 13
GO

-----------------------------------------------------------------------------------
/*
    �Cuantos ancianos existen en la PVL?
    Mujeres >= 60
    Varones >= 65
*/
USE pvl
GO
SELECT
COUNT(*) AS 'ANCIANO'
FROM Beneficiario
WHERE
    (
        CONVERT(INT,DATEDIFF(DAY, fec_nac_ben_da, '20040731')/365.256363004) >= 60
        AND
        cod_sex_bi = 0
    )
    OR
    (
        CONVERT(INT,DATEDIFF(DAY, fec_nac_ben_da, '20040731')/365.256363004) >= 65
        AND
        cod_sex_bi = 1
    )
GO

-----------------------------------------------------------------------------------
/*
    MADRES LACTANTES
*/
USE pvl
GO
SELECT
COUNT(*) AS 'MADRES LACTANTES'
FROM Beneficiario
WHERE CONVERT(INT,DATEDIFF(DAY, fec_lac_ben_da, '20040731')/365.256363004) = 0
GO


-----------------------------------------------------------------------------------
/*
    MADRES GESTANTES
*/
USE pvl
GO
SELECT
COUNT(*) AS 'MADRES GESTANTES'
FROM Beneficiario
WHERE CONVERT(INT,DATEDIFF(DAY, fec_emb_ben_da, CONVERT(DATE, '31/07/2004', 103))/7) BETWEEN 0 AND 42
GO