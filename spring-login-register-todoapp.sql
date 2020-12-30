-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2020 at 02:31 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spring-login-register-todoapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `id` bigint(20) NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id`, `title`, `description`) VALUES
(1, 'ccccccccccc', 'cccccccccccccc'),
(3, 'a', 'a'),
(4, 'hello', 'world'),
(5, 'sadf', 'asdf'),
(6, 'forum', 'forum'),
(10, 'new', 'new');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'ditya_jelita971', 'ditya_jelita971@gmail.co.id', '123456', 'admin'),
(2, 'arkadewi_waskita763', 'arkadewi_waskita763@zoho.com', '123456', 'admin'),
(3, 'wijaya.pranawa178', 'wijaya.pranawa178@tutamail.com', '123456', 'admin'),
(4, 'danurdaragayatri497', 'danurdaragayatri497@zoho.com', '123456', 'admin'),
(5, 'arief.santoso390', 'arief.santoso390@tutanota.com', '123456', 'admin'),
(6, 'hadi_pradigta906', 'hadi_pradigta906@tutamail.com', '123456', 'admin'),
(7, 'teja.bajradaka914', 'teja.bajradaka914@zoho.com', '123456', 'admin'),
(8, 'ulung.brawijaya150', 'ulung.brawijaya150@aim.com', '123456', 'admin'),
(9, 'nawa.lestari533', 'nawa.lestari533@aim.com', '123456', 'admin'),
(10, 'rahardian__tohpati297', 'rahardian__tohpati297@protonmail.com', '123456', 'admin'),
(11, 'ariefbamantara163', 'ariefbamantara163@protonmail.ch', '123456', 'admin'),
(12, 'gibran.ganendra567', 'gibran.ganendra567@icloud.com', '123456', 'admin'),
(13, 'rama_arjanta645', 'rama_arjanta645@gmail.com', '123456', 'admin'),
(14, 'intannarasnama224', 'intannarasnama224@protonmail.ch', '123456', 'admin'),
(15, 'janu_cipta691', 'janu_cipta691@aol.com', '123456', 'admin'),
(16, 'abyasa_gadhing533', 'abyasa_gadhing533@yandex.com', '123456', 'admin'),
(17, 'adhi.sudiro517', 'adhi.sudiro517@yandex.com', '123456', 'admin'),
(18, 'widia.listia669', 'widia.listia669@protonmail.ch', '123456', 'admin'),
(19, 'sudirocandra9', 'sudirocandra9@gmail.co.id', '123456', 'admin'),
(20, 'gumelar__raditya332', 'gumelar__raditya332@aim.com', '123456', 'admin'),
(21, 'sudiro__tulus6', 'sudiro__tulus6@keemail.me', '123456', 'admin'),
(22, 'nadindra_april217', 'nadindra_april217@tutamail.com', '123456', 'admin'),
(23, 'gempita.permata767', 'gempita.permata767@keemail.me', '123456', 'admin'),
(24, 'bagasdirga427', 'bagasdirga427@gmail.co.id', '123456', 'admin'),
(25, 'tohpati.teja946', 'tohpati.teja946@tutamail.com', '123456', 'admin'),
(26, 'april__wuri352', 'april__wuri352@outlook.com', '123456', 'admin'),
(27, 'madaharsa.ditya668', 'madaharsa.ditya668@tutanota.com', '123456', 'admin'),
(28, 'rani_ningrum246', 'rani_ningrum246@yahoo.com', '123456', 'admin'),
(29, 'wangi_jenar107', 'wangi_jenar107@facebook.com', '123456', 'admin'),
(30, 'wulanairani892', 'wulanairani892@yahoo.com', '123456', 'admin'),
(31, 'ihsan_mahadri525', 'ihsan_mahadri525@tutanota.de', '123456', 'admin'),
(32, 'samudra_budiono248', 'samudra_budiono248@aol.com', '123456', 'admin'),
(33, 'banurasmi__ratih816', 'banurasmi__ratih816@tutanota.de', '123456', 'admin'),
(34, 'gilanggunawan351', 'gilanggunawan351@keemail.me', '123456', 'admin'),
(35, 'cakraabimana680', 'cakraabimana680@facebook.com', '123456', 'admin'),
(36, 'maya__citra879', 'maya__citra879@tutanota.de', '123456', 'admin'),
(37, 'aswangga__haris727', 'aswangga__haris727@tutamail.com', '123456', 'admin'),
(38, 'ayudisha.widi234', 'ayudisha.widi234@protonmail.ch', '123456', 'admin'),
(39, 'maktikagantari468', 'maktikagantari468@zoho.com', '123456', 'admin'),
(40, 'gunawan.hakim807', 'gunawan.hakim807@tutanota.de', '123456', 'admin'),
(41, 'hasya_padmana971', 'hasya_padmana971@gmail.co.id', '123456', 'admin'),
(42, 'santoso_raharja583', 'santoso_raharja583@icloud.com', '123456', 'admin'),
(43, 'daniswara__handaru70', 'daniswara__handaru70@yahoo.co.id', '123456', 'admin'),
(44, 'buana.gentala202', 'buana.gentala202@outlook.com', '123456', 'admin'),
(45, 'manika.anjani350', 'manika.anjani350@tutamail.com', '123456', 'admin'),
(46, 'nirmala__kana544', 'nirmala__kana544@yandex.com', '123456', 'admin'),
(47, 'ganendra_siswanto263', 'ganendra_siswanto263@tutanota.com', '123456', 'admin'),
(48, 'banyu.widayaka243', 'banyu.widayaka243@protonmail.ch', '123456', 'admin'),
(49, 'ulung.tohpati912', 'ulung.tohpati912@keemail.me', '123456', 'admin'),
(50, 'rudiganendra141', 'rudiganendra141@gmail.com', '123456', 'admin'),
(51, 'hardana.rangga486', 'hardana.rangga486@stikom.ac.id', '123456', 'admin'),
(52, 'respatiastaguna382', 'respatiastaguna382@tutanota.de', '123456', 'admin'),
(53, 'kasihisthika404', 'kasihisthika404@icloud.com', '123456', 'admin'),
(54, 'tohpati__abyasa501', 'tohpati__abyasa501@outlook.com', '123456', 'admin'),
(55, 'herdian__buana447', 'herdian__buana447@tutanota.com', '123456', 'admin'),
(56, 'adinata__jatmika657', 'adinata__jatmika657@tuta.io', '123456', 'admin'),
(57, 'kamandaka.lakeswara646', 'kamandaka.lakeswara646@facebook.com', '123456', 'admin'),
(58, 'tri.swasti994', 'tri.swasti994@tutanota.de', '123456', 'admin'),
(59, 'widuri.mirtra914', 'widuri.mirtra914@yahoo.com', '123456', 'admin'),
(60, 'kahyang.paramita637', 'kahyang.paramita637@lycos.com', '123456', 'admin'),
(61, 'hasya.saraswati670', 'hasya.saraswati670@tutanota.com', '123456', 'admin'),
(62, 'hanafirangga82', 'hanafirangga82@stikom.ac.id', '123456', 'admin'),
(63, 'aradhana.henry147', 'aradhana.henry147@tutamail.com', '123456', 'admin'),
(64, 'kasyaira_lestari859', 'kasyaira_lestari859@aim.com', '123456', 'admin'),
(65, 'ganendradarsa227', 'ganendradarsa227@stikom.ac.id', '123456', 'admin'),
(66, 'surya__aji900', 'surya__aji900@keemail.me', '123456', 'admin'),
(67, 'aradhana_halim457', 'aradhana_halim457@zoho.com', '123456', 'admin'),
(68, 'kemala__karmika341', 'kemala__karmika341@protonmail.ch', '123456', 'admin'),
(69, 'dianti.rahmi970', 'dianti.rahmi970@lycos.com', '123456', 'admin'),
(70, 'madaharsa__wangi725', 'madaharsa__wangi725@tuta.io', '123456', 'admin'),
(71, 'brahmajiwa83', 'brahmajiwa83@yahoo.co.id', '123456', 'admin'),
(72, 'lika.limar681', 'lika.limar681@gmail.co.id', '123456', 'admin'),
(73, 'narasnamalaksita952', 'narasnamalaksita952@stikom.ac.id', '123456', 'admin'),
(74, 'langitbisma354', 'langitbisma354@tutamail.com', '123456', 'admin'),
(75, 'jiwa__satria213', 'jiwa__satria213@outlook.com', '123456', 'admin'),
(76, 'prasetyo__apta699', 'prasetyo__apta699@zoho.com', '123456', 'admin'),
(77, 'tulus.ricky64', 'tulus.ricky64@keemail.me', '123456', 'admin'),
(78, 'sucibatari303', 'sucibatari303@facebook.com', '123456', 'admin'),
(79, 'yuni__kasih673', 'yuni__kasih673@gmail.co.id', '123456', 'admin'),
(80, 'kiranasuci678', 'kiranasuci678@aim.com', '123456', 'admin'),
(81, 'herdian__budiono470', 'herdian__budiono470@tuta.io', '123456', 'admin'),
(82, 'istari__kani581', 'istari__kani581@tuta.io', '123456', 'admin'),
(83, 'sudiro_kresna775', 'sudiro_kresna775@stikom.ac.id', '123456', 'admin'),
(84, 'wangimadarsana630', 'wangimadarsana630@tuta.io', '123456', 'admin'),
(85, 'cakrawalabajradaka411', 'cakrawalabajradaka411@yandex.com', '123456', 'admin'),
(86, 'gusti__jenaka858', 'gusti__jenaka858@gmail.com', '123456', 'admin'),
(87, 'bulan_mada255', 'bulan_mada255@icloud.com', '123456', 'admin'),
(88, 'jokokala250', 'jokokala250@yahoo.co.id', '123456', 'admin'),
(89, 'kamajaya.adiwangsa787', 'kamajaya.adiwangsa787@icloud.com', '123456', 'admin'),
(90, 'aruna_rosa400', 'aruna_rosa400@yahoo.co.id', '123456', 'admin'),
(91, 'admin', 'naufalsugiarto832@tutanota.com', '123456', 'admin'),
(92, 'tokohp', 'tokohp90@gmail.com', '12345678', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
