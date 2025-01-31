/*
BUSCAR FECHA ESPECIFICA
*/

/*
    Mostrar a los beneficiarios
    que hayan nacido el 6/6/1996
*/
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc,
    dni_ben_ch,
    fec_nac_ben_da
FROM Beneficiario
WHERE fec_nac_ben_da = '19960606'
ORDER BY 1
GO

SELECT dni_ben_ch FROM Beneficiario
--------------------------------------------------------------------------
/*
    Mostrar a los beneficiarios
    que hayan nacido el 6/6/1996
*/
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc,
    dni_ben_ch,
    fec_nac_ben_da
FROM Beneficiario
WHERE fec_nac_ben_da = CONVERT(DATE,'06/06/1996',103) --103 FORMATO PERUANO PARA FECHA
ORDER BY 1
GO

--------------------------------------------------------------------------

/*
    Mostrar a los beneficiarios
    que hayan nacido el 6/6/1996
*/
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc,
    dni_ben_ch,
    fec_nac_ben_da
FROM Beneficiario
WHERE fec_nac_ben_da = '1996-06-06'
ORDER BY 1
GO

