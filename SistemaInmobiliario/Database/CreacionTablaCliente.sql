CREATE TABLE [dbo].Clientes
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [DNI] VARCHAR(8) NULL, 
    [Nombre] VARCHAR(100) NULL, 
    [Apellido] VARCHAR(100) NULL, 
    [Telefono] VARCHAR(20) NULL, 
    [Direccion] VARCHAR(200) NULL
)
go
CREATE PROCEDURE [dbo].CLIENTES_REGISTRAR
	@DNI varchar(8),
	@Nombre varchar(100),
	@Apellido varchar(100),
	@Telefono varchar(20),
	@Direccion varchar(200)
AS
begin
	declare @Id int = (select isnull(max(Id),0) +1 from Clientes)

	insert into Clientes (Id, DNI, Nombre, Apellido, Telefono, Direccion)
	values (@Id, @DNI, @Nombre, @Apellido, @Telefono, @Direccion);

	select @Id
end
go
CREATE PROCEDURE CLIENTES_SELECCIONAR
	@Id int
AS
BEGIN
	SELECT * FROM Clientes where Id = @Id
END
go
CREATE PROCEDURE CLIENTES_LISTAR
AS
BEGIN
	SELECT * FROM Clientes
END
go
CREATE PROCEDURE [dbo].CLIENTES_ACTUALIZAR
	@DNI varchar(8),
	@Nombre varchar(100),
	@Apellido varchar(100),
	@Telefono varchar(20),
	@Direccion varchar(200),
	@Id int
AS
begin
	update Clientes 
	SET DNI = @DNI, 
	Nombre = @Nombre, 
	Apellido = @Apellido, 
	Telefono = @Telefono, 
	Direccion = @Direccion
	where Id = @Id
end
go
CREATE PROCEDURE [dbo].CLIENTES_ELIMINAR
	@Id int
AS
begin
	DELETE FROM Clientes 
	where Id = @Id
end
go