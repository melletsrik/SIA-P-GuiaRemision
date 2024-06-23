-- Tabla de Departamentos
CREATE TABLE MAE_DEPARTAMENTO (
  ID_DEPARTAMENTO INTEGER PRIMARY KEY,
  NOMBRE VARCHAR(50) NOT NULL
);

-- Tabla de Provincias
CREATE TABLE MAE_PROVINCIA (
  ID_PROVINCIA INTEGER PRIMARY KEY,
  ID_DEPARTAMENTO INTEGER NOT NULL,
  NOMBRE VARCHAR(50) NOT NULL,
  FOREIGN KEY (ID_DEPARTAMENTO) REFERENCES MAE_DEPARTAMENTO (ID_DEPARTAMENTO)
);


-- Tabla de Distritos
CREATE TABLE MAE_DISTRITO (
  ID_DISTRITO INTEGER PRIMARY KEY,
  ID_PROVINCIA INTEGER NOT NULL,
  NOMBRE VARCHAR(50) NOT NULL,
  FOREIGN KEY (ID_PROVINCIA) REFERENCES MAE_PROVINCIA (ID_PROVINCIA)
);

-- Tabla de Direcciones
CREATE TABLE MAE_DIRECCION (
  ID_DIRECCION INTEGER PRIMARY KEY,
  ID_DISTRITO INTEGER NOT NULL,
  REFERENCIA VARCHAR(200),
  FOREIGN KEY (ID_DISTRITO) REFERENCES MAE_DISTRITO (ID_DISTRITO)
);

-- Tabla de tipos de documentos
CREATE TABLE MAE_TIPO_DOCUMENTO (
  ID_TIPO_DOCUMENTO INTEGER PRIMARY KEY,
  DESCRIPCION VARCHAR(50) NOT NULL
);

-- Tabla de unidades
CREATE TABLE MAE_UNIDADES (
  ID_UNIDAD INTEGER PRIMARY KEY,
  DESCRIPCION VARCHAR(50) NOT NULL
);

-- Tabla de proveedores
CREATE TABLE MAE_PROVEEDOR (
  ID_PROVEEDOR INTEGER PRIMARY KEY NOT NULL,
  ID_TIPO_DOCUMENTO INTEGER NOT NULL,  
  ID_DIRECCION INTEGER NOT NULL,
  DIRECCION VARCHAR(200) NOT NULL,
  NOMBRE VARCHAR(100) NOT NULL,
  TELEFONO VARCHAR(12) NOT NULL,
  CORREO VARCHAR(50),
  FOREIGN KEY (ID_TIPO_DOCUMENTO) REFERENCES MAE_TIPO_DOCUMENTO (ID_TIPO_DOCUMENTO),
  FOREIGN KEY (ID_DIRECCION) REFERENCES MAE_DIRECCION (ID_DIRECCION)
);

-- Tabla de productos
CREATE TABLE MAE_PRODUCTO (
  ID_PRODUCTO INTEGER PRIMARY KEY NOT NULL,
  ID_UNIDAD INTEGER NOT NULL,
  NOMBRE VARCHAR(255) NOT NULL,
  DESCRIPCION TEXT ,
  PESO FLOAT NOT NULL,
  FOREIGN KEY (ID_UNIDAD) REFERENCES MAE_UNIDADES (ID_UNIDAD)
);

-- Tabla de clientes
CREATE TABLE MAE_CLIENTE (
  ID_CLIENTE INTEGER PRIMARY KEY NOT NULL,
  ID_TIPO_DOCUMENTO INTEGER NOT NULL,
  ID_DOCUMENTO INTEGER NOT NULL,
  ID_DIRECCION INTEGER NOT NULL,
  NUM_DOCUMENTO VARCHAR(50) NOT NULL,
  DIRECCION VARCHAR(200) NOT NULL,
  NOMBRE VARCHAR(100) NOT NULL,
  TELEFONO VARCHAR(12) NOT NULL,
  FOREIGN KEY (ID_TIPO_DOCUMENTO) REFERENCES MAE_TIPO_DOCUMENTO (ID_TIPO_DOCUMENTO),
  FOREIGN KEY (ID_DIRECCION) REFERENCES MAE_DIRECCION (ID_DIRECCION)
);

