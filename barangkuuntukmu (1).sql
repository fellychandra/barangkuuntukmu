-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Jul 2022 pada 11.03
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barangkuuntukmu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kodebarang` int(11) NOT NULL,
  `namabarang` varchar(100) NOT NULL,
  `jumlah` varchar(5) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id` int(11) NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kodebarang`, `namabarang`, `jumlah`, `deskripsi`, `email`, `id`, `gambar`) VALUES
(15, 'Meja', '0', 'BAGUS', 'admin@gmail.com', 3, 'bg1.jpg'),
(18, '11', '7', '11', '12@gmail.com', 2, 'Logoadmin1.png'),
(19, 'Meja', '8', 'BAGUS', 'admin@gmail.com', 3, 'MEJA.png'),
(20, 'Kursi', '0', 'Masih bagus', 'admin@gmail.com', 3, 'LOGO12.png'),
(26, 'Sofa', '10', 'Masih bagus', 'admin@gmail.com', 3, 'SOFA.jpg'),
(28, 'Buku Pelajaran', '2', 'Pelajaran IPA', 'admin@gmail.com', 3, 'IPA.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `berikan`
--

CREATE TABLE `berikan` (
  `id` int(11) NOT NULL,
  `kodebarang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `idpeminta` int(11) NOT NULL,
  `idpemilik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `berikan`
--

INSERT INTO `berikan` (`id`, `kodebarang`, `jumlah`, `idpeminta`, `idpemilik`) VALUES
(12, 18, 1, 7, 3),
(13, 18, 1, 7, 2),
(14, 18, 1, 7, 2),
(22, 18, 1, 7, 2),
(23, 18, 1, 1, 2),
(26, 18, 1, 8, 2),
(27, 19, 1, 6, 3),
(28, 18, 1, 6, 2),
(29, 20, 1, 6, 3),
(30, 19, 1, 6, 3),
(31, 28, 1, 7, 3),
(32, 26, 1, 7, 3),
(33, 28, 1, 7, 3);

--
-- Trigger `berikan`
--
DELIMITER $$
CREATE TRIGGER `hapusstok` AFTER INSERT ON `berikan` FOR EACH ROW BEGIN
UPDATE barang set jumlah= jumlah- NEW.jumlah WHERE kodebarang = NEW.kodebarang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int(11) NOT NULL,
  `kodebarang` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `iduser` int(11) NOT NULL,
  `iduserpemilik` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `emailpemilik` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`id`, `kodebarang`, `email`, `iduser`, `iduserpemilik`, `jumlah`, `emailpemilik`) VALUES
(37, 18, 'fellychndr@gmail.com', 6, 2, 1, '12@gmail.com'),
(39, 18, 'fellychndr@gmail.com', 6, 2, 1, '12@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`iduser`, `email`, `nama`, `alamat`, `notelp`, `password`, `gambar`, `role`) VALUES
(1, '1234@gmail.com', '1234', 'Jalan senang hati', '6287867346064', '$2y$10$caK/hFqQ1P18MYUVfKW.1uvEQwHJ2eNVs4F3ilhu46Hihw9dLuNs2', 'default.jpg', 'Pemilik'),
(2, '12@gmail.com', 'fellyc', '12345', '12345', '$2y$10$UbYxWaKguOAMEQ7iyruYyuyrFkAyyPuuZvkIWf8MSZuDjgIAlx2.6', 'default.jpg', 'Pemilik'),
(3, 'admin@gmail.com', 'Felly Chandra', 'Kp Senag Hati', '6287795356681', '$2y$10$ItZ6xi19/v7jOGeFMwasq.hvYRtHLstNwYyDthQ2nXItVWeXAie9u', 'SAD.jpg', 'Pemilik'),
(4, 'baru@gmail.com', 'Baru', 'kp senang hati', '6287795356681', '$2y$10$Cmqv0y6p5pFesYYNnLaO5ewF4WZ2qzGKJ7lIiZTX5T4WHtLMXwAeq', 'default.jpg', 'Pemilik'),
(5, 'fellychndr1@gmail.com', 'Felly Chandra', 'Jalan senang hati', '6287867346064', '$2y$10$kA50c1Ulwc3NyciDMXpLTe6dgVMlpHgvPqcgmi2z39TXh8OJw88dK', 'default.jpg', 'Pemilik'),
(6, 'fellychndr@gmail.com', 'Fellychndraaa', 'Jalan senang hati', '6287867346064', '$2y$10$/Qn7xCJoz/P41V0FSmdAIu6ymePueox.St1bfVviAY9FmIdyZzRmK', 'dl_beatsnoop_com-high-db98921e50cc055a33.jpg', 'User'),
(7, 'tika@gmail.com', 'Tika', 'Maton', '6282384426170', '$2y$10$huHFxNexoXPz5NlDsU/HTOrT8NLUop4WSVdrEmGU3kC0nMJsVjYhW', 'default.jpg', 'User'),
(8, 'felly@gmail.com', 'Felly Chandra', 'jjjj', '6287795366681', '$2y$10$4gnfWCFb65BDF0X1U0Ws0OVi6pukq1aCbwWWF5vjw87oHiiqGGOCG', 'default.jpg', 'User');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kodebarang`),
  ADD KEY `userbarang` (`id`);

--
-- Indeks untuk tabel `berikan`
--
ALTER TABLE `berikan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `berikandata` (`idpeminta`),
  ADD KEY `punyadata` (`idpemilik`),
  ADD KEY `databarang` (`kodebarang`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userminta` (`iduser`),
  ADD KEY `userpunya` (`iduserpemilik`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `kodebarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `berikan`
--
ALTER TABLE `berikan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `userbarang` FOREIGN KEY (`id`) REFERENCES `user` (`iduser`);

--
-- Ketidakleluasaan untuk tabel `berikan`
--
ALTER TABLE `berikan`
  ADD CONSTRAINT `berikandata` FOREIGN KEY (`idpeminta`) REFERENCES `user` (`iduser`),
  ADD CONSTRAINT `databarang` FOREIGN KEY (`kodebarang`) REFERENCES `barang` (`kodebarang`),
  ADD CONSTRAINT `punyadata` FOREIGN KEY (`idpemilik`) REFERENCES `user` (`iduser`);

--
-- Ketidakleluasaan untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `userminta` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`),
  ADD CONSTRAINT `userpunya` FOREIGN KEY (`iduserpemilik`) REFERENCES `user` (`iduser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
