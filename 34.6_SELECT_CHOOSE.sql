/*
CHOOSE
El término "CHOOSE" se refiere a una función que permite seleccionar un valor
de una lista basada en un índice.

Es una función diferente a CASE, pero también se usa para manejar condiciones
y devolver resultados.

Sintaxis
CHOOSE(indice, valor1, valor2, valor3, ...)

*/
USE pvl
GO
SELECT
	nom_ben_vc AS Nombres,
    cod_sex_bi AS Sexo,
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') [Sexo Formateado]
    
FROM Beneficiario
GO