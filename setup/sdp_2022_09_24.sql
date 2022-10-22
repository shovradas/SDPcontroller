-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2022 at 10:13 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sdp`
--

-- --------------------------------------------------------

--
-- Table structure for table `closed_connection`
--

CREATE TABLE `closed_connection` (
  `gateway_sdpid` int(11) NOT NULL,
  `client_sdpid` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `start_timestamp` bigint(20) NOT NULL,
  `end_timestamp` bigint(20) NOT NULL,
  `protocol` tinytext COLLATE utf8_bin NOT NULL,
  `source_ip` tinytext COLLATE utf8_bin NOT NULL,
  `source_port` int(11) NOT NULL,
  `destination_ip` tinytext COLLATE utf8_bin NOT NULL,
  `destination_port` int(11) NOT NULL,
  `nat_destination_ip` tinytext COLLATE utf8_bin NOT NULL,
  `nat_destination_port` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `closed_connection`
--

INSERT INTO `closed_connection` (`gateway_sdpid`, `client_sdpid`, `service_id`, `start_timestamp`, `end_timestamp`, `protocol`, `source_ip`, `source_port`, `destination_ip`, `destination_port`, `nat_destination_ip`, `nat_destination_port`) VALUES
(55557, 55558, 7, 1663335621, 1663335621, 'tcp', '192.168.31.219', 43998, '192.168.31.241', 7000, '', 0),
(55557, 55558, 8, 1663377169, 1663377169, 'tcp', '192.168.31.219', 51152, '192.168.31.241', 8000, '10.42.0.1', 9000),
(55557, 55558, 9, 1663946329, 1663946329, 'tcp', '192.168.31.131', 41678, '192.168.31.111', 9000, '', 0),
(55557, 55558, 9, 1663946638, 1663946638, 'tcp', '192.168.31.131', 41682, '192.168.31.111', 9000, '', 0),
(55557, 55558, 8, 1663957121, 1663957121, 'tcp', '192.168.31.131', 56630, '192.168.31.111', 8000, '172.16.31.121', 8000),
(55557, 55558, 9, 1664000004, 1664000004, 'tcp', '192.168.31.131', 41740, '192.168.31.111', 9000, '', 0),
(55557, 55558, 8, 1664000678, 1664000678, 'tcp', '192.168.31.131', 56662, '192.168.31.111', 8000, '172.16.31.121', 8000),
(55557, 55558, 8, 1664000728, 1664000728, 'tcp', '192.168.31.131', 56662, '192.168.31.111', 8000, '172.16.31.121', 8000),
(55557, 55558, 8, 1664000746, 1664000746, 'tcp', '192.168.31.131', 56668, '192.168.31.111', 8000, '172.16.31.121', 8000),
(55557, 55558, 8, 1664001410, 1664001410, 'tcp', '192.168.31.131', 56672, '192.168.31.111', 8000, '172.16.31.121', 8000),
(55557, 55558, 8, 1664001431, 1664001431, 'tcp', '192.168.31.131', 56672, '192.168.31.111', 8000, '172.16.31.121', 8000),
(55557, 55558, 8, 1664001437, 1664001437, 'tcp', '192.168.31.131', 56678, '192.168.31.111', 8000, '172.16.31.121', 8000),
(55557, 55558, 8, 1664001705, 1664001705, 'tcp', '192.168.31.131', 56680, '192.168.31.111', 8000, '172.16.31.121', 8000),
(55557, 55559, 8, 1664003579, 1664003579, 'tcp', '192.168.31.132', 41144, '192.168.31.111', 8000, '172.16.31.121', 8000);

-- --------------------------------------------------------

--
-- Table structure for table `controller`
--

CREATE TABLE `controller` (
  `sdpid` int(11) NOT NULL,
  `name` varchar(1024) COLLATE utf8_bin NOT NULL,
  `address` varchar(4096) COLLATE utf8_bin NOT NULL COMMENT 'ip or url',
  `port` int(11) NOT NULL,
  `gateway_sdpid` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `environment`
--

CREATE TABLE `environment` (
  `id` int(11) NOT NULL,
  `name` varchar(1024) COLLATE utf8_bin NOT NULL,
  `mobile` tinyint(1) NOT NULL,
  `os_group` enum('Android','iOS','Windows','OSX','Linux') COLLATE utf8_bin NOT NULL,
  `os_version` varchar(1024) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `gateway`
--

CREATE TABLE `gateway` (
  `sdpid` int(11) NOT NULL,
  `name` varchar(1024) COLLATE utf8_bin NOT NULL,
  `address` varchar(1024) COLLATE utf8_bin NOT NULL COMMENT 'ip or url',
  `port` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `gateway_controller`
--

CREATE TABLE `gateway_controller` (
  `id` int(11) NOT NULL,
  `gateway_sdpid` int(11) NOT NULL,
  `controller_sdpid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `valid` tinyint(4) NOT NULL DEFAULT 1,
  `name` varchar(1024) COLLATE utf8_bin NOT NULL,
  `Description` varchar(4096) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `valid`, `name`, `Description`) VALUES
