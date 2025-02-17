/*
Operadores Lógicos
Operador	Descripción
OR			Devuelve verdadero si al menos una de las condiciones es verdadera.
*/

-- Mostrar todos los productos cuyo precio es de 10 o 20 dólares

USE deltron
GO
SELECT cod_prd_in, cod_prd_vc, nom_prd_vc, pre_ven_prd_mo
FROM Almacen.producto
WHERE pre_ven_prd_mo = 20 OR pre_ven_prd_mo = 10
ORDER BY 4
GO

------------------------------------------------------

/*
    Mostrar los beneficiarios ancianos en el Programa del Vaso de Leche
    Ancianos femeninos >= 60 años
    Ancianos masculinos >= 65 años
*/
USE pvl
GO
SELECT
    pat_ben_vc AS Paterno,
    mat_ben_vc AS Materno,
    nom_ben_vc AS Nombres,
    CONVERT(CHAR(10), fec_nac_ben_da, 103) AS [Fecha de Nacimiento],
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE
    (
            CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) >= 60
        AND
            cod_sex_bi= 0 --SEXO FEMENINO
    )
    OR
    (
            CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) >= 65
        AND
            cod_sex_bi= 1 --SEXO MASCULINO
    )
ORDER BY 5, 6
GO