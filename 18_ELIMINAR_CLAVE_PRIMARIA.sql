--REMOVER CLAVE PRIMARIA
IF EXISTS  -- CODIGO EXTRA PARA PODER EJECUTAR VARIAS VECES EL CODIGO
(
	SELECT NAME
	FROM SYSOBJECTS
	WHERE 
			xtype = 'PK'
		AND
			NAME = 'pk_rol_cod_rol_in'
)
ALTER TABLE Personal.rol
DROP CONSTRAINT [pk_rol_cod_rol_in]
GO


--------------------------------------------------
--ESTABLECER CLAVE PRIMARIA
ALTER TABLE [Personal].[rol]
ADD CONSTRAINT pk_personal_rol_cod_rol_in
PRIMARY KEY (cod_rol_in) --nombre de la columna
GO