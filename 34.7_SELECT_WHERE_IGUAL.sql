/*
Operadores de relaci�n
Operador			Descripci�n
=					Igual a: compara si dos valores son iguales.
<> o !=				Diferente de: verifica si dos valores no son iguales.
>					Mayor que: comprueba si el valor de la izquierda es mayor que el de la derecha.
<					Menor que: comprueba si el valor de la izquierda es menor que el de la derecha.
>=					Mayor o igual que: comprueba si el valor de la izquierda es mayor o igual al de la derecha.
<=					Menor o igual que: comprueba si el valor de la izquierda es menor o igual al de la derecha.
BETWEEN ... AND ...	Verifica si un valor se encuentra dentro de un rango especificado, incluyendo los l�mites.
LIKE				Se utiliza para buscar un patr�n espec�fico en una columna de texto. Ejemplo: LIKE 'A%' (comienza con A).
IN (...)			Comprueba si un valor est� dentro de un conjunto de valores especificados. Ejemplo: IN (1, 2, 3).
IS NULL				Verifica si un valor es NULL.
IS NOT NULL			Verifica si un valor no es NULL.


Operadores L�gicos
Operador	Descripci�n
AND			Devuelve verdadero si ambas condiciones son verdaderas.
OR			Devuelve verdadero si al menos una de las condiciones es verdadera.
NOT			Invierte el valor l�gico de la condici�n; devuelve verdadero si la condici�n es falsa.


*/

--Consultas usando =  Igual a: compara si dos valores son iguales.

-- Mostrar todos los productos que cuestan 20 d�lares
USE deltron
GO
SELECT cod_prd_in, cod_prd_vc, nom_prd_vc, pre_ven_prd_mo AS VALOR
FROM Almacen.producto
WHERE pre_ven_prd_mo = 20
GO

-----------------------------------------
--MOSTRAR LAS PERSONAS QUE NACIERON EL 15 DE ENERO DEL 2004
USE pvl
GO
SELECT
    cod_ben_in AS C�digo,
    pat_ben_vc AS Paterno,
    mat_ben_vc AS Materno,
    nom_ben_vc AS Nombres,
    CONVERT(CHAR(10), fec_nac_ben_da, 103) AS [Fecha de Nacimiento],
    dni_ben_ch AS DNI,
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE
    fec_nac_ben_da = '20040115'
GO

--------------------------------------------------
--MOSTRAR TODOS LOS BENEFICIARIOS CON APELLIDO PATERNO LUIS
USE pvl
GO
SELECT
    cod_ben_in AS C�digo,
    pat_ben_vc AS Paterno,
    mat_ben_vc AS Materno,
    nom_ben_vc AS Nombres,
    CONVERT(CHAR(10), fec_nac_ben_da, 103) AS [Fecha de Nacimiento],
    dni_ben_ch AS DNI,
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE
    pat_ben_vc = 'LUIS'
GO