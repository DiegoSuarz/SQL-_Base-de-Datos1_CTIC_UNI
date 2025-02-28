/*
La cl�usula WHERE en SQL se utiliza para filtrar registros y especificar 
condiciones que deben cumplirse para que los registros sean seleccionados 
o manipulados.
Es una parte esencial de muchas consultas SQL, ya que te permite obtener 
solo los datos que realmente necesitas.
*/


--------------------------------------------------------------------------
/*
    Mostrar al beneficiario
    con c�digo 1000
*/
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc
FROM Beneficiario
WHERE cod_ben_in = 1000
GO

--------------------------------------------------------------------------
/*
	El operador IN en SQL Server se utiliza para filtrar registros que coinciden con un 
	conjunto espec�fico de valores.
	Es una alternativa m�s concisa y legible a m�ltiples condiciones OR.
	
    Mostrar al beneficiario
    con c�digo 10, 100, 1000, 10000
*/

USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc
FROM Beneficiario
WHERE cod_ben_in IN (10, 100, 1000, 10000)
ORDER BY 1

--------------------------------------------------------------------------
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc
FROM Beneficiario
WHERE 
		cod_ben_in = 10
	OR
		cod_ben_in = 100
	OR 
		cod_ben_in = 1000
	OR 
		cod_ben_in = 10000
ORDER BY 1
GO

--------------------------------------------------------------------------
/*
    Mostrar al beneficiario
    con c�digo 10 hasta 20
    incluyendo ambos
*/
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc
FROM Beneficiario
WHERE cod_ben_in BETWEEN 10 AND 20
ORDER BY 1

--------------------------------------------------------------------------
/*
    Mostrar al beneficiario
    con c�digo 10 hasta 20
    incluyendo ambos
*/
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc
FROM Beneficiario
WHERE
        cod_ben_in >= 10
    AND
        cod_ben_in <= 20
ORDER BY 1
GO


--------------------------------------------------------------------------
/*
    Mostrar a los beneficiarios
    que tengan DNI
*/
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc,
    dni_ben_ch
FROM Beneficiario
WHERE
    LEN(dni_ben_ch) = 8 --SI TIENE 8 DIGITOS, LEN CUANTA EL NUMERO DE CARACTERES QUE TIENE UNA LETRA
ORDER BY cod_ben_in  --ORDENAR POR LA COLUMNA cod_ben_in
GO
--------------------------------------------------------------------------
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc,
    dni_ben_ch
FROM Beneficiario
WHERE
    dni_ben_ch LIKE ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') --SOLO DETECTA VALORES NUMERCIOS - NO LETRAS

ORDER BY cod_ben_in  --ORDENAR POR LA COLUMNA cod_ben_in
GO

--------------------------------------------------------------------------
--LOS VALORES INVALIDOS PARA LOS DNI
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc,
    dni_ben_ch
FROM Beneficiario
WHERE
    dni_ben_ch NOT LIKE ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') --SOLO DETECTA VALORES NUMERCIOS - NO LETRAS
						AND  LEN(dni_ben_ch) = 8 

ORDER BY cod_ben_in  --ORDENAR POR LA COLUMNA cod_ben_in
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