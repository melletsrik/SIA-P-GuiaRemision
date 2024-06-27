create table mae_departamento (
  id_departamento integer primary key,
  nombre varchar(50) not null
);

create table mae_provincia (
  id_provincia integer primary key,
  id_departamento integer not null,
  nombre varchar(50) not null,
  foreign key (id_departamento) references mae_departamento (id_departamento)
);

create table mae_distrito (
  id_distrito integer primary key,
  id_provincia integer not null,
  nombre varchar(50) not null,
  foreign key (id_provincia) references mae_provincia (id_provincia)
);

create table mae_tipo_documento (
  id_tipo_documento integer primary key,
  descripcion varchar(50) not null
);

create table mae_unidades (
  id_unidad integer primary key,
  descripcion varchar(50) not null
);

CREATE TABLE mae_proveedor (
  id_proveedor varchar(20) PRIMARY KEY NOT NULL,
  id_tipo_documento integer NOT NULL,
  nombre varchar(20) NOT NULL,
  telefono varchar(12) NOT NULL,
  correo varchar(50),
  FOREIGN KEY (id_tipo_documento) REFERENCES mae_tipo_documento (id_tipo_documento)
);

create table mae_producto (
  id_producto varchar(20) primary key not null,
  id_unidad integer not null,
  nombre varchar(255) not null,
  descripcion text,
  peso float not null,
  foreign key (id_unidad) references mae_unidades (id_unidad)
);

create table mae_cliente (
  id_cliente varchar(20) primary key not null,
  id_tipo_documento integer not null,
  id_direccion integer not null,
  direccion varchar(200) not null,
  nombre varchar(20) not null,
  telefono varchar(12) not null,
  foreign key (id_tipo_documento) references mae_tipo_documento (id_tipo_documento),
  foreign key (id_direccion) references mae_distrito (id_distrito)
);

create table mae_transportista (
  id_transportista varchar(20) primary key not null,
  id_tipo_documento integer not null,
  nombre varchar(20) not null,
  apellido varchar(30) not null,
  num_licencia varchar(15) not null,
  foreign key (id_tipo_documento) references mae_tipo_documento (id_tipo_documento)
);

create table mae_vehiculo (
  id_vehiculo varchar(20) primary key not null,
  categoria varchar(10) not null,
  capacidad float not null,
  ind_retorno boolean not null
);

create table mae_usuario (
  id_usuario varchar(20) primary key not null,
  id_tipo_documento integer not null,
  nombre varchar(20) not null,
  apellido varchar(20) not null,
  contrasenia varchar(20) not null,
  correo varchar(30) not null,
  telefono varchar(20) not null,
  foreign key (id_tipo_documento) references mae_tipo_documento (id_tipo_documento)
);

CREATE TABLE trs_sede_proveedor (
  id_sede_proveedor varchar(10) PRIMARY KEY NOT NULL,
  id_proveedor varchar(20) NOT NULL,
  id_distrito integer NOT NULL,
  discripcion varchar(30) NOT NULL,
  FOREIGN KEY (id_proveedor) REFERENCES mae_proveedor (id_proveedor),
  FOREIGN KEY (id_distrito) REFERENCES mae_distrito (id_distrito)
);

CREATE TABLE trs_cabecera_gr (
  id_cabecera integer PRIMARY KEY NOT NULL,
  id_proveedor varchar(20) NOT NULL,
  id_cliente varchar(20) NOT NULL,
  id_transportista varchar(20) NOT NULL,
  id_vehiculo varchar(20) NOT NULL,
  num_factura varchar(10) NOT NULL,
  fecha_emi date NOT NULL,
  hora_emi time NOT NULL,
  motivo_tras text NOT NULL,
  modalidad varchar(30) NOT NULL,
  FOREIGN KEY (id_proveedor) REFERENCES mae_proveedor (id_proveedor),
  FOREIGN KEY (id_cliente) REFERENCES mae_cliente (id_cliente),
  FOREIGN KEY (id_transportista) REFERENCES mae_transportista (id_transportista),
  FOREIGN KEY (id_vehiculo) REFERENCES mae_vehiculo (id_vehiculo)
);

create table trs_detalle_gr (
  id_cabecera integer not null,
  id_producto varchar(20) not null,
  cantidad_prod integer not null,
  peso_total float not null,
  foreign key (id_cabecera) references trs_cabecera_gr (id_cabecera),
  foreign key (id_producto) references mae_producto (id_producto)
);
