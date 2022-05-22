Create database Ferre_Berny_Desktop
go
use Ferre_Berny_Desktop
go
create table Almacenes(
	Id int not null identity (1,1) primary key,
	Nombre varchar(50)
)
go
create table Proveedores(
	Id int not null identity (1,1) primary key,
	Nombre varchar(150) not null,
	Telefono varchar(12) null,
	Direccion varchar(250) null
)

go
create table Categorias(
	Id int not null identity (1,1) primary key,
	Nombre varchar(50)
)
go
-- Tabla nueva para guardar las marcas de los productos
create table Marcas(
	Id int not null identity (1,1) primary key,
	Nombre varchar(50)
)
go

create table Productos(
	Id int not null identity (1,1) primary key,
	Nombre varchar(150) not null,
	Id_Marca int not null,
	Id_Categoria int not null,
	StockMinimo int not null default(0),
	StockMaximo int not null default(0),
	Existencia int not null default(0),
	PrecioUnitario decimal(18,2),
	foreign key(Id_Categoria) references Categorias(Id),
	foreign key(Id_Marca) references Marcas(Id),
)
go
create table Almacenes_Productos(
	Id int not null identity(1,1),
	Id_Almacen int not null foreign key references Almacenes(Id),
	Id_Producto int not null foreign key references Productos(Id),
	Existencia int
	primary key(
		Id_Almacen,Id_Producto
	)
)
go
/*create table Categorias_Productos(
	Id_categoria int,
	Id_Productos int
	primary key(Id_categoria,Id_Productos)
	foreign key(Id_Productos) references Productos(Id),
	foreign key(Id_categoria) references Categorias(Id)
)
go*/

create table Compras(
	Id int not null identity (1,1) primary key,
	Documento varchar(20),
	Id_Proveedor int foreign key references Proveedores(Id),
	Fecha date not null default getdate(),
	Sumas decimal(18,2),
	Iva decimal(18,2),
)
go

create table ComprasDetalle(
	Id int not null identity (1,1),
	Id_Documento int not null,
	Id_Almacen int,
	Id_Producto int,
	Cantidad int,
	Precio decimal(18,2),
	PrecioTotal decimal(18,2)
	primary key(Id,Id_almacen,Id_Producto),
	foreign key(Id_documento) references Compras(Id),
	FOREIGN KEY([Id_almacen], [Id_Producto])
	REFERENCES [dbo].[Almacenes_Productos] ([Id_almacen], [Id_Producto])
)
go
create table Ventas(
	Id int not null identity (1,1) primary key,
	Documento varchar(20),
	Fecha date not null default getdate(),
	Suma decimal(18,2)
)
go

create table VentasDetalle(
	Id int not null identity (1,1),
	Id_Documento int not null,
	Id_Almacen int,
	Id_Producto int not null,
	Cantidad int not null default(0),
	Precio decimal(18,2),
	PrecioTotal decimal(18,2)
	primary key(Id,Id_Producto,Id_almacen),
	foreign key(Id_Documento) references Ventas(Id),
	--foreign key(Id_Productos) references Productos(Id),
	FOREIGN KEY([Id_almacen], [Id_Producto])
	REFERENCES [dbo].[Almacenes_Productos] ([Id_almacen], [Id_Producto])
)
go
create table Kardex(
	Id_Kardex int not null identity (1,1),
	Id_Compra int not null,
	Id_Venta int not null,
	Id_almacen int not null,
	Id_Producto int not null,
	Cantidad int,
	Precio decimal(18,2),
	PrecioTotal decimal(18,2),
	Fecha date,
	CantidadNueva int
	primary key(Id_kardex,Id_Compra,Id_Venta,Id_almacen,Id_Producto)
)
go

create table Usuarios(
	Id int not null identity (1,1),
	Usuario varchar(10),
	Clave varchar(15),
	Nombres varchar(80),
	Apellidos varchar(80),
	Nivel int,
	primary key(Id)
)
