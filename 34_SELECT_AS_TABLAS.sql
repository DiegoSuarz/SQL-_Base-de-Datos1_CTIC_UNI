-------------------------------------------------------------------------
-- ALIAS A NIVEL DE TABLAS
--AS DA UNA ALIAS A LAS CONSULTAS

USE pvl
GO
SELECT
    ca.cod_cen_aco_ti ,
    ca.nom_cen_aco_vc
FROM CentroAcopio AS ca
GO

-------------------------------------------------------------------------
USE pvl
GO
SELECT
    ca.cod_cen_aco_ti ,
    ca.nom_cen_aco_vc
FROM CentroAcopio ca --SE PUEDE USAR SIN "AS"
GO