(2, 1, 'mygroup', 'not sure yet');

--
-- Triggers `group`
--
DELIMITER $$
CREATE TRIGGER `group_after_delete` AFTER DELETE ON `group` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'group',
        event = 'delete';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `group_service`
--

CREATE TABLE `group_service` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `group_service`
--

INSERT INTO `group_service` (`id`, `group_id`, `service_id`) VALUES
(2, 2, 9);

--
-- Triggers `group_service`
--
DELIMITER $$
CREATE TRIGGER `group_service_after_delete` AFTER DELETE ON `group_service` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'group_service',
        event = 'delete';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `group_service_after_insert` AFTER INSERT ON `group_service` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'group_service',
        event = 'insert';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `group_service_after_update` AFTER UPDATE ON `group_service` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'group_service',
        event = 'update';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mqtt_topics`
--

CREATE TABLE `mqtt_topics` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mqtt_topics`
--

INSERT INTO `mqtt_topics` (`id`, `name`) VALUES
(1, 'thing1/temperature'),
(2, 'thing1/pressure');

-- --------------------------------------------------------

--
-- Table structure for table `mqtt_topics_user`
--

CREATE TABLE `mqtt_topics_user` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mqtt_topics_user`
--

INSERT INTO `mqtt_topics_user` (`id`, `topic_id`, `user_id`) VALUES
(1, 1, 3),
(2, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `open_connection`
--

CREATE TABLE `open_connection` (
  `gateway_sdpid` int(11) NOT NULL,
  `client_sdpid` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `start_timestamp` bigint(20) NOT NULL,
  `end_timestamp` bigint(20) NOT NULL,
  `protocol` tinytext COLLATE utf8_bin NOT NULL,
  `source_ip` tinytext COLLATE utf8_bin NOT NULL,
  `source_port` int(11) NOT NULL,
  `destination_ip` tinytext COLLATE utf8_bin NOT NULL,
  `destination_port` int(11) NOT NULL,
  `nat_destination_ip` tinytext COLLATE utf8_bin NOT NULL,
  `nat_destination_port` int(11) NOT NULL,
  `gateway_controller_connection_id` int(11) NOT NULL COMMENT 'Only used to track open conns, not an index to a table'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `refresh_trigger`
--

CREATE TABLE `refresh_trigger` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `table_name` tinytext COLLATE utf8_bin NOT NULL,
  `event` tinytext COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `refresh_trigger`
--

INSERT INTO `refresh_trigger` (`id`, `timestamp`, `table_name`, `event`) VALUES
(51, '2022-09-11 17:42:39', 'sdpid_service', 'insert'),
(52, '2022-09-11 17:43:13', 'service_gateway', 'insert'),
(53, '2022-09-11 19:02:03', 'service_gateway', 'update'),
(54, '2022-09-11 19:12:59', 'service_gateway', 'insert'),
(55, '2022-09-11 19:15:59', 'user_group', 'insert'),
(56, '2022-09-11 19:16:17', 'group_service', 'insert'),
(57, '2022-09-15 08:29:35', 'service_gateway', 'delete'),
(58, '2022-09-15 08:29:35', 'service_gateway', 'delete'),
(59, '2022-09-15 08:29:35', 'service_gateway', 'delete'),
(60, '2022-09-15 08:29:35', 'service_gateway', 'delete'),
(61, '2022-09-15 08:30:55', 'service_gateway', 'insert'),
(62, '2022-09-15 08:30:55', 'service_gateway', 'insert'),
(63, '2022-09-15 08:30:55', 'service_gateway', 'insert'),
(64, '2022-09-15 08:30:55', 'service_gateway', 'insert'),
(65, '2022-09-15 17:41:41', 'service_gateway', 'update'),
(66, '2022-09-15 17:41:47', 'service_gateway', 'update'),
(67, '2022-09-15 21:44:21', 'service_gateway', 'update'),
(68, '2022-09-15 21:48:35', 'service_gateway', 'update'),
(69, '2022-09-15 22:05:43', 'service_gateway', 'update'),
(70, '2022-09-15 22:05:50', 'service_gateway', 'update'),
(71, '2022-09-15 22:38:59', 'service_gateway', 'update'),
(72, '2022-09-15 22:45:44', 'service_gateway', 'update'),
(73, '2022-09-16 13:24:23', 'service_gateway', 'update'),
(74, '2022-09-16 13:24:27', 'service_gateway', 'update'),
(75, '2022-09-16 14:25:06', 'service_gateway', 'update'),
(76, '2022-09-16 14:25:09', 'service_gateway', 'update'),
(77, '2022-09-16 14:27:29', 'service_gateway', 'update'),
(78, '2022-09-16 14:29:18', 'service_gateway', 'update'),
(79, '2022-09-16 14:29:33', 'service_gateway', 'update'),
(80, '2022-09-23 14:00:29', 'sdpid_service', 'insert'),
(81, '2022-09-23 14:10:43', 'service_gateway', 'update'),
(82, '2022-09-23 14:10:55', 'service_gateway', 'update'),
(83, '2022-09-23 14:11:38', 'service_gateway', 'update'),
(84, '2022-09-24 07:08:01', 'sdpid_service', 'insert');

-- --------------------------------------------------------

--
-- Table structure for table `sdpid`
--

CREATE TABLE `sdpid` (
  `sdpid` int(11) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  `type` enum('client','gateway','controller') COLLATE utf8_bin NOT NULL DEFAULT 'client',
  `country` varchar(128) COLLATE utf8_bin NOT NULL,
  `state` varchar(128) COLLATE utf8_bin NOT NULL,
  `locality` varchar(128) COLLATE utf8_bin NOT NULL,
  `org` varchar(128) COLLATE utf8_bin NOT NULL,
  `org_unit` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `alt_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `encrypt_key` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  `hmac_key` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  `serial` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_cred_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cred_update_due` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) DEFAULT NULL,
  `environment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `sdpid`
