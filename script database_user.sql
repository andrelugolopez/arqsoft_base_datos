create database database_user;
use database_user;

create table usuarios(
documento varchar(100) not null, nombres varchar(50) not null, apellidos varchar (50) not null,
direccion varchar(100) null, telefono varchar(12) null, 
correo varchar(100) primary key not null, clave varchar(100) not null, idcarrito int(4) not null, rol varchar(30)null);

create table factura(
id_factura int(12) primary key not null, documento varchar(100), idproducto int(12) not null, 
cantidad varchar(3) not null,categoria varchar(11) null, 
vunitario float not null, iva float, vtotal float
);

create table carrito(
idcarrito int(4) primary key not null, articulo varchar(50) not null, 
documento varchar(100)not null,
cantidad int(3)
);

create table productos(
idproducto int(12) not null primary key, nombreproducto varchar(45) not null, 
marca varchar(50) not null, disponibiilidad varchar(1) not null, precio float not null);

create table recuperacion(
correo varchar(100) not null, token_rec varchar(10)primary key not null);

create table detallescarrito(
idcarrito int(4) primary key not null, idproducto int(12) not null, correo varchar(100) not null);

alter table usuarios drop column idcarrito;
drop table detallescarrito;

create table detalltescarrito(
iddetalle int(4) primary key, idcarrito1 int(4) not null, correo1 varchar(100),
idproducto1 int(12) not null, foreign key (idproducto1)references productos(idproducto), 
foreign key (idcarrito1) references carrito(idcarrito), foreign key (correo1) references usuarios(correo));
desc usuarios;