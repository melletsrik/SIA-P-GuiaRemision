CREATE TABLE `MAE_PROVEEDOR` (
  `ID_PROVEEDOR` integer PRIMARY KEY,
  `NOMBRE` varchar(20),
  `APELLIDO` varchar(30),
  `DIRECCION` varchar(100),
  `TELEFONO` varchar(12),
  `CORREO` varchar(50)
);

CREATE TABLE `MAE_PRODUCTO` (
  `ID_PRODUCTO` integer PRIMARY KEY,
  `NOMBRE` varchar(255),
  `DESCRIPCION` text,
  `PESO` float,
  `UNIDAD` varchar(255)
);

CREATE TABLE `MAE_CLIENTE` (
  `ID_CLIENTE` integer PRIMARY KEY,
  `NOMBRE` varchar(20),
  `APELLIDO` varchar(30),
  `RUC` varchar(11),
  `DIRECCION` varchar(100),
  `TELEFONO` varchar(12)
);

CREATE TABLE `MAE_TRANSPORTISTA` (
  `ID_TRANSPORTISTA` integer PRIMARY KEY,
  `NOMBRE` varchar(20),
  `APELLIDO` varchar(30),
  `DNI` varchar(8),
  `NUM_LICENCIA` varchar(10)
);

CREATE TABLE `MAE_VEHICULO` (
  `ID_VEHICULO` integer PRIMARY KEY,
  `PLACA` varchar(10),
  `CATEGORIA` varchar(10),
  `CAPACIDAD` float,
  `IND_RETORNO` bool
);

CREATE TABLE `TRS_CABECERA_GR` (
  `ID_CABECERA` integer PRIMARY KEY,
  `ID_PROVEEDOR` integer,
  `ID_CLIENTE` integer,
  `ID_TRANSPORTISTA` integer,
  `ID_VEHICULO` integer,
  `NUM_GUIA` varchar(50),
  `FECHA_EMI` date,
  `HORA_EMI` time,
  `MOTIVO_TRAS` text,
  `MODALIDAD` varchar(30)
);

CREATE TABLE `TRS_DETALLE_GR` (
  `ID_CABECERA` integer,
  `ID_PRODUCTO` integer,
  `NUM_FACTURA` varchar(10),
  `CANTIDAD_PROD` integer,
  `PESO_TOTAL` float
);

ALTER TABLE `TRS_CABECERA_GR` ADD FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `MAE_PROVEEDOR` (`ID_PROVEEDOR`);
ALTER TABLE `TRS_CABECERA_GR` ADD FOREIGN KEY (`ID_CLIENTE`) REFERENCES `MAE_CLIENTE` (`ID_CLIENTE`);
ALTER TABLE `TRS_CABECERA_GR` ADD FOREIGN KEY (`ID_TRANSPORTISTA`) REFERENCES `MAE_TRANSPORTISTA` (`ID_TRANSPORTISTA`);
ALTER TABLE `TRS_CABECERA_GR` ADD FOREIGN KEY (`ID_VEHICULO`) REFERENCES `MAE_VEHICULO` (`ID_VEHICULO`);
ALTER TABLE `TRS_DETALLE_GR` ADD FOREIGN KEY (`ID_CABECERA`) REFERENCES `TRS_CABECERA_GR` (`ID_CABECERA`);
ALTER TABLE `TRS_DETALLE_GR` ADD FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `MAE_PRODUCTO` (`ID_PRODUCTO`);


--Registros de prueba de bases de datos
INSERT INTO MAE_PROVEEDOR (ID_PROVEEDOR, NOMBRE, APELLIDO, DIRECCION, TELEFONO, CORREO) VALUES
    (1, 'Distribuidora La Roca', 'Sánchez', 'Av. Los Alisos 123, Lima', '998877665', 'info@laroca.com'),
    (2, 'Ferretería El Martillo', 'Gómez', 'Jr. Huancayo 456, Arequipa', '987654321', 'contacto@elmartillo.com'),
    (3, 'Comercializadora San Martín', 'Díaz', 'Calle Tacna 789, Trujillo', '955443322', 'ventas@sanmartin.com');

INSERT INTO MAE_PRODUCTO (ID_PRODUCTO, NOMBRE, DESCRIPCION, PESO, UNIDAD) VALUES
    (1, 'Ladrillos Cerámicos', 'Ladrillos de cerámica para construcción', 3.5, 'kg'),
    (2, 'Tornillos Autoperforantes', 'Tornillos para estructuras metálicas', 0.02, 'kg'),
    (3, 'Cemento Portland Tipo I', 'Cemento para uso general en construcción', 50.0, 'kg');

INSERT INTO MAE_CLIENTE (ID_CLIENTE, NOMBRE, APELLIDO, RUC, DIRECCION, TELEFONO) VALUES
    (1, 'Constructora Los Cedros', 'Martínez', '20123456789', 'Av. Caminos del Inca 234, Lima', '977665544'),
    (2, 'Ingeniería y Arquitectura SAC', 'Pérez', '20456789012', 'Jr. Pizarro 567, Arequipa', '955443322'),
    (3, 'Remodelaciones Ríos EIRL', 'González', '20567890123', 'Calle El Sol 890, Trujillo', '944332211');

INSERT INTO MAE_TRANSPORTISTA (ID_TRANSPORTISTA, NOMBRE, APELLIDO, DNI, NUM_LICENCIA) VALUES
    (1, 'Transportes Gómez', 'García', '11223344', 'LIC-001'),
    (2, 'Logística Express', 'Pérez', '22334455', 'LIC-002'),
    (3, 'Transportes El Sol', 'López', '33445566', 'LIC-003');

INSERT INTO MAE_VEHICULO (ID_VEHICULO, PLACA, CATEGORIA, CAPACIDAD, IND_RETORNO) VALUES
    (1, 'ABC-123', 'Camión', 5000.0, true),
    (2, 'XYZ-789', 'Furgoneta', 2000.0, false),
    (3, 'DEF-456', 'Camioneta', 3000.0, true);

INSERT INTO TRS_CABECERA_GR (ID_CABECERA, ID_PROVEEDOR, ID_CLIENTE, ID_TRANSPORTISTA, ID_VEHICULO, NUM_GUIA, FECHA_EMI, HORA_EMI, MOTIVO_TRAS, MODALIDAD) VALUES
    (1, 1, 1, 1, 1, 'GR2023001', '2024-06-15', '12:30:00', 'Venta de materiales de construcción', 'Terrestre'),
    (2, 2, 2, 2, 2, 'GR2023002', '2024-06-15', '13:00:00', 'Envío de tornillos a sucursal', 'Terrestre'),
    (3, 3, 3, 3, 3, 'GR2023003', '2024-06-15', '13:30:00', 'Transporte de cemento para obra', 'Terrestre');

INSERT INTO TRS_DETALLE_GR (ID_CABECERA, ID_PRODUCTO, NUM_FACTURA, CANTIDAD_PROD, PESO_TOTAL) VALUES
    (1, 1, 'FAC-2023001', 100, 350.0),
    (1, 2, 'FAC-2023002', 500, 10.0),
    (2, 2, 'FAC-2023003', 750, 15.0),
    (3, 3, 'FAC-2023004', 300, 150.0);