--

INSERT INTO `sdpid` (`sdpid`, `valid`, `type`, `country`, `state`, `locality`, `org`, `org_unit`, `alt_name`, `email`, `encrypt_key`, `hmac_key`, `serial`, `last_cred_update`, `cred_update_due`, `user_id`, `environment_id`) VALUES
(55556, 1, 'controller', 'DE', 'Saxony', 'Chemnitz', 'TU Chemnitz', 'Informatik', NULL, NULL, 'yZvbUWjFUTKqcCOCtOS8yds1yoXKg8HMVQ+i6BHqdyaIxglK5CzcSF4TDSU512dAvK6xxHMsQFWriUEtRf1wpxPBot3NhitL+4pf9d3O6x6BF93QX8w+nH6hbAO+HoqRqIzhBvbZVWR99zW+b87zRF9mwUybc/HjTZBWXQKBgQDIcbMKocHATXJuvC7s0HuqicVBcaxYi3SGrKRXDIvOKWs7kQ5ESoJLNI3lXrP4tBCbivYhjxR4XrhbugGalFOkJHZvwp/RtU6zSZ0XFC/ab/LkeClukUQDNmKqDtPNljbEkwgScmMoYmUw3uEpXokvQwkka6UH4DAH/DPAGFQ6rg==', '3KtHypqIk6zi9foyo7sPjx9SyisquAux7r+sV0VHLSF8NOA3+3CEIBQgI+OS/4YCjzgg2Uqy/3SaRDpy28kCQA2xFibxgoK4EBIe3/BVFhN+wHHQVMAbxju3eqrCTq7tnO961dXKJBxV5JdaPg/JUXE6xvien19RNmea55U1j7c=', '2ef62e6223639c064c02083d196f0898aa537ce3', '2022-09-06 08:11:05', '2022-10-06 22:00:00', NULL, NULL),
(55557, 1, 'gateway', 'DE', 'Saxony', 'Chemnitz', 'TU Chemnitz', 'Informatik', NULL, NULL, 'WOW6nXvvnvRSGSSFGYNuuZ1rKQ9+p43D8JkabdtkuMfWhfW8/ypPHFOGuqtpLnrnLJywoYLYm4/QAC1UC9o5yXZ2AwQ+Whpd47QTTTvALFtchGjVa3+911Dv6xb0phGEsnKvX0tWcVRtFii6x0AV/SGQq0MO54hetBHlLwKBgQD5BSUL20L0FDSQw8uLCaZUQTFlq61kTTB1znVQOGUaV9uBzcf/dy2rMraqaCN7I40b4Xb1gTeUKmhdVcIbcJWioTpePpboIR0DHidVz5qs4Jn4AbxSt+sSAR63QPKa8qtY7cg2b3azfz0vG0uhSCHlWaq7LtNqqGq85IhzO8LEdQ==', '+VH/eGKzsFAjpcHIhd4EwApw28oK6DbMSRlvcVXWS+pmsQV7QnFda05xqV840/Qy+kVTteF478ZXGXYkpQJBAOEI6ocyjb9voy8a5qKtpahuDOS8bA9IXg8hyzkfxdepQev16wApfdu7/EW+Crr6sEDnTLM7PQPnaQiPXC3Vx4Y=', '7bf0e17ae38c36d904d0f4362063789db4be54cd', '2022-09-24 06:37:06', '2022-10-24 22:00:00', NULL, NULL),
(55558, 1, 'client', 'DE', 'Saxony', 'Chemnitz', 'TU Chemnitz', 'Informatik', NULL, NULL, 'dz2cEtBCKNRFk4RACBFBP8mPxbJEUvUroeHgfmky3A7nAVZzrAXehi5rCOysePCLASeZ6sq3awZNmsK7JHdvM3kUsKptehNnUn3a3+BIMBTbidw9/MGSCk0xpHMVJ7lANs+ESlVWpi/nf1jYPPYHgQ8E9/UoAqBTWyEO0/kCgYA7bgPXs34i0RoroEr4URjEWxde5nLAezgXt+Q2V7kxIqOw5AgrCL6P+zsinpo3ujemTP7J3O42JabgNDHrqY+oeOX17IK37wXf4Cm50mM9sIArwAE2m1Ll+Hg+5yU4WhDttBd0W41ysfK4U2egbrZKuR2ZOiFC/ujMahGBlrsl8Q==', 'WZPtnpLDeYqmui+6N9u7CIuVFJoejldAh1zHRcYPsqT5Yd9MbGbLYGyDF0C2zMr1i1C+WVStO3T2MTBYnQJBAJlS/srv9s4LuVUIVL4oLaeoaJSnBNPIo5+wmaPvs3NwysDirRd9qBW9bxLJkASpP8j9BxkVYx+OiwZHhDrNogU=', '6f348ad78a4ff994eec7e61968f825ca4afda351', '2022-09-23 14:06:50', '2022-10-23 22:00:00', NULL, NULL),
(55559, 1, 'client', 'DE', 'Saxony', 'Chemnitz', 'Fraunhofer Society ', 'IWU', NULL, NULL, 'Kg+lxudFYCXY4pdeQc289YNW2FGoNhgQlh16BZOnue+4+iChw3qu01gMih4eLtvhKtrFhdtvVSW5weRRACs7gtKpJJaxJkhF81kbmVjRH2okfa2tWycVHT0YhE1o9PnPjRQAxClSCalfT+P6xniVt5WRTUMz2UbHb7cjaEECgYBcn0xZUwCAc7q/yVURole8YStK1rtNKQ4wOqcJxc3Y3oGxNC63WEUwUBiiRrXWKxU7/vJd99t7BG3nkJF2FDe5OMaN5LckZoBXCjg+QHIocdbnXl0jrQl/uzH1tTFC+dzzkg/jR7GBARrRyyD8KLmUxSnajdJ2cnTodL6pOn6Zow==', 'dOrOiU/uD/HIQD1yiTJMt7XoVU2vgfPrXvwlCGrI90fmTtjpt/vCe2zlYWEFp/yE+Ede+YN0d09dNY9IWJUCQDbvXYmeFdc/WyEJAyKo6lXFErB8rVYGyZ4hkFPP6FFwJEBAOvtfLe1KxFW/+pvd9eYxdFUlG27ERPwC83zOFYc=', '', '2022-09-24 07:02:51', '2022-10-24 22:00:00', NULL, NULL);

--
-- Triggers `sdpid`
--
DELIMITER $$
CREATE TRIGGER `sdpid_after_delete` AFTER DELETE ON `sdpid` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'sdpid',
        event = 'delete';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sdpid_after_update` AFTER UPDATE ON `sdpid` FOR EACH ROW BEGIN
IF OLD.user_id != NEW.user_id OR
   OLD.valid != NEW.valid THEN
    INSERT INTO refresh_trigger
    SET table_name = 'sdpid',
        event = 'update';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sdpid_service`
--

CREATE TABLE `sdpid_service` (
  `id` int(11) NOT NULL,
  `sdpid` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `sdpid_service`
--

INSERT INTO `sdpid_service` (`id`, `sdpid`, `service_id`) VALUES
(11, 55558, 6),
(12, 55558, 7),
(13, 55558, 8),
(14, 55558, 9),
(15, 55559, 8);

--
-- Triggers `sdpid_service`
--
DELIMITER $$
CREATE TRIGGER `sdpid_service_after_delete` AFTER DELETE ON `sdpid_service` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'sdpid_service',
        event = 'delete';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sdpid_service_after_insert` AFTER INSERT ON `sdpid_service` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'sdpid_service',
        event = 'insert';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sdpid_service_after_update` AFTER UPDATE ON `sdpid_service` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'sdpid_service',
        event = 'update';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `name` varchar(1024) COLLATE utf8_bin NOT NULL,
  `description` varchar(4096) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `name`, `description`) VALUES
(6, 'controller', 'SDP Controller'),
(7, 'web-server-7000', 'Python Web Server running at port 7000'),
(8, 'web-server-8000\r\n', 'Python Web Server running at port 8000'),
(9, 'web-server-9000', 'Python Web Server running at port 9000');

--
-- Triggers `service`
--
DELIMITER $$
CREATE TRIGGER `service_after_delete` AFTER DELETE ON `service` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'service',
        event = 'delete';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `service_gateway`
--

CREATE TABLE `service_gateway` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `gateway_sdpid` int(11) NOT NULL,
  `protocol` tinytext COLLATE utf8_bin NOT NULL COMMENT 'TCP, UDP',
  `port` int(10) UNSIGNED NOT NULL,
  `nat_ip` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '1.1.1.1   internal IP address',
  `nat_port` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `service_gateway`
--

INSERT INTO `service_gateway` (`id`, `service_id`, `gateway_sdpid`, `protocol`, `port`, `nat_ip`, `nat_port`) VALUES
(5, 6, 55557, 'TCP', 5000, '', 0),
(6, 7, 55557, 'TCP', 7000, '', 0),
(7, 8, 55557, 'TCP', 8000, '172.16.31.121', 8000),
(8, 9, 55557, 'TCP', 9000, '', 0);

--
-- Triggers `service_gateway`
--
DELIMITER $$
CREATE TRIGGER `service_gateway_after_delete` AFTER DELETE ON `service_gateway` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'service_gateway',
        event = 'delete';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `service_gateway_after_insert` AFTER INSERT ON `service_gateway` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'service_gateway',
        event = 'insert';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `service_gateway_after_update` AFTER UPDATE ON `service_gateway` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'service_gateway',
        event = 'update';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `last_name` varchar(128) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(128) COLLATE utf8_bin NOT NULL,
  `country` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `locality` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `org` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `org_unit` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `alt_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `last_name`, `first_name`, `country`, `state`, `locality`, `org`, `org_unit`, `alt_name`, `email`) VALUES
(3, 'Doe', 'John', 'DE', 'Saxony', 'Chemnitz', 'TU Chemnitz', 'Informatik', NULL, ''),
(4, 'Max', 'Mustermann', 'DE', 'Saxony', 'Chemnitz', 'TU Chemnitz', 'Informatik', NULL, '');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `user_after_delete` AFTER DELETE ON `user` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'user',
        event = 'delete';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`id`, `user_id`, `group_id`) VALUES
(2, 3, 2);

--
-- Triggers `user_group`
--
DELIMITER $$
CREATE TRIGGER `user_group_after_delete` AFTER DELETE ON `user_group` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'user_group',
        event = 'delete';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_group_after_insert` AFTER INSERT ON `user_group` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'user_group',
        event = 'insert';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_group_after_update` AFTER UPDATE ON `user_group` FOR EACH ROW BEGIN
    INSERT INTO refresh_trigger
    SET table_name = 'user_group',
        event = 'update';
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `closed_connection`
--
ALTER TABLE `closed_connection`
  ADD PRIMARY KEY (`gateway_sdpid`,`client_sdpid`,`start_timestamp`,`source_port`),
  ADD KEY `gateway_sdpid` (`gateway_sdpid`),
  ADD KEY `client_sdpid` (`client_sdpid`);

--
-- Indexes for table `controller`
--
ALTER TABLE `controller`
  ADD PRIMARY KEY (`sdpid`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `gateway_sdpid` (`gateway_sdpid`);

--
-- Indexes for table `environment`
--
ALTER TABLE `environment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway`
--
ALTER TABLE `gateway`
  ADD PRIMARY KEY (`sdpid`);

--
-- Indexes for table `gateway_controller`
--
ALTER TABLE `gateway_controller`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gateway_sdpid` (`gateway_sdpid`),
  ADD KEY `controller_sdpid` (`controller_sdpid`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_service`
--
ALTER TABLE `group_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `mqtt_topics`
--
ALTER TABLE `mqtt_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mqtt_topics_user`
--
ALTER TABLE `mqtt_topics_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `open_connection`
--
ALTER TABLE `open_connection`
  ADD PRIMARY KEY (`gateway_controller_connection_id`,`client_sdpid`,`start_timestamp`,`source_port`),
  ADD KEY `gateway_sdpid` (`gateway_sdpid`),
  ADD KEY `client_sdpid` (`client_sdpid`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `refresh_trigger`
--
ALTER TABLE `refresh_trigger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sdpid`
--
ALTER TABLE `sdpid`
  ADD PRIMARY KEY (`sdpid`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `environment_id` (`environment_id`);

--
-- Indexes for table `sdpid_service`
--
ALTER TABLE `sdpid_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `sdpid` (`sdpid`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_gateway`
--
ALTER TABLE `service_gateway`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `gateway_sdpid` (`gateway_sdpid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `group_id` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `environment`
--
ALTER TABLE `environment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateway_controller`
--
ALTER TABLE `gateway_controller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_service`
--
ALTER TABLE `group_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mqtt_topics`
--
ALTER TABLE `mqtt_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mqtt_topics_user`
--
ALTER TABLE `mqtt_topics_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `refresh_trigger`
--
ALTER TABLE `refresh_trigger`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `sdpid`
--
ALTER TABLE `sdpid`
  MODIFY `sdpid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55560;

--
-- AUTO_INCREMENT for table `sdpid_service`
--
ALTER TABLE `sdpid_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `service_gateway`
--
ALTER TABLE `service_gateway`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `closed_connection`
--
ALTER TABLE `closed_connection`
  ADD CONSTRAINT `closed_connection_ibfk_1` FOREIGN KEY (`gateway_sdpid`) REFERENCES `sdpid` (`sdpid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `closed_connection_ibfk_2` FOREIGN KEY (`client_sdpid`) REFERENCES `sdpid` (`sdpid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `controller`
--
ALTER TABLE `controller`
  ADD CONSTRAINT `controller_ibfk_1` FOREIGN KEY (`sdpid`) REFERENCES `sdpid` (`sdpid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `controller_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `controller_ibfk_3` FOREIGN KEY (`gateway_sdpid`) REFERENCES `sdpid` (`sdpid`) ON UPDATE CASCADE;

--
-- Constraints for table `gateway`
--
ALTER TABLE `gateway`
  ADD CONSTRAINT `gateway_ibfk_1` FOREIGN KEY (`sdpid`) REFERENCES `sdpid` (`sdpid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gateway_controller`
--
ALTER TABLE `gateway_controller`
  ADD CONSTRAINT `gateway_controller_ibfk_1` FOREIGN KEY (`gateway_sdpid`) REFERENCES `sdpid` (`sdpid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gateway_controller_ibfk_2` FOREIGN KEY (`controller_sdpid`) REFERENCES `sdpid` (`sdpid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_service`
--
ALTER TABLE `group_service`
  ADD CONSTRAINT `group_service_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `group_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `open_connection`
--
ALTER TABLE `open_connection`
  ADD CONSTRAINT `open_connection_ibfk_1` FOREIGN KEY (`gateway_sdpid`) REFERENCES `sdpid` (`sdpid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `open_connection_ibfk_2` FOREIGN KEY (`client_sdpid`) REFERENCES `sdpid` (`sdpid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `open_connection_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sdpid`
--
ALTER TABLE `sdpid`
  ADD CONSTRAINT `sdpid_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sdpid_ibfk_2` FOREIGN KEY (`environment_id`) REFERENCES `environment` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `sdpid_service`
--
ALTER TABLE `sdpid_service`
  ADD CONSTRAINT `sdpid_service_ibfk_1` FOREIGN KEY (`sdpid`) REFERENCES `sdpid` (`sdpid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sdpid_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service_gateway`
--
ALTER TABLE `service_gateway`
  ADD CONSTRAINT `service_gateway_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `service_gateway_ibfk_2` FOREIGN KEY (`gateway_sdpid`) REFERENCES `sdpid` (`sdpid`) ON UPDATE CASCADE;

--
-- Constraints for table `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `user_group_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
