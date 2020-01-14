-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-01-2020 a las 18:24:32
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id_alumno` bigint(20) UNSIGNED NOT NULL,
  `numCuenta` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apPat` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `apMat` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id_alumno`, `numCuenta`, `nombre`, `apPat`, `apMat`, `telefono`) VALUES
(315115502, '313258419', 'Edgar Michael', 'Pérez', 'Valdez', '5167063');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costoestandar`
--

CREATE TABLE `costoestandar` (
  `idCostoEstandar` int(2) NOT NULL,
  `precio` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `costoestandar`
--

INSERT INTO `costoestandar` (`idCostoEstandar`, `precio`) VALUES
(1, 500),
(2, 650);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `idCurso` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `nomCurso` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `temario` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `idCostoEstandar` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idCurso`, `nomCurso`, `temario`, `idCostoEstandar`) VALUES
('1', 'C', 'http://mmedia1.fi-b.unam.mx/temarios/TemarioLenguuajeC_2020_1.pdf', 1),
('2', 'JAVA BÁSICO', 'http://mmedia1.fi-b.unam.mx/temarios/TemarioJavaBasico_2020-1.pdf', 1),
('3', 'PYTHON BÁSICO', 'http://mmedia1.fi-b.unam.mx/temarios/Temario_Pythonbasico_2020-1.pdf', 2),
('4', 'PYTHON INTERMEDIO', 'http://mmedia1.fi-b.unam.mx/temarios/TemarioPythonIntermedio_2020-1.pdf', 2),
('5', 'ANDRIOD', 'http://mmedia1.fi-b.unam.mx/temarios/Temario_Android_2020-1.pdf', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email`
--

CREATE TABLE `email` (
  `idAlumno` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idGrupo` int(3) NOT NULL,
  `idCurso` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `horarioInicio` time NOT NULL,
  `horarioFinal` time NOT NULL,
  `horastotales` decimal(6,0) NOT NULL,
  `cupo` int(5) NOT NULL,
  `instructor` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`idGrupo`, `idCurso`, `horarioInicio`, `horarioFinal`, `horastotales`, `cupo`, `instructor`) VALUES
(1, '1', '08:00:00', '12:00:00', '20', 13, 'Paulina y Michael'),
(2, '2', '08:00:00', '12:00:00', '20', 13, 'Joaquín y Marco'),
(3, '3', '08:00:00', '12:00:00', '20', 13, 'Sergio y Jorge'),
(4, '3', '13:00:00', '17:00:00', '20', 13, 'Michael y Zaira'),
(5, '4', '13:00:00', '17:00:00', '20', 13, 'Jorge y Eduardo'),
(6, '5', '13:00:00', '17:00:00', '20', 13, 'Itzel y Daniel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `idAlumno` bigint(20) UNSIGNED NOT NULL,
  `idGrupo` int(3) NOT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `monto` int(6) DEFAULT NULL,
  `idTipoInscripcion` int(2) NOT NULL,
  `equipo` tinyint(1) NOT NULL,
  `semestre` varchar(7) COLLATE utf8_spanish_ci NOT NULL,
  `pagado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoinscripcion`
--

CREATE TABLE `tipoinscripcion` (
  `idTipoInscripcion` int(2) NOT NULL,
  `tipo` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `costo` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipoinscripcion`
--

INSERT INTO `tipoinscripcion` (`idTipoInscripcion`, `tipo`, `descripcion`, `costo`) VALUES
(1, 'UNAM1', 'desc.', 500),
(2, 'UNAM2', 'desc.', 650),
(3, 'EXTERNO', 'desc.', 800),
(4, 'GENERAL', 'desc.', 1500),
(5, 'BECARIO', 'desc.', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id_alumno`),
  ADD UNIQUE KEY `id_alumno` (`id_alumno`);

--
-- Indices de la tabla `costoestandar`
--
ALTER TABLE `costoestandar`
  ADD PRIMARY KEY (`idCostoEstandar`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idCurso`),
  ADD KEY `fk_idCostoEstandar` (`idCostoEstandar`);

--
-- Indices de la tabla `email`
--
ALTER TABLE `email`
  ADD UNIQUE KEY `idAlumno` (`idAlumno`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idGrupo`),
  ADD KEY `fk_idCurso` (`idCurso`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD UNIQUE KEY `idAlumno` (`idAlumno`),
  ADD KEY `fk_idGrupo` (`idGrupo`),
  ADD KEY `fk_idTipoInscripcion` (`idTipoInscripcion`);

--
-- Indices de la tabla `tipoinscripcion`
--
ALTER TABLE `tipoinscripcion`
  ADD PRIMARY KEY (`idTipoInscripcion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id_alumno` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315115503;

--
-- AUTO_INCREMENT de la tabla `email`
--
ALTER TABLE `email`
  MODIFY `idAlumno` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `idAlumno` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_idCostoEstandar` FOREIGN KEY (`idCostoEstandar`) REFERENCES `costoestandar` (`idCostoEstandar`);

--
-- Filtros para la tabla `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `fk_email` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`id_alumno`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `fk_idCurso` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`);

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `fk_idAlumno` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`id_alumno`),
  ADD CONSTRAINT `fk_idGrupo` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`),
  ADD CONSTRAINT `fk_idTipoInscripcion` FOREIGN KEY (`idTipoInscripcion`) REFERENCES `tipoinscripcion` (`idTipoInscripcion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
