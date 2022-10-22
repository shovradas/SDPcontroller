-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 13, 2022 at 09:16 PM
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
(56, '2022-09-11 19:16:17', 'group_service', 'insert');

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
(55557, 1, 'gateway', 'DE', 'Saxony', 'Chemnitz', 'TU Chemnitz', 'Informatik', NULL, NULL, 'ZF04tRSDW7qfQoKU34IYb9Slf2JwBS61cluq2QAnd6HehW0tubtXQA0jmU4RoUEffzATUCtjJu3QWJk5VBxTX99MhsWIy7HnAR+PqVf9Q1fekd0E6IcnCXFv1NhTYJF2wMcPWdIMVcpYfplhOUmA1P6aXBtUnScdKqVBBWECgYAXpFq47y8he2yon7Tzzih+pgt9Xw4Cyb/vAnvQQ5uxXtoBeoKvQ5fEb2MvydFaFl+0BQz4W1L+lMDxxr2/4C0y85b2IjR/sWRlVuDDGuMytthzRMVWVqgc+bJEQwIjgeZxptfNls3sUVT/7b2pcUacHGtdIV/CkMDOtH5lhCSJkQ==', 'nzNO34Mm9T2+dqbRAyW1F1ypBMpIPHJsrm86bdm4CZDi6MctSFkm34g7GH+JOMgMwal1ZYsp/czxTc4T0NECQATC26lT1zL+pnagTwHzwSqz9fmJU28wCXBn8rl2VJTyDJ7GjaLmH7BA35m7Lrz+sowfaCVlyncwaDNv2fNtt2w=', '7bf0e17ae38c36d904d0f4362063789db4be54cd', '2022-09-13 17:41:21', '2022-10-13 22:00:00', NULL, NULL),
(55558, 1, 'client', 'DE', 'Saxony', 'Chemnitz', 'TU Chemnitz', 'Informatik', NULL, NULL, 'mdAL22YXiKLf0yEpd6HLBuJPmCsxwugl/4xjtqltWmVVt5KHxn0+RZnW0hhHueSIyooEm373B5v7JAENV6+CqFM/pL/hTPm43n5PhltIskHZx++MnEoPtbKec8IbhsKyzCew1ev7IQ9k06MGJSY+2L3Yw9oNbSCKa4REkKkCgYATdJeqsyodtAOgq5tbyA31e5X4ph6iKRVMWTDJb2vTwlRZmEsFI/C3mRnyq2GoMi6Hqidwi4K9Qpk5Dq6an7bS07XAfo79D3jF4jSQ+QMOzI/YqQKkOvbSVABdbj6uiov6I9Zzy2dx2xNdTRf7Fsb4Sg6B5TpJrBuedBDlXZQb0w==', 'Zul2dz58PqrQZww8B6I+436Uxx1xSVoM3xto/Xj8Yf5gkhB8D+Zk4RSY6O/v4o+MR9Ipv7nxFjP+pnsALkkCQGnCitYzY7yunAvx+2hCB3QlOlaIfpiA17yRSHzWyPNwWXi6vhb2gVeEXzRnzvEvpJxe9ivuRHJ1ViaOXVduN1o=', '6f348ad78a4ff994eec7e61968f825ca4afda351', '2022-09-13 00:14:51', '2022-10-13 22:00:00', NULL, NULL);

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
(13, 55558, 8);

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
(7, 8, 55557, 'TCP', 8000, '', 0),
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `sdpid`
--
ALTER TABLE `sdpid`
  MODIFY `sdpid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55559;

--
-- AUTO_INCREMENT for table `sdpid_service`
--
ALTER TABLE `sdpid_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
