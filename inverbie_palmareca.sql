-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 31-03-2021 a las 00:37:03
-- Versión del servidor: 10.3.28-MariaDB
-- Versión de PHP: 7.3.27
set foreign_key_checks=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inverbie_palmareca`
--
CREATE DATABASE IF NOT EXISTS `inverbie_palmareca` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `inverbie_palmareca`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_app_config`
--

CREATE TABLE `c19_app_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `c19_app_config`
--

INSERT INTO `c19_app_config` (`key`, `value`) VALUES
('address', 'Your Address'),
('company', 'Inverbienes'),
('currency_side', ''),
('currency_symbol', '$'),
('custom10_name', '0'),
('custom1_name', '0'),
('custom2_name', '0'),
('custom3_name', '0'),
('custom4_name', '0'),
('custom5_name', '0'),
('custom6_name', '0'),
('custom7_name', '0'),
('custom8_name', '0'),
('custom9_name', '0'),
('default_tax_1_name', '0'),
('default_tax_1_rate', '0'),
('default_tax_2_name', '0'),
('default_tax_2_rate', '0'),
('email', ''),
('fax', ''),
('language', 'es'),
('logo', 'o_1f1i2qffno01183qt8vijv70a7.png'),
('phone', '111-2222'),
('print_after_sale', '0'),
('recv_invoice_format', '0'),
('return_policy', '0'),
('sales_invoice_format', '0'),
('tax_included', '0'),
('timezone', 'America/New_York'),
('website', 'http://www.inverbienescancun.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_attachments`
--

CREATE TABLE `c19_attachments` (
  `attachment_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `descriptions` varchar(100) NOT NULL,
  `session_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `c19_attachments`
--

INSERT INTO `c19_attachments` (`attachment_id`, `loan_id`, `customer_id`, `filename`, `descriptions`, `session_id`) VALUES
(1, 0, 0, 'o_1av647e1p1q191c5rk5hdrfkc47.jpg', '', 'v674W7tyKAiPgFpT'),
(2, 0, 0, 'o_1f1c3no07od0t5o9gkj3lu127.png', '', 'v5YCQ2HO3UbDAVkw'),
(3, 0, 0, 'o_1f1c3v9k310mi4iasce1nb5v867.png', '', 'mhOPp6uFL1iHjW0q'),
(4, 0, 0, 'o_1f1c4dctol8t15rn1f68g0f1q687.PNG', '', 'MDtTWP7Q3mShkcwe'),
(9, 7, 0, 'o_1f1konh361k5s7jgoofkh1oid7.xlsx', '', 'OPdtypEiCmAl5FMn'),
(10, 8, 0, 'o_1f1kppku31idf12p919q61gss2jf7.xlsx', '', 'jof78kLSy4E3inVY');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_customers`
--

CREATE TABLE `c19_customers` (
  `person_id` int(10) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `credit_limit` decimal(10,2) NOT NULL,
  `conyuge_name` varchar(100) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `oficina` varchar(50) DEFAULT NULL,
  `lugar_nacimiento` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` varchar(50) DEFAULT NULL,
  `lugar_trabajo` varchar(50) DEFAULT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `refnombre1` varchar(100) DEFAULT NULL,
  `refdireccion1` varchar(200) DEFAULT NULL,
  `reftel1` varchar(50) DEFAULT NULL,
  `refparentesco1` varchar(50) DEFAULT NULL,
  `refnombre2` varchar(100) DEFAULT NULL,
  `refdireccion2` varchar(200) DEFAULT NULL,
  `reftel2` varchar(50) DEFAULT NULL,
  `refparentesco2` varchar(50) DEFAULT NULL,
  `refnombre3` varchar(100) DEFAULT NULL,
  `refdireccion3` varchar(200) DEFAULT NULL,
  `reftel3` varchar(50) DEFAULT NULL,
  `refparentesco3` varchar(50) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT 1,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `added_by` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `c19_customers`
--

INSERT INTO `c19_customers` (`person_id`, `account_number`, `credit_limit`, `conyuge_name`, `celular`, `oficina`, `lugar_nacimiento`, `fecha_nacimiento`, `lugar_trabajo`, `puesto`, `facebook`, `refnombre1`, `refdireccion1`, `reftel1`, `refparentesco1`, `refnombre2`, `refdireccion2`, `reftel2`, `refparentesco2`, `refnombre3`, `refdireccion3`, `reftel3`, `refparentesco3`, `taxable`, `deleted`, `added_by`) VALUES
(2, 'sincuenta', 0.00, 'sin conyuge', 'sin celular', 'sin tel oficina', 'sin lugar nacimiento', '0/0/0', 'sin lugar de trabajo', 'sin puesto', 'sin facebook', 'sin nom referencia1', 'sin direccion referencia1', 'sin telefono referencia1', 'sin parentesco1', 'sin nombre referencia2', 'sin direccion referencia2', 'sin telefono referencia2', 'sin parentesco referencia2', 'sin nombre referencia 3', 'sin direccion referencia3', 'sin telefono referencia3', 'sin parentesco referencia3', 0, 0, 1),
(4, NULL, 0.00, 'Veronica Sanchez Legaria', '9615938015', 'Sin Telefono de oficina', 'Mexico D.F. ', '02 de agosto de 1974', 'Cubo Negocios', 'Director de Plaza', 'Javier Gomez', 'Ricardo Gomez Mejia', 'Sin direccion', '7442252495', 'Hermano', 'Rodrigo Reyes', 'Sin direccion', '9984205285', 'amigo', 'Sin datos', 'Sin datos', 'Sin datos', 'Hermano', 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_emails`
--

CREATE TABLE `c19_emails` (
  `email_id` int(11) NOT NULL,
  `template_name` varchar(300) DEFAULT NULL,
  `templates` text DEFAULT NULL,
  `descriptions` text NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_employees`
--

CREATE TABLE `c19_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `added_by` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `c19_employees`
--

INSERT INTO `c19_employees` (`username`, `password`, `person_id`, `added_by`, `deleted`) VALUES
('admin', '0192023a7bbd73250516f069df18b500', 1, 1, 0),
('reyna', 'd56f9149f115c459482c0c1167550129', 3, 1, 0),
('viridiana', '4a876998dbc1306a954a1e5640cf5af3', 5, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_financial_status`
--

CREATE TABLE `c19_financial_status` (
  `financial_status_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `income_sources` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `c19_financial_status`
--

INSERT INTO `c19_financial_status` (`financial_status_id`, `person_id`, `income_sources`) VALUES
(1, 2, '[\"=\"]'),
(2, 4, '[\"=\"]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_grants`
--

CREATE TABLE `c19_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `c19_grants`
--

INSERT INTO `c19_grants` (`permission_id`, `person_id`) VALUES
('config', 1),
('config', 3),
('config', 5),
('customers', 1),
('customers', 3),
('customers', 5),
('emails', 1),
('emails', 3),
('emails', 5),
('employees', 1),
('employees', 3),
('employees', 5),
('loans', 1),
('loans', 3),
('loans', 5),
('loan_types', 1),
('loan_types', 3),
('loan_types', 5),
('lotes', 1),
('lotes', 3),
('lotes', 5),
('messages', 1),
('messages', 3),
('messages', 5),
('my_wallets', 1),
('my_wallets', 3),
('my_wallets', 5),
('overdues', 1),
('overdues', 3),
('overdues', 5),
('payments', 1),
('payments', 3),
('payments', 5),
('roles', 1),
('roles', 3),
('roles', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_guarantee`
--

CREATE TABLE `c19_guarantee` (
  `guarantee_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL DEFAULT 0,
  `lote_id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `type` varchar(300) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `make` varchar(50) NOT NULL,
  `serial` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `proof` varchar(1000) NOT NULL,
  `images` varchar(1000) NOT NULL,
  `observations` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_loans`
--

CREATE TABLE `c19_loans` (
  `loan_id` int(11) NOT NULL,
  `account` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `remarks` varchar(300) NOT NULL,
  `loan_type_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `lote_id` int(11) NOT NULL,
  `enganche` int(11) DEFAULT NULL,
  `mantenimiento` int(11) DEFAULT NULL,
  `observacion_lote` varchar(250) DEFAULT NULL,
  `loan_amount` decimal(10,2) NOT NULL,
  `loan_balance` decimal(10,2) NOT NULL,
  `loan_status` enum('pending','approved','on going','paid') NOT NULL,
  `loan_agent_id` int(11) NOT NULL,
  `loan_approved_by_id` int(11) NOT NULL,
  `loan_reviewed_by_id` int(11) NOT NULL,
  `loan_applied_date` int(11) NOT NULL,
  `loan_payment_date` int(11) NOT NULL,
  `misc_fees` text NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `payment_scheds` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `c19_loans`
--

INSERT INTO `c19_loans` (`loan_id`, `account`, `description`, `remarks`, `loan_type_id`, `customer_id`, `lote_id`, `enganche`, `mantenimiento`, `observacion_lote`, `loan_amount`, `loan_balance`, `loan_status`, `loan_agent_id`, `loan_approved_by_id`, `loan_reviewed_by_id`, `loan_applied_date`, `loan_payment_date`, `misc_fees`, `delete_flag`, `payment_scheds`) VALUES
(1, '2', 'sin descripcion', '', 0, 2, 1, 100, 200, 'sin obsercaciones', 1000.00, 1000.00, 'pending', 1, 0, 0, 1616731200, 1609822800, '{\"\":\"\"}', 0, '{\"term\":\"10\",\"term_period\":\"month\",\"payment_sched\":null,\"interest_rate\":\"\",\"penalty\":null,\"payment_breakdown\":{\"schedule\":[\"1\\/5\\/2021\",\"31\\/5\\/2021\",\"1\\/7\\/2021\",\"31\\/7\\/2021\",\"31\\/8\\/2021\",\"1\\/10\\/2021\",\"31\\/10\\/2021\",\"1\\/12\\/2021\",\"31\\/12\\/2021\",\"31\\/1\\/2022\"],\"balance\":[\"900.00\",\"800.00\",\"700.00\",\"600.00\",\"500.00\",\"400.00\",\"300.00\",\"200.00\",\"100.00\",\"0.00\"],\"interest\":[\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\"],\"amount\":[\"100.00\",\"100.00\",\"100.00\",\"100.00\",\"100.00\",\"100.00\",\"100.00\",\"100.00\",\"100.00\",\"100.00\"]}}'),
(2, '4', 'Sin descripción ', '', 0, 4, 2, 12000, 5000, 'Sin observaciones ', 647500.00, 647500.00, 'pending', 3, 0, 0, 1597204800, 0, '{\"185\":\"3500\"}', 0, '{\"term\":\"185\",\"term_period\":\"month\",\"payment_sched\":null,\"interest_rate\":\"\",\"penalty\":null,\"payment_breakdown\":{\"schedule\":[\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\",\"NaN\\/NaN\\/NaN\"],\"balance\":[\"644000.00\",\"640500.00\",\"637000.00\",\"633500.00\",\"630000.00\",\"626500.00\",\"623000.00\",\"619500.00\",\"616000.00\",\"612500.00\",\"609000.00\",\"605500.00\",\"602000.00\",\"598500.00\",\"595000.00\",\"591500.00\",\"588000.00\",\"584500.00\",\"581000.00\",\"577500.00\",\"574000.00\",\"570500.00\",\"567000.00\",\"563500.00\",\"560000.00\",\"556500.00\",\"553000.00\",\"549500.00\",\"546000.00\",\"542500.00\",\"539000.00\",\"535500.00\",\"532000.00\",\"528500.00\",\"525000.00\",\"521500.00\",\"518000.00\",\"514500.00\",\"511000.00\",\"507500.00\",\"504000.00\",\"500500.00\",\"497000.00\",\"493500.00\",\"490000.00\",\"486500.00\",\"483000.00\",\"479500.00\",\"476000.00\",\"472500.00\",\"469000.00\",\"465500.00\",\"462000.00\",\"458500.00\",\"455000.00\",\"451500.00\",\"448000.00\",\"444500.00\",\"441000.00\",\"437500.00\",\"434000.00\",\"430500.00\",\"427000.00\",\"423500.00\",\"420000.00\",\"416500.00\",\"413000.00\",\"409500.00\",\"406000.00\",\"402500.00\",\"399000.00\",\"395500.00\",\"392000.00\",\"388500.00\",\"385000.00\",\"381500.00\",\"378000.00\",\"374500.00\",\"371000.00\",\"367500.00\",\"364000.00\",\"360500.00\",\"357000.00\",\"353500.00\",\"350000.00\",\"346500.00\",\"343000.00\",\"339500.00\",\"336000.00\",\"332500.00\",\"329000.00\",\"325500.00\",\"322000.00\",\"318500.00\",\"315000.00\",\"311500.00\",\"308000.00\",\"304500.00\",\"301000.00\",\"297500.00\",\"294000.00\",\"290500.00\",\"287000.00\",\"283500.00\",\"280000.00\",\"276500.00\",\"273000.00\",\"269500.00\",\"266000.00\",\"262500.00\",\"259000.00\",\"255500.00\",\"252000.00\",\"248500.00\",\"245000.00\",\"241500.00\",\"238000.00\",\"234500.00\",\"231000.00\",\"227500.00\",\"224000.00\",\"220500.00\",\"217000.00\",\"213500.00\",\"210000.00\",\"206500.00\",\"203000.00\",\"199500.00\",\"196000.00\",\"192500.00\",\"189000.00\",\"185500.00\",\"182000.00\",\"178500.00\",\"175000.00\",\"171500.00\",\"168000.00\",\"164500.00\",\"161000.00\",\"157500.00\",\"154000.00\",\"150500.00\",\"147000.00\",\"143500.00\",\"140000.00\",\"136500.00\",\"133000.00\",\"129500.00\",\"126000.00\",\"122500.00\",\"119000.00\",\"115500.00\",\"112000.00\",\"108500.00\",\"105000.00\",\"101500.00\",\"98000.00\",\"94500.00\",\"91000.00\",\"87500.00\",\"84000.00\",\"80500.00\",\"77000.00\",\"73500.00\",\"70000.00\",\"66500.00\",\"63000.00\",\"59500.00\",\"56000.00\",\"52500.00\",\"49000.00\",\"45500.00\",\"42000.00\",\"38500.00\",\"35000.00\",\"31500.00\",\"28000.00\",\"24500.00\",\"21000.00\",\"17500.00\",\"14000.00\",\"10500.00\",\"7000.00\",\"3500.00\",\"0.00\"],\"interest\":[\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\",\"0.00\"],\"amount\":[\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\",\"3500.00\"]}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_loan_payments`
--

CREATE TABLE `c19_loan_payments` (
  `loan_payment_id` int(11) NOT NULL,
  `account` varchar(50) NOT NULL DEFAULT '0',
  `loan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `balance_amount` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `teller_id` int(11) NOT NULL,
  `date_paid` int(11) NOT NULL,
  `date_modified` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `remarks` varchar(2000) NOT NULL,
  `delete_flag` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_loan_types`
--

CREATE TABLE `c19_loan_types` (
  `loan_type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `term` int(11) NOT NULL,
  `term_period_type` varchar(50) NOT NULL,
  `payment_schedule` varchar(50) NOT NULL,
  `percent_charge1` decimal(10,2) NOT NULL,
  `period_charge1` int(11) NOT NULL,
  `period_type1` varchar(50) NOT NULL,
  `percent_charge2` decimal(10,2) NOT NULL,
  `period_charge2` int(11) NOT NULL,
  `period_type2` varchar(50) NOT NULL,
  `percent_charge3` decimal(10,2) NOT NULL,
  `period_charge3` int(11) NOT NULL,
  `period_type3` varchar(50) NOT NULL,
  `percent_charge4` decimal(10,2) NOT NULL,
  `period_charge4` int(11) NOT NULL,
  `period_type4` varchar(50) NOT NULL,
  `percent_charge5` decimal(10,2) NOT NULL,
  `period_charge5` int(11) NOT NULL,
  `period_type5` varchar(50) NOT NULL,
  `percent_charge6` decimal(10,2) NOT NULL,
  `period_charge6` int(11) NOT NULL,
  `period_type6` varchar(50) NOT NULL,
  `percent_charge7` decimal(10,2) NOT NULL,
  `period_charge7` int(11) NOT NULL,
  `period_type7` varchar(50) NOT NULL,
  `percent_charge8` decimal(10,2) NOT NULL,
  `period_charge8` int(11) NOT NULL,
  `period_type8` varchar(50) NOT NULL,
  `percent_charge9` decimal(10,2) NOT NULL,
  `period_charge9` int(11) NOT NULL,
  `period_type9` varchar(50) NOT NULL,
  `percent_charge10` decimal(10,2) NOT NULL,
  `period_charge10` int(11) NOT NULL,
  `period_type10` varchar(50) NOT NULL,
  `added_by` int(11) NOT NULL,
  `date_added` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `c19_loan_types`
--

INSERT INTO `c19_loan_types` (`loan_type_id`, `name`, `description`, `term`, `term_period_type`, `payment_schedule`, `percent_charge1`, `period_charge1`, `period_type1`, `percent_charge2`, `period_charge2`, `period_type2`, `percent_charge3`, `period_charge3`, `period_type3`, `percent_charge4`, `period_charge4`, `period_type4`, `percent_charge5`, `period_charge5`, `period_type5`, `percent_charge6`, `period_charge6`, `period_type6`, `percent_charge7`, `period_charge7`, `period_type7`, `percent_charge8`, `period_charge8`, `period_type8`, `percent_charge9`, `period_charge9`, `period_type9`, `percent_charge10`, `period_charge10`, `period_type10`, `added_by`, `date_added`, `modified_by`, `date_modified`) VALUES
(8, 'test', 'fds fasdfasdf', 5, 'month', 'weekly', 12.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 1, 1456477469, 0, 0),
(9, 'norman_type', 'fasdfa sdfas', 5, 'month', 'weekly', 12.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 2, 1456477650, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_lotes`
--

CREATE TABLE `c19_lotes` (
  `lote_id` int(10) NOT NULL,
  `desarrollo` varchar(255) NOT NULL,
  `sm` varchar(10) NOT NULL,
  `lote` varchar(10) NOT NULL,
  `superficie` int(11) NOT NULL DEFAULT 1000,
  `estado` varchar(10) NOT NULL DEFAULT 'disponible',
  `comentarios` varchar(256) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `added_by` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `c19_lotes`
--

INSERT INTO `c19_lotes` (`lote_id`, `desarrollo`, `sm`, `lote`, `superficie`, `estado`, `comentarios`, `deleted`, `added_by`) VALUES
(1, 'sin desarrollo', '0', '0', 0, 'disponible', 'nada', 0, 1),
(2, 'LA SELVA', 'B2', '9', 1000, 'disponible', 'sin comentarios', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_messages`
--

CREATE TABLE `c19_messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL DEFAULT 0,
  `recipient_id` int(11) NOT NULL DEFAULT 0,
  `mark_as_read` tinyint(1) NOT NULL DEFAULT 0,
  `header` varchar(300) NOT NULL,
  `body` text NOT NULL,
  `send_date` date NOT NULL,
  `receive_date` date NOT NULL,
  `sender_delete_flag` tinyint(4) NOT NULL DEFAULT 0,
  `recipient_delete_flag` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_modules`
--

CREATE TABLE `c19_modules` (
  `module_id` varchar(255) NOT NULL,
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `icons` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `c19_modules`
--

INSERT INTO `c19_modules` (`module_id`, `name_lang_key`, `desc_lang_key`, `sort`, `icons`, `is_active`) VALUES
('config', 'module_config', 'module_config_desc', 100, '<i class=\"fa fa-cogs\" style=\"font-size: 50px; color:#26B6AE\"></i>', 1),
('customers', 'module_customers', 'module_customers_desc', 10, '<i class=\"fa fa-smile-o\" style=\"font-size: 50px; color:#FF5400\"></i>', 1),
('emails', 'module_email', 'module_email_desc', 0, '<i class=\"fa fa-envelope\" style=\"font-size: 50px; color:#26B6AE\"></i>', 0),
('employees', 'module_employees', 'module_employees_desc', 80, '<i class=\"fa fa-users\" style=\"font-size: 50px; color:#FF5400\"></i>', 1),
('loans', 'module_loans', 'module_loans_desc', 80, '<i class=\"fa fa-money\" style=\"font-size: 50px; color:#4EA216\"></i>', 1),
('loan_types', 'module_loan_types', 'module_loan_types_desc', 79, '<i class=\"fa fa-sitemap\" style=\"font-size: 50px; color:#e80a0a\"></i>', 1),
('lotes', 'module_lotes', 'module_lotes_desc', 10, '<i class=\"fa fa-home\" style=\"font-size: 50px; color:#FF5400\"></i>', 1),
('messages', 'module_messages', 'module_messages_desc', 80, '<i class=\"fa fa-envelope\" style=\"font-size: 50px; color:#4EA216\"></i>', 0),
('my_wallets', 'module_my_wallets', 'module_my_wallets_desc', 79, '<i class=\"fa fa-briefcase\" style=\"font-size: 50px; color:#e80a0a\"></i>', 0),
('overdues', 'module_overdues', 'module_overdues_desc', 80, '<i class=\"fa fa-file\" style=\"font-size: 50px; color:#1b926c\"></i>', 0),
('payments', 'module_payments', 'module_payments_desc', 80, '<i class=\"fa fa-paypal\" style=\"font-size: 50px; color:#2B9EC4\"></i>', 0),
('plugins', 'module_plugins', 'module_plugins_desc', 99, '<i class=\"fa fa-wrench\" style=\"font-size: 50px; color:#2B9EC4\"></i>', 0),
('roles', 'module_roles', 'module_roles_desc', 79, '<i class=\"fa fa-cogs\" style=\"font-size: 50px; color:#1b926c\"></i>', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_payment_schedules`
--

CREATE TABLE `c19_payment_schedules` (
  `payment_schedule_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `recurrence` int(11) NOT NULL DEFAULT 0,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `c19_payment_schedules`
--

INSERT INTO `c19_payment_schedules` (`payment_schedule_id`, `name`, `recurrence`, `delete_flag`) VALUES
(1, 'weekly', 0, 0),
(2, 'biweekly', 0, 0),
(3, 'monthly', 0, 0),
(4, 'bimonthly', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_people`
--

CREATE TABLE `c19_people` (
  `person_id` int(10) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `c19_people`
--

INSERT INTO `c19_people` (`person_id`, `first_name`, `last_name`, `photo_url`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `role_id`) VALUES
(1, 'Admin1', 'Admin', 'o_1f1i3l6a715sk1vcp1eqp1vc11m2q8.jpg', '421-2583', 'admin@loans.com', 'nowhere', '', '', '', '', '', '', 13),
(2, 'sin nombre', 'sin apellido', '', 'sin tel casa', 'a@a.com', 'sin direccion', 'sin direccion2', 'NA', 'NA', 'NA', 'NA', 'sin comentarios', 0),
(3, 'Reyna', 'Vazquez', '', '', '', '', '', '', '', '', '', '', 13),
(4, 'Javier ', 'Gómez Mejia', '', 'Sin telefono de casa', 'clauxaspa@gmail.com', 'Bulevar Kukulkan Km.12.5 Isla dorada, hechizada D.12 ', 'Sin Direccion', 'NA', 'NA', 'NA', 'NA', 'Sin comentarios', 0),
(5, 'Viridiana', 'gerente', '', '', '', '', '', '', '', '', '', '', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_permissions`
--

CREATE TABLE `c19_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `c19_permissions`
--

INSERT INTO `c19_permissions` (`permission_id`, `module_id`, `location_id`) VALUES
('config', 'config', NULL),
('customers', 'customers', NULL),
('emails', 'emails', NULL),
('employees', 'employees', NULL),
('loans', 'loans', NULL),
('loan_types', 'loan_types', NULL),
('lotes', 'lotes', NULL),
('messages', 'messages', NULL),
('my_wallets', 'my_wallets', NULL),
('overdues', 'overdues', NULL),
('payments', 'payments', NULL),
('plugins', 'plugins', NULL),
('roles', 'roles', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_plugins`
--

CREATE TABLE `c19_plugins` (
  `plugin_id` int(11) NOT NULL,
  `module_name` varchar(200) NOT NULL,
  `module_desc` varchar(200) NOT NULL,
  `module_settings` text NOT NULL,
  `status_flag` enum('Active','Inactive') NOT NULL DEFAULT 'Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_roles`
--

CREATE TABLE `c19_roles` (
  `role_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `low_level` varchar(200) NOT NULL,
  `rights` text NOT NULL,
  `added_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `c19_roles`
--

INSERT INTO `c19_roles` (`role_id`, `name`, `low_level`, `rights`, `added_by`) VALUES
(13, 'admin', '[\"13\",\"15\"]', '[\"emails\",\"lotes\",\"customers\",\"roles\",\"loan_types\",\"my_wallets\",\"loans\",\"messages\",\"overdues\",\"payments\",\"employees\",\"config\"]', 1),
(15, 'Staff', 'false', '[\"customers\",\"roles\",\"loan_types\"]', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_sessions`
--

CREATE TABLE `c19_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `c19_sessions`
--

INSERT INTO `c19_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('19b3acbcc0cf7ac87edc55f4e79a2edf', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476594341, ''),
('2be56e964905cdfc808499232b814f7d', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36', 1457925550, ''),
('573781a90e84892b448238abc6e51686', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476594341, 'a:2:{s:9:\"user_data\";s:0:\"\";s:9:\"person_id\";s:1:\"1\";}'),
('6108c8326f39bed970692f5ec60d0c3e', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36', 1457941852, 'a:2:{s:9:\"user_data\";s:0:\"\";s:9:\"person_id\";s:1:\"1\";}'),
('79e2d16b2d4a4347d55f2c986acc987a', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476603802, 'a:3:{s:9:\"person_id\";s:1:\"1\";s:4:\"data\";a:2:{s:6:\"params\";a:3:{s:4:\"name\";s:36:\"o_1av66hk6o1vab10e91eoh1su11r688.jpg\";s:7:\"user_id\";s:1:\"1\";s:9:\"softtoken\";s:32:\"4accd073402639e6b42c62615c464d11\";}s:8:\"filename\";s:36:\"o_1av66hk6o1vab10e91eoh1su11r688.jpg\";}s:6:\"linker\";s:16:\"v674W7tyKAiPgFpT\";}'),
('9cd728f4fd4455ba79cd698515a697fb', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36', 1458184977, 'a:2:{s:9:\"user_data\";s:0:\"\";s:9:\"person_id\";s:1:\"1\";}'),
('ae78b2310cba875b73b8a3e0ebce6741', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36', 1456479807, ''),
('e62cbed658e0108e3d389077112d735d', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36', 1457426042, 'a:2:{s:9:\"user_data\";s:0:\"\";s:9:\"person_id\";s:1:\"1\";}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_smtp`
--

CREATE TABLE `c19_smtp` (
  `smtp_id` int(11) NOT NULL,
  `smtp_host` varchar(300) NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_user` varchar(300) NOT NULL,
  `smtp_pass` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `c19_smtp`
--

INSERT INTO `c19_smtp` (`smtp_id`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`) VALUES
(1, '', 0, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c19_wallets`
--

CREATE TABLE `c19_wallets` (
  `wallet_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `descriptions` varchar(200) NOT NULL,
  `wallet_type` enum('debit','credit','transfer') NOT NULL,
  `trans_date` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `transfer_to` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `c19_app_config`
--
ALTER TABLE `c19_app_config`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `c19_attachments`
--
ALTER TABLE `c19_attachments`
  ADD PRIMARY KEY (`attachment_id`);

--
-- Indices de la tabla `c19_customers`
--
ALTER TABLE `c19_customers`
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `person_id` (`person_id`);

--
-- Indices de la tabla `c19_emails`
--
ALTER TABLE `c19_emails`
  ADD PRIMARY KEY (`email_id`);

--
-- Indices de la tabla `c19_employees`
--
ALTER TABLE `c19_employees`
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `person_id` (`person_id`);

--
-- Indices de la tabla `c19_financial_status`
--
ALTER TABLE `c19_financial_status`
  ADD PRIMARY KEY (`financial_status_id`);

--
-- Indices de la tabla `c19_grants`
--
ALTER TABLE `c19_grants`
  ADD PRIMARY KEY (`permission_id`,`person_id`),
  ADD KEY `ospos_grants_ibfk_2` (`person_id`);

--
-- Indices de la tabla `c19_guarantee`
--
ALTER TABLE `c19_guarantee`
  ADD PRIMARY KEY (`guarantee_id`);

--
-- Indices de la tabla `c19_loans`
--
ALTER TABLE `c19_loans`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indices de la tabla `c19_loan_payments`
--
ALTER TABLE `c19_loan_payments`
  ADD PRIMARY KEY (`loan_payment_id`);

--
-- Indices de la tabla `c19_loan_types`
--
ALTER TABLE `c19_loan_types`
  ADD PRIMARY KEY (`loan_type_id`);

--
-- Indices de la tabla `c19_lotes`
--
ALTER TABLE `c19_lotes`
  ADD PRIMARY KEY (`lote_id`);

--
-- Indices de la tabla `c19_messages`
--
ALTER TABLE `c19_messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indices de la tabla `c19_modules`
--
ALTER TABLE `c19_modules`
  ADD PRIMARY KEY (`module_id`),
  ADD UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  ADD UNIQUE KEY `name_lang_key` (`name_lang_key`);

--
-- Indices de la tabla `c19_payment_schedules`
--
ALTER TABLE `c19_payment_schedules`
  ADD PRIMARY KEY (`payment_schedule_id`);

--
-- Indices de la tabla `c19_people`
--
ALTER TABLE `c19_people`
  ADD PRIMARY KEY (`person_id`);

--
-- Indices de la tabla `c19_permissions`
--
ALTER TABLE `c19_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `ospos_permissions_ibfk_2` (`location_id`);

--
-- Indices de la tabla `c19_plugins`
--
ALTER TABLE `c19_plugins`
  ADD PRIMARY KEY (`plugin_id`);

--
-- Indices de la tabla `c19_roles`
--
ALTER TABLE `c19_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indices de la tabla `c19_sessions`
--
ALTER TABLE `c19_sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `c19_smtp`
--
ALTER TABLE `c19_smtp`
  ADD PRIMARY KEY (`smtp_id`);

--
-- Indices de la tabla `c19_wallets`
--
ALTER TABLE `c19_wallets`
  ADD PRIMARY KEY (`wallet_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `c19_attachments`
--
ALTER TABLE `c19_attachments`
  MODIFY `attachment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `c19_emails`
--
ALTER TABLE `c19_emails`
  MODIFY `email_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c19_financial_status`
--
ALTER TABLE `c19_financial_status`
  MODIFY `financial_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `c19_guarantee`
--
ALTER TABLE `c19_guarantee`
  MODIFY `guarantee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c19_loans`
--
ALTER TABLE `c19_loans`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `c19_loan_payments`
--
ALTER TABLE `c19_loan_payments`
  MODIFY `loan_payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c19_loan_types`
--
ALTER TABLE `c19_loan_types`
  MODIFY `loan_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `c19_lotes`
--
ALTER TABLE `c19_lotes`
  MODIFY `lote_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `c19_messages`
--
ALTER TABLE `c19_messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c19_payment_schedules`
--
ALTER TABLE `c19_payment_schedules`
  MODIFY `payment_schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `c19_people`
--
ALTER TABLE `c19_people`
  MODIFY `person_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `c19_plugins`
--
ALTER TABLE `c19_plugins`
  MODIFY `plugin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c19_roles`
--
ALTER TABLE `c19_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `c19_smtp`
--
ALTER TABLE `c19_smtp`
  MODIFY `smtp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `c19_wallets`
--
ALTER TABLE `c19_wallets`
  MODIFY `wallet_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `c19_customers`
--
ALTER TABLE `c19_customers`
  ADD CONSTRAINT `c19_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `c19_people` (`person_id`);

--
-- Filtros para la tabla `c19_employees`
--
ALTER TABLE `c19_employees`
  ADD CONSTRAINT `c19_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `c19_people` (`person_id`);

--
-- Filtros para la tabla `c19_grants`
--
ALTER TABLE `c19_grants`
  ADD CONSTRAINT `c19_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `c19_permissions` (`permission_id`),
  ADD CONSTRAINT `c19_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `c19_employees` (`person_id`);

--
-- Filtros para la tabla `c19_permissions`
--
ALTER TABLE `c19_permissions`
  ADD CONSTRAINT `c19_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `c19_modules` (`module_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `c19_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `kpos_stock_locations` (`location_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
