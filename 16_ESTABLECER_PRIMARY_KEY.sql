-- ESTABLECER UNA LLAVE PRIMARIA A UNA COLUMNA
-----------------------------------------------
USE empresa_oti
GO

SELECT * FROM Personal.rol GO

ALTER TABLE rol
ADD CONSTRAINT pk_rol_cod_rol_in --cambiar nombre a la clave primaria
PRIMARY KEY (cod_rol_in)			--LLAVE PRIMARIA ORDENA LOS REGISTRON DE FORMA FISICA
GO

-----------------------------------------------
SELECT * 
FROM rol

