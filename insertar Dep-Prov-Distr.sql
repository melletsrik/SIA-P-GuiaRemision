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

-- mae_tipo_documento
insert into mae_tipo_documento (id_tipo_documento, descripcion) values 
(1, 'DNI'),
(2, 'Pasaporte'),
(3, 'Carné de Extranjería'),
(4, 'RUC');

-- mae_unidades
insert into mae_unidades (id_unidad, descripcion) values 
(1, 'Caja'),
(2, 'Botella'),
(3, 'Saco'),
(4, 'Bolsa'),
(5, 'Paquete'),
(6, 'Lata'),
(7, 'Unidad');
-- mae_transportista
insert into mae_transportista (id_transportista, id_tipo_documento, nombre, apellido, num_licencia) values 
('12345678', 1, 'Carlos', 'Perez', 'B1234567'),
('87654321', 1, 'Luis', 'Gomez', 'C7654321'),
('23456789', 1, 'Juan', 'Ramirez', 'D2345678'),
('98765432', 1, 'Pedro', 'Martinez', 'E8765432');
-- mae_cliente
insert into mae_cliente (id_cliente, id_tipo_documento, id_direccion, direccion, nombre, telefono) values 
('87654321', 1, 1, 'Av. Larco 123', 'Ana Lopez', '987654321'),
('12345678', 1, 2, 'Jr. Puno 456', 'Maria Fernandez', '876543210'),
('23456789', 1, 3, 'Calle Lima 789', 'Jose Rojas', '765432109'),
('98765432', 1, 4, 'Av. Grau 321', 'Rosa Vargas', '654321098'),
('34567890', 1, 5, 'Jr. Cusco 654', 'Carlos Chavez', '543210987'),
('87654322', 1, 6, 'Calle Arequipa 987', 'Luis Castro', '432109876'),
('45678901', 1, 7, 'Av. Tacna 111', 'Juan Sanchez', '321098765'),
('56789012', 1, 8, 'Jr. Moquegua 222', 'Pedro Torres', '210987654');
-- mae_proveedor
insert into mae_proveedor (id_proveedor, id_tipo_documento, nombre, telefono, correo) values 
('20123456789', 4, 'Proveedor Uno', '987654321', 'proveedor1@example.com'),
('20234567890', 4, 'Proveedor Dos', '876543210', 'proveedor2@example.com'),
('20345678901', 4, 'Proveedor Tres', '765432109', 'proveedor3@example.com');
-- mae_producto
insert into mae_producto (id_producto, id_unidad, nombre, descripcion, peso) values 
('P001', 1, 'Producto 1', 'Descripción del producto 1', 1.5),
('P002', 2, 'Producto 2', 'Descripción del producto 2', 2.0),
('P003', 3, 'Producto 3', 'Descripción del producto 3', 3.5),
('P004', 4, 'Producto 4', 'Descripción del producto 4', 0.5),
('P005', 5, 'Producto 5', 'Descripción del producto 5', 4.0),
('P006', 6, 'Producto 6', 'Descripción del producto 6', 2.5),
('P007', 7, 'Producto 7', 'Descripción del producto 7', 1.0),
('P008', 1, 'Producto 8', 'Descripción del producto 8', 2.8),
('P009', 2, 'Producto 9', 'Descripción del producto 9', 1.2),
('P010', 3, 'Producto 10', 'Descripción del producto 10', 3.3);
-- mae_producto
insert into mae_producto (id_producto, id_unidad, nombre, descripcion, peso) values 
('E001', 1, 'Refrigeradora LG', 'Refrigeradora de 260 litros', 60.0),
('E002', 2, 'Lavadora Samsung', 'Lavadora de 16 kg', 70.0),
('E003', 3, 'Microondas Panasonic', 'Microondas de 23 litros', 12.0),
('E004', 4, 'Televisor Sony', 'Televisor LED de 55 pulgadas', 18.0),
('E005', 5, 'Aspiradora Bosch', 'Aspiradora de 1600W', 8.0),
('E006', 6, 'Licuadora Oster', 'Licuadora de 600W', 4.0),
('E007', 7, 'Horno Eléctrico Mabe', 'Horno eléctrico de 45 litros', 14.0),
('E008', 1, 'Cocina Indurama', 'Cocina a gas de 4 quemadores', 30.0),
('E009', 2, 'Ventilador Imaco', 'Ventilador de pie de 16 pulgadas', 5.0),
('E010', 3, 'Plancha Philips', 'Plancha a vapor 1200W', 2.0);
-- mae_usuario
insert into mae_usuario (id_usuario, id_tipo_documento, nombre, apellido, contrasenia, correo, telefono) values 
('admin', 1, 'Administrador', 'Principal', 'password123', 'admin@example.com', '987654321');
