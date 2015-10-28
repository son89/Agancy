
-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2015 at 05:37 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `src-agancy`
--

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE IF NOT EXISTS `driver` (
`d-id` int(10) NOT NULL,
  `d-name` varchar(30) COLLATE utf8_persian_ci DEFAULT NULL,
  `d-family` varchar(30) COLLATE utf8_persian_ci DEFAULT NULL,
  `d-code` int(10) DEFAULT NULL,
  `d-dateregister` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `d-mobile` varchar(11) COLLATE utf8_persian_ci DEFAULT NULL,
  `d-phone` varchar(11) COLLATE utf8_persian_ci DEFAULT NULL,
  `d-address` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `d-m-id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `machine`
--

CREATE TABLE IF NOT EXISTS `machine` (
`m-id` int(5) NOT NULL,
  `m-d-id` int(10) DEFAULT NULL,
  `m-modelandname` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `passer-by`
--

CREATE TABLE IF NOT EXISTS `passer-by` (
`p-id` int(10) NOT NULL,
  `pa-phone` varchar(11) COLLATE utf8_persian_ci DEFAULT NULL,
  `pa-source` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `pa-destination` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `pa-price` decimal(10,0) NOT NULL,
  `pa-dateregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pa-d-id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `servics`
--

CREATE TABLE IF NOT EXISTS `servics` (
`s-id` int(10) NOT NULL,
  `s-destination` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `s-dateregister` timestamp NULL DEFAULT NULL,
  `s-price` decimal(10,0) DEFAULT NULL,
  `d-id` int(11) NOT NULL,
  `pa-id` int(11) NOT NULL,
  `tr-id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=1 ;

--
-- RELATIONS FOR TABLE `servics`:
--   `d-id`
--       `driver` -> `d-id`
--   `pa-id`
--       `passer-by` -> `p-id`
--   `tr-id`
--       `travelers` -> `t-id`
--

-- --------------------------------------------------------

--
-- Table structure for table `travelers`
--

CREATE TABLE IF NOT EXISTS `travelers` (
`t-id` int(5) NOT NULL COMMENT 'this is a primary key, auto increment ',
  `t-name` varchar(30) COLLATE utf8_persian_ci DEFAULT NULL,
  `t-family` varchar(30) COLLATE utf8_persian_ci DEFAULT NULL,
  `t-phone` varchar(11) COLLATE utf8_persian_ci DEFAULT NULL,
  `t-mobile` varchar(11) COLLATE utf8_persian_ci NOT NULL,
  `t-address` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `t-gender` bit(1) DEFAULT NULL,
  `t-dateregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
 ADD PRIMARY KEY (`d-id`);

--
-- Indexes for table `machine`
--
ALTER TABLE `machine`
 ADD PRIMARY KEY (`m-id`);

--
-- Indexes for table `passer-by`
--
ALTER TABLE `passer-by`
 ADD PRIMARY KEY (`p-id`);

--
-- Indexes for table `servics`
--
ALTER TABLE `servics`
 ADD PRIMARY KEY (`s-id`), ADD KEY `d-id` (`d-id`), ADD KEY `fk_tr_srv` (`tr-id`), ADD KEY `fk_pa_srv` (`pa-id`);

--
-- Indexes for table `travelers`
--
ALTER TABLE `travelers`
 ADD PRIMARY KEY (`t-id`), ADD UNIQUE KEY `t-phone` (`t-phone`,`t-mobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
MODIFY `d-id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `machine`
--
ALTER TABLE `machine`
MODIFY `m-id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `passer-by`
--
ALTER TABLE `passer-by`
MODIFY `p-id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `servics`
--
ALTER TABLE `servics`
MODIFY `s-id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `travelers`
--
ALTER TABLE `travelers`
MODIFY `t-id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'this is a primary key, auto increment ';
--
-- Constraints for dumped tables
--

--
-- Constraints for table `servics`
--
ALTER TABLE `servics`
ADD CONSTRAINT `fk_driver_srv` FOREIGN KEY (`d-id`) REFERENCES `driver` (`d-id`),
ADD CONSTRAINT `fk_pa_srv` FOREIGN KEY (`pa-id`) REFERENCES `passer-by` (`p-id`),
ADD CONSTRAINT `fk_tr_srv` FOREIGN KEY (`tr-id`) REFERENCES `travelers` (`t-id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
