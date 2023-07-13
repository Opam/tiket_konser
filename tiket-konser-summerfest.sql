-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2023 at 02:50 AM
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
-- Database: `tiket-konser-summerfest`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `kdAdmin` int(3) NOT NULL,
  `Nama_Admin` varchar(50) NOT NULL,
  `No_Telp` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`kdAdmin`, `Nama_Admin`, `No_Telp`) VALUES
(2, 'Hakim', '082324399096'),
(45645, 'Opaam', '065756754'),
(20500043, 'Zeen', '0896546478964');

-- --------------------------------------------------------

--
-- Table structure for table `mtd_bayar`
--

CREATE TABLE `mtd_bayar` (
  `kdPembayaran` int(3) NOT NULL,
  `Metode_Pembayaran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mtd_bayar`
--

INSERT INTO `mtd_bayar` (`kdPembayaran`, `Metode_Pembayaran`) VALUES
(1, 'LinkAja');

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `kdTiket` int(4) NOT NULL,
  `Nama_Tiket` varchar(50) NOT NULL,
  `Harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tiket`
--

INSERT INTO `tiket` (`kdTiket`, `Nama_Tiket`, `Harga`) VALUES
(123, 'Jogja Tour VIP - 50K', 50000),
(124, 'Solo Tour VIP - 50K', 50000),
(125, 'Semarang Tour VIP - 50K', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `kdTransaksi` varchar(10) NOT NULL,
  `Nama_Peserta` varchar(50) NOT NULL,
  `admin` int(3) NOT NULL,
  `tiket` int(4) NOT NULL,
  `mtd_bayar` int(3) NOT NULL,
  `Uang_Bayar` int(10) NOT NULL,
  `Kembalian` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`kdTransaksi`, `Nama_Peserta`, `admin`, `tiket`, `mtd_bayar`, `Uang_Bayar`, `Kembalian`) VALUES
('234324', 'Razina', 45645, 45645, 54645, 456, 456),
('34534534', 'Taki', 2, 3242, 23423, 1000000, 50000),
('4535', 'Razin', 2, 145645, 1546456, 1456456, 1546456);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`kdAdmin`);

--
-- Indexes for table `mtd_bayar`
--
ALTER TABLE `mtd_bayar`
  ADD PRIMARY KEY (`kdPembayaran`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`kdTiket`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kdTransaksi`),
  ADD KEY `admin` (`admin`),
  ADD KEY `mtd_bayar` (`mtd_bayar`),
  ADD KEY `tiket` (`tiket`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `admin` (`kdAdmin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
