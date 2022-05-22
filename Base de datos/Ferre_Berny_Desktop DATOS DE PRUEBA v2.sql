use Ferre_Berny_Desktop
go

insert into Almacenes(Nombre) values ('Almacen1')
insert into Almacenes(Nombre) values ('Almacen2')
insert into Almacenes(Nombre) values ('Almacen3')
insert into Almacenes(Nombre) values ('Almacen4')
insert into Almacenes(Nombre) values ('Almacen5')
go


insert into Proveedores(Nombre, Telefono, Direccion)
values('EmpresaA', '93939393', 'Cuscatlán')
insert into Proveedores(Nombre, Telefono, Direccion)
values('EmpresaB', '76567656', 'La Libertad')
insert into Proveedores(Nombre, Telefono, Direccion)
values('EmpresaC', '22020022', 'Sonsonate')
insert into Proveedores(Nombre, Telefono, Direccion)
values('EmpresaD', '33233232', 'Juayua')
insert into Proveedores(Nombre, Telefono, Direccion)
values('EmpresaE', '61064433', 'San Salvador')
go


insert into Categorias(Nombre) values('Electricidad')
insert into Categorias(Nombre) values('Plomería')
insert into Categorias(Nombre) values('Limpieza')
insert into Categorias(Nombre) values('Jardinería')
go

insert into Marcas(Nombre) values('TECNO LITE')
insert into Marcas(Nombre) values('DURMAN')
insert into Marcas(Nombre) values('APC')
insert into Marcas(Nombre) values('GOOD YEAR')
insert into Marcas(Nombre) values('INGCO')
go


insert into Productos(Nombre, Id_Marca, Id_Categoria, StockMinimo, StockMaximo, Existencia, PrecioUnitario)
values('FOCO LED ROSCA E27 14 WATTS LUZ BLANCA', 1, 1, 200, 1500, 750, 2.50)
insert into Productos(Nombre, Id_Marca, Id_Categoria, StockMinimo, StockMaximo, Existencia, PrecioUnitario)
values('TUBO PVC 2 PULGADA X 6 METROS 100 PSI', 2, 2, 200, 1800, 600, 5.00)
insert into Productos(Nombre, Id_Marca, Id_Categoria, StockMinimo, StockMaximo, Existencia, PrecioUnitario)
values('CURVA CONDUIT TUBERIA 1 PULGADA METAL GALVANIZADO EMT', 3, 2, 300, 1700, 500, 6.25)
insert into Productos(Nombre, Id_Marca, Id_Categoria, StockMinimo, StockMaximo, Existencia, PrecioUnitario)
values('SET DE LIMPIEZA AUTO AZUL/AMARILLO', 4, 3, 300, 2000, 400, 10.50)
insert into Productos(Nombre, Id_Marca, Id_Categoria, StockMinimo, StockMaximo, Existencia, PrecioUnitario)
values('GUANTE PROTECTOR DE CUERO/LONA USO GENERAL TALLA 10.5 MANGA CORTA', 5, 4, 350, 1550, 800, 4.75)
go

insert into Almacenes_Productos values (1,1,750)
insert into Almacenes_Productos values (2,2,600)
insert into Almacenes_Productos values (3,3,500)
insert into Almacenes_Productos values (4,4,400)
insert into Almacenes_Productos values (5,5,800)
go

insert into Compras(Documento, Id_Proveedor, Fecha, Sumas, Iva)
values('DOC-00001', 1, '2021-03-02 10:35:29', 1500, 150)
insert into Compras(Documento, Id_Proveedor, Fecha, Sumas, Iva)
values('DOC-00002', 2, '2021-04-03 10:45:20', 1500, 150)
insert into Compras(Documento, Id_Proveedor, Fecha, Sumas, Iva)
values('DOC-00003', 3, '2021-03-04 12:35:10', 1500, 150)
go

insert into Ventas(Documento, Fecha, Suma) values('VE-00001', '2021-05-05 08:20:29', 3000)
insert into Ventas(Documento, Fecha, Suma) values('VE-00002', '2021-05-06 09:35:00', 2000)
insert into Ventas(Documento, Fecha, Suma) values('VE-00003', '2021-05-07 10:59:43', 1000)
go

insert into Usuarios(Usuario, Clave, Nombres, Apellidos, Nivel)
values('Fer', '12345', 'Diego', 'Bejarano', 0)
insert into Usuarios(Usuario, Clave, Nombres, Apellidos, Nivel)
values('Caro', '23456', 'Carolina', 'Montalvo', 0)
insert into Usuarios(Usuario, Clave, Nombres, Apellidos, Nivel)
values('Donay', '34567', 'Adonay', 'Palacios', 0)
insert into Usuarios(Usuario, Clave, Nombres, Apellidos, Nivel)
values('Gab', '45678', 'Gabriel', 'Chávez', 0)
insert into Usuarios(Usuario, Clave, Nombres, Apellidos, Nivel)
values('Cru', '56789', 'Luis', 'Cruz', 0)
go

insert into ComprasDetalle(Id_Documento, Id_Almacen, Id_Producto, Cantidad, Precio, PrecioTotal)
values(1, 1, 1, 200, 5, 1000)
insert into ComprasDetalle(Id_Documento, Id_Almacen, Id_Producto, Cantidad, Precio, PrecioTotal)
values(1, 2, 2, 50, 10, 500)
insert into ComprasDetalle(Id_Documento, Id_Almacen, Id_Producto, Cantidad, Precio, PrecioTotal)
values(2, 3, 3, 200, 5, 1000)
insert into ComprasDetalle(Id_Documento, Id_Almacen, Id_Producto, Cantidad, Precio, PrecioTotal)
values(2, 4, 4, 50, 10, 500)
insert into ComprasDetalle(Id_Documento, Id_Almacen, Id_Producto, Cantidad, Precio, PrecioTotal)
values(3, 5, 5, 300, 5, 1500)
go

insert into VentasDetalle(Id_Documento, Id_Almacen, Id_Producto, Cantidad, Precio, PrecioTotal)
values(1, 3, 3, 600, 5, 3000)
insert into VentasDetalle(Id_Documento, Id_Almacen, Id_Producto, Cantidad, Precio, PrecioTotal)
values(2, 4, 4, 200, 10, 2000)
insert into VentasDetalle(Id_Documento, Id_Almacen, Id_Producto, Cantidad, Precio, PrecioTotal)
values(3, 5, 5, 200, 5, 1000)
go

insert into Kardex(Id_Venta, Id_Producto, Id_Compra, Id_almacen, Cantidad, Precio, PrecioTotal, Fecha, CantidadNueva)
values(0, 1, 1, 1, 200, 5, 1000, '2021-03-02 10:35:29', 750)
insert into Kardex(Id_Venta, Id_Producto, Id_Compra, Id_almacen, Cantidad, Precio, PrecioTotal, Fecha, CantidadNueva)
values(0, 2, 1, 2, 50, 10, 500, '2021-03-02 10:35:29', 600)
insert into Kardex(Id_Venta, Id_Producto, Id_Compra, Id_almacen, Cantidad, Precio, PrecioTotal, Fecha, CantidadNueva)
values(0, 3, 2, 3, 200, 5, 1000, '2021-04-03 10:45:20', 1100)
insert into Kardex(Id_Venta, Id_Producto, Id_Compra, Id_almacen, Cantidad, Precio, PrecioTotal, Fecha, CantidadNueva)
values(0, 4, 2, 4, 50, 10, 500, '2021-04-03 10:45:20', 600)
insert into Kardex(Id_Venta, Id_Producto, Id_Compra, Id_almacen, Cantidad, Precio, PrecioTotal, Fecha, CantidadNueva)
values(0, 5, 3, 5, 300, 50, 1500, '2021-03-04 12:35:10', 1000)
insert into Kardex(Id_Venta, Id_Producto, Id_Compra, Id_almacen, Cantidad, Precio, PrecioTotal, Fecha, CantidadNueva)
values(1, 3, 0, 3, 600, 5, 3000, '2021-05-05 08:20:29', 500)
insert into Kardex(Id_Venta, Id_Producto, Id_Compra, Id_almacen, Cantidad, Precio, PrecioTotal, Fecha, CantidadNueva)
values(2, 4, 0, 4, 200, 10, 2000, '2021-05-06 09:35:00', 400)
insert into Kardex(Id_Venta, Id_Producto, Id_Compra, Id_almacen, Cantidad, Precio, PrecioTotal, Fecha, CantidadNueva)
values(3, 5, 0, 5, 200, 5, 1000, '2021-05-07 10:59:43', 800)

select * from Kardex