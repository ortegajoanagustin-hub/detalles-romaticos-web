-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2026 at 09:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `detalles_romanticos`
--

-- --------------------------------------------------------

--
-- Table structure for table `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carrito`
--

INSERT INTO `carrito` (`id`, `usuario_id`, `fecha_creacion`) VALUES
(1, 1, '2026-10-16 06:20:13'),
(2, 2, '2026-10-16 06:20:13'),
(3, 3, '2026-10-16 06:44:34'),
(4, 4, '2026-10-16 10:33:14'),
(5, 5, '2026-10-16 11:11:23');

-- --------------------------------------------------------

--
-- Table structure for table `detalle_carrito`
--

CREATE TABLE `detalle_carrito` (
  `id` int(11) NOT NULL,
  `carrito_id` int(11) NOT NULL,
  `regalo_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1
) ;

--
-- Dumping data for table `detalle_carrito`
--

INSERT INTO `detalle_carrito` (`id`, `carrito_id`, `regalo_id`, `cantidad`) VALUES
(5, 1, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `regalo_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL
) ;

--
-- Dumping data for table `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `pedido_id`, `regalo_id`, `cantidad`, `precio_unitario`) VALUES
(1, 1, 9, 1, 60.00),
(2, 2, 9, 3, 60.00),
(3, 3, 8, 10, 21700.00);

-- --------------------------------------------------------

--
-- Table structure for table `direccion`
--

CREATE TABLE `direccion` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `calle` varchar(150) NOT NULL,
  `ciudad` varchar(150) NOT NULL,
  `codigo_postal` varchar(20) NOT NULL,
  `es_principal` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` enum('pendiente','pagado','enviado','recibido','cancelado') NOT NULL DEFAULT 'pendiente',
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pedidos`
--

INSERT INTO `pedidos` (`id`, `usuario_id`, `total`, `estado`, `fecha_pedido`) VALUES
(1, 1, 60.00, 'pendiente', '2026-10-16 07:06:04'),
(2, 4, 180.00, 'pendiente', '2026-10-16 10:35:14'),
(3, 1, 217000.00, 'pendiente', '2026-10-16 10:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `regalos`
--

CREATE TABLE `regalos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(150) DEFAULT NULL,
  `material` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `categoria` varchar(30) NOT NULL DEFAULT 'otros',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ;

--
-- Dumping data for table `regalos`
--

INSERT INTO `regalos` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `material`, `color`, `categoria`, `fecha_creacion`) VALUES
(1, 'Collar con grabado de coordenadas', 'Collar de plata con las coordenadas del lugar que ustedes elijan grabadas a mano.', 28500.00, 12, NULL, 'Plata 925', 'Plateado', 'joyeria', '2026-10-16 06:20:13'),
(2, 'Ramo de rosas con tarjeta dedicada', 'Docena de rosas frescas con tarjeta escrita con tu mensaje.', 14900.00, 20, NULL, 'Rosas naturales', 'Rojo', 'flores', '2026-10-16 06:20:13'),
(3, 'Caja de bombones con mensaje grabado', 'Bombones artesanales en caja con tu mensaje grabado en la tapa.', 9200.00, 30, NULL, 'Chocolate', 'Marrón', 'gourmet', '2026-10-16 06:20:13'),
(4, 'Caja sorpresa con fotos y cartas', 'Caja con fotos impresas, cartas y pequeños detalles para recordar momentos juntos.', 17300.00, 15, NULL, 'Cartón rígido', 'Rosa', 'cajas', '2026-10-16 06:20:13'),
(5, 'Cena romántica con carta personalizada', 'Cena para dos con menú y carta personalizados con su historia.', 32000.00, 8, NULL, 'Experiencia', 'No aplica', 'experiencias', '2026-10-16 06:20:13'),
(6, 'Pulsera doble con iniciales grabadas', 'Pulsera doble de acero con las iniciales de ambos.', 19800.00, 18, NULL, 'Acero quirúrgico', 'Dorado', 'joyeria', '2026-10-16 06:20:13'),
(7, 'Flor del mes, entrega mensual', 'Una flor de estación entregada cada mes con una nota breve.', 11400.00, 25, NULL, 'Flores de estación', 'Variado', 'flores', '2026-10-16 06:20:13'),
(8, 'Torta artesanal con foto comestible', 'Torta artesanal decorada con una foto comestible a elección.', 21700.00, 0, NULL, 'Masa y crema', 'Blanco', 'gourmet', '2026-10-16 06:20:13'),
(9, 'anillo con forma de chipa', 'un elegante anillo de aniversario con un diseño de chipa', 60.00, 16, 'db14b3cc09894151a593f10d10a4a2d5.png', 'tungsteno', 'negro y amarillo', 'joyeria', '2026-10-16 06:40:15');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('cliente','admin') NOT NULL DEFAULT 'cliente',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol`, `fecha_registro`) VALUES
(1, 'Administrador', 'admin@amordetalle.com', '$2y$10$GY1j5ApkK8fDyFgScMXqcu/UPWe/HjwcQvOkzvfuF84YfQ4cZDQ2u', 'admin', '2026-10-16 06:20:13'),
(2, 'Cliente Demo', 'cliente@amordetalle.com', '$2y$10$fbMvGLTsIrUI1BK2O2YiVO5jPi2XPe/d.oq9U5kBVdi.ulPs42Ag2', 'cliente', '2026-10-16 06:20:13'),
(3, 'agustin', 'ortegajoanagustin@gmail.com', '$2y$10$0.ouutM8y4KH/BqrNAPgCOQDNhxfeJOGYBUyG46w3qrcRM2S8tBei', 'cliente', '2026-10-16 06:44:34'),
(4, 'Daniel', 'guancodaniel915@gmail.com', '$2y$10$BYNAnORF4y2cOR34JXyuGuuryCnjv6b3.iujLVvQqEZUwVpQYaWz.', 'cliente', '2026-10-16 10:33:14'),
(5, 'profe avalos', 'avalos@gmail.com', '$2y$10$bacIIjM1XMIi81Cdbyg0Pu7vUCRuMCmmb/ve1u3UoydOTgffWGVrW', 'cliente', '2026-10-16 11:11:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_carrito_regalo` (`carrito_id`,`regalo_id`),
  ADD KEY `fk_detalle_carrito_regalo` (`regalo_id`);

--
-- Indexes for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalle_pedido` (`pedido_id`),
  ADD KEY `fk_detalle_regalo` (`regalo_id`);

--
-- Indexes for table `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedido_usuario` (`usuario_id`);

--
-- Indexes for table `regalos`
--
ALTER TABLE `regalos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_regalos_categoria` (`categoria`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `regalos`
--
ALTER TABLE `regalos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `fk_carrito_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  ADD CONSTRAINT `fk_detalle_carrito` FOREIGN KEY (`carrito_id`) REFERENCES `carrito` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalle_carrito_regalo` FOREIGN KEY (`regalo_id`) REFERENCES `regalos` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fk_detalle_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalle_regalo` FOREIGN KEY (`regalo_id`) REFERENCES `regalos` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