-- Tabla de transportistas
CREATE TABLE MAE_TRANSPORTISTA (
  ID_TRANSPORTISTA INTEGER PRIMARY KEY NOT NULL,
  ID_TIPO_DOCUMENTO INTEGER NOT NULL  ,
  NOMBRE VARCHAR(50) NOT NULL,
  APELLIDO VARCHAR(50) NOT NULL,
  NUM_LICENCIA VARCHAR(10) NOT NULL,
  FOREIGN KEY (ID_TIPO_DOCUMENTO) REFERENCES MAE_TIPO_DOCUMENTO (ID_TIPO_DOCUMENTO)
);

-- Tabla de vehículos
CREATE TABLE MAE_VEHICULO (
  ID_VEHICULO INTEGER PRIMARY KEY NOT NULL,
  PLACA VARCHAR(10) NOT NULL,
  CATEGORIA VARCHAR(10) NOT NULL,
  CAPACIDAD FLOAT NOT NULL,
  IND_RETORNO BOOLEAN NOT NULL
);

-- Tabla de cabecera de guía de remisión
CREATE TABLE TRS_CABECERA_GR (
  ID_CABECERA INTEGER PRIMARY KEY NOT NULL,
  ID_PROVEEDOR INTEGER NOT NULL,
  ID_CLIENTE INTEGER NOT NULL,
  ID_TRANSPORTISTA INTEGER NOT NULL,
  ID_VEHICULO INTEGER NOT NULL,
  NUM_GUIA VARCHAR(50) NOT NULL,
  FECHA_EMI DATE NOT NULL,
  HORA_EMI TIME NOT NULL,
  MOTIVO_TRAS TEXT NOT NULL,
  MODALIDAD VARCHAR(30) NOT NULL,
  FOREIGN KEY (ID_PROVEEDOR) REFERENCES MAE_PROVEEDOR (ID_PROVEEDOR),
  FOREIGN KEY (ID_CLIENTE) REFERENCES MAE_CLIENTE (ID_CLIENTE),
  FOREIGN KEY (ID_TRANSPORTISTA) REFERENCES MAE_TRANSPORTISTA (ID_TRANSPORTISTA),
  FOREIGN KEY (ID_VEHICULO) REFERENCES MAE_VEHICULO (ID_VEHICULO)
);


-- Tabla de detalle de guía de remisión
CREATE TABLE TRS_DETALLE_GR (
  ID_CABECERA INTEGER NOT NULL,
  ID_PRODUCTO INTEGER NOT NULL,
  NUM_FACTURA VARCHAR(10) NOT NULL,
  CANTIDAD_PROD INTEGER NOT NULL,
  PESO_TOTAL FLOAT NOT NULL,
  FOREIGN KEY (ID_CABECERA) REFERENCES TRS_CABECERA_GR (ID_CABECERA),
  FOREIGN KEY (ID_PRODUCTO) REFERENCES MAE_PRODUCTO (ID_PRODUCTO)
);


--Registros para Aerquipa

INSERT INTO MAE_DEPARTAMENTO (ID_DEPARTAMENTO, NOMBRE) VALUES (1, 'Arequipa');
--Registros para las provincias de Arequipa

INSERT INTO MAE_PROVINCIA (ID_PROVINCIA, ID_DEPARTAMENTO, NOMBRE) VALUES 
(1, 1, 'Arequipa'), 
(2, 1, 'Camaná'), 
(3, 1, 'Caravelí'), 
(4, 1, 'Castilla'), 
(5, 1, 'Caylloma'), 
(6, 1, 'Condesuyos'), 
(7, 1, 'Islay'), 
(8, 1, 'La Unión');
--Registros para los distritos de la provincia Arequipa
INSERT INTO MAE_DISTRITO (ID_DISTRITO, ID_PROVINCIA, NOMBRE) VALUES 
(1, 1, 'Arequipa'),
(2, 1, 'Alto Selva Alegre'),
(3, 1, 'Cayma'),
(4, 1, 'Cerro Colorado'),
(5, 1, 'Characato'),
(6, 1, 'Chiguata'),
(7, 1, 'Jacobo Hunter'),
(8, 1, 'La Joya'),
(9, 1, 'Mariano Melgar'),
(10, 1, 'Miraflores'),
(11, 1, 'Mollebaya'),
(12, 1, 'Paucarpata'),
(13, 1, 'Pocsi'),
(14, 1, 'Polobaya'),
(15, 1, 'Quequeña'),
(16, 1, 'Sabandia'),
(17, 1, 'Sachaca'),
(18, 1, 'San Juan de Siguas'),
(19, 1, 'San Juan de Tarucani'),
(20, 1, 'Santa Isabel de Siguas'),
(21, 1, 'Santa Rita de Siguas'),
(22, 1, 'Socabaya'),
(23, 1, 'Tiabaya'),
(24, 1, 'Uchumayo'),
(25, 1, 'Vitor'),
(26, 1, 'Yanahuara'),
(27, 1, 'Yarabamba'),
(28, 1, 'Yura');
--Registros para los distritos de la provincia Camaná
INSERT INTO MAE_DISTRITO (ID_DISTRITO, ID_PROVINCIA, NOMBRE) VALUES 
(29, 2, 'Camaná'),
(30, 2, 'José María Quimper'),
(31, 2, 'Mariano Nicolás Valcárcel'),
(32, 2, 'Mariscal Cáceres'),
(33, 2, 'Nicolás de Piérola'),
(34, 2, 'Ocoña'),
(35, 2, 'Quilca'),
(36, 2, 'Samuel Pastor');
--Registros para los distritos de la provincia Caravelí
INSERT INTO MAE_DISTRITO (ID_DISTRITO, ID_PROVINCIA, NOMBRE) VALUES 
(37, 3, 'Caravelí'),
(38, 3, 'Acarí'),
(39, 3, 'Atico'),
(40, 3, 'Atiquipa'),
(41, 3, 'Bella Unión'),
(42, 3, 'Cahuacho'),
(43, 3, 'Chala'),
(44, 3, 'Chaparra'),
(45, 3, 'Huanuhuanu'),
(46, 3, 'Jaqui'),
(47, 3, 'Lomas'),
(48, 3, 'Quicacha'),
(49, 3, 'Yauca');
--Registros para los distritos de la provincia Castilla
INSERT INTO MAE_DISTRITO (ID_DISTRITO, ID_PROVINCIA, NOMBRE) VALUES 
(50, 4, 'Aplao'),
(51, 4, 'Andagua'),
(52, 4, 'Ayo'),
(53, 4, 'Chachas'),
(54, 4, 'Chilcaymarca'),
(55, 4, 'Choco'),
(56, 4, 'Huancarqui'),
(57, 4, 'Machaguay'),
(58, 4, 'Orcopampa'),
(59, 4, 'Pampacolca'),
(60, 4, 'Tipan'),
(61, 4, 'Uñon'),
(62, 4, 'Uraca'),
(63, 4, 'Viraco');
--Registros para los distritos de la provincia Caylloma
INSERT INTO MAE_DISTRITO (ID_DISTRITO, ID_PROVINCIA, NOMBRE) VALUES 
(64, 5, 'Chivay'),
(65, 5, 'Achoma'),
(66, 5, 'Cabanaconde'),
(67, 5, 'Callalli'),
(68, 5, 'Caylloma'),
(69, 5, 'Coporaque'),
(70, 5, 'Huambo'),
(71, 5, 'Huanca'),
(72, 5, 'Ichupampa'),
(73, 5, 'Lari'),
(74, 5, 'Lluta'),
(75, 5, 'Maca'),
(76, 5, 'Madrigal'),
(77, 5, 'San Antonio de Chuca'),
(78, 5, 'Sibayo'),
(79, 5, 'Tapay'),
(80, 5, 'Tisco'),
(81, 5, 'Tuti'),
(82, 5, 'Yanque'),
(83, 5, 'Majes');
--Registros para los distritos de la provincia Condesuyos
INSERT INTO MAE_DISTRITO (ID_DISTRITO, ID_PROVINCIA, NOMBRE) VALUES 
(84, 6, 'Chuquibamba'),
(85, 6, 'Andaray'),
(86, 6, 'Cayarani'),
(87, 6, 'Chichas'),
(88, 6, 'Iray'),
(89, 6, 'Río Grande'),
(90, 6, 'Salamanca'),
(91, 6, 'Yanaquihua');
--Registros para los distritos de la provincia Islay y La Unión
INSERT INTO MAE_DISTRITO (ID_DISTRITO, ID_PROVINCIA, NOMBRE) VALUES 
-- Distritos de la provincia de Islay
(92, 7, 'Mollendo'),
(93, 7, 'Cocachacra'),
(94, 7, 'Dean Valdivia'),
(95, 7, 'Islay'),
(96, 7, 'Mejia'),
(97, 7, 'Punta de Bombon'),

