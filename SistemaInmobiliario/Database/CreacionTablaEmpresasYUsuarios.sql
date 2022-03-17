﻿CREATE TABLE EMPRESAS (
ID INT,
NOMBRE VARCHAR(50),
CORREO VARCHAR(50),
TELEFONO VARCHAR(30),
DIRECCION VARCHAR(300),
CONSTRAINT PK_EMPRESA PRIMARY KEY (ID)
)
GO
CREATE TABLE USERS (
ID INT,
DNI VARCHAR(12),
NOMBRES VARCHAR(50),
APELLIDOS VARCHAR(50),
TELEFONO VARCHAR(50),
DIRECCION VARCHAR(300),
USERNAME VARCHAR(30),
EMAIL VARCHAR(50),
PASSWORD VARCHAR(30),
CONSTRAINT PK_USER PRIMARY KEY (ID),
CONSTRAINT UQ_EMAIL UNIQUE (EMAIL),
CONSTRAINT UQ_USERNAME UNIQUE (USERNAME)
)
go
alter table USERS add IdRol int default 0
GO
--- PROCEDURES EMPRESAS
GO
CREATE PROCEDURE [dbo].EMPRESAS_REGISTRAR
	@NOMBRE VARCHAR(50),
	@CORREO VARCHAR(50),
	@TELEFONO VARCHAR(30),
	@DIRECCION VARCHAR(300)
AS
begin
	declare @Id int = (select isnull(max(Id),0) +1 from EMPRESAS)

	insert into EMPRESAS (Id, NOMBRE, CORREO, TELEFONO, DIRECCION)
	values (@Id, @NOMBRE, @CORREO, @TELEFONO, @DIRECCION);

	select @Id
end
go
CREATE PROCEDURE EMPRESAS_SELECCIONAR
	@Id int
AS
BEGIN
	SELECT * FROM EMPRESAS where Id = @Id
END
go
CREATE PROCEDURE EMPRESAS_LISTAR
AS
BEGIN
	SELECT * FROM EMPRESAS
END
go
CREATE PROCEDURE [dbo].EMPRESAS_ACTUALIZAR
	@NOMBRE VARCHAR(50),
	@CORREO VARCHAR(50),
	@TELEFONO VARCHAR(30),
	@DIRECCION VARCHAR(300),
	@Id int
AS
begin
	update EMPRESAS 
	SET NOMBRE = @NOMBRE, 
	CORREO = @CORREO, 
	TELEFONO = @TELEFONO, 
	DIRECCION = @DIRECCION
	where Id = @Id
end
go
CREATE PROCEDURE [dbo].EMPRESAS_ELIMINAR
	@Id int
AS
begin
	DELETE FROM EMPRESAS 
	where Id = @Id
end
GO
--- PROCEDURES USUARIOS
GO
CREATE PROCEDURE [dbo].USERS_REGISTRAR
	@DNI VARCHAR(12),
	@NOMBRES VARCHAR(50),
	@APELLIDOS VARCHAR(50),
	@TELEFONO VARCHAR(50),
	@DIRECCION VARCHAR(300),
	@USERNAME VARCHAR(30),
	@EMAIL VARCHAR(50),
	@PASSWORD VARCHAR(30),
	@IdRol int 
AS
begin
	declare @Id int = (select isnull(max(Id),0) +1 from USERS)

	insert into USERS (Id, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, USERNAME, EMAIL, PASSWORD, IdRol)
	values (@Id, @NOMBRES, @APELLIDOS, @TELEFONO, @DIRECCION, @USERNAME, @EMAIL, @PASSWORD, @IdRol);

	select @Id
end
go
CREATE PROCEDURE USERS_SELECCIONAR
	@Id int
AS
BEGIN
	SELECT * FROM USERS where Id = @Id
END
go
CREATE PROCEDURE USERS_LISTAR
AS
BEGIN
	SELECT * FROM USERS
END
go
CREATE PROCEDURE [dbo].USERS_ACTUALIZAR
	@DNI VARCHAR(12),
	@NOMBRES VARCHAR(50),
	@APELLIDOS VARCHAR(50),
	@TELEFONO VARCHAR(50),
	@DIRECCION VARCHAR(300),
	@USERNAME VARCHAR(30),
	@EMAIL VARCHAR(50),
	@PASSWORD VARCHAR(30),
	@IdRol int,
	@Id int
AS
begin
	update USERS 
	SET DNI = @DNI, 
	NOMBRES = @NOMBRES, 
	APELLIDOS = @APELLIDOS, 
	TELEFONO = @TELEFONO,
	DIRECCION = @DIRECCION,
	USERNAME = @USERNAME,
	EMAIL = @EMAIL,
	PASSWORD = @PASSWORD,
	IdRol=@IdRol
	where Id = @Id
end
go
CREATE PROCEDURE [dbo].USERS_ELIMINAR
	@Id int
AS
begin
	DELETE FROM USERS 
	where Id = @Id
end
go