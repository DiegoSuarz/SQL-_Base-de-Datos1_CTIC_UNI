--CREACION DE LLAVE PRIMARIA:
/*
Una llave primaria (o clave primaria) en SQL Server es una restricci�n 
que se utiliza para identificar de manera �nica cada fila en una tabla. 
Es una caracter�stica fundamental para mantener la integridad de los
datos en una base de datos relacional.

Caracter�sticas de una llave primaria:
	Unicidad:
			Los valores de la columna o combinaci�n de columnas 
			definidas como llave primaria deben ser �nicos para cada 
			fila.
	
	No permite valores nulos:
		Una llave primaria no puede contener valores nulos (NULL).
	
	�ndice autom�tico:
		Al definir una llave primaria, SQL Server crea autom�ticamente
		un �ndice �nico en la columna o columnas de la llave primaria
		para mejorar el rendimiento de las b�squedas.

	Solo una por tabla:
		Cada tabla puede tener solo una llave primaria, aunque esta 
		puede estar formada por m�ltiples columnas (clave compuesta).
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
VALUES(3, 'R0003','Almac�n');
GO
INSERT INTO rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(8, 'R0008','Transportes');
GO
SELECT * FROM rol
GO