/*
IIF
IIF es una función condicional en SQL Server que permite realizar 
evaluaciones lógicas en una consulta.

Sintaxis
IIF(condición, valor_si_verdadero, valor_si_falso)
*/

USE pvl
GO

SELECT
    
    pat_ben_vc AS Paterno,
    nom_ben_vc AS Nombres,
	cod_sex_bi AS Sexo,
    IIF(cod_sex_bi=0, 'FEMENINO', 'MASCULINO') AS [Sexo formateado]
FROM Beneficiario
GO