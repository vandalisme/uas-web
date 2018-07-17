-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2018 at 10:09 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokobuku`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Fiksi'),
(2, 'Edukasi'),
(3, 'Komputer'),
(4, 'Bisnis'),
(5, 'Komik');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesan`
--

CREATE TABLE `tb_pesan` (
  `id_pesan` int(11) NOT NULL,
  `nama_pengirim` varchar(30) NOT NULL,
  `email_pengirim` varchar(30) NOT NULL,
  `subjek` varchar(30) NOT NULL,
  `pesan` text NOT NULL,
  `tanggal_kirim` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pesan`
--

INSERT INTO `tb_pesan` (`id_pesan`, `nama_pengirim`, `email_pengirim`, `subjek`, `pesan`, `tanggal_kirim`) VALUES
(5, 'Adit', 'adit@gmail.com', 'Adit', 'Adit', '2018-04-25 06:34:43'),
(6, 'Nikko', 'nikkoeka04@gmail.com', 'Bertanya tentang buku', 'saya ingin bertanya apakah buku dilan yang ke dua sudah terbit ?', '2018-04-25 06:44:48'),
(7, 'Ivanka', 'ivanka@gmail.com', 'Mau tanya sesuatu', 'mau tanya sesuatu dong, untuk buku masak-masak udah terbit belum yaa ?', '2018-04-25 07:30:11'),
(8, 'Muhammad Rafif', 'rafif@gmail.com', 'Melamar Kerja', 'Apakah saya bisa melamar kerja sebagai admin dari web ini ?', '2018-04-25 07:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id_produk` int(11) NOT NULL,
  `nama_buku` varchar(50) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `pengarang` varchar(30) NOT NULL,
  `harga` int(11) NOT NULL,
  `image_buku` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_produk`
--

INSERT INTO `tb_produk` (`id_produk`, `nama_buku`, `id_kategori`, `pengarang`, `harga`, `image_buku`) VALUES
(1, 'Pulau Terlarang', 1, 'Vasca Vannisa', 64000, '40623-pulau-terlarang.jpg'),
(2, 'Lima Sekawan: Di Pulau Seram (Cetak Ulang 2018)', 1, 'Enid Blyton', 34000, '95626-lima-sekawan.jpg'),
(4, 'Kitab YOUTUBER', 3, 'Jubilee Enterprise', 42240, '92831-kitab-youtuber.jpg'),
(5, 'Langkah Mudah Pemrograman Android Menggunakan App ', 3, 'Abdul Kadir', 71840, '31387-android.jpg'),
(6, 'Membuat Aplikasi Bisnis Terapan dengan Ms Excel', 3, 'Jubilee Enterprise', 42240, '44192-excell.jpg'),
(7, 'Adobe InDesign Komplet', 3, 'Jubilee Enterprise', 55040, '56062-indesign.jpg'),
(8, 'Panduan Lengkap Pajak Internasional', 4, 'Drs. Chairil Anwar Pohan,M.Si,', 158400, '64552-pajak.jpg'),
(9, 'Berani Jadi Pengusaha, Sukses Usaha Dan Raih Pinja', 4, 'Thomas Arifin', 46400, '55552-berani.jpg'),
(10, 'Taktik Tokcer Kuasai Matematika SD/MI Kelas V', 2, 'Dr. IWAN KUSWIDI, M.Sc.', 88000, '74842-matematika.jpg'),
(11, 'Cerdas Berbahasa Indonesia, SMA/MA Kls XII, Kelomp', 2, 'Engkos Kosasih', 62850, '41793-bahasa.jpg'),
(12, 'Komik KKPK #6: Monster Insomnia', 5, 'Galuh Borneasakhi Aisha', 28000, '19324-komik.jpg'),
(13, 'Dilan, dia adalah dilanku tahun 1990', 1, 'Pidi Baiq', 75000, '87450-dilan.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `tanggal_transaksi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_transaksi`, `id_user`, `id_produk`, `tanggal_transaksi`) VALUES
(86145, 5, 1, '2018-04-24 17:00:00'),
(86145, 5, 9, '2018-04-24 17:00:00'),
(86145, 5, 7, '2018-04-24 17:00:00'),
(79398, 5, 5, '2018-04-24 17:00:00'),
(79398, 5, 6, '2018-04-24 17:00:00'),
(24158, 5, 10, '2018-04-24 17:00:00'),
(24158, 5, 9, '2018-04-24 17:00:00'),
(18039, 1, 1, '2018-04-24 17:00:00'),
(18039, 1, 11, '2018-04-24 17:00:00'),
(18039, 1, 12, '2018-04-24 17:00:00'),
(2259, 1, 3, '2018-04-24 17:00:00'),
(2259, 1, 10, '2018-04-24 17:00:00'),
(2259, 1, 9, '2018-04-24 17:00:00'),
(22290, 1, 9, '2018-04-24 17:00:00'),
(22290, 1, 10, '2018-04-24 17:00:00'),
(22290, 1, 6, '2018-04-24 17:00:00'),
(22290, 1, 5, '2018-04-24 17:00:00'),
(9278, 6, 12, '2018-04-24 17:00:00'),
(9278, 6, 10, '2018-04-24 17:00:00'),
(9278, 6, 13, '2018-04-24 17:00:00'),
(70655, 6, 1, '2018-04-24 17:00:00'),
(70655, 6, 12, '2018-04-24 17:00:00'),
(18683, 7, 2, '2018-04-25 07:53:36'),
(18683, 7, 12, '2018-04-25 07:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(16) NOT NULL,
  `level` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `email`, `password`, `alamat`, `no_hp`, `level`) VALUES
(1, 'Nikko Eka Saputra', 'nikkoeka04@gmail.com', 'nikko', 'Bandung', '08988190546', 'user'),
(2, '', 'admin@gmail.com', 'admin', '', '', 'admin'),
(5, 'Aditya Permana', 'adit@gmail.com', 'adit', 'Jakarta', '08988190546', 'user'),
(6, 'Ivanka Tri Agustin', 'ivanka@gmail.com', 'ivanka', 'Jakarta', '08992741488', 'user'),
(7, 'Muhammad Rafif', 'rafif@gmail.com', 'rafif', 'Bandung', 'rafif@gmail.com', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tb_pesan`
--
ALTER TABLE `tb_pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_pesan`
--
ALTER TABLE `tb_pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