-- Distritos de la provincia de La Unión
(98, 8, 'Cotahuasi'),
(99, 8, 'Alca'),
(100, 8, 'Charcana'),
(101, 8, 'Huaynacotas'),
(102, 8, 'Pampamarca'),
(103, 8, 'Puyca'),
(104, 8, 'Quechualla'),
(105, 8, 'Sayla'),
(106, 8, 'Tauria'),
(107, 8, 'Tomepampa'),
(108, 8, 'Toro');

--Departamento de Tacna
INSERT INTO MAE_DEPARTAMENTO (ID_DEPARTAMENTO, NOMBRE) VALUES (2, 'Tacna');
--Provincias de Tacna
INSERT INTO MAE_PROVINCIA (ID_PROVINCIA, ID_DEPARTAMENTO, NOMBRE) VALUES 
(9, 2, 'Tacna'),
(10, 2, 'Tarata'),
(11, 2, 'Jorge Basadre'),
(12, 2, 'Candarave');
--Distritos de Tacna
INSERT INTO MAE_DISTRITO (ID_DISTRITO, ID_PROVINCIA, NOMBRE) VALUES 
-- Distritos de la provincia de Tacna
(109, 9, 'Tacna'),
(110, 9, 'Alto de la Alianza'),
(111, 9, 'Calana'),
(112, 9, 'Ciudad Nueva'),
(113, 9, 'Inclán'),
(114, 9, 'Pachía'),
(115, 9, 'Palca'),
(116, 9, 'Pocollay'),
(117, 9, 'Sama'),
(118, 9, 'Coronel Gregorio Albarracín Lanchipa'),

-- Distritos de la provincia de Tarata
(119, 10, 'Tarata'),
(120, 10, 'Héroes Albarracín'),
(121, 10, 'Estique'),
(122, 10, 'Estique-Pampa'),
(123, 10, 'Sitajara'),
(124, 10, 'Susapaya'),
(125, 10, 'Tarucachi'),
(126, 10, 'Ticaco'),

-- Distritos de la provincia de Jorge Basadre
(127, 11, 'Locumba'),
(128, 11, 'Ilabaya'),
(129, 11, 'Ite'),

-- Distritos de la provincia de Candarave
(130, 12, 'Candarave'),
(131, 12, 'Cairani'),
(132, 12, 'Camilaca'),
(133, 12, 'Curibaya'),
(134, 12, 'Huanuara'),
(135, 12, 'Quilahuani');
--Departamento de Moquegua
INSERT INTO MAE_DEPARTAMENTO (ID_DEPARTAMENTO, NOMBRE) VALUES (3, 'Moquegua');
--Provincias de Moquegua
INSERT INTO MAE_PROVINCIA (ID_PROVINCIA, ID_DEPARTAMENTO, NOMBRE) VALUES 
(13, 3, 'Mariscal Nieto'),
(14, 3, 'General Sánchez Cerro'),
(15, 3, 'Ilo');
--Distritos de Moquegua
INSERT INTO MAE_DISTRITO (ID_DISTRITO, ID_PROVINCIA, NOMBRE) VALUES 
-- Distritos de la provincia de Mariscal Nieto
(136, 13, 'Moquegua'),
(137, 13, 'Carumas'),
(138, 13, 'Cuchumbaya'),
(139, 13, 'Samegua'),
(140, 13, 'San Cristóbal'),
(141, 13, 'Torata'),

-- Distritos de la provincia de General Sánchez Cerro
(142, 14, 'Omate'),
(143, 14, 'Chojata'),
(144, 14, 'Coalaque'),
(145, 14, 'Ichuña'),
(146, 14, 'La Capilla'),
(147, 14, 'Lloque'),
(148, 14, 'Matalaque'),
(149, 14, 'Puquina'),
(150, 14, 'Quinistaquillas'),
(151, 14, 'Ubinas'),
(152, 14, 'Yunga'),

-- Distritos de la provincia de Ilo
(153, 15, 'Ilo'),
(154, 15, 'El Algarrobal'),
(155, 15, 'Pacocha');
--Departamento de Puno
INSERT INTO MAE_DEPARTAMENTO (ID_DEPARTAMENTO, NOMBRE) VALUES (4, 'Puno');
--Provincias de Puno
INSERT INTO MAE_PROVINCIA (ID_PROVINCIA, ID_DEPARTAMENTO, NOMBRE) VALUES 
(16, 4, 'Puno'),
(17, 4, 'Azángaro'),
(18, 4, 'Carabaya'),
(19, 4, 'Chucuito'),
(20, 4, 'El Collao'),
(21, 4, 'Huancané'),
(22, 4, 'Lampa'),
(23, 4, 'Melgar'),
(24, 4, 'Moho'),
(25, 4, 'San Antonio de Putina'),
(26, 4, 'San Román'),
(27, 4, 'Sandia'),
(28, 4, 'Yunguyo');
--Distritos de Puno
INSERT INTO MAE_DISTRITO (ID_DISTRITO, ID_PROVINCIA, NOMBRE) VALUES 
-- Distritos de la provincia de Puno
(156, 16, 'Puno'),
(157, 16, 'Acora'),
(158, 16, 'Amantani'),
(159, 16, 'Atuncolla'),
(160, 16, 'Capachica'),
(161, 16, 'Chucuito'),
(162, 16, 'Coata'),
(163, 16, 'Huata'),
(164, 16, 'Mañazo'),
(165, 16, 'Paucarcolla'),
(166, 16, 'Pichacani'),
(167, 16, 'Plateria'),
(168, 16, 'San Antonio'),
(169, 16, 'Tiquillaca'),
(170, 16, 'Vilque'),

-- Distritos de la provincia de Azángaro
(171, 17, 'Azángaro'),
(172, 17, 'Achaya'),
(173, 17, 'Arapa'),
(174, 17, 'Asillo'),
(175, 17, 'Caminaca'),
(176, 17, 'Chupa'),
(177, 17, 'José Domingo Choquehuanca'),
(178, 17, 'Muñani'),
(179, 17, 'Potoni'),
(180, 17, 'Saman'),
(181, 17, 'San Antón'),
(182, 17, 'San José'),
(183, 17, 'San Juan de Salinas'),
(184, 17, 'Santiago de Pupuja'),
(185, 17, 'Tirapata'),

-- Distritos de la provincia de Carabaya
(186, 18, 'Macusani'),
(187, 18, 'Ajoyani'),
(188, 18, 'Ayapata'),
(189, 18, 'Coasa'),
(190, 18, 'Corani'),
(191, 18, 'Crucero'),
(192, 18, 'Ituata'),
(193, 18, 'Ollachea'),
(194, 18, 'San Gaban'),

-- Distritos de la provincia de Chucuito
(195, 19, 'Juli'),
(196, 19, 'Desaguadero'),
(197, 19, 'Huacullani'),
(198, 19, 'Kelluyo'),
(199, 19, 'Pisacoma'),
(200, 19, 'Pomata'),
(201, 19, 'Zepita'),

-- Distritos de la provincia de El Collao
(202, 20, 'Ilave'),
(203, 20, 'Capazo'),
(204, 20, 'Santa Rosa'),
(205, 20, 'Conduriri'),

