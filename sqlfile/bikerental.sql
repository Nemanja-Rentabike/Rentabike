-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2021 at 07:36 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bikerental`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'nemanjazabac', '21232f297a57a5a743894a0e4a801fc3', '2021-09-09 19:16:37');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `VehicleId` int(11) DEFAULT NULL,
  `FromDate` varchar(20) DEFAULT NULL,
  `ToDate` varchar(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`id`, `userEmail`, `VehicleId`, `FromDate`, `ToDate`, `message`, `Status`, `PostingDate`) VALUES
(1, 'test@test.com', 6, '20/10/1991', '20/10/1992', 'test', 0, '2021-09-06 01:20:04'),
(2, 'guest@guest.com', 1, '12/12/2021', '13/12/2021', 'test', 0, '2021-09-06 01:21:12'),
(3, 'guest@guest.com', 1, '12/12/2021', '13/12/2021', 'test', 0, '2021-09-06 01:21:26'),
(4, 'guest@guest.com', 1, '123', '13/12/2021', 'test', 0, '2021-09-06 01:21:57'),
(5, 'test@test.com', 6, '12/12/2021', '12/12/2021', 'asd', 0, '2021-09-06 08:08:12'),
(6, 'test@test.com', 6, '12/12/2021', '12/12/2021', 'asd', 0, '2021-09-06 08:50:49'),
(7, 'test@test.com', 6, '12/12/2021', '12/12/2021', 'asd', 0, '2021-09-06 08:54:39'),
(8, 'test@test.com', 6, '12/12/2021', '12/12/2021', 'asd', 0, '2021-09-06 08:56:36'),
(9, 'test@test1.com', 2, '12/12/2021', '20/10/1992', 'asd', 1, '2021-09-07 00:09:51'),
(10, 'test@test1.com', 3, '20/10/1991', '20/10/1992', 'test', 0, '2021-09-08 23:43:54'),
(11, 'test@test1.com', 3, '12/11/2022', '20/10/2023', 'test', 0, '2021-09-08 23:44:57'),
(12, 'nikola@gmail.com', 1, '10/10/2021', '10/10/2021', 'test', 0, '2021-09-10 03:21:33'),
(13, 'nikola@gmail.com', 1, '10/11/2021', '12/11/2021', 'test', 0, '2021-09-10 03:24:51'),
(14, 'nidzo@gmail.com', 1, '10/11/2021', '12/11/2021', 'test', 1, '2021-09-10 03:26:41');

-- --------------------------------------------------------

--
-- Table structure for table `tblbrands`
--

CREATE TABLE `tblbrands` (
  `id` int(11) NOT NULL,
  `BrandName` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbrands`
--

INSERT INTO `tblbrands` (`id`, `BrandName`, `CreationDate`, `UpdationDate`) VALUES
(1, 'KTM', '2017-06-18 16:24:34', '2017-06-19 06:42:23'),
(2, 'Bajaj', '2017-06-18 16:24:50', NULL),
(3, 'Honda', '2017-06-18 16:25:03', NULL),
(4, 'Suzuki', '2017-06-18 16:25:13', NULL),
(7, 'Honda', '2021-09-09 19:21:28', NULL),
(8, 'Testing', '2021-09-09 19:24:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, 'Test Demo test demo																									', 'test@test.com', '8585233222');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(1, 'Terms and Conditions', 'terms', '<P align=justify><FONT size=2><STRONG><FONT color=#990000>This Site is provided for your personal and non-commercial use only. All content included in this Site, including but not limited to any text, graphics, images, logos, button icons, data compilations, software, audio and video (collectively, \"Materials\"), is the property of Yamaha or its content suppliers, and you may not distribute, exchange, modify, reproduce, perform, sell or transmit the Materials for any business, commercial or public purposes. The Materials are protected by applicable laws, including Japan and international copyright and trademark laws, and any unauthorized use of any Materials may violate copyright, trademark, and other applicable laws. You may not frame or utilize framing techniques to enclose any portion of this Site or any Materials without express written consent of Yamaha. You are granted a revocable and nonexclusive right to create a hyperlink to this Site so long as the link does not portray Yamaha, its affiliates, or their products or services in a false, misleading, derogatory, or otherwise offensive manner. You may not use any Yamaha logo or other Materials as part of the link without express written consent of Yamaha. If you breach any of these Terms, your authorization to use this Site automatically terminates and you must immediately destroy any downloaded or printed Materials herefrom. </FONT></P>'),
(2, 'Privacy Policy', 'privacy', '<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat</span>'),
(3, 'About Us ', 'aboutus', '<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">WE ARE THE BIKE RENTAL MANAGER. The only 100% dedicated bike rental booking website. The first Bike Rental Manager (BRM) shop was our own bike shop. Ever Since it has been our aim to make bike rental easier for everyone, everywhere.We focus on making bike rentals easier for you.Your rental business has a unique set of challenges. We are the only dedicated bike rental site and will be able to offer you a solution to match your needs.Get in touch with us today! We provide affordable bike rates, we hae lost of Satiisfied customers feedback, you can have a look at our home page too!! </span>'),
(11, 'FAQs', 'faqs', '																														<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">How do I use discounts coupons?\nExcept for promotion codes, Our discounts are applied automatically if your reservation meets any of the criteria mentioned above.\n\nTo use a promotion code, simply enter the code on the homepage widget as you start your reservation. You can do this by selecting the \"Have a promotion code?\" prompt. Promotion codes can also be entered on the checkout page, under Reservation Total. Please note that the promotion code prompt does not appear for certain types of reservations, such as reservations made on the Deals page.\n<br>\nOur Discounts Terms & Conditions\nWe no longer offer or accept returning customer discounts. All discounts are non-transferable and cannot be combined with additional promotions or discounts.</br>\n\n* Liability in case accident:\nThe hirer should have coverage through his own accident and liability insurance.\nThe renting company is not responsible under any circumstances for accidents or damages caused to the hirer or which the hirer causes to any third party or cases of liability </span>');

-- --------------------------------------------------------

--
-- Table structure for table `tbltestimonial`
--

CREATE TABLE `tbltestimonial` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `Testimonial` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltestimonial`
--

INSERT INTO `tbltestimonial` (`id`, `UserEmail`, `Testimonial`, `PostingDate`, `status`) VALUES
(1, 'test@test1.com', ' ', '2021-09-06 23:59:59', NULL),
(2, 'test@test1.com', '', '2021-09-08 20:38:31', NULL),
(3, 'test@test1.com', '', '2021-09-08 20:39:51', 1),
(4, 'test@test1.com', '', '2021-09-08 20:40:00', NULL),
(5, 'test@test1.com', '', '2021-09-08 20:40:03', NULL),
(6, 'test@test1.com', '', '2021-09-08 20:41:25', NULL),
(7, 'test@test1.com', '', '2021-09-08 20:44:31', NULL),
(8, 'test@test1.com', '', '2021-09-08 20:44:50', NULL),
(9, 'test@test1.com', '', '2021-09-08 21:05:27', NULL),
(10, 'test@test1.com', 'asdsadadasdadadadadad', '2021-09-08 19:25:42', 1),
(11, 'test@test1.com', 'asdasdasdadsadadadsadadad', '2021-09-08 19:29:35', NULL),
(12, 'test@test1.com', 'assssssssssssssssssssssssssssssss', '2021-09-08 19:30:14', NULL),
(13, 'test@test1.com', 'ssssssssssssssssssssssssssssssssssssssssss', '2021-09-08 19:31:11', NULL),
(14, 'test@test1.com', 'ssssssssssssssssssssssssssssssssssssssssss', '2021-09-08 19:31:18', NULL),
(15, 'test@test1.com', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2021-09-08 23:45:17', NULL),
(16, 'nidzo@gmail.com', 'fwawafwffwaq2125125152rwwa', '2021-09-10 03:27:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Hash` varchar(255) DEFAULT NULL,
  `status` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `dob`, `Address`, `City`, `Country`, `RegDate`, `UpdationDate`, `Hash`, `status`) VALUES
(5, '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', NULL, NULL, NULL, NULL, '2021-09-05 20:49:54', NULL, NULL, '0'),
(6, 'test', 'test@test.com', '202cb962ac59075b964b07152d234b70', 'test', '', '', '', '', '2021-09-05 20:50:32', '2021-09-06 20:48:46', NULL, '0'),
(7, 'test', 'test@test1.com', 'f5bb0c8de146c67b44babbf4e6584cc0', 'test', '12/12/1901', '', '', '', '2021-09-06 21:58:27', '2021-09-06 23:59:46', NULL, '0'),
(8, 'asd', 'asd@dsa', '202cb962ac59075b964b07152d234b70', 'sad', NULL, NULL, NULL, NULL, '2021-09-07 10:34:02', NULL, NULL, '0'),
(9, 'asd', 'asd@dsa.com', '7815696ecbf1c96e6894b779456d330e', 'asd', NULL, NULL, NULL, NULL, '2021-09-08 19:39:35', NULL, NULL, '0'),
(10, 'asd', 'asd@dddd.com', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, NULL, NULL, '2021-09-08 19:39:57', NULL, NULL, '0'),
(11, 'asd', 'asd@dddd.com', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, NULL, NULL, '2021-09-08 19:47:14', NULL, NULL, '0'),
(12, 'test', 'asd@dsad.com', 'f5bb0c8de146c67b44babbf4e6584cc0', '12312323', NULL, NULL, NULL, NULL, '2021-09-08 20:03:32', NULL, NULL, '0'),
(13, 'test', 'test@1213.com', '4297f44b13955235245b2497399d7a93', '123123123', NULL, NULL, NULL, NULL, '2021-09-08 20:26:09', NULL, NULL, '0'),
(14, 'asd', 'asd@asd.com', '4297f44b13955235245b2497399d7a93', '123123', NULL, NULL, NULL, NULL, '2021-09-08 22:49:04', NULL, NULL, '0'),
(15, 'test', 'asd@dsa.coms', 'f5bb0c8de146c67b44babbf4e6584cc0', '123123123', NULL, NULL, NULL, NULL, '2021-09-08 22:49:56', NULL, NULL, '0'),
(16, 'test', 'asd@dsa.coms', 'f5bb0c8de146c67b44babbf4e6584cc0', '123123123', NULL, NULL, NULL, NULL, '2021-09-08 22:51:09', NULL, NULL, '0'),
(17, 'asd', 'etes@dsa.com', 'f5bb0c8de146c67b44babbf4e6584cc0', '123213', NULL, NULL, NULL, NULL, '2021-09-08 22:51:33', NULL, NULL, '0'),
(18, 'asd', 'etes@dsa.com', 'f5bb0c8de146c67b44babbf4e6584cc0', '123213', NULL, NULL, NULL, NULL, '2021-09-08 22:52:14', NULL, NULL, '0'),
(19, 'test', 'test@dsada.com', 'f5bb0c8de146c67b44babbf4e6584cc0', '123123123', NULL, NULL, NULL, NULL, '2021-09-08 22:52:28', NULL, NULL, '0'),
(20, 'test', 'test@dsada.com', 'f5bb0c8de146c67b44babbf4e6584cc0', '123123123', NULL, NULL, NULL, NULL, '2021-09-08 22:53:04', NULL, NULL, '0'),
(21, 'test', 'test@asd.com', 'f5bb0c8de146c67b44babbf4e6584cc0', '123123123', NULL, NULL, NULL, NULL, '2021-09-08 22:54:35', NULL, NULL, '0'),
(22, 'test', 'test@asd.com', 'f5bb0c8de146c67b44babbf4e6584cc0', '123123123', NULL, NULL, NULL, NULL, '2021-09-08 22:55:28', NULL, NULL, '0'),
(23, 'Test Payment', 'asd@aaa.com', 'f5bb0c8de146c67b44babbf4e6584cc0', '333333333', NULL, NULL, NULL, NULL, '2021-09-08 22:55:46', NULL, NULL, '0'),
(24, 'test', 'asd@dsadad.com', 'f5bb0c8de146c67b44babbf4e6584cc0', '123123123', NULL, NULL, NULL, NULL, '2021-09-08 23:24:31', NULL, '072b030ba126b2f4b2374f342be9ed44', '0'),
(25, 'Test', 'nemanaj@zab.com', 'f5bb0c8de146c67b44babbf4e6584cc0', '123123123', NULL, NULL, NULL, NULL, '2021-09-08 23:31:41', NULL, '54229abfcfa5649e7003b83dd4755294', '0'),
(26, 'Test', 'te@te.com', 'f5bb0c8de146c67b44babbf4e6584cc0', '123123123', '', '', '', '', '2021-09-08 23:34:17', '2021-09-08 23:40:38', '140f6969d5213fd0ece03148e62e461e', '1'),
(27, 'Test', 'test@test123123.com', '4297f44b13955235245b2497399d7a93', '123123', NULL, NULL, NULL, NULL, '2021-09-09 21:29:39', NULL, '02e74f10e0327ad868d138f2b4fdd6f0', '0'),
(28, 'nemanja', 'nemanja@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '123456', NULL, NULL, NULL, NULL, '2021-09-09 21:30:52', NULL, '37a749d808e46495a8da1e5352d03cae', '0'),
(29, 'nidzo', 'nidzo@gmail.com', '$2y$10$C0obr51uoNLIxVbzBjwiJuitAwqiMXnX1Tj5FMGbJYBzKUOowsXra', '1241255115', NULL, NULL, NULL, NULL, '2021-09-10 03:25:34', '2021-09-10 03:25:46', 'eb160de1de89d9058fcb0b968dbbbd68', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblvehicles`
--

CREATE TABLE `tblvehicles` (
  `id` int(11) NOT NULL,
  `VehiclesTitle` varchar(150) DEFAULT NULL,
  `VehiclesBrand` int(11) DEFAULT NULL,
  `VehiclesOverview` longtext DEFAULT NULL,
  `PricePerDay` int(11) DEFAULT NULL,
  `FuelType` varchar(100) DEFAULT NULL,
  `ModelYear` int(6) DEFAULT NULL,
  `SeatingCapacity` int(11) DEFAULT NULL,
  `Vimage1` varchar(120) DEFAULT NULL,
  `Vimage2` varchar(120) DEFAULT NULL,
  `Vimage3` varchar(120) DEFAULT NULL,
  `Vimage4` varchar(120) DEFAULT NULL,
  `Vimage5` varchar(120) DEFAULT NULL,
  `AirConditioner` int(11) DEFAULT NULL,
  `PowerDoorLocks` int(11) DEFAULT NULL,
  `AntiLockBrakingSystem` int(11) DEFAULT NULL,
  `BrakeAssist` int(11) DEFAULT NULL,
  `PowerSteering` int(11) DEFAULT NULL,
  `DriverAirbag` int(11) DEFAULT NULL,
  `PassengerAirbag` int(11) DEFAULT NULL,
  `PowerWindows` int(11) DEFAULT NULL,
  `CDPlayer` int(11) DEFAULT NULL,
  `CentralLocking` int(11) DEFAULT NULL,
  `CrashSensor` int(11) DEFAULT NULL,
  `LeatherSeats` int(11) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvehicles`
--

INSERT INTO `tblvehicles` (`id`, `VehiclesTitle`, `VehiclesBrand`, `VehiclesOverview`, `PricePerDay`, `FuelType`, `ModelYear`, `SeatingCapacity`, `Vimage1`, `Vimage2`, `Vimage3`, `Vimage4`, `Vimage5`, `AirConditioner`, `PowerDoorLocks`, `AntiLockBrakingSystem`, `BrakeAssist`, `PowerSteering`, `DriverAirbag`, `PassengerAirbag`, `PowerWindows`, `CDPlayer`, `CentralLocking`, `CrashSensor`, `LeatherSeats`, `RegDate`, `UpdationDate`) VALUES
(1, 'SS400', 2, 'Slowly spreading its cards this year, the Ace of Bajaj Autos is still not on the table. With the expectations like Pulsar 400SS or Pulsar SS400, the Ace (400SS) would be the commander of the Pulsar series. It would be a benchmark for the other motorcycle manufacturers as the competition for more performance oriented bikes will definitely rise this year.', 345345, 'Petrol', 3453, 2, 'knowledges_base_bg.jpg', 'yellow2.jpg', 'yellow2.jpg', 'yellow3.jpg', '', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2017-06-19 11:46:23', '2021-09-10 03:31:40'),
(2, 'RS200', 2, 'The Pulsar is by far the most successful brand Bajaj has managed to create in the recent past.It is also fast, no doubt. But, its true highlight is its easy to ride nature. ', 50, 'Petrol', 1999, 2, 'bike_755x430.png', 'bluw1.jpg', 'blue2.jfif', 'blue3.jpg', '', 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, NULL, NULL, '2017-06-19 16:16:17', '2021-09-10 03:33:10'),
(3, 'R1', 4, ' The Suzuki GSX-R1000 is a sport bike from Suzuki GSX-R series of motorcycles.It was introduced in 2001 to replace the GSX-R1100 and is powered by a liquid-cooled 999 cc (61.0 cu in) inline four-cylinder, four-stroke engine.', 99, 'Petrol', 2012, 2, 'featured-img-300.jpg', 'black2.jpg', 'black2.png', 'black4.jpg', '', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, '2017-06-19 16:18:20', '2021-09-10 03:34:09'),
(4, 'Duke390', 1, ' The KTM 390 DUKE breathes life into values that have made motorcycling so amazing for decades. It combines maximum riding pleasure with optimum user value and comes out on top wherever nimble handling counts. Light as a feather, powerful and packed with state-of-the-art technology, it guarantees a thrilling ride, whether youre in the urban jungle or a forest of bends. 390 DUKE – nowhere you will find more motorcycle per euro.', 100, 'Petrol', 2012, 2, 'featured-img-3000.jpg', 'orange2.jpg', 'orange3.jpg', 'orange4.jpg', '', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, '2017-06-19 16:18:43', '2021-09-10 03:34:57'),
(5, 'R1', 5, 'The YZF-R1® features a lightweight and compact crossplane crankshaft, inline-four-cylinder, 998cc high output engine. Featuring titanium fracture-split connecting rods, an offset cylinder block and magnesium covers, the motor delivers extremely high horsepower and a strong pulse of linear torque for outstanding performance, all wrapped in aerodynamic MotoGP®-style bodywork.', 345345, 'Petrol', 3453, 2, 'bikes_755x430.png', NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2017-06-20 17:57:09', '2017-06-21 16:56:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbrands`
--
ALTER TABLE `tblbrands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblbrands`
--
ALTER TABLE `tblbrands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
