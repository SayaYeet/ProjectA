-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2024 at 12:56 PM
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
-- Database: `projecta`
--

-- --------------------------------------------------------

--
-- Table structure for table `pemimpin`
--

CREATE TABLE `pemimpin` (
  `id` int(3) NOT NULL,
  `nama_pemimpin` varchar(100) NOT NULL,
  `tahun` varchar(5) NOT NULL,
  `negara` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemimpin`
--

INSERT INTO `pemimpin` (`id`, `nama_pemimpin`, `tahun`, `negara`) VALUES
(2, 'Joseph Stalin', '1941', 'Uni Soviet'),
(3, 'Vladimir Lenin', '1917', 'Uni Soviet'),
(4, 'Hirohito', '1926', 'Kekaisaran Jepang'),
(5, 'Winston Churchill', '1940', 'Britania Raya'),
(6, 'Kaiser Wilhelm II', '1888', 'Kekaisaran Jerman'),
(7, 'Soekarno', '1950', 'Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `password`, `role`) VALUES
(1, 'admin', '0000', 1),
(3, 'admin', '4a7d1ed414474e4033ac29ccb8653d9b', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pemimpin`
--
ALTER TABLE `pemimpin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pemimpin`
--
ALTER TABLE `pemimpin`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
