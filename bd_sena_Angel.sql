-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 05, 2023 at 03:42 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_adso_users`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

-- Cambiando el nombre de la tabla y de las columnas
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre_comple` varchar(50) NOT NULL,
  `fecha_Nac` date NOT NULL,
  `color` varchar(10) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL COMMENT 'Dirección del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Eliminando el insert original
-- INSERT INTO `usuario` (`id`, `nombre_comple`, `fecha_Nac`, `color`, `correo`, `phone`, `direccion`) VALUES
-- (22, 'Test adso', '2000-01-01', '#fff', 'test3@test.com', '1231231231230', '123 Main Street');

-- Insertando 10 registros nuevos
INSERT INTO `usuario` (`id`, `nombre_comple`, `fecha_Nac`, `color`, `correo`, `phone`, `direccion`) VALUES
(1, 'Juan Pérez', '1990-05-15', '#00ff00', 'juan.perez@email.com', '1234567890', 'Av. Principal 123'),
(2, 'María Gómez', '1985-08-22', '#0000ff', 'maria.gomez@email.com', '9876543210', 'Calle Secundaria 456'),
-- Agrega aquí los registros restantes
(3, 'Luis Rodríguez', '2002-03-10', '#ff0000', 'luis.rodriguez@email.com', '5555555555', 'Calle Principal 789'),
(4, 'Ana Martínez', '1998-12-05', '#ffff00', 'ana.martinez@email.com', '7777777777', 'Av. Secundaria 321'),
(5, 'Pedro Sánchez', '1995-06-28', '#ff00ff', 'pedro.sanchez@email.com', '9999999999', 'Calle Principal 654'),
(6, 'Sofía Torres', '1980-09-17', '#00ffff', 'sofia.torres@email.com', '3333333333', 'Av. Secundaria 987'),
(7, 'Miguel González', '1993-11-02', '#800080', 'miguel.gonzalez@email.com', '6666666666', 'Calle Principal 321'),
(8, 'Elena Ramírez', '1987-04-25', '#008000', 'elena.ramirez@email.com', '4444444444', 'Av. Secundaria 654'),
(9, 'Javier Herrera', '2000-07-14', '#800000', 'javier.herrera@email.com', '2222222222', 'Calle Principal 987'),
(10, 'Carolina López', '1996-02-18', '#008080', 'carolina.lopez@email.com', '1111111111', 'Av. Secundaria 123');

-- Indexes y AUTO_INCREMENT para la nueva tabla
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD INDEX `idx_direccion` (`direccion`);

ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

-- Función para calcular la edad basada en la fecha de nacimiento
DELIMITER //
CREATE FUNCTION `calcular_edad` (fecha_nacimiento DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE edad INT;
    SET edad = YEAR(CURDATE()) - YEAR(fecha_nacimiento) - (RIGHT(CURDATE(), 5) < RIGHT(fecha_nacimiento, 5));
    RETURN edad;
END //
DELIMITER ;

-- Comentario para la nueva función
-- Función para calcular la edad basada en la fecha de nacimiento

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

