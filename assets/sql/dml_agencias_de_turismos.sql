/*
-Instituto: "IESTP Jose María Arguedas - Puquio"-
--Unidad Didáctica: Herramientas de desarrollo de Software--
--Unidad Didáctica: Análisis y Diseño de Sistemas--
--Docente: Ing Jhon David Ccoyllo Rojas--
--Perido académico: IV--
--Programa de estudio: APSTI--
---Fecha entrega: 13/11/2024---

Base de datos: bd_agencias_de_turismos
Descripcion:
Integrantes:
-
-
-
-
-

Subconjunto del lenguaje SQL: DML
*/

INSERT INTO module(name, icon)
VALUES
('Gestión de Reservas', 'event'),
('Gestión de Clientes', 'person'),
('Facturación y Pagos', 'receipt_long'),
('Administración de Inventario', 'inventory_2'),
('Gestión de Paquetes Turísticos', 'card_travel'),
('Análisis y Reportes', 'bar_chart'),
('Marketing y Promociones', 'campaign'),
('Gestión de Usuarios y Roles', 'manage_accounts'),
('Seguimiento de Viajes', 'location_on');

INSERT INTO category(id, name)
VALUES
(1,'Aventura'),
(2,'Cultural'),
(3,'Gastronómico'),
(4,'Playa y Sol'),
(5,'Familiar'),
(6,'Negocio'),
(7,'Deporte'),
(8,'Relajación y Bienestar'),
(9,'Naturaleza');

INSERT INTO agency(ruc, company_name, front_page, avatar, location, category_id)
VALUES
('20100912768', 'TRAVEL GROUP PERU S.A.', '20100912768_front_page.jpg', '20100912768_avatar.jpg', 'Lima', 1),
('20610247033', 'MEDIA TRAVEL GROUP S.A.C.', '20610247033_front_page.jpg', '20610247033_avatar.jpg', 'Lima', 2),
('20448459978', 'PUNO TOURS SERVICIOS TURISTICOS EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA', '20448459978_front_page.jpg', '20448459978_avatar.jpg', 'Puno', 3),
('20534780185', 'E & N HUAMANGA TOURS S.R.L.', '20534780185_front_page.jpg', '20534780185_avatar.jpg', 'Huamanga', 4),
('20605213015', 'AGENCIA DE VIAJES Y TURISMO AYACUCHO TRAVEL E.I.R.L.', '20605213015_front_page.jpg', '20605213015_avatar.jpg', 'Huamanga', 5),
('20606832509', 'AGENCIA DE VIAJES Y TURISMO OPERADOR DE TURISMO HUANCARAYLLA TRAVEL S.R.L.', '20606832509_front_page.jpg', '20606832509_avatar.jpg', 'Huamanga', 6),
('20600693701', 'VIAJES EXPRESS TRAVEL PERU S.A.C.', '20600693701_front_page.jpg', '20600693701_avatar.jpg', 'Lima', 7),
('20452714125', 'MOROCHUCOS REP´S S.R.L.', '20452714125_front_page.jpg', '20452714125_avatar.jpg', 'Huamanga', 8),
('20602780911', 'APU KUNTUR TRAVEL E.I.R.L.', '20602780911_front_page.jpg', '20602780911_avatar.jpg', 'Lucanas', 9),
('20601738636', 'AGENCIA DE VIAJES Y TURISMO ZAMY E.I.R.L.', '20601738636_front_page.jpg', '20601738636_avatar.jpg', 'Huamanga', 1);

INSERT INTO favorite(agency_id)
VALUES
(1),
(2),
(3),
(4),
(5);