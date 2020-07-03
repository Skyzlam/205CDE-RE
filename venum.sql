-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 04, 2020 at 04:31 AM
-- Server version: 5.7.30-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `venum`
--

-- --------------------------------------------------------

--
-- Table structure for table `clothes`
--

CREATE TABLE `clothes` (
  `clothes_ID` int(8) NOT NULL,
  `clothes_Name` varchar(20) NOT NULL,
  `clothes_Price` int(8) NOT NULL,
  `clothes_Sizes` varchar(1) NOT NULL,
  `clothes_Info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clothes`
--

INSERT INTO `clothes` (`clothes_ID`, `clothes_Name`, `clothes_Price`, `clothes_Sizes`, `clothes_Info`) VALUES
(1, 'Yellow clothe', 200, 'S', 'Yellow clothe'),
(2, 'Red clothe', 150, 'S', 'Red clothe'),
(3, 'Black clothe', 200, 'M', 'Black clothe'),
(4, 'Navy Blue clothe', 225, 'M', 'Navy Blue clothe'),
(5, 'Pink clothe', 175, 'S', 'Pink clothe');

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `user_ID` int(10) NOT NULL,
  `user_Name` varchar(50) NOT NULL,
  `user_Email` varchar(20) NOT NULL,
  `user_Phone` int(8) NOT NULL,
  `user_Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`user_ID`, `user_Name`, `user_Email`, `user_Phone`, `user_Password`) VALUES
(1, 'Tom', 'tom@gmail.com', 12345678, '12345678'),
(2, 'Mary', 'mary@gmail.com', 87654321, '87654321'),
(3, 'OOO', 'ooo@ooo.com', 55555555, '12344556'),
(4, 'test', 'test@test.com', 88889999, '56781234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clothes`
--
ALTER TABLE `clothes`
  ADD PRIMARY KEY (`clothes_ID`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`user_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clothes`
--
ALTER TABLE `clothes`
  MODIFY `clothes_ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `user_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
