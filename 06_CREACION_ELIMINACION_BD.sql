USE master
GO
IF EXISTS
(
	SELECT NAME
	FROM SYSDATABASES
	WHERE NAME = 'OTI'
)
DROP DATABASE [empresa_oti] --ELIMINAR LA BASE DE DATOS
GO
CREATE DATABASE [empresa_oti] --CREAR BASE DE DATOS
ON  PRIMARY 
( 
		NAME = N'empresaoti_dat',   
		FILENAME = N'C:\bd\empresaoti_dat.mdf' ,
		SIZE = 30720KB ,  --tamaño de la base de datos
		MAXSIZE = 51200KB ,  --maximo tamaño
		FILEGROWTH = 10240KB  --crecimiento
)
 LOG ON 
( 
		NAME = N'empresaoti_log', 
		FILENAME = N'C:\bd\empresaoti_log.ldf' , 
		SIZE = 10240KB , 
		FILEGROWTH = 10%
)
