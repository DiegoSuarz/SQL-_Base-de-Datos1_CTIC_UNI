--TABLE SCAN
/*
Un table scan en SQL Server ocurre cuando el motor de base de datos 
examina todas las filas de una tabla para satisfacer una consulta.
Esto sucede generalmente porque no hay un índice adecuado para 
optimizar la búsqueda, lo que obliga al motor a recorrer toda 
la tabla de principio a fin.
*/

USE empresa_oti
GO
IF EXISTS
(
	SELECT name
	FROM sys.tables
	WHERE name = 'rol'
)
DROP TABLE rol
GO
CREATE TABLE rol
(
	cod_rol_in td_codigo,
	cod_rol_ch CHAR(5),
	nom_rol_vc td_nombre
)
GO
INSERT INTO rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(5, 'R0005','Ventas');
GO
INSERT INTO rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(3, 'R0003','Almacén');
GO
INSERT INTO rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(8, 'R0008','Transportes');
GO
SET SHOWPLAN_ALL ON
GO
SELECT * FROM rol
GO
SET SHOWPLAN_ALL OFF
GO


