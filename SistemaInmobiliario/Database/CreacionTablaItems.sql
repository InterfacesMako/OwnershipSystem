CREATE TABLE [dbo].Items
(
	[Id] INT NOT NULL PRIMARY KEY, 
	[Nombre] VARCHAR(50),
	[Detalle] VARCHAR(500),
	[Stock] INT,
	[Estado] BIT
)
go
CREATE PROCEDURE [dbo].ITEMS_REGISTRAR
	@Nombre varchar(50),
	@Detalle varchar(500),
	@Stock int,
	@Estado BIT
AS
begin
	declare @Id int = (select isnull(max(Id),0) +1 from Items)

	insert into Items (Id, Nombre, Stock, Detalle, Estado)
	values (@Id, @Nombre, @Stock, @Detalle, @Estado);

	select @Id
end
go
CREATE PROCEDURE ITEMS_SELECCIONAR
	@Id int
AS
BEGIN
	SELECT * FROM Items where Id = @Id
END
go
CREATE PROCEDURE ITEMS_LISTAR
AS
BEGIN
	SELECT * FROM Items
END
go
CREATE PROCEDURE [dbo].ITEMS_ACTUALIZAR
	@Nombre varchar(50),
	@Detalle varchar(500),
	@Stock int,
	@Estado BIT,
	@Id int
AS
begin
	update Items 
	SET Nombre = @Nombre, 
	Detalle = @Detalle, 
	Stock = @Stock, 
	Estado = @Estado
	where Id = @Id
end
go
CREATE PROCEDURE [dbo].ITEMS_ELIMINAR
	@Id int
AS
begin
	DELETE FROM Items 
	where Id = @Id
end
go