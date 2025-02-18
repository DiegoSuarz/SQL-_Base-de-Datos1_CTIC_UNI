/*
IIF
IIF es una funci�n condicional en SQL Server que permite realizar 
evaluaciones l�gicas en una consulta.

Sintaxis
IIF(condici�n, valor_si_verdadero, valor_si_falso)
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