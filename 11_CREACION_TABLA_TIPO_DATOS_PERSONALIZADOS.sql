--CREACION DE TABLA CON TIPOS DE DATOS PERSONALIZADOS POR 
--EL USUARIO
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
