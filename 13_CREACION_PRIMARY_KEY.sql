--CREACION DE LLAVE PRIMARIA:
/*
Una llave primaria (o clave primaria) en SQL Server es una restricción 
que se utiliza para identificar de manera única cada fila en una tabla. 
Es una característica fundamental para mantener la integridad de los
datos en una base de datos relacional.

Características de una llave primaria:
	Unicidad:
			Los valores de la columna o combinación de columnas 
			definidas como llave primaria deben ser únicos para cada 
			fila.
	
	No permite valores nulos:
		Una llave primaria no puede contener valores nulos (NULL).
	
	Índice automático:
		Al definir una llave primaria, SQL Server crea automáticamente
		un índice único en la columna o columnas de la llave primaria
		para mejorar el rendimiento de las búsquedas.

	Solo una por tabla:
		Cada tabla puede tener solo una llave primaria, aunque esta 
		puede estar formada por múltiples columnas (clave compuesta).
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
CREATE TABLE rol --crear tabla rol
(
	--columnas de la tabla con su tipo de dato
    cod_rol_in INT PRIMARY KEY,			--LLAVE PRIMARIA ORDENA LOS REGISTRON DE FORMA FISICA
    cod_rol_ch CHAR(5),		--tipo char
    nom_rol_vc VARCHAR(15) 
)
GO
-----------------------------------------------
-- insertar valores a la tabla rol
INSERT INTO rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(5, 'R0005','Ventas');
GO
INSERT INTO rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(3, 'R0003','Almacén');
GO
INSERT INTO rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(8, 'R0008','Transportes');
GO
SELECT * FROM rol
GO