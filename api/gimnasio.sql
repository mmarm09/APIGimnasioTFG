-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2024 a las 20:59:18
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
-- Base de datos: `gimnasio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

CREATE TABLE `ejercicio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `tipo` enum('CARDIO','FUERZA','ESTIRAMIENTO') NOT NULL,
  `complemento` enum('EQUIPAMIENTO','PESO CORPORAL','PESAS','ACCESORIOS') DEFAULT NULL,
  `grupo_muscular` enum('TREN SUPERIOR','TRONCO','TREN INFERIOR') DEFAULT NULL,
  `foto` mediumtext DEFAULT NULL,
  `foto_detalle` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`id`, `nombre`, `tipo`, `complemento`, `grupo_muscular`, `foto`, `foto_detalle`) VALUES
(1, 'CINTA', 'CARDIO', NULL, NULL, 'fotosejercicios/cinta.jpg', 'fotosejercicios2/cardio/cinta.png'),
(2, 'GEMELOS', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/gemelos.png', 'fotosejercicios2/estiramiento/gemelos.png'),
(4, 'BURPEE', 'FUERZA', 'PESO CORPORAL', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/burpee.png', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/burpee.png'),
(5, 'ELEVACIÓN LATERAL CON MANCUERNAS CODO 90º', 'FUERZA', 'PESAS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesas/elevacionlateralcodo90.png', 'fotosejercicios2/fuerza/trensuperior/pesas/elevacionlateralcodo90.png'),
(15, 'BICICLETA VERTICAL', 'CARDIO', NULL, NULL, 'fotosejercicios/bicicletavertical.jpg', 'fotosejercicios2/cardio/bicivertical.png'),
(16, 'CLIMB', 'CARDIO', NULL, NULL, 'fotosejercicios/climb.jpg', 'fotosejercicios2/cardio/escaleras.png'),
(17, 'CROSSOVER', 'CARDIO', NULL, NULL, 'fotosejercicios/eliptica.jpg', 'fotosejercicios2/cardio/eliptica.png'),
(18, 'BICICLETA RECLINE', 'CARDIO', NULL, NULL, 'fotosejercicios/bicicletarecline.jpg', 'fotosejercicios2/cardio/bicirecline.png'),
(19, 'ERGÓMETRO REMO', 'CARDIO', NULL, NULL, 'fotosejercicios/ergometroremo.jpg', 'fotosejercicios2/cardio/ergometro.png'),
(20, 'ADDUCTORES DE LA CADERA - DE PIE', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/adductorescaderadepie.png', 'fotosejercicios2/estiramiento/adductorescadera.png'),
(21, 'BÍCEPS', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/biceps.png', 'fotosejercicios2/estiramiento/biceps.png'),
(22, 'CUÁDRICEPS - DE PIE', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/cuadricepsdepie.png', 'fotosejercicios2/estiramiento/cuadricepspie.png'),
(23, 'CUELLO - FLEXIÓN ADELANTE', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/cuelloadelante.png', 'fotosejercicios2/estiramiento/flexioncuello.png'),
(24, 'ESPALDA BAJA', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/espaldabaja.png', 'fotosejercicios2/estiramiento/espaldabaja.png'),
(25, 'ESPALDA - PECHO RECTO EN LA BARRA FIJA', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/espaldapechorectobarrafija.png', 'fotosejercicios2/estiramiento/espaldapechorecto.png'),
(26, 'FLEXORES DE LA CADERA SOBRE UNA RODILLA', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/flexorescaderarodilla.png', 'fotosejercicios2/estiramiento/flexorescadera.png'),
(27, 'GLÚTEOS - PIERNA CRUZADA', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/gluteospiernacruzada.png', 'fotosejercicios2/estiramiento/gluteospiernacruzada.png'),
(28, 'HOMBROS', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/hombros.png', 'fotosejercicios2/estiramiento/hombro.png'),
(29, 'ISQUIOTIBIALES - PIERNA LEVANTADA', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/isquiotibialespiernalevantada.png', 'fotosejercicios2/estiramiento/isquiopiernalevantada.png'),
(30, 'ISQUIOTIBIALES SENTADO - UNA PIERNA FLEXIONADA', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/isquiotibialesunapiernaflexionada.png', 'fotosejercicios2/estiramiento/isquiotibiales.png'),
(31, 'LUMBARES- SUPINO', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/lumbaressupino.png', 'fotosejercicios2/estiramiento/lumbaressupino.png'),
(32, 'PECTORALES - DE CARA A LA BARRA FIJA', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/pectoralescarabarra.png', 'fotosejercicios2/estiramiento/pectorales.png'),
(33, 'TRÍCEPS', 'ESTIRAMIENTO', NULL, NULL, 'fotosejercicios/estiramientos/triceps.png', 'fotosejercicios2/estiramiento/triceps.png'),
(34, 'LOW ROW ARTIS', 'FUERZA', 'EQUIPAMIENTO', 'TREN SUPERIOR', 'fotosejercicios/fuerza/trensuperior/equipamiento/5169-17814651.jpg', 'fotosejercicios/fuerza/trensuperior/equipamiento/5169-17814651.jpg'),
(35, 'CHEST PRESS - DISTENSIÓN AGARRE ANCHO', 'FUERZA', 'EQUIPAMIENTO', 'TREN SUPERIOR', 'fotosejercicios/fuerza/trensuperior/equipamiento/chestpress.png', 'fotosejercicios2/fuerza/trensuperior/equipamiento/chestpressagarreancho.png'),
(36, 'CRUCES DE PECTORAL CON CABLE-POLEA DE PIE INCLINADO', 'FUERZA', 'EQUIPAMIENTO', 'TREN SUPERIOR', 'fotosejercicios/fuerza/trensuperior/equipamiento/crucepolea.png', 'fotosejercicios2/fuerza/trensuperior/equipamiento/crucespectoral.png'),
(37, 'DOMINADA - AGARRE ANCHO', 'FUERZA', 'EQUIPAMIENTO', 'TREN SUPERIOR', 'fotosejercicios/fuerza/trensuperior/equipamiento/dominada.png', 'fotosejercicios2/fuerza/trensuperior/equipamiento/dominadaagarreancho.png'),
(38, 'EXTENSIÓN DE TRÍCEPS', 'FUERZA', 'EQUIPAMIENTO', 'TREN SUPERIOR', 'fotosejercicios/fuerza/trensuperior/equipamiento/extensiontriceppolea.png', 'fotosejercicios2/fuerza/trensuperior/equipamiento/extension-de-triceps-con-cuerda-y-cable-polea-de-pie-init-pos-1048.png'),
(39, 'SHOULDER PRESS ARTIS', 'FUERZA', 'EQUIPAMIENTO', 'TREN SUPERIOR', 'fotosejercicios/fuerza/trensuperior/equipamiento/images.jpg', 'fotosejercicios/fuerza/trensuperior/equipamiento/images.jpg'),
(40, 'INCLINE CHEST PRESS PURE', 'FUERZA', 'EQUIPAMIENTO', 'TREN SUPERIOR', 'fotosejercicios/fuerza/trensuperior/equipamiento/pure-incline-chest-press.jpg', 'fotosejercicios/fuerza/trensuperior/equipamiento/pure-incline-chest-press.jpg'),
(41, 'PULL DOWN PURE', 'FUERZA', 'EQUIPAMIENTO', 'TREN SUPERIOR', 'fotosejercicios/fuerza/trensuperior/equipamiento/pure-pulldown-plp.jpg', 'fotosejercicios/fuerza/trensuperior/equipamiento/pure-pulldown-plp.jpg'),
(42, 'REMO CON TRIÁNGULO', 'FUERZA', 'EQUIPAMIENTO', 'TREN SUPERIOR', 'fotosejercicios/fuerza/trensuperior/equipamiento/remotriangulo.png', 'fotosejercicios2/fuerza/trensuperior/equipamiento/remotriangulo.png'),
(43, 'PULLDOWN SEL', 'FUERZA', 'EQUIPAMIENTO', 'TREN SUPERIOR', 'fotosejercicios/fuerza/trensuperior/equipamiento/selection-900-pulldown-plp.jpg', 'fotosejercicios/fuerza/trensuperior/equipamiento/selection-900-pulldown-plp.jpg'),
(44, 'FLEXIÓN DE BRAZOS PARA TRÍCEPS', 'FUERZA', 'EQUIPAMIENTO', 'TREN SUPERIOR', 'fotosejercicios/fuerza/trensuperior/equipamiento/triceps.png', 'fotosejercicios2/fuerza/trensuperior/equipamiento/fondostriceps.png'),
(45, 'CURL DE BICEPS CON MANCUERNAS EN BANCO INCLINADO', 'FUERZA', 'PESAS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesas/curlbicepsbancoinclinado.png', 'fotosejercicios2/fuerza/trensuperior/pesas/curlbicepsbancoinclinado.png'),
(46, 'CURL DE BICEPS EN BANCO PREDICADOR O SCOTT', 'FUERZA', 'PESAS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesas/curlbicepspredicador.png', 'fotosejercicios2/fuerza/trensuperior/pesas/curlbicepspredicador.png'),
(47, 'PRESS ARNOLD', 'FUERZA', 'PESAS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesas/pressarnold.png', 'fotosejercicios2/fuerza/trensuperior/pesas/pressarnold.png'),
(48, 'PRESS DE BANCA CON BARRA', 'FUERZA', 'PESAS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesas/pressbancabarra.png', 'fotosejercicios2/fuerza/trensuperior/pesas/pressbancabarra.png'),
(49, 'PRESS DE HOMBROS CON MANCUERNAS SENTADO CON APOYO', 'FUERZA', 'PESAS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesas/presshombrosentado.png', 'fotosejercicios2/fuerza/trensuperior/pesas/presshombrosentado.png'),
(50, 'REMO AL CUELLO CON MANCUERNAS', 'FUERZA', 'PESAS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesas/remoalcuello.png', 'fotosejercicios2/fuerza/trensuperior/pesas/remoalcuello.png'),
(51, 'REMO CON BARRA', 'FUERZA', 'PESAS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesas/remoconbarra.png', 'fotosejercicios2/fuerza/trensuperior/pesas/remoconbarra.png'),
(52, 'ELEVACIÓN DE PIERNAS', 'FUERZA', 'PESO CORPORAL', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/elevacionpiernas.png', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/elevacionpiernas.png'),
(53, 'FLEXIONES', 'FUERZA', 'PESO CORPORAL', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/flexiones.png', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/flexiones.png'),
(54, 'FLEXIONES CON RODILLAS EN EL SUELO', 'FUERZA', 'PESO CORPORAL', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/flexionesconrodillas.png', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/flexionesconrodillas.png'),
(55, 'PLANCHA HORIZONTAL ISOMÉTRICA', 'FUERZA', 'PESO CORPORAL', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/planchahorizontalisometrica.png', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/planchahorizontalisometrica.png'),
(56, 'PLANCHA LATERAL', 'FUERZA', 'PESO CORPORAL', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/planchalateral.png', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/planchalateral.png'),
(57, 'PLANCHA LATERAL CON APOYO DE ANTEBRAZO', 'FUERZA', 'PESO CORPORAL', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/planchalateralapoyoantebrazo.png', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/planchalateralapoyoantebrazo.png'),
(58, 'PRESS DE HOMBROS EN EQUILIBRIO VERTICAL', 'FUERZA', 'PESO CORPORAL', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/presshombrovertical.png', 'fotosejercicios2/fuerza/trensuperior/pesocorporal/presshombrovertical.png'),
(59, 'APERTURAS DE HOMBROS CON BANDA ELÁSTICA DE PIE', 'FUERZA', 'ACCESORIOS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/accesorios/aperturahombrosbanda.png', 'fotosejercicios2/fuerza/trensuperior/accesorios/aperturahombrosbanda.png'),
(60, 'CURL DE BÍCEPS CON BANDA', 'FUERZA', 'ACCESORIOS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/accesorios/curlbicepsbanda.png', 'fotosejercicios2/fuerza/trensuperior/accesorios/curlbicepsbanda.png'),
(61, 'DESPLAZAMIENTO ADELANTE EN PLANCHA CON BANDA DE RESISTENCIA', 'FUERZA', 'ACCESORIOS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/accesorios/despalzamientoalanteplanchabanda.png', 'fotosejercicios2/fuerza/trensuperior/accesorios/despalzamientoalanteplanchabanda.png'),
(62, 'ELEVACIÓN DE HOMBRO ATRÁS', 'FUERZA', 'ACCESORIOS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/accesorios/elevacionhombroatras.png', 'fotosejercicios2/fuerza/trensuperior/accesorios/elevacionhombroatras.png'),
(63, 'JALÓN DORSAL CON BANDA', 'FUERZA', 'ACCESORIOS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/accesorios/jalondorsalconbanda.png', 'fotosejercicios2/fuerza/trensuperior/accesorios/jalondorsalconbanda.png'),
(64, 'PATADA DE TRÍCEPS CON BANDA', 'FUERZA', 'ACCESORIOS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/accesorios/patadatricepsbanda.png', 'fotosejercicios2/fuerza/trensuperior/accesorios/patadatricepsbanda.png'),
(65, 'REMO CON BANDA', 'FUERZA', 'ACCESORIOS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/accesorios/remobanda.png', 'fotosejercicios2/fuerza/trensuperior/accesorios/remobanda.png'),
(66, 'REMO AL CUELLO CON BANDA ELÁSTICA', 'FUERZA', 'ACCESORIOS', 'TREN SUPERIOR', 'fotosejercicios2/fuerza/trensuperior/accesorios/remocuellobanda.png', 'fotosejercicios2/fuerza/trensuperior/accesorios/remocuellobanda.png'),
(67, 'ENCOGIMIENTOS EN MAQUINA ABDOMINALES SENTADO', 'FUERZA', 'EQUIPAMIENTO', 'TRONCO', 'fotosejercicios2/fuerza/tronco/equipamiento/encogimiento.png', 'fotosejercicios2/fuerza/tronco/equipamiento/encogimiento.png'),
(68, 'EXTENSIÓN LUMBAR EN SILLA ROMANA', 'FUERZA', 'EQUIPAMIENTO', 'TRONCO', 'fotosejercicios2/fuerza/tronco/equipamiento/extensionlumbar.png', 'fotosejercicios2/fuerza/tronco/equipamiento/extensionlumbar.png'),
(69, 'FLEXIÓN DE CADERAS EN MAQUINA DE PARALELAS', 'FUERZA', 'EQUIPAMIENTO', 'TRONCO', 'fotosejercicios2/fuerza/tronco/equipamiento/flexioncaderamaquina.png', 'fotosejercicios2/fuerza/tronco/equipamiento/flexioncaderamaquina.png'),
(70, 'FLEXIÓN DE CADERAS PIERNAS ESTIRADAS EN MAQUINA DE PARALELAS', 'FUERZA', 'EQUIPAMIENTO', 'TRONCO', 'fotosejercicios2/fuerza/tronco/equipamiento/flexioncaderapiesestirados.png', 'fotosejercicios2/fuerza/tronco/equipamiento/flexioncaderapiesestirados.png'),
(71, 'ENCOGIMIENTOS: BRAZOS ESTIRADOS VAN A LAS RODILLAS', 'FUERZA', 'PESO CORPORAL', 'TRONCO', 'fotosejercicios2/fuerza/tronco/pesocorporal/brazosestiradosrodillas.png', 'fotosejercicios2/fuerza/tronco/pesocorporal/brazosestiradosrodillas.png'),
(72, 'ELEVACIÓN DE LA PELVIS EN VERTICAL', 'FUERZA', 'PESO CORPORAL', 'TRONCO', 'fotosejercicios2/fuerza/tronco/pesocorporal/elevacionpelvis.png', 'fotosejercicios2/fuerza/tronco/pesocorporal/elevacionpelvis.png'),
(73, 'ENCOGIMIENTOS', 'FUERZA', 'PESO CORPORAL', 'TRONCO', 'fotosejercicios2/fuerza/tronco/pesocorporal/encogimientos.png', 'fotosejercicios2/fuerza/tronco/pesocorporal/encogimientos.png'),
(74, 'ENCOGIMIENTOS CON GIROS A RODILLA CONTRARIA', 'FUERZA', 'PESO CORPORAL', 'TRONCO', 'fotosejercicios2/fuerza/tronco/pesocorporal/encogimientoscongirorodilla.png', 'fotosejercicios2/fuerza/tronco/pesocorporal/encogimientoscongirorodilla.png'),
(75, 'EXTENSIÓN DEL CUERPO SOBRE LAS RODILLAS', 'FUERZA', 'PESO CORPORAL', 'TRONCO', 'fotosejercicios2/fuerza/tronco/pesocorporal/extensioncuerporodillas.png', 'fotosejercicios2/fuerza/tronco/pesocorporal/extensioncuerporodillas.png'),
(76, 'FLEXIÓN DE TRONCO Y DE CADERAS SIMULTANEAMENTE', 'FUERZA', 'PESO CORPORAL', 'TRONCO', 'fotosejercicios2/fuerza/tronco/pesocorporal/flexiontroncocadera.png', 'fotosejercicios2/fuerza/tronco/pesocorporal/flexiontroncocadera.png'),
(77, 'ENCOGIMIENTO LA MANO BUSCA EL PIE', 'FUERZA', 'PESO CORPORAL', 'TRONCO', 'fotosejercicios2/fuerza/tronco/pesocorporal/manobuscapie.png', 'fotosejercicios2/fuerza/tronco/pesocorporal/manobuscapie.png'),
(78, 'ENCOGIMIENTO LA MANO CONTRARIA AL LATERAL', 'FUERZA', 'PESO CORPORAL', 'TRONCO', 'fotosejercicios2/fuerza/tronco/pesocorporal/manocontrarialateral.png', 'fotosejercicios2/fuerza/tronco/pesocorporal/manocontrarialateral.png'),
(79, 'CAIDA ADELANTE CON BALON MEDICINAL', 'FUERZA', 'ACCESORIOS', 'TRONCO', 'fotosejercicios2/fuerza/tronco/accesorios/caidadelantebalon.png', 'fotosejercicios2/fuerza/tronco/accesorios/caidadelantebalon.png'),
(80, 'DESPLAZAMIENTO ADELANTE EN PLANCHA CON BANDA DE RESISTENCIA', 'FUERZA', 'ACCESORIOS', 'TRONCO', 'fotosejercicios2/fuerza/tronco/accesorios/desplazamientoadelanteplancabanda.png', 'fotosejercicios2/fuerza/tronco/accesorios/desplazamientoadelanteplancabanda.png'),
(81, 'DESPLAZAMIENTO LATERAL EN PLANCHA CON BANDA DE RESISTENCIA', 'FUERZA', 'ACCESORIOS', 'TRONCO', 'fotosejercicios2/fuerza/tronco/accesorios/desplazamientolateralenplanchabanda.png', 'fotosejercicios2/fuerza/tronco/accesorios/desplazamientolateralenplanchabanda.png'),
(82, 'ELEVACIÓN DE CADERA Y BALON MEDICINAL SOBRE BANCO', 'FUERZA', 'ACCESORIOS', 'TRONCO', 'fotosejercicios2/fuerza/tronco/accesorios/elevacioncaderabalonmedicinalsobrebanco.png', 'fotosejercicios2/fuerza/tronco/accesorios/elevacioncaderabalonmedicinalsobrebanco.png'),
(83, 'ENCOGIMIENTOS CON BALÓN MEDICINAL', 'FUERZA', 'ACCESORIOS', 'TRONCO', 'fotosejercicios2/fuerza/tronco/accesorios/encogimientobalonmedicinal.png', 'fotosejercicios2/fuerza/tronco/accesorios/encogimientobalonmedicinal.png'),
(84, 'EQUILIBRIO ALTERNO SOBRE BALÓN MEDICINAL', 'FUERZA', 'ACCESORIOS', 'TRONCO', 'fotosejercicios2/fuerza/tronco/accesorios/equilibriobalon.png', 'fotosejercicios2/fuerza/tronco/accesorios/equilibriobalon.png'),
(85, 'LANZAMIENTO DE BALÓN MEDICINAL AL SUELO', 'FUERZA', 'ACCESORIOS', 'TRONCO', 'fotosejercicios2/fuerza/tronco/accesorios/lanzamientobalonsuelo.png', 'fotosejercicios2/fuerza/tronco/accesorios/lanzamientobalonsuelo.png'),
(86, 'ESTIRAMIENTO VERTEBRAL CON MANCUERNAS DE RODILLAS', 'FUERZA', 'PESAS', 'TRONCO', 'fotosejercicios2/fuerza/tronco/pesas/estiramientovertebralmancuerna.png', 'fotosejercicios2/fuerza/tronco/pesas/estiramientovertebralmancuerna.png'),
(87, 'FLEXIÓN LATERAL DE TRONCO CON MANCUERNA', 'FUERZA', 'PESAS', 'TRONCO', 'fotosejercicios2/fuerza/tronco/pesas/flexionlateraltroncomancuerna.png', 'fotosejercicios2/fuerza/tronco/pesas/flexionlateraltroncomancuerna.png'),
(88, 'GIROS DE CINTURA CON BARRA O PICA', 'FUERZA', 'PESAS', 'TRONCO', 'fotosejercicios2/fuerza/tronco/pesas/girocinturabarra.png', 'fotosejercicios2/fuerza/tronco/pesas/girocinturabarra.png'),
(89, 'GIRO DE CINTURA DE PIE CON DISCO', 'FUERZA', 'PESAS', 'TRONCO', 'fotosejercicios2/fuerza/tronco/pesas/girocinturacondisco.png', 'fotosejercicios2/fuerza/tronco/pesas/girocinturacondisco.png'),
(90, 'TIRÓN FRONTAL CON MANCUERNA', 'FUERZA', 'PESAS', 'TRONCO', 'fotosejercicios2/fuerza/tronco/pesas/tironfrontalmancuerna.png', 'fotosejercicios2/fuerza/tronco/pesas/tironfrontalmancuerna.png'),
(91, 'EXTENSIÓN DE GEMELOS SENTADO EN MÁQUINA', 'FUERZA', 'EQUIPAMIENTO', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/equipamiento/extensiongemelossentado.png', 'fotosejercicios2/fuerza/treninferior/equipamiento/extensiongemelossentado.png'),
(92, 'PRENSA HORIZONTAL EN MAQUINA', 'FUERZA', 'EQUIPAMIENTO', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/equipamiento/prensaHorizontal.png', 'fotosejercicios2/fuerza/treninferior/equipamiento/prensaHorizontal.png'),
(93, 'MEDIA SENTADILLA EN MAQUINA HACK', 'FUERZA', 'EQUIPAMIENTO', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/equipamiento/sentadillahaka.png', 'fotosejercicios2/fuerza/treninferior/equipamiento/sentadillahaka.png'),
(94, 'CURL FEMORAL CON MAQUINA DECLINADA', 'FUERZA', 'EQUIPAMIENTO', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/equipamiento/curlfemoralmaquinainclinada.png', 'fotosejercicios2/fuerza/treninferior/equipamiento/curlfemoralmaquinainclinada.png'),
(95, 'ZANCADA EN MAQUINA SMITH', 'FUERZA', 'EQUIPAMIENTO', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/equipamiento/zancadasmith.png', 'fotosejercicios2/fuerza/treninferior/equipamiento/zancadasmith.png'),
(96, 'ADDUCCIÓN DE CADERA EN MAQUINA SENTADO', 'FUERZA', 'EQUIPAMIENTO', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/equipamiento/adduccion.png', 'fotosejercicios2/fuerza/treninferior/equipamiento/adduccion.png'),
(97, 'EXTENSIÓN DE PIERNAS EN MAQUINA', 'FUERZA', 'EQUIPAMIENTO', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/equipamiento/extensionpierna.png', 'fotosejercicios2/fuerza/treninferior/equipamiento/extensionpierna.png'),
(98, 'PRENSA DE PIERNAS INCLINADA', 'FUERZA', 'EQUIPAMIENTO', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/equipamiento/prensainclinada.png', 'fotosejercicios2/fuerza/treninferior/equipamiento/prensainclinada.png'),
(99, 'MEDIA SENTADILLA ISOMÉTRICA', 'FUERZA', 'PESO CORPORAL', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesocorporal/sentadillaisometrica.png', 'fotosejercicios2/fuerza/treninferior/pesocorporal/sentadillaisometrica.png'),
(100, 'ZANCADA LATERAL', 'FUERZA', 'PESO CORPORAL', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesocorporal/zancadalateral.png', 'fotosejercicios2/fuerza/treninferior/pesocorporal/zancadalateral.png'),
(101, 'ZANCADA', 'FUERZA', 'PESO CORPORAL', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesocorporal/zancada.png', 'fotosejercicios2/fuerza/treninferior/pesocorporal/zancada.png'),
(102, 'PESO MUERTO SUMO CON BARRA', 'FUERZA', 'PESO CORPORAL', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesocorporal/pesomuertobarra.png', 'fotosejercicios2/fuerza/treninferior/pesocorporal/pesomuertobarra.png'),
(103, 'SALTO PIES JUNTOS SOBRE BANCO', 'FUERZA', 'PESO CORPORAL', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesocorporal/saltobanco.png', 'fotosejercicios2/fuerza/treninferior/pesocorporal/saltobanco.png'),
(104, 'SENTADILLA A UNA PIERNA', 'FUERZA', 'PESO CORPORAL', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesocorporal/sentadillaunapierna.png', 'fotosejercicios2/fuerza/treninferior/pesocorporal/sentadillaunapierna.png'),
(105, 'FLEXIÓN DE TRONCO INCLINADO HACIA DELANTE', 'FUERZA', 'PESO CORPORAL', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesocorporal/FLEXIONTRONCO.png', 'fotosejercicios2/fuerza/treninferior/pesocorporal/FLEXIONTRONCO.png'),
(106, 'SALTO VERTICAL', 'FUERZA', 'PESO CORPORAL', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesocorporal/saltovertical.png', 'fotosejercicios2/fuerza/treninferior/pesocorporal/saltovertical.png'),
(107, 'MEDIA SENTADILLA BRAZOS EXTENDIDOS CON BALÓN MEDICINAL', 'FUERZA', 'ACCESORIOS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/accesorios/sentadillabalon.png', 'fotosejercicios2/fuerza/treninferior/accesorios/sentadillabalon.png'),
(108, 'CAIDA ADELANTE CON BALON MEDICINAL', 'FUERZA', 'ACCESORIOS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/accesorios/caidadelantebalon.png', 'fotosejercicios2/fuerza/treninferior/accesorios/caidadelantebalon.png'),
(109, 'ABDUCCIÓN DE CADERA CON BANDA ELÁSTICA Y PIERNAS CERRADAS', 'FUERZA', 'ACCESORIOS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/accesorios/abduccionbanda.png', 'fotosejercicios2/fuerza/treninferior/accesorios/abduccionbanda.png'),
(110, 'EXTENSIÓN DE CADERA CON BANDA ELÁSTICA', 'FUERZA', 'ACCESORIOS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/accesorios/extensioncaderabanda.png', 'fotosejercicios2/fuerza/treninferior/accesorios/extensioncaderabanda.png'),
(111, 'ZANCADAS LATERALES CON BANDA ELÁSTICA', 'FUERZA', 'ACCESORIOS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/accesorios/zancadaslateralesbanda.png', 'fotosejercicios2/fuerza/treninferior/accesorios/zancadaslateralesbanda.png'),
(112, 'PATADA DE GLÚTEO CON BANDA ELÁSTICA', 'FUERZA', 'ACCESORIOS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/accesorios/patadagluteobanda.png', 'fotosejercicios2/fuerza/treninferior/accesorios/patadagluteobanda.png'),
(113, 'MEDIA SENTADILLA CON GOMAS', 'FUERZA', 'ACCESORIOS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/accesorios/mediasentadillagomas.png', 'fotosejercicios2/fuerza/treninferior/accesorios/mediasentadillagomas.png'),
(114, 'ALMEJA O ABDUCCIÓN DE CADERA CON MINI BANDA', 'FUERZA', 'ACCESORIOS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/accesorios/abduccioncaderabanda.png', 'fotosejercicios2/fuerza/treninferior/accesorios/abduccioncaderabanda.png'),
(115, 'MEDIA SENTADILLA CON BARRA', 'FUERZA', 'PESAS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesas/mediasentadillabarra.png', 'fotosejercicios2/fuerza/treninferior/pesas/mediasentadillabarra.png'),
(116, 'ZANCADAS CON MANCUERNAS', 'FUERZA', 'PESAS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesas/zancadamancuernas.png', 'fotosejercicios2/fuerza/treninferior/pesas/zancadamancuernas.png'),
(117, 'LEVANTAMIENTO EN DOS TIEMPOS', 'FUERZA', 'PESAS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesas/levantamientodostiempos.png', 'fotosejercicios2/fuerza/treninferior/pesas/levantamientodostiempos.png'),
(118, 'MEDIA SENTADILLA SUMO CON MANCUERNA', 'FUERZA', 'PESAS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesas/sumomancuerna.png', 'fotosejercicios2/fuerza/treninferior/pesas/sumomancuerna.png'),
(119, 'TIRÓN FRONTAL CON MANCUERNA', 'FUERZA', 'PESAS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesas/tironfrontalmancuerna.png', 'fotosejercicios2/fuerza/treninferior/pesas/tironfrontalmancuerna.png'),
(120, 'PESO MUERTO CON BARRA O TRADICIONAL', 'FUERZA', 'PESAS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesas/pesomuertobarra.png', 'fotosejercicios2/fuerza/treninferior/pesas/pesomuertobarra.png'),
(121, 'PESO MUERTO A UNA PIERNA CON MANCUERNAS', 'FUERZA', 'PESAS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesas/pesomuertounapierna.png', 'fotosejercicios2/fuerza/treninferior/pesas/pesomuertounapierna.png'),
(122, 'ELEVACIÓN DE GEMELOS DE PIE CON MANCUERNAS', 'FUERZA', 'PESAS', 'TREN INFERIOR', 'fotosejercicios2/fuerza/treninferior/pesas/elevaciongemelosmancuerna.png', 'fotosejercicios2/fuerza/treninferior/pesas/elevaciongemelosmancuerna.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

CREATE TABLE `novedades` (
  `id` int(11) NOT NULL,
  `tipo` enum('CONSEJO','NOTICIA','BENEFICIO') DEFAULT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `novedades`
--

INSERT INTO `novedades` (`id`, `tipo`, `titulo`, `descripcion`) VALUES
(1, 'CONSEJO', 'Empieza progresivamente', 'Haz una prueba para evaluar tu forma física y diseña tus entrenamientos en función de tu estado actual. A medida que vayas progresando, podrás ir aumentando la intensidad de tus entrenamientos.'),
(2, 'NOTICIA', 'Prueba el entrenamiento de resistencia', 'El entrenamiento de resistencia puede ayudar a ganar masa muscular y a mejorar la fuerza y la resistencia muscular, pero también puede ayudar a acelerar el metabolismo.'),
(3, 'BENEFICIO', 'Ir al gimnasio hace que estés más feliz', 'Cuando realizas ejercicio, esta actividad física estimula diferentes sustancias químicas en tu cerebro. Dichas sustancias pueden hacer que te sientas más feliz, con un mejor estado de ánimo, mucho más relajado y menos ansioso.'),
(4, 'CONSEJO', 'Ejercicios de movilidad y estiramientos', 'Los ejercicios de movilidad antes de entrenar y los estiramientos después de entrenar pueden ayudar a aumentar el rendimiento y mejorar la recuperación.'),
(5, 'NOTICIA', 'Elige los mejores suplementos', 'Tomar un cazo de proteína de suero y 3-5 gramos de creatina antes o después de entrenar durante 10 semanas ayuda a aumentar la masa muscular y la fuerza, además de reducir la grasa corporal.'),
(6, 'BENEFICIO', 'Concilias el sueño y duermes mejor', 'Lo más conveniente es que programes tu horario de entrenamiento en el gimnasio, temprano por la mañana, o durante las tardes.'),
(7, 'CONSEJO', 'Nunca olvides tu día de descanso', 'Los días de descanso permiten que el cuerpo se recupere para que puedas volver más fuerte a la siguiente sesión de entrenamiento.'),
(8, 'CONSEJO', 'Cambia tu rutina de entrenamiento', 'Lo ideal es cambiar la rutina de entrenamiento cada 8-12 semanas para que el cuerpo no se acostumbre a hacer siempre lo mismo. ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `progreso`
--

CREATE TABLE `progreso` (
  `id` int(11) NOT NULL,
  `peso_kg` decimal(5,2) DEFAULT NULL,
  `altura_cm` int(11) DEFAULT NULL,
  `imc` decimal(5,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutina`
--

CREATE TABLE `rutina` (
  `id` int(11) NOT NULL,
  `duracion_semanas` int(2) NOT NULL,
  `num_sesiones` int(1) NOT NULL,
  `dificultad` enum('PRINCIPIANTE','MODERADO','AVANZADO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `rutina`
--

INSERT INTO `rutina` (`id`, `duracion_semanas`, `num_sesiones`, `dificultad`) VALUES
(1, 0, 0, NULL),
(2, 9, 3, NULL),
(3, 10, 15, NULL),
(4, 8, 4, NULL),
(5, 4, 5, NULL),
(7, 8, 5, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutina_ejercicio`
--

CREATE TABLE `rutina_ejercicio` (
  `id_rutina` int(11) DEFAULT NULL,
  `id_ejercicio` int(11) DEFAULT NULL,
  `dia` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `rutina_ejercicio`
--

INSERT INTO `rutina_ejercicio` (`id_rutina`, `id_ejercicio`, `dia`) VALUES
(3, 1, 1),
(3, 1, 1),
(7, 72, 1),
(7, 21, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secuencia`
--

CREATE TABLE `secuencia` (
  `id` int(11) NOT NULL,
  `series` int(2) DEFAULT NULL,
  `repeticiones` int(2) DEFAULT NULL,
  `duracion` int(2) DEFAULT NULL,
  `id_ejercicio` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `secuencia`
--

INSERT INTO `secuencia` (`id`, `series`, `repeticiones`, `duracion`, `id_ejercicio`) VALUES
(1, 1, NULL, 20, 1),
(2, 1, NULL, 20, 1),
(3, 1, 12, NULL, 37),
(4, 2, 12, NULL, 37),
(5, 3, 12, NULL, 37),
(6, 4, 12, NULL, 37),
(7, 1, NULL, 20, 1),
(8, 1, 12, NULL, 40),
(9, 2, 12, NULL, 40),
(10, 3, 12, NULL, 40),
(11, 4, 12, NULL, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `foto` mediumtext DEFAULT NULL,
  `id_rutina` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `dni`, `nombre`, `apellidos`, `telefono`, `correo`, `fecha_nacimiento`, `contrasena`, `foto`, `id_rutina`) VALUES
(4, '77777777E', 'dsd', 'dwdw', '555555555', 'a@gmail.com', '2024-06-04', 'dwdweddwwedw', ' ', 1),
(5, '66666666R', 'b', 'b', '478596547', 'b@gmail.com', '2024-06-03', 'bbbbbbbb', '', NULL),
(6, '44444444V', 'Juan', 'Ortega', '656556626', 'juan@gmail.com', '2024-06-13', 'juanitojuan', ' ', 1),
(7, '77777777E', 'a', 'a', '878787878', 'a@gmail.com', '2024-06-01', 'holahola', NULL, 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `novedades`
--
ALTER TABLE `novedades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `progreso`
--
ALTER TABLE `progreso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `rutina`
--
ALTER TABLE `rutina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rutina_ejercicio`
--
ALTER TABLE `rutina_ejercicio`
  ADD KEY `id_rutina` (`id_rutina`),
  ADD KEY `id_ejercicio` (`id_ejercicio`);

--
-- Indices de la tabla `secuencia`
--
ALTER TABLE `secuencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ejercicio` (`id_ejercicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rutina` (`id_rutina`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT de la tabla `novedades`
--
ALTER TABLE `novedades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `progreso`
--
ALTER TABLE `progreso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rutina`
--
ALTER TABLE `rutina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `secuencia`
--
ALTER TABLE `secuencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `progreso`
--
ALTER TABLE `progreso`
  ADD CONSTRAINT `progreso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rutina_ejercicio`
--
ALTER TABLE `rutina_ejercicio`
  ADD CONSTRAINT `rutina_ejercicio_ibfk_1` FOREIGN KEY (`id_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rutina_ejercicio_ibfk_2` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `secuencia`
--
ALTER TABLE `secuencia`
  ADD CONSTRAINT `secuencia_ibfk_1` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_rutina` FOREIGN KEY (`id_rutina`) REFERENCES `rutina` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