-- Distritos de la provincia de Huancané
(206, 21, 'Huancané'),
(207, 21, 'Cojata'),
(208, 21, 'Huatasani'),
(209, 21, 'Inchupalla'),
(210, 21, 'Pusi'),
(211, 21, 'Rosaspata'),
(212, 21, 'Taraco'),
(213, 21, 'Vilque Chico'),

-- Distritos de la provincia de Lampa
(214, 22, 'Lampa'),
(215, 22, 'Cabanilla'),
(216, 22, 'Calapuja'),
(217, 22, 'Nicasio'),
(218, 22, 'Ocuviri'),
(219, 22, 'Palca'),
(220, 22, 'Paratia'),
(221, 22, 'Pucara'),

-- Distritos de la provincia de Melgar
(222, 23, 'Ayaviri'),
(223, 23, 'Antauta'),
(224, 23, 'Cupi'),
(225, 23, 'Llalli'),
(226, 23, 'Macari'),
(227, 23, 'Nuñoa'),
(228, 23, 'Orurillo'),
(229, 23, 'Santa Rosa'),
(230, 23, 'Umachiri'),

-- Distritos de la provincia de Moho
(231, 24, 'Moho'),
(232, 24, 'Conima'),
(233, 24, 'Huayrapata'),
(234, 24, 'Tilali'),

-- Distritos de la provincia de San Antonio de Putina
(235, 25, 'Putina'),
(236, 25, 'Ananea'),
(237, 25, 'Pedro Vilca Apaza'),
(238, 25, 'Quilcapuncu'),

-- Distritos de la provincia de San Román
(239, 26, 'Juliaca'),
(240, 26, 'Cabana'),
(241, 26, 'Cabanillas'),
(242, 26, 'Caracoto'),

-- Distritos de la provincia de Sandia
(243, 27, 'Sandia'),
(244, 27, 'Cuyocuyo'),
(245, 27, 'Limbani'),
(246, 27, 'Patambuco'),
(247, 27, 'Phara'),
(248, 27, 'Quiaca'),
(249, 27, 'San Juan del Oro'),
(250, 27, 'Yanahuaya'),
(251, 27, 'Alto Inambari'),

-- Distritos de la provincia de Yunguyo
(252, 28, 'Yunguyo'),
(253, 28, 'Anapia'),
(254, 28, 'Copani'),
(255, 28, 'Cuturapi'),
(256, 28, 'Ollaraya'),
(257, 28, 'Tinicachi');


-- Insertando datos en MAE_TIPO_DOCUMENTO
INSERT INTO MAE_TIPO_DOCUMENTO (ID_TIPO_DOCUMENTO, DESCRIPCION) VALUES
  (1,'DNI'),
  (2,'RUC'),
  (3,'Carnet de extranjería'),
  (4,'Pasaporte');


INSERT INTO MAE_UNIDADES (ID_UNIDAD, DESCRIPCION) VALUES 
(1, 'Unidades'),
(2, 'Kilogramos'),
(3, 'Litros'),
(4, 'Metros cuadrados'),
(5, 'Cajas'),
(6, 'Paquetes'),
(7, 'Botellas');

INSERT INTO MAE_VEHICULO (ID_VEHICULO, PLACA, CATEGORIA, CAPACIDAD, IND_RETORNO) VALUES 
(1, 'ABC-123', 'Camión', 10.5, true),
(2, 'DEF-456', 'Camioneta', 5.0, true),
(3, 'GHI-789', 'Furgoneta', 3.2, true),
(4, 'JKL-012', 'Trailer', 15.0, true),
(5, 'MNO-345', 'Pickup', 1.5, true),
(6, 'PQR-678', 'Camión', 12.0, true);

INSERT INTO MAE_TRANSPORTISTA (ID_TRANSPORTISTA, ID_TIPO_DOCUMENTO, NOMBRE, APELLIDO, NUM_LICENCIA) VALUES 
(1, 1, 'Napoleón', 'Peréz', 'A23456'),
(2, 2, 'María', 'García', '654G21'),
(3, 1, 'Juan', 'Bonaparte', '9H7654'),
(4, 2, 'Laura', 'Flores', '32109P'),
(5, 1, 'Carlos', 'López', '5W7890');

INSERT INTO MAE_PRODUCTO (ID_PRODUCTO, ID_UNIDAD, NOMBRE, DESCRIPCION, PESO) VALUES 
(1, 2, 'Martillo', 'Martillo de acero forjado', 1.5),
(2, 5, 'Lámpara LED', 'Lámpara de techo con tecnología LED', 2.3),
(3, 1, 'Mesa de madera', 'Mesa de comedor estilo rústico', 10.0),
(4, 3, 'Aceite de oliva', 'Aceite de oliva virgen extra', 0.75),
(5, 6, 'Juego de sábanas', 'Sábanas de algodón 300 hilos', 1.2),
(6, 4, 'Pintura blanca', 'Pintura al agua para interiores', 2.5),
(7, 2, 'Destornillador', 'Destornillador eléctrico recargable', 1.0),
(8, 7, 'Vino tinto', 'Vino tinto reserva, cosecha 2020', 0.75),
(9, 5, 'Laptop', 'Laptop ultradelgada con pantalla táctil', 2.1),
(10, 1, 'Tornillos', 'Tornillos de acero inoxidable', 0.02),
(11, 3, 'Agua mineral', 'Agua mineral sin gas, botella 1 litro', 1.8),
(12, 6, 'Set de cocina', 'Set de utensilios de cocina antiadherentes', 1.3),
(13, 4, 'Cemento Portland', 'Cemento para construcción de alta resistencia', 25.0),
(14, 2, 'Zapatos deportivos', 'Zapatos deportivos para running', 1.1),
(15, 7, 'Jabón líquido', 'Jabón líquido antibacterial, botella 500 ml', 0.5);

INSERT INTO MAE_CLIENTE (ID_CLIENTE, ID_TIPO_DOCUMENTO, ID_DOCUMENTO, ID_DIRECCION, NUM_DOCUMENTO, DIRECCION, NOMBRE, TELEFONO) VALUES 
(1, 1, 12345678, 136, '12345678', 'Av. Puno 567, Puno', 'Panadería San Martín', '951234567'),
(2, 2, 87654321, 153, '20123456789', 'Av. Lima 890, Lima', 'Tienda Mi Hogar', '954321987'),
(3, 1, 34567890, 171, '34567890', 'Jr. Arequipa 123, Arequipa', 'Restaurante El Sabor', '959876543'),
(4, 2, 98765432, 191, '20345678901', 'Av. Cusco 456, Cusco', 'Ferretería San Pablo', '977654321'),
(5, 1, 23456789, 223, '56789012', 'Jr. Tacna 789, Tacna', 'Librería El Saber', '975432198'),
(6, 2, 65432109, 239, '23567890123', 'Av. Moquegua 901, Moquegua', 'Supermercado El Sol', '973214567'),
(7, 1, 89012345, 206, '45678901', 'Jr. Juliaca 234, Juliaca', 'Farmacia San Lucas', '956789123'),
(8, 2, 32109876, 227, '67890123', 'Av. Ayaviri 567, Ayaviri', 'Ferretería La Construcción', '974567890'),
(9, 1, 56789012, 243, '56789012', 'Jr. Puno 890, Puno', 'Ferretería La Estrella', '952345678'),
(10, 2, 10987654, 252, '34567890', 'Av. Ilave 901, Ilave', 'Ferretería El Poderoso', '973456789');

INSERT INTO MAE_PROVEEDOR (ID_PROVEEDOR, ID_TIPO_DOCUMENTO, ID_DIRECCION, DIRECCION, NOMBRE, TELEFONO, CORREO) VALUES 
(1, 2, 136, 'Av. Simón Bolívar 1234, Arequipa', 'Distribuidora La Unión SAC', '958746321', 'info@distribuidoralu.com'),
(2, 1, 153, 'Jr. Lima 567, Ilo', 'Ferretería El Progreso', '972345678', 'ventas@ferreteriaelprogreso.com'),
(3, 2, 171, 'Calle Comercio 890, Puno', 'Productos del Altiplano EIRL', '951234567', 'contacto@productosaltiplano.com');
