/*
SENTENCIA SELECT: RECUPERA DATOS DE LA BD

[ WITH { [ XMLNAMESPACES , ] [ common_table_expression ] } ]

SELECT [*] [Campo1, Campo2, Campo3, ...] [ INTO Esquema.Tabla ]
[ FROM Esquema.Tabla ]
[ WHERE Condiciones_de_filtro_a_nivel_de_columnas ]
[ GROUP BY Campo1, Campo2, Campo3, ...]
[ HAVING Condiciones_de_filtro_a_nivel_de_funciones_de_agregado ]
[ WINDOW window_expression ]
[ ORDER BY Campo1, Campo2, Campo3, ... [ ASC | DESC ]]


Cl�usulas importantes:
WHERE: Filtra registros seg�n condiciones.
ORDER BY: Ordena los resultados.
GROUP BY: Agrupa registros para c�lculos con funciones de agregaci�n.
HAVING: Filtra grupos de datos (se usa con GROUP BY).
DISTINCT: Elimina registros duplicados.
*/

USE pvl
GO
SELECT * --TODOS LOS CAMPOS (COLUMNAS)
FROM CentroAcopio
GO

-------------------------------------------------------------------------
USE pvl
GO
SELECT cod_cen_aco_ti, nom_cen_aco_vc --SELECCIONAR COLUMNAS ESPECIFICAS
FROM CentroAcopio
GO

-------------------------------------------------------------------------
-- ALIAS A NIVEL DE COLUMNAS
--AS DA UNA ALIAS A LAS CONSULTAS
USE pvl
GO
SELECT
    cod_cen_aco_ti AS C�digo,   
    nom_cen_aco_vc AS CentroDeAcopio
FROM CentroAcopio
GO
-------------------------------------------------------------------------

SELECT
    cod_cen_aco_ti AS C�digo,
    nom_cen_aco_vc AS [Centro de Acopio]
FROM CentroAcopio
GO

-------------------------------------------------------------------------
USE pvl
GO
SELECT
    cod_cen_aco_ti AS C�digo,
    nom_cen_aco_vc AS 'Centro de Acopio'
FROM CentroAcopio
GO

-------------------------------------------------------------------------
USE pvl
GO
SELECT
    cod_cen_aco_ti AS C�digo,
    nom_cen_aco_vc AS "Centro de Acopio"
FROM CentroAcopio
GO

-------------------------------------------------------------------------
USE pvl
GO
SELECT
    C�digo = cod_cen_aco_ti ,
    "Centro de Acopio" = nom_cen_aco_vc
FROM CentroAcopio
GO
-------------------------------------------------------------------------