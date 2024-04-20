USE libreria;

CREATE TABLE genero(
idGenero INT PRIMARY KEY AUTO_INCREMENT,
GeneroLiterario VARCHAR(45)NOT NULL
);

 CREATE TABLE Editoriales(
 
 Id_Editoreales INT PRIMARY KEY AUTO_INCREMENT,
 Nombre VARCHAR(45) NOT NULL,
 Direccion VARCHAR(250) NOT NULL,
 Telefono CHAR(9)NOT NULL,
 Email VARCHAR(250) NOT NULL,
 genero_idGenero INT
 );
ALTER TABLE Editoreales ADD FOREIGN KEY (genero) REFERENCES
genero(idGenero);

CREATE TABLE Libros(
Id_Libros INT PRIMARY KEY AUTO_INCREMENT,
Titulo VARCHAR(100) NOT NULL,
Descripcion VARCHAR(100) NOT NULL,
Precio DECIMAL,
Stock INT NOT NULL,
categorias_Id_Categoria INT,
Editoriales_Id_Editoreales INT,
Autores_Id_Autores INT,
inventario_idinventario INT
 );
ALTER TABLE Libros ADD FOREIGN KEY (categorias) REFERENCES
categorias(Id_Categoria);
ALTER TABLE Libros ADD FOREIGN KEY (Editoriales) REFERENCES
Editoriales(Id_Editoreales);
ALTER TABLE Libros ADD FOREIGN KEY (Autores) REFERENCES
Autores(Id_Autores);
ALTER TABLE Libros ADD FOREIGN KEY (inventario) REFERENCES
inventario(idinventario);
 
 CREATE TABLE Autores(
 Id_Autores INT PRIMARY KEY AUTO_INCREMENT,
 Nombre VARCHAR(45) NOT NULL,
 Apellido VARCHAR(45) NOT NULL,
 PaisdeOrigen VARCHAR(45) NOT NULL
 );
 
CREATE TABLE categorias(
Id_Categoria  INT PRIMARY KEY AUTO_INCREMENT,
Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Clientes(
Id_Clientes INT PRIMARY KEY AUTO_INCREMENT,
Nonbre VARCHAR(45) NOT NULL,
Apellido VARCHAR(45) NOT NULL,
Direccion VARCHAR(250) NOT NULL,
Telefono CHAR(9)NOT NULL,
Email VARCHAR(250)NOT NULL
);

CREATE TABLE  DetalleVenta(
Id_DetalleVenta INT PRIMARY KEY AUTO_INCREMENT,
Id_Venta VARCHAR(45),
Cantidad INT NOT NULL,
Preciounitario DECIMAL,
Subtotal DECIMAL,
Ventas_Id_Ventas INT,
Libros_Id_Libros INT
);
ALTER TABLE DetalleVenta ADD FOREIGN KEY (Ventas) REFERENCES
Ventas(Id_Ventas );
ALTER TABLE DetalleVenta ADD FOREIGN KEY (Libros) REFERENCES
Libros(Id_Libros);

CREATE TABLE Ventas(
Id_Ventas INT PRIMARY KEY AUTO_INCREMENT,
Fecha DATE,
Cliente_Id_Clientes INT,
metodosPago_idmetodosPago INT,
Empleados_Id_Empleados INT
);
ALTER TABLE Ventas ADD FOREIGN KEY (metodosPago) REFERENCES
metodosPago(idmetodosPago);
ALTER TABLE Ventas ADD FOREIGN KEY (Empleados) REFERENCES
Empleados(Id_Empleados ); 
 
CREATE TABLE Empleados(
Id_Empleados  INT PRIMARY KEY AUTO_INCREMENT,
Nombre VARCHAR(45) NOT NULL,
Apellido VARCHAR(45) NOT NULL,
Puesto VARCHAR(45)NOT NULL,
Fechadecontratacion DATE,
Direccion VARCHAR(250) NOT NULL,
Telefono CHAR(9)NOT NULL,
Email VARCHAR(250)NOT NULL,
Cargos_idCargos INT
);

ALTER TABLE Empleados ADD FOREIGN KEY (Cargos) REFERENCES
Cargos(idCargos); 

CREATE TABLE metodosPago(
idmetodos INT PRIMARY KEY AUTO_INCREMENT,
nombreMetodoPago VARCHAR(45) NOT NULL
);

CREATE TABLE Facturas_Compras(
idFactura_Compras INT PRIMARY KEY AUTO_INCREMENT, 
Total DECIMAL,
Descuento DECIMAL,
Impuesto DECIMAL,
Total_a_pagar DECIMAL,
Compras_idCompras INT 
);
ALTER TABLE Facturas_Compras ADD FOREIGN KEY (Compras) REFERENCES
Compras(idCompras); 


CREATE TABLE Factura_Ventas(
idFacturaVentas INT PRIMARY KEY AUTO_INCREMENT,
Total DECIMAL,
Descuento DECIMAL,
Impuesto DECIMAL,
Ventas_id_Ventas INT
);
ALTER TABLE Facturas_Ventas ADD FOREIGN KEY (Ventas) REFERENCES
Ventas(id_Ventas ); 

CREATE TABLE Detalle_Compra(
idDetalle INT PRIMARY KEY AUTO_INCREMENT,
Cantidad INT NOT NULL,
Preciounitario DECIMAL,
Subtotal DECIMAL,
Compras_idCompras INT,
Libros_Id_Libros INT 
);
ALTER TABLE Detalle_Compra ADD FOREIGN KEY (Compras) REFERENCES
Compras(idCompras ); 
ALTER TABLE Detalle_Compra ADD FOREIGN KEY (Libros) REFERENCES
Libros(Id_Libros); 

CREATE TABLE Compras(
idCompras  INT PRIMARY KEY AUTO_INCREMENT,
Fecha DATE,
Proveedores_idProveedores INT NOT NULL,
Empleados_Id_Empleados INT
);
ALTER TABLE Compra ADD FOREIGN KEY (Proveedores) REFERENCES
Proveedores(idProveedores ); 
ALTER TABLE Compra ADD FOREIGN KEY (Empleados) REFERENCES
Empleados(Id_Empleados ); 

CREATE TABLE Proveedores(
Nonbre VARCHAR(45)NOT NULL,
Direccion VARCHAR(250)NOT NULL,
Telefono CHAR(9)NOT NULL,
Email VARCHAR(250)NOT NULL,
Direcciones_idDirecciones INT
);
ALTER TABLE Proveedores ADD FOREIGN KEY (Direcciones) REFERENCES
Direcciones(idDirecciones); 

CREATE TABLE Proveedores_Categorias(
Proveedors_Categorias INT PRIMARY KEY AUTO_INCREMENT,
Proveedores_idProveedores INT,
categorias_Id_Categoria INT
);
ALTER TABLE Proveedores_Categorias ADD FOREIGN KEY (Proveedores) REFERENCES
Proveedores(idProveedores ); 
ALTER TABLE Proveedores_Categorias ADD FOREIGN KEY (categorias) REFERENCES
categorias(Id_Categoria); 

CREATE TABLE Direcciones(
idDirecciones INT PRIMARY KEY AUTO_INCREMENT,
Codigo_postal VARCHAR(10)NOT NULL,
Distritos_idDistritos INT
);
ALTER TABLE Direcciones ADD FOREIGN KEY (Distritos) REFERENCES
Distritos(idDistritos ); 

CREATE TABLE Distritos(
idDistritos INT PRIMARY KEY AUTO_INCREMENT,
Nombre_Municipios VARCHAR(45)NOT NULL,
Municipios_idMunicipios INT
);
ALTER TABLE Distritos ADD FOREIGN KEY (Municipios) REFERENCES
Municipios(idMunicipios); 

CREATE TABLE Municipios(
idMunicipios INT PRIMARY KEY AUTO_INCREMENT,
Nombre_Municipio VARCHAR(45) NOT NULL,
Departamentos_idDepartamentos INT
);
ALTER TABLE Municipios ADD FOREIGN KEY (DepartamentoS) REFERENCES
Departamentos(idDepartamentos); 

CREATE TABLE Departamentos(
idDepartamentos INT PRIMARY KEY AUTO_INCREMENT,
Nombre_Departamentos VARCHAR(30) NOT NULL
);

CREATE TABLE Empleado_Compras(
idEmpleado_Compras INT PRIMARY KEY AUTO_INCREMENT,
Empleados_Id_Empleados INT NOT NULL,
Compras_idCompras INT
);
ALTER TABLE Empleado_Compras ADD FOREIGN KEY (Empleados) REFERENCES
Empleados(Id_Empleados); 
ALTER TABLE Empleado_Compras ADD FOREIGN KEY (Compras) REFERENCES
Compras(idCompras); 

CREATE TABLE Empleado_Venta(
idEmpleado_Venta INT PRIMARY KEY AUTO_INCREMENT,
Empleados_Id_Empleados INT,
Ventas_Id_Ventas INT
);
ALTER TABLE Empleado_Venta ADD FOREIGN KEY (Empleados) REFERENCES
Empleados(Id_Empleados); 
ALTER TABLE Empleado_Venta ADD FOREIGN KEY (Ventas) REFERENCES
Ventas(Id_Ventas); 

CREATE TABLE inventario(
idinventario INT PRIMARY KEY AUTO_INCREMENT,
estante VARCHAR(15) NOT NULL,
pasillo VARCHAR(45) NOT NULL,
stock VARCHAR(45) NOT NULL
);
CREATE TABLE Cargos(
idCargos INT PRIMARY KEY AUTO_INCREMENT,
NombreCargos VARCHAR(55)
);

