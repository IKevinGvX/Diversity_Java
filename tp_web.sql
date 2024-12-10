-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2024 a las 02:36:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tp_web`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingresar_usuarios` (IN `email` VARCHAR(255), IN `contraseña` VARCHAR(255), IN `fecha_creacion` DATE, IN `rol_id` INT)   BEGIN
    -- Verificar si el rol_id es NULL o no se ha proporcionado, y asignar 7
    IF rol_id IS NULL THEN
        SET rol_id = 7;
    END IF;
    
    -- Insertar usuario con rol_id determinado
    INSERT INTO usuarios (email, contrasena, fecha_creacion, rol_id) 
    VALUES (email, contraseña, fecha_creacion, rol_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerallproducts` ()   begin
declare total int;
select count(*) into total from productos;
select total as total_productos;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerproductocategoria` ()   begin
select b.producto_id,b.nombre_producto,b.descripcion,b.precio,b.stock,a.descripcion 
from categoria a inner join productos b
on a.idcategoria= b.idcategoria; end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes_inventario`
--

CREATE TABLE `ajustes_inventario` (
  `ajuste_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad_ajustada` int(11) DEFAULT NULL,
  `tipo_ajuste` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `almacen_id` int(11) NOT NULL,
  `nombre_almacen` varchar(100) DEFAULT NULL,
  `direccion_almacen` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`almacen_id`, `nombre_almacen`, `direccion_almacen`) VALUES
(1, 'Berlin Central Warehouse', 'Berliner Str. 15, Berlin, Germany'),
(2, 'Hamburg North Storage', 'Hamburger Allee 120, Hamburg, Germany'),
(3, 'Munich Logistics Hub', 'Munich Allee 45, Munich, Germany'),
(4, 'Frankfurt Main Depot', 'Frankfurter Str. 80, Frankfurt, Germany'),
(5, 'Cologne Distribution Center', 'Cologne Str. 25, Cologne, Germany'),
(6, 'Stuttgart South Warehouse', 'Stuttgart Allee 60, Stuttgart, Germany'),
(7, 'Dresden Regional Storage', 'Dresdner Str. 35, Dresden, Germany'),
(8, 'Bremen Logistics Point', 'Bremer Weg 90, Bremen, Germany'),
(9, 'Leipzig East Depot', 'Leipziger Str. 50, Leipzig, Germany'),
(10, 'Hannover Central Hub', 'Hannover Str. 65, Hannover, Germany'),
(11, 'Boston Storage Facility', 'Boston Ave 100, Boston, USA'),
(12, 'New York Main Warehouse', 'New York St 200, New York, USA'),
(13, 'Chicago Distribution Point', 'Chicago Ave 75, Chicago, USA'),
(14, 'Miami Logistics Center', 'Miami Blvd 50, Miami, USA'),
(15, 'San Francisco Depot', 'San Francisco St 120, San Francisco, USA'),
(16, 'Dallas Storage Unit', 'Dallas Pkwy 45, Dallas, USA'),
(17, 'Los Angeles West Warehouse', 'Los Angeles Blvd 95, Los Angeles, USA'),
(18, 'Houston South Depot', 'Houston Str. 35, Houston, USA'),
(19, 'Seattle North Logistics', 'Seattle Ave 125, Seattle, USA'),
(20, 'Denver Distribution Center', 'Denver St 70, Denver, USA'),
(21, 'Potsdam Regional Hub', 'Potsdamer Str. 30, Potsdam, Germany'),
(22, 'Lübeck Central Storage', 'Lübecker Weg 45, Lübeck, Germany'),
(23, 'Rostock Logistics Depot', 'Rostocker Str. 65, Rostock, Germany'),
(24, 'Magdeburg Warehouse', 'Magdeburger Allee 40, Magdeburg, Germany'),
(25, 'Kiel Storage Facility', 'Kiel Str. 55, Kiel, Germany'),
(26, 'Heidelberg Logistics Point', 'Heidelberger Str. 15, Heidelberg, Germany'),
(27, 'Freiburg Depot', 'Freiburger Str. 120, Freiburg, Germany'),
(28, 'Erlangen Hub', 'Erlanger Str. 35, Erlangen, Germany'),
(29, 'Mainz Distribution Unit', 'Mainzer Allee 50, Mainz, Germany'),
(30, 'Bonn Storage Center', 'Bonn Str. 90, Bonn, Germany'),
(31, 'San Diego Warehouse', 'San Diego St 110, San Diego, USA'),
(32, 'Atlanta Logistics Depot', 'Atlanta Ave 80, Atlanta, USA'),
(33, 'Austin Storage Hub', 'Austin Blvd 40, Austin, USA'),
(34, 'Phoenix Main Storage', 'Phoenix Str. 25, Phoenix, USA'),
(35, 'Portland Regional Unit', 'Portland Ave 95, Portland, USA'),
(36, 'Las Vegas Storage Facility', 'Las Vegas Blvd 60, Las Vegas, USA'),
(37, 'Philadelphia North Depot', 'Philadelphia St 75, Philadelphia, USA'),
(38, 'Charlotte Warehouse', 'Charlotte St 30, Charlotte, USA'),
(39, 'Detroit Logistics Point', 'Detroit Str. 85, Detroit, USA'),
(40, 'Salt Lake City Storage', 'Salt Lake Blvd 50, Salt Lake City, USA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen_productos`
--

CREATE TABLE `almacen_productos` (
  `producto_id` int(11) DEFAULT NULL,
  `almacen_id` int(11) DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `estado` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `descripcion`) VALUES
(1, 'Laptops'),
(2, 'Electrodomésticos'),
(3, 'Refrigeradores'),
(4, 'Lavadoras'),
(5, 'Secadoras de Ropa'),
(6, 'Microondas'),
(7, 'Cocinas'),
(8, 'Hornos Eléctricos'),
(9, 'Aspiradoras'),
(10, 'Ventiladores'),
(11, 'Aires Acondicionados'),
(12, 'Calentadores de Agua'),
(13, 'Freidoras de Aire'),
(14, 'Licuadoras'),
(15, 'Batidoras'),
(16, 'Tostadoras'),
(17, 'Cafeteras'),
(18, 'Extractores de Jugo'),
(19, 'Máquinas de Café Expreso'),
(20, 'Purificadores de Aire'),
(21, 'Congeladores'),
(22, 'Planchas'),
(23, 'Cocinas de Inducción'),
(24, 'Estufas Eléctricas'),
(25, 'Hornos de Pizza'),
(26, 'Robot de Cocina'),
(27, 'Deshumificadores de Aire'),
(28, 'Reparación de Electrodomésticos'),
(29, 'Sistemas de Refrigeración de Agua'),
(30, 'Herramientas de Reparación de Electrodomésticos'),
(31, 'Tecnología de Consumo'),
(32, 'Computadoras de Escritorio'),
(33, 'Laptops'),
(34, 'Tabletas'),
(35, 'Monitores'),
(36, 'Teclados y Ratones'),
(37, 'Cámaras Web'),
(38, 'Impresoras y Escáneres'),
(39, 'Sistemas de Sonido'),
(40, 'Cámaras de Seguridad'),
(41, 'Drones'),
(42, 'Consolas de Videojuegos'),
(43, 'Computadoras para Gaming'),
(44, 'Discos Duros Externos'),
(45, 'Memorias RAM'),
(46, 'Tarjetas Gráficas'),
(47, 'Placas Base para Computadoras'),
(48, 'Redes WiFi y Router'),
(49, 'UPS (Sistemas de Energía Ininterrumpida)'),
(50, 'Servicios de Reparación de Computadoras'),
(51, 'Instalación de Sistemas de Video Vigilancia'),
(52, 'Servicio Técnico de Mantenimiento Computacional'),
(53, 'Mantenimiento de Redes y Equipos Informáticos'),
(54, 'Instalación de Software y Actualización'),
(55, 'Sistemas de Backup y Recuperación de Datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cliente_` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `foto` longblob DEFAULT NULL,
  `ruc` int(11) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `foto` blob DEFAULT NULL,
  `ruc` int(11) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `usuario_id`, `nombre`, `apellido`, `fecha_nac`, `dni`, `foto`, `ruc`, `correo`, `telefono`, `direccion`) VALUES
(1, NULL, 'Carlos', 'Pérez', '1985-05-10', 12345678, 0x666f746f312e6a7067, 2147483647, 'carlos.perez@gmail.com', '+34-612345678', 'Calle Falsa 123, Madrid, España'),
(2, NULL, 'Ana', 'González', '1990-11-22', 23456789, 0x666f746f322e6a7067, 2147483647, 'ana.gonzalez@yahoo.com', '+1-555-2345678', 'Av. Libertador 2345, Buenos Aires, Argentina'),
(3, NULL, 'Luis', 'Martínez', '1982-02-14', 34567890, 0x666f746f332e6a7067, 2147483647, 'luis.martinez@hotmail.com', '+44-7911-234567', '10 Downing Street, Londres, Reino Unido'),
(4, NULL, 'Marta', 'López', '1995-04-17', 45678901, 0x666f746f342e6a7067, 2147483647, 'marta.lopez@outlook.com', '+33-612345678', 'Rue de Paris 45, París, Francia'),
(5, NULL, 'José', 'Hernández', '1978-09-05', 56789012, 0x666f746f352e6a7067, 2147483647, 'jose.hernandez@mail.com', '+52-55-12345678', 'Calle Reforma 101, Ciudad de México, México'),
(6, NULL, 'María', 'Rodríguez', '1992-08-30', 67890123, 0x666f746f362e6a7067, 2147483647, 'maria.rodriguez@icloud.com', '+49-151-23456789', 'Alexanderplatz 15, Berlín, Alemania'),
(7, NULL, 'Pedro', 'García', '1990-01-12', 78901234, 0x666f746f372e6a7067, 2147483647, 'pedro.garcia@aol.com', '+1-800-2345678', 'Main Street 500, Los Angeles, USA'),
(8, NULL, 'Laura', 'Sánchez', '1988-03-20', 89012345, 0x666f746f382e6a7067, 2147483647, 'laura.sanchez@live.com', '+61-412345678', 'King Street 50, Sídney, Australia'),
(9, NULL, 'Ricardo', 'Ramírez', '1993-07-25', 90123456, 0x666f746f392e6a7067, 2147483647, 'ricardo.ramirez@gmail.com', '+34-612345679', 'Gran Via 15, Barcelona, España'),
(10, NULL, 'Beatriz', 'Díaz', '1987-10-08', 12345679, 0x666f746f31302e6a7067, 2147483647, 'beatriz.diaz@yahoo.com', '+39-320-1234567', 'Via Roma 55, Roma, Italia'),
(11, NULL, 'Sofía', 'Martín', '1994-09-15', 12346789, 0x666f746f31312e6a7067, 2147483647, 'sofia.martin@outlook.com', '+34-622345679', 'Carrer de Balmes 101, Barcelona, España'),
(12, NULL, 'Javier', 'Fernández', '1980-01-11', 23457890, 0x666f746f31322e6a7067, 2147483647, 'javier.fernandez@icloud.com', '+54-911-2345678', 'Av. 9 de Julio 750, Buenos Aires, Argentina'),
(13, NULL, 'Esteban', 'Vázquez', '1992-03-30', 34568901, 0x666f746f31332e6a7067, 2147483647, 'esteban.vazquez@hotmail.com', '+1-212-2345678', '5th Ave 200, New York, USA'),
(14, NULL, 'Elena', 'Torres', '1986-12-22', 45679012, 0x666f746f31342e6a7067, 2147483647, 'elena.torres@mail.com', '+44-793-234567', 'Oxford Street 80, Londres, Reino Unido'),
(15, NULL, 'Gabriel', 'Gutiérrez', '1990-05-05', 56789123, 0x666f746f31352e6a7067, 2147483647, 'gabriel.gutierrez@aol.com', '+33-670123456', 'Champs-Élysées 75, París, Francia'),
(16, NULL, 'Clara', 'Jiménez', '1988-07-14', 67890234, 0x666f746f31362e6a7067, 2147483647, 'clara.jimenez@gmail.com', '+52-55-23456789', 'Paseo de la Reforma 120, Ciudad de México, México'),
(17, NULL, 'Andrés', 'Alvarez', '1995-06-28', 78901345, 0x666f746f31372e6a7067, 2147483647, 'andres.alvarez@live.com', '+49-1701234567', 'Kurfürstendamm 40, Berlín, Alemania'),
(18, NULL, 'Patricia', 'Moreno', '1983-08-19', 89012456, 0x666f746f31382e6a7067, 2147483647, 'patricia.moreno@outlook.com', '+61-412345678', 'George St 75, Sídney, Australia'),
(19, NULL, 'Felipe', 'Ruiz', '1989-10-10', 90123567, 0x666f746f31392e6a7067, 2147483647, 'felipe.ruiz@gmail.com', '+34-612345680', 'Avenida Brasil 500, Madrid, España'),
(20, NULL, 'Beatriz', 'Serrano', '1984-02-23', 12346790, 0x666f746f32302e6a7067, 2147483647, 'beatriz.serrano@yahoo.com', '+1-415-2345678', 'Mission Street 120, San Francisco, USA'),
(21, NULL, 'Santiago', 'Vega', '1982-03-17', 12347890, 0x666f746f32312e6a7067, 2147483647, 'santiago.vega@gmail.com', '+34-612345681', 'Calle del Mar 200, Valencia, España'),
(22, NULL, 'Carla', 'Santos', '1991-07-22', 23457901, 0x666f746f32322e6a7067, 2147483647, 'carla.santos@yahoo.com', '+1-555-2345679', 'Av. Paulista 800, São Paulo, Brasil'),
(23, NULL, 'Felipe', 'Castro', '1994-06-12', 34568012, 0x666f746f32332e6a7067, 2147483647, 'felipe.castro@hotmail.com', '+44-7911-234568', '1 Kingsway, Londres, Reino Unido'),
(24, NULL, 'Lorena', 'Gutiérrez', '1988-04-25', 45679123, 0x666f746f32342e6a7067, 2147483647, 'lorena.gutierrez@outlook.com', '+33-612345679', 'Avenue des Champs-Élysées 78, París, Francia'),
(25, NULL, 'Manuel', 'Torres', '1980-11-05', 56789234, 0x666f746f32352e6a7067, 2147483647, 'manuel.torres@mail.com', '+52-55-34567890', 'Calle Juárez 10, Guadalajara, México'),
(26, NULL, 'Gabriela', 'Mendoza', '1992-10-15', 67890345, 0x666f746f32362e6a7067, 2147483647, 'gabriela.mendoza@icloud.com', '+49-1702345678', 'Münchener Str. 12, Berlín, Alemania'),
(27, NULL, 'Diego', 'Serrano', '1995-02-02', 78901456, 0x666f746f32372e6a7067, 2147483647, 'diego.serrano@live.com', '+61-412345679', 'Flinders Street 65, Melbourne, Australia'),
(28, NULL, 'Nuria', 'Paredes', '1983-09-09', 89012567, 0x666f746f32382e6a7067, 2147483647, 'nuria.paredes@aol.com', '+39-3202345678', 'Piazza del Duomo 5, Milán, Italia'),
(29, NULL, 'Oscar', 'Ruiz', '1990-05-14', 90123678, 0x666f746f32392e6a7067, 2147483647, 'oscar.ruiz@outlook.com', '+34-672345680', 'Avenida de América 99, Madrid, España'),
(30, NULL, 'Lina', 'García', '1984-08-01', 12347901, 0x666f746f33302e6a7067, 2147483647, 'lina.garcia@gmail.com', '+1-408-2345678', 'Silicon Valley 400, San Francisco, USA'),
(31, NULL, 'Raúl', 'Rodríguez', '1996-12-10', 23458012, 0x666f746f33312e6a7067, 2147483647, 'raul.rodriguez@hotmail.com', '+44-7944-234569', 'High Street 50, Edimburgo, Reino Unido'),
(32, NULL, 'Elisa', 'Márquez', '1991-01-05', 34568123, 0x666f746f33322e6a7067, 2147483647, 'elisa.marquez@icloud.com', '+52-55-45678901', 'Av. Insurgentes 850, Ciudad de México, México'),
(33, NULL, 'Fernando', 'Jiménez', '1987-06-17', 45679234, 0x666f746f33332e6a7067, 2147483647, 'fernando.jimenez@aol.com', '+33-632123456', 'Rue de la République 35, Lyon, Francia'),
(34, NULL, 'Silvia', 'Morales', '1989-04-30', 56789345, 0x666f746f33342e6a7067, 2147483647, 'silvia.morales@mail.com', '+49-1603456789', 'Gendarmenmarkt 18, Berlín, Alemania'),
(35, NULL, 'Antonio', 'Castillo', '1993-09-23', 67890456, 0x666f746f33352e6a7067, 2147483647, 'antonio.castillo@outlook.com', '+1-646-2345678', 'Broadway 400, New York, USA'),
(36, NULL, 'Julia', 'Ríos', '1990-01-22', 78901567, 0x666f746f33362e6a7067, 2147483647, 'julia.rios@live.com', '+44-7421-234570', 'Oxford Street 120, Londres, Reino Unido'),
(37, NULL, 'Ricardo', 'Vázquez', '1986-03-14', 89012678, 0x666f746f33372e6a7067, 2147483647, 'ricardo.vazquez@icloud.com', '+33-612234567', 'Boulevard Saint-Germain 50, París, Francia'),
(38, NULL, 'Valeria', 'Moreno', '1995-08-19', 90124789, 0x666f746f33382e6a7067, 2147483647, 'valeria.moreno@gmail.com', '+34-612345681', 'Carrer de Pau Claris 90, Barcelona, España'),
(39, NULL, 'Sergio', 'Núñez', '1988-12-28', 12348012, 0x666f746f33392e6a7067, 2147483647, 'sergio.nunez@yahoo.com', '+52-55-56789012', 'Av. Paseo de la Reforma 100, Ciudad de México, México'),
(40, NULL, 'Claudia', 'Álvarez', '1985-06-05', 23459123, 0x666f746f34302e6a7067, 2147483647, 'claudia.alvarez@hotmail.com', '+49-1703456789', 'Grote Markt 45, Ámsterdam, Países Bajos'),
(41, NULL, 'Tomás', 'Herrera', '1992-11-17', 34560234, 0x666f746f34312e6a7067, 2147483647, 'tomas.herrera@aol.com', '+1-213-2345678', 'Sunset Blvd 600, Los Angeles, USA'),
(42, NULL, 'Victoria', 'Fuentes', '1993-03-29', 45671345, 0x666f746f34322e6a7067, 2147483647, 'victoria.fuentes@outlook.com', '+44-7911-234571', 'Baker Street 221B, Londres, Reino Unido'),
(43, NULL, 'Jorge', 'González', '1989-02-19', 56782456, 0x666f746f34332e6a7067, 2147483647, 'jorge.gonzalez@mail.com', '+52-55-67890123', 'Calle Reforma 1050, Ciudad de México, México'),
(44, NULL, 'Isabel', 'Ruiz', '1982-07-01', 67893567, 0x666f746f34342e6a7067, 2147483647, 'isabel.ruiz@gmail.com', '+49-1704567890', 'Karl-Marx-Allee 100, Berlín, Alemania'),
(45, NULL, 'Luis', 'Castro', '1991-05-13', 78904678, 0x666f746f34352e6a7067, 2147483647, 'luis.castro@live.com', '+34-672345682', 'Avenida 9 de Julio 600, Buenos Aires, Argentina'),
(46, NULL, 'Juliana', 'Reyes', '1990-02-09', 89015789, 0x666f746f34362e6a7067, 2147483647, 'juliana.reyes@outlook.com', '+33-612345678', 'Rue de Rivoli 101, París, Francia'),
(47, NULL, 'Ricardo', 'Martín', '1984-04-25', 90126890, 0x666f746f34372e6a7067, 2147483647, 'ricardo.martin@icloud.com', '+61-412345680', 'Queen St 120, Brisbane, Australia'),
(48, NULL, 'Cristina', 'Molina', '1987-01-15', 12349101, 0x666f746f34382e6a7067, 2147483647, 'cristina.molina@gmail.com', '+1-212-2345689', 'Park Ave 450, New York, USA'),
(49, NULL, 'Fernando', 'Sánchez', '1992-11-25', 23450212, 0x666f746f34392e6a7067, 2147483647, 'fernando.sanchez@yahoo.com', '+52-55-23456789', 'Avenida Insurgentes 300, Ciudad de México, México'),
(50, NULL, 'Andrea', 'Gómez', '1993-05-04', 34561323, 0x666f746f35302e6a7067, 2147483647, 'andrea.gomez@hotmail.com', '+49-1602345678', 'Friedrichstr. 50, Berlín, Alemania');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `empleado_id` bigint(20) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `rango` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `foto` longblob DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`empleado_id`, `usuario_id`, `rango`, `nombre`, `apellido`, `fecha_nac`, `dni`, `foto`, `correo`, `telefono`, `direccion`, `fecha`) VALUES
(1, NULL, 'Gerente', 'Anna', 'Müller', '1990-01-05', 0, NULL, 'anna.mueller@xyzcorp.de', '+49 30 123456', 'Berliner Str. 25, Berlin, Germany', NULL),
(2, NULL, 'Supervisor', 'Max', 'Schmidt', '1985-05-20', 0, NULL, 'max.schmidt@globaltech.de', '+49 40 987654', 'Hamburger Allee 100, Hamburg, Germany', NULL),
(3, NULL, 'Analista', 'Emma', 'Schneider', '1993-12-15', 0, NULL, 'emma.schneider@abccompany.de', '+49 69 543210', 'Frankfurter Str. 55, Frankfurt, Germany', NULL),
(4, NULL, 'Asistente', 'Paul', 'Fischer', '1987-03-11', 0, NULL, 'paul.fischer@xyzcorp.de', '+49 341 678901', 'Leipziger Str. 12, Leipzig, Germany', NULL),
(5, NULL, 'Gerente', 'Lara', 'Weber', '1992-07-22', 0, NULL, 'lara.weber@globaltech.de', '+49 711 234567', 'Stuttgart Allee 33, Stuttgart, Germany', NULL),
(6, NULL, 'Operador', 'Julia', 'Becker', '1990-09-14', 0, NULL, 'julia.becker@abccompany.de', '+49 351 345678', 'Dresdner Str. 90, Dresden, Germany', NULL),
(7, NULL, 'Supervisor', 'Luca', 'Hoffmann', '1995-11-30', 0, NULL, 'luca.hoffmann@xyzcorp.de', '+49 421 456789', 'Bremer Weg 45, Bremen, Germany', NULL),
(8, NULL, 'Analista', 'Sophie', 'Meyer', '1991-02-17', 0, NULL, 'sophie.meyer@globaltech.de', '+49 511 567890', 'Hannover Str. 80, Hannover, Germany', NULL),
(9, NULL, 'Asistente', 'Leo', 'Wagner', '1986-06-25', 0, NULL, 'leo.wagner@abccompany.de', '+49 89 678901', 'Munich Allee 23, Munich, Germany', NULL),
(10, NULL, 'Operador', 'Maria', 'Koch', '1988-04-18', 0, NULL, 'maria.koch@xyzcorp.de', '+49 221 789012', 'Cologne Str. 10, Cologne, Germany', NULL),
(11, NULL, 'Gerente', 'Alex', 'Bauer', '1985-07-09', 123456789, NULL, 'alex.bauer@globaltech.de', '+1 617 1234567', 'Boston Ave 22, Boston, USA', NULL),
(12, NULL, 'Supervisor', 'Clara', 'Zimmermann', '1990-08-15', 234567890, NULL, 'clara.zimmermann@abccompany.com', '+1 212 2345678', 'New York St 88, New York, USA', NULL),
(13, NULL, 'Analista', 'Nina', 'Schäfer', '1993-11-20', 345678901, NULL, 'nina.schaefer@xyzcorp.com', '+1 312 3456789', 'Chicago Ave 47, Chicago, USA', NULL),
(14, NULL, 'Asistente', 'Daniel', 'Krause', '1989-03-03', 456789012, NULL, 'daniel.krause@globaltech.com', '+1 305 4567890', 'Miami Blvd 30, Miami, USA', NULL),
(15, NULL, 'Gerente', 'Mia', 'Lehmann', '1994-10-10', 567890123, NULL, 'mia.lehmann@abccompany.com', '+1 415 5678901', 'San Francisco St 54, San Francisco, USA', NULL),
(16, NULL, 'Operador', 'Henry', 'Schulz', '1987-06-18', 678901234, NULL, 'henry.schulz@xyzcorp.com', '+1 972 6789012', 'Dallas Pkwy 18, Dallas, USA', NULL),
(17, NULL, 'Supervisor', 'Eva', 'Maier', '1992-01-14', 789012345, NULL, 'eva.maier@globaltech.com', '+1 310 7890123', 'Los Angeles Blvd 29, Los Angeles, USA', NULL),
(18, NULL, 'Analista', 'Lisa', 'Huber', '1991-05-22', 890123456, NULL, 'lisa.huber@abccompany.com', '+1 713 8901234', 'Houston Str. 60, Houston, USA', NULL),
(19, NULL, 'Asistente', 'Erik', 'König', '1986-12-01', 901234567, NULL, 'erik.koenig@xyzcorp.com', '+1 206 9012345', 'Seattle Ave 77, Seattle, USA', NULL),
(20, NULL, 'Operador', 'Olivia', 'Frank', '1995-09-27', 12345678, NULL, 'olivia.frank@globaltech.com', '+1 303 0123456', 'Denver St 31, Denver, USA', NULL),
(21, NULL, 'Gerente', 'Hans', 'Gruber', '1985-08-09', 0, NULL, 'hans.gruber@xyzcorp.de', '+49 6221 123456', 'Heidelberger Str. 50, Heidelberg, Germany', NULL),
(22, NULL, 'Supervisor', 'Greta', 'Wolf', '1993-10-05', 0, NULL, 'greta.wolf@globaltech.de', '+49 761 987654', 'Freiburger Str. 75, Freiburg, Germany', NULL),
(23, NULL, 'Analista', 'Lukas', 'Hartmann', '1990-06-12', 0, NULL, 'lukas.hartmann@abccompany.de', '+49 6131 543210', 'Mainzer Allee 32, Mainz, Germany', NULL),
(24, NULL, 'Asistente', 'Sara', 'Neumann', '1994-11-25', 0, NULL, 'sara.neumann@xyzcorp.de', '+49 621 678901', 'Mannheimer Str. 19, Mannheim, Germany', NULL),
(25, NULL, 'Gerente', 'Felix', 'Scholz', '1987-02-15', 0, NULL, 'felix.scholz@globaltech.de', '+49 231 234567', 'Dortmunder Weg 45, Dortmund, Germany', NULL),
(26, NULL, 'Operador', 'Emma', 'Lang', '1991-05-18', 0, NULL, 'emma.lang@abccompany.de', '+49 228 345678', 'Bonn Str. 65, Bonn, Germany', NULL),
(27, NULL, 'Supervisor', 'Noah', 'Klein', '1989-12-02', 0, NULL, 'noah.klein@xyzcorp.de', '+49 241 456789', 'Aachener Str. 22, Aachen, Germany', NULL),
(28, NULL, 'Analista', 'Lara', 'Seidel', '1995-03-29', 0, NULL, 'lara.seidel@globaltech.de', '+49 9131 567890', 'Erlanger Str. 50, Erlangen, Germany', NULL),
(29, NULL, 'Asistente', 'Julia', 'Walter', '1988-09-03', 0, NULL, 'julia.walter@abccompany.de', '+49 931 678901', 'Würzburger Str. 75, Würzburg, Germany', NULL),
(30, NULL, 'Operador', 'Oliver', 'Zimmer', '1992-07-22', 0, NULL, 'oliver.zimmer@xyzcorp.de', '+49 541 789012', 'Osnabrücker Str. 18, Osnabrück, Germany', NULL),
(31, NULL, 'Gerente', 'Hanna', 'Krämer', '1985-11-11', 901283746, NULL, 'hanna.kraemer@globaltech.de', '+1 801 1234567', 'Salt Lake Blvd 40, Salt Lake City, USA', NULL),
(32, NULL, 'Supervisor', 'Leo', 'Schuster', '1989-03-14', 801234567, NULL, 'leo.schuster@abccompany.com', '+1 619 2345678', 'San Diego St 90, San Diego, USA', NULL),
(33, NULL, 'Analista', 'Mia', 'Brandt', '1993-08-29', 701234567, NULL, 'mia.brandt@xyzcorp.com', '+1 404 3456789', 'Atlanta Ave 60, Atlanta, USA', NULL),
(34, NULL, 'Asistente', 'Eva', 'Lorenz', '1991-12-22', 601234567, NULL, 'eva.lorenz@globaltech.com', '+1 512 4567890', 'Austin Blvd 20, Austin, USA', NULL),
(35, NULL, 'Gerente', 'Henry', 'Arnold', '1986-10-07', 501234567, NULL, 'henry.arnold@abccompany.com', '+1 602 5678901', 'Phoenix Str. 12, Phoenix, USA', NULL),
(36, NULL, 'Operador', 'Alex', 'Simon', '1990-05-19', 401234567, NULL, 'alex.simon@xyzcorp.com', '+1 503 6789012', 'Portland Ave 42, Portland, USA', NULL),
(37, NULL, 'Supervisor', 'Clara', 'Hauser', '1995-02-13', 301234567, NULL, 'clara.hauser@globaltech.com', '+1 702 7890123', 'Las Vegas Blvd 77, Las Vegas, USA', NULL),
(38, NULL, 'Analista', 'Daniel', 'Koch', '1987-01-18', 201234567, NULL, 'daniel.koch@abccompany.com', '+1 215 8901234', 'Philadelphia St 30, Philadelphia, USA', NULL),
(39, NULL, 'Asistente', 'Lisa', 'Meier', '1992-06-05', 101234567, NULL, 'lisa.meier@xyzcorp.com', '+1 704 9012345', 'Charlotte St 54, Charlotte, USA', NULL),
(40, NULL, 'Operador', 'Nina', 'Berg', '1988-04-09', 91234567, NULL, 'nina.berg@globaltech.com', '+1 313 0123456', 'Detroit Str. 90, Detroit, USA', NULL),
(41, NULL, 'Gerente', 'Hans', 'Fuchs', '1990-03-15', 0, NULL, 'hans.fuchs@abccompany.de', '+49 431 123456', 'Kiel Str. 28, Kiel, Germany', NULL),
(42, NULL, 'Supervisor', 'Anna', 'Reuter', '1994-09-12', 0, NULL, 'anna.reuter@xyzcorp.de', '+49 331 987654', 'Potsdamer Str. 19, Potsdam, Germany', NULL),
(43, NULL, 'Analista', 'Max', 'Kuhn', '1991-10-08', 0, NULL, 'max.kuhn@globaltech.de', '+49 451 543210', 'Lübecker Weg 50, Lübeck, Germany', NULL),
(44, NULL, 'Asistente', 'Emma', 'Stein', '1989-12-25', 0, NULL, 'emma.stein@abccompany.de', '+49 381 678901', 'Rostocker Str. 10, Rostock, Germany', NULL),
(45, NULL, 'Operador', 'Paul', 'Witt', '1993-07-17', 0, NULL, 'paul.witt@xyzcorp.de', '+49 391 234567', 'Magdeburger Allee 22, Magdeburg, Germany', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_costos`
--

CREATE TABLE `historial_costos` (
  `historial_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_almacen_salida`
--

CREATE TABLE `movimientos_almacen_salida` (
  `movimiento_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo_movimiento` varchar(50) DEFAULT 'Salida'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_almacen_destinado`
--

CREATE TABLE `movimiento_almacen_destinado` (
  `movimiento_id` int(11) DEFAULT NULL,
  `almacen_id` int(11) DEFAULT NULL,
  `cantidad_enviada` int(11) DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `estado` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_almacen_entrada`
--

CREATE TABLE `movimiento_almacen_entrada` (
  `movimiento_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo_movimiento` varchar(50) DEFAULT 'Entrada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL,
  `nombre_producto` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `idcategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `nombre_producto`, `descripcion`, `precio`, `stock`, `idcategoria`) VALUES
(4, 'Laptop', 'Laptop Ryzen 7G', 1800.00, 12, 1),
(5, 'Refrigerador LG', 'Refrigerador de alta capacidad', 1200.00, 20, 1),
(6, 'Microondas Samsung', 'Microondas digital con múltiples funciones', 350.00, 50, 2),
(7, 'Licuadora Oster', 'Licuadora de 10 velocidades', 80.00, 100, 3),
(8, 'Aspiradora Dyson', 'Aspiradora sin bolsa de alta potencia', 600.00, 30, 4),
(9, 'Plancha Philips', 'Plancha de vapor con suela antiadherente', 40.00, 80, 5),
(10, 'Lavadora Whirlpool', 'Lavadora automática de 15 kg', 700.00, 15, 1),
(11, 'Secadora Samsung', 'Secadora eléctrica de ropa', 800.00, 12, 1),
(12, 'Batidora Kitchenaid', 'Batidora de pedestal con 10 velocidades', 500.00, 25, 3),
(13, 'Horno eléctrico Teka', 'Horno eléctrico empotrable', 400.00, 18, 2),
(14, 'Extractor de jugos Philips', 'Extractor de jugos de acero inoxidable', 120.00, 45, 3),
(15, 'Televisor LG 55\"', 'Televisor 4K UHD con Smart TV', 900.00, 22, 6),
(16, 'Freidora de aire Tefal', 'Freidora sin aceite de gran capacidad', 150.00, 40, 3),
(17, 'Cafetera Nespresso', 'Cafetera automática de cápsulas', 200.00, 35, 3),
(18, 'Ventilador Taurus', 'Ventilador de pie con 3 velocidades', 60.00, 70, 7),
(19, 'Calefactor Xiaomi', 'Calefactor eléctrico portátil', 100.00, 50, 7),
(20, 'Horno tostador Hamilton Beach', 'Horno tostador compacto', 70.00, 60, 2),
(21, 'Termoeléctrico Bosch', 'Calentador de agua eléctrico', 250.00, 20, 1),
(22, 'Parrilla eléctrica Oster', 'Parrilla eléctrica antiadherente', 110.00, 50, 3),
(23, 'Máquina de pan Panasonic', 'Máquina para hacer pan en casa', 180.00, 30, 3),
(24, 'Cortadora de pelo Wahl', 'Cortadora de pelo profesional', 50.00, 80, 8),
(25, 'Secadora de cabello Remington', 'Secadora de cabello con ionizador', 60.00, 65, 8),
(26, 'Horno de gas Mabe', 'Horno de gas empotrable', 700.00, 10, 2),
(27, 'Televisor Samsung 65\"', 'Televisor 4K UHD con panel QLED', 1200.00, 12, 6),
(28, 'Hidrolavadora Karcher', 'Hidrolavadora a presión compacta', 250.00, 40, 9),
(29, 'Humidificador Philips', 'Humidificador ultrasónico', 120.00, 30, 7),
(30, 'Cámara de seguridad Xiaomi', 'Cámara IP con visión nocturna', 80.00, 50, 10),
(31, 'Purificador de aire Dyson', 'Purificador con filtro HEPA', 400.00, 20, 7),
(32, 'Ventilador de torre Rowenta', 'Ventilador silencioso con mando', 150.00, 30, 7),
(33, 'Robot aspirador iRobot', 'Robot aspirador con mapeo inteligente', 600.00, 15, 4),
(34, 'Frigobar Mabe', 'Mini refrigerador de 90L', 250.00, 25, 1),
(35, 'Congelador Whirlpool', 'Congelador horizontal de 200L', 500.00, 10, 1),
(36, 'Dispensador de agua LG', 'Dispensador de agua caliente y fría', 300.00, 20, 1),
(37, 'Cocina a gas Indurama', 'Cocina de 4 quemadores', 400.00, 18, 2),
(38, 'Plancha de cabello Babyliss', 'Plancha de cabello profesional', 120.00, 50, 8),
(39, 'Batidora de inmersión Braun', 'Batidora manual con accesorios', 80.00, 60, 3),
(40, 'Deshumidificador DeLonghi', 'Deshumidificador para grandes espacios', 300.00, 15, 7),
(41, 'Refrigerador Samsung', 'Refrigerador French Door con dispensador', 1500.00, 8, 1),
(42, 'Horno microondas Panasonic', 'Microondas con grill', 200.00, 50, 2),
(43, 'Extractor de cocina Teka', 'Campana extractora de acero inoxidable', 350.00, 10, 2),
(44, 'Cafetera Oster', 'Cafetera de goteo programable', 90.00, 40, 3),
(45, 'Olla de presión eléctrica Instant Pot', 'Olla multifuncional', 140.00, 30, 3),
(46, 'Tostadora Cuisinart', 'Tostadora para 4 rebanadas', 60.00, 70, 3),
(47, 'Cortador de alimentos Black+Decker', 'Procesador de alimentos compacto', 100.00, 50, 3),
(48, 'Hervidor eléctrico Philips', 'Hervidor rápido con filtro', 50.00, 80, 3),
(49, 'Máquina para waffles Black+Decker', 'Máquina para waffles antiadherente', 60.00, 60, 3),
(50, 'Enfriador de aire portátil Honeywell', 'Enfriador de aire con depósito de agua', 250.00, 20, 7),
(51, 'Aspiradora robot Xiaomi', 'Robot aspirador económico', 400.00, 18, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `proveedor_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `foto` blob DEFAULT NULL,
  `ruc` int(11) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes_financieros`
--

CREATE TABLE `reportes_financieros` (
  `reporte_id` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `ingresos` decimal(10,2) DEFAULT NULL,
  `egresos` decimal(10,2) DEFAULT NULL,
  `ganancia` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `rol_id` int(11) NOT NULL,
  `nombre_rol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`rol_id`, `nombre_rol`) VALUES
(1, 'Vendedor'),
(2, 'Administrador'),
(3, 'Sistemas'),
(4, 'Cliente'),
(5, 'Proveedor'),
(7, 'Sin Roles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `email`, `contrasena`, `rol_id`, `fecha_creacion`) VALUES
(29, 'kevinguerrero.14@gmail.com', 'kevinguerrero', 3, '2024-12-08 19:43:50'),
(30, 'santiago.vega@gmail.com', 'Password123!', 4, '2024-12-08'),
(31, 'carla.santos@yahoo.com', 'SecurePass456$', 4, '2024-12-08'),
(32, 'felipe.castro@hotmail.com', 'Test1234@!', 4, '2024-12-08'),
(33, 'lorena.gutierrez@outlook.com', 'Passw0rd789!', 4, '2024-12-08'),
(34, 'manuel.torres@mail.com', 'Qwerty@1234', 4, '2024-12-08'),
(35, 'gabriela.mendoza@icloud.com', 'Strongpass!987', 4, '2024-12-08'),
(36, 'diego.serrano@live.com', 'Diego2024Pass@', 4, '2024-12-08'),
(37, 'nuria.paredes@aol.com', 'AolPass567#', 4, '2024-12-08'),
(38, 'oscar.ruiz@outlook.com', 'Ruis1234$#', 4, '2024-12-08'),
(39, 'lina.garcia@gmail.com', 'Garcia#2023$', 4, '2024-12-08'),
(40, 'raul.rodriguez@hotmail.com', 'Rodriguez1234@', 4, '2024-12-08'),
(41, 'elisa.marquez@icloud.com', 'Marquez!5678', 4, '2024-12-08'),
(42, 'fernando.jimenez@aol.com', 'Jimenez321$!', 4, '2024-12-08'),
(43, 'silvia.morales@mail.com', 'Morales123@#', 4, '2024-12-08'),
(44, 'antonio.castillo@outlook.com', 'Castillo*2024', 4, '2024-12-08'),
(45, 'julia.rios@live.com', 'Rios@1234$', 4, '2024-12-08'),
(46, 'ricardo.vazquez@icloud.com', 'Vazquez#4567@', 4, '2024-12-08'),
(47, 'victoria.fuentes@gmail.com', 'Fuentes789@!', 4, '2024-12-08'),
(48, 'sergio.nunez@yahoo.com', 'Nunez@Secure123', 4, '2024-12-08'),
(49, 'claudia.alvarez@hotmail.com', 'Alvarez#890', 4, '2024-12-08'),
(50, 'tomas.herrera@aol.com', 'Herrera2024@!', 4, '2024-12-08'),
(51, 'victoria.moreno@outlook.com', 'Moreno4567!#', 4, '2024-12-08'),
(52, 'jorge.gonzalez@mail.com', 'Gonzalez@2024', 4, '2024-12-08'),
(53, 'isabel.ruiz@gmail.com', 'Ruiz!2023#', 4, '2024-12-08'),
(54, 'luis.castro@live.com', 'Castro2024@!', 4, '2024-12-08'),
(55, 'juliana.reyes@outlook.com', 'Reyes@789!', 4, '2024-12-08'),
(56, 'ricardo.martin@icloud.com', 'Martin2024@#', 4, '2024-12-08'),
(57, 'cristina.molina@gmail.com', 'Molina123$!', 4, '2024-12-08'),
(58, 'fernando.sanchez@yahoo.com', 'Sanchez987#@', 4, '2024-12-08'),
(59, 'andrea.gomez@hotmail.com', 'Gomez2024*$', 4, '2024-12-08'),
(60, 'alberto.morales@icloud.com', 'Alberto@1234', 4, '2024-12-08'),
(61, 'monica.jimenez@aol.com', 'Monica#2024!', 4, '2024-12-08'),
(62, 'juan.perez@outlook.com', 'Perez*5678$', 4, '2024-12-08'),
(63, 'ana.garcia@mail.com', 'Ana!2024$#', 4, '2024-12-08'),
(64, 'pablo.martinez@gmail.com', 'Martinez@1234', 4, '2024-12-08'),
(65, 'ruth.rodriguez@live.com', 'Rodriguez456@', 4, '2024-12-08'),
(66, 'gonzalo.diaz@icloud.com', 'Gonzalo@!789', 4, '2024-12-08'),
(67, 'patricia.fernandez@aol.com', 'Patricia123!$', 4, '2024-12-08'),
(68, 'gabriel.lopez@outlook.com', 'Lopez987@!', 4, '2024-12-08'),
(69, 'paula.martinez@mail.com', 'Paula@1234$', 4, '2024-12-08'),
(70, 'roberto.moreno@icloud.com', 'Moreno#8901', 4, '2024-12-08'),
(71, 'carolina.smith@aol.com', 'Smith2024!#', 4, '2024-12-08'),
(72, 'mario.bautista@live.com', 'Bautista4567@', 4, '2024-12-08'),
(73, 'josé.santiago@outlook.com', 'Santiago@!2024', 4, '2024-12-08'),
(74, 'marta.gonzalez@mail.com', 'Gonzalez!1234', 4, '2024-12-08'),
(75, 'ricardo.jimenez@icloud.com', 'Ricardo1234!#', 4, '2024-12-08'),
(76, 'angelica.martin@aol.com', 'Angelica@2024!', 4, '2024-12-08'),
(77, 'victor.martinez@live.com', 'Victor@4567$', 4, '2024-12-08'),
(78, 'lucia.perez@outlook.com', 'Lucia@7890$', 4, '2024-12-08'),
(79, 'gabriel.reyes@mail.com', 'Reyes!5678@', 4, '2024-12-08'),
(80, 'francisco.sanchez@icloud.com', 'Francisco123$!', 4, '2024-12-08'),
(81, 'roberto.garcia@aol.com', 'Garcia@!8901', 4, '2024-12-08'),
(82, 'margarita.moreno@live.com', 'Moreno456!$', 4, '2024-12-08'),
(83, 'francisco.diaz@outlook.com', 'Diaz@2024#', 4, '2024-12-08'),
(84, 'maria.vazquez@mail.com', 'Vazquez@1234', 4, '2024-12-08'),
(85, 'cesar.ortiz@icloud.com', 'Ortiz#5678@', 4, '2024-12-08'),
(86, 'jorge.rodriguez@aol.com', 'Rodriguez2024@', 4, '2024-12-08'),
(87, 'elena.gonzalez@live.com', 'Gonzalez@8901$', 4, '2024-12-08'),
(88, 'roberto.martinez@outlook.com', 'Martinez#2024', 4, '2024-12-08'),
(89, 'cristina.perez@mail.com', 'Perez@4567$', 4, '2024-12-08'),
(90, 'sandra.martinez@icloud.com', 'Martinez123$!', 4, '2024-12-08'),
(91, 'margarita.lopez@aol.com', 'Lopez@7890$', 4, '2024-12-08'),
(92, 'pedro.garcia@live.com', 'Garcia123@#', 4, '2024-12-08'),
(93, 'hugo.perez@outlook.com', 'Perez4567#$', 4, '2024-12-08'),
(94, 'rosa.diaz@mail.com', 'Diaz1234@!', 4, '2024-12-08'),
(95, 'francisco.rodriguez@icloud.com', 'Rodriguez@2024', 4, '2024-12-08'),
(96, 'laura.reyes@aol.com', 'Reyes!8901$', 4, '2024-12-08'),
(97, 'ana.moreno@live.com', 'Moreno#1234$', 4, '2024-12-08'),
(98, 'juan.carlos@outlook.com', 'Carlos!7890', 4, '2024-12-08'),
(99, 'miguel.fernandez@mail.com', 'Miguel@4567$', 4, '2024-12-08'),
(100, 'elena.sanchez@icloud.com', 'Sanchez@1234', 4, '2024-12-08'),
(101, 'manuel.lopez@aol.com', 'Lopez!2024$', 4, '2024-12-08'),
(102, 'cristina.castro@live.com', 'Castro4567#@', 4, '2024-12-08'),
(103, 'natalia.perez@outlook.com', 'Perez@8901$', 4, '2024-12-08'),
(104, 'miguel.gonzalez@mail.com', 'Gonzalez2024@', 4, '2024-12-08'),
(105, 'victoria.herrera@icloud.com', 'Herrera#2024!', 4, '2024-12-08'),
(106, 'sara.martinez@aol.com', 'Martinez!8901', 4, '2024-12-08'),
(107, 'sergio.rodriguez@live.com', 'Rodriguez1234$', 4, '2024-12-08'),
(108, 'marta.diaz@outlook.com', 'Diaz@5678#', 4, '2024-12-08'),
(109, 'carla.garcia@mail.com', 'Garcia@8901$', 4, '2024-12-08'),
(110, 'alberto.sanchez@icloud.com', 'Sanchez#1234', 4, '2024-12-08'),
(111, 'juan.perez@aol.com', 'Perez!5678$', 4, '2024-12-08'),
(112, 'marta.reyes@live.com', 'Reyes2024#$', 4, '2024-12-08'),
(113, 'jose.gonzalez@outlook.com', 'Gonzalez123@!', 4, '2024-12-08'),
(114, 'raul.rodriguez@mail.com', 'Rodriguez!8901$', 4, '2024-12-08'),
(115, 'ana.torres@gmail.com', 'Torres2024#$', 5, '2024-12-08'),
(116, 'luis.martinez@yahoo.com', 'Luis@1234$', 5, '2024-12-08'),
(117, 'isabel.gonzalez@hotmail.com', 'Gonzalez1234!', 5, '2024-12-08'),
(118, 'david.rodriguez@outlook.com', 'David@5678#', 5, '2024-12-08'),
(119, 'marcos.reyes@icloud.com', 'Reyes@8901!', 5, '2024-12-08'),
(120, 'carmen.sanchez@aol.com', 'Sanchez2024@!', 5, '2024-12-08'),
(121, 'jorge.ferrer@mail.com', 'Ferrer@1234#', 5, '2024-12-08'),
(122, 'elena.moreno@live.com', 'Moreno#5678', 5, '2024-12-08'),
(123, 'pablo.lopez@outlook.com', 'Lopez1234$', 5, '2024-12-08'),
(124, 'marta.castillo@icloud.com', 'Castillo!7890', 5, '2024-12-08'),
(125, 'victor.hernandez@aol.com', 'Victor#2024@', 5, '2024-12-08'),
(126, 'liliana.ramos@live.com', 'Ramos2024@!', 5, '2024-12-08'),
(127, 'martin.perez@outlook.com', 'Perez1234$', 5, '2024-12-08'),
(128, 'paula.garcia@mail.com', 'Garcia#5678', 5, '2024-12-08'),
(129, 'fernando.cueto@icloud.com', 'Cueto!8901$', 5, '2024-12-08'),
(130, 'sonia.diaz@yahoo.com', 'Diaz@1234#', 5, '2024-12-08'),
(131, 'carlos.mendoza@hotmail.com', 'Mendoza2024$', 5, '2024-12-08'),
(132, 'olga.rojas@outlook.com', 'Rojas#5678$', 5, '2024-12-08'),
(133, 'josue.flores@icloud.com', 'Flores@8901!', 5, '2024-12-08'),
(134, 'mario.morales@aol.com', 'Morales1234$', 5, '2024-12-08'),
(135, 'sofia.silva@mail.com', 'Silva#2024@!', 5, '2024-12-08'),
(136, 'daniel.carrillo@live.com', 'Carrillo2024$', 5, '2024-12-08'),
(137, 'camila.rodriguez@outlook.com', 'Rodriguez@8901', 5, '2024-12-08'),
(138, 'juliana.castro@icloud.com', 'Castro#1234$', 5, '2024-12-08'),
(139, 'angel.garcia@aol.com', 'Garcia2024#$', 5, '2024-12-08'),
(140, 'joseph.martin@mail.com', 'Martin#5678@', 5, '2024-12-08'),
(141, 'maria.jimenez@outlook.com', 'Jimenez1234$', 5, '2024-12-08'),
(142, 'luis.gomez@gmail.com', 'Gomez2024#$', 1, '2024-12-08'),
(143, 'marta.lopez@yahoo.com', 'Lopez1234!', 1, '2024-12-08'),
(144, 'carlos.perez@hotmail.com', 'Perez!5678$', 1, '2024-12-08'),
(145, 'ana.martinez@outlook.com', 'Martinez@8901', 1, '2024-12-08'),
(146, 'jose.hernandez@icloud.com', 'Hernandez123$', 1, '2024-12-08'),
(147, 'sofia.castro@aol.com', 'Castro4567#', 1, '2024-12-08'),
(148, 'pedro.rodriguez@mail.com', 'Rodriguez2024@', 1, '2024-12-08'),
(149, 'laura.diaz@live.com', 'Diaz!1234$', 1, '2024-12-08'),
(150, 'mario.reyes@outlook.com', 'Reyes@5678#', 1, '2024-12-08'),
(151, 'carolina.flores@icloud.com', 'Flores8901$', 1, '2024-12-08'),
(152, 'jorge.garcia@aol.com', 'Garcia#1234$', 1, '2024-12-08'),
(153, 'sergio.morales@mail.com', 'Morales2024@!', 1, '2024-12-08'),
(154, 'isabel.sanchez@live.com', 'Sanchez@5678#', 1, '2024-12-08'),
(155, 'luis.moreno@outlook.com', 'Moreno1234$', 1, '2024-12-08'),
(156, 'marta.gonzalez@icloud.com', 'Gonzalez4567!', 1, '2024-12-08');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ajustes_inventario`
--
ALTER TABLE `ajustes_inventario`
  ADD PRIMARY KEY (`ajuste_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`almacen_id`);

--
-- Indices de la tabla `almacen_productos`
--
ALTER TABLE `almacen_productos`
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `almacen_id` (`almacen_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`empleado_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `historial_costos`
--
ALTER TABLE `historial_costos`
  ADD PRIMARY KEY (`historial_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `movimientos_almacen_salida`
--
ALTER TABLE `movimientos_almacen_salida`
  ADD PRIMARY KEY (`movimiento_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `movimiento_almacen_destinado`
--
ALTER TABLE `movimiento_almacen_destinado`
  ADD KEY `movimiento_id` (`movimiento_id`),
  ADD KEY `almacen_id` (`almacen_id`);

--
-- Indices de la tabla `movimiento_almacen_entrada`
--
ALTER TABLE `movimiento_almacen_entrada`
  ADD PRIMARY KEY (`movimiento_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `categoria_many_products` (`idcategoria`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`proveedor_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `reportes_financieros`
--
ALTER TABLE `reportes_financieros`
  ADD PRIMARY KEY (`reporte_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ajustes_inventario`
--
ALTER TABLE `ajustes_inventario`
  MODIFY `ajuste_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `almacen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `empleado_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `historial_costos`
--
ALTER TABLE `historial_costos`
  MODIFY `historial_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos_almacen_salida`
--
ALTER TABLE `movimientos_almacen_salida`
  MODIFY `movimiento_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimiento_almacen_entrada`
--
ALTER TABLE `movimiento_almacen_entrada`
  MODIFY `movimiento_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `proveedor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reportes_financieros`
--
ALTER TABLE `reportes_financieros`
  MODIFY `reporte_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ajustes_inventario`
--
ALTER TABLE `ajustes_inventario`
  ADD CONSTRAINT `ajustes_inventario_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`);

--
-- Filtros para la tabla `almacen_productos`
--
ALTER TABLE `almacen_productos`
  ADD CONSTRAINT `almacen_productos_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`),
  ADD CONSTRAINT `almacen_productos_ibfk_2` FOREIGN KEY (`almacen_id`) REFERENCES `almacen` (`almacen_id`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`);

--
-- Filtros para la tabla `historial_costos`
--
ALTER TABLE `historial_costos`
  ADD CONSTRAINT `historial_costos_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`);

--
-- Filtros para la tabla `movimientos_almacen_salida`
--
ALTER TABLE `movimientos_almacen_salida`
  ADD CONSTRAINT `movimientos_almacen_salida_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`);

--
-- Filtros para la tabla `movimiento_almacen_destinado`
--
ALTER TABLE `movimiento_almacen_destinado`
  ADD CONSTRAINT `movimiento_almacen_destinado_ibfk_1` FOREIGN KEY (`movimiento_id`) REFERENCES `movimiento_almacen_entrada` (`movimiento_id`),
  ADD CONSTRAINT `movimiento_almacen_destinado_ibfk_2` FOREIGN KEY (`almacen_id`) REFERENCES `almacen` (`almacen_id`);

--
-- Filtros para la tabla `movimiento_almacen_entrada`
--
ALTER TABLE `movimiento_almacen_entrada`
  ADD CONSTRAINT `movimiento_almacen_entrada_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `categoria_many_products` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`rol_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
