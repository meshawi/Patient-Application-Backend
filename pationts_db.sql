-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2024 at 01:00 AM
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
-- Database: `pationts_db`
--
CREATE DATABASE IF NOT EXISTS `pationts_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pationts_db`;

-- --------------------------------------------------------

--
-- Stand-in structure for view `all_appointments`
-- (See below for the actual view)
--
CREATE TABLE `all_appointments` (
`AppointmentID` int(11)
,`ClinicID` int(11)
,`ClinicName` varchar(100)
,`ClinicIcon` varchar(255)
,`PatientID` int(11)
,`PatientFirstName` varchar(50)
,`PatientLastName` varchar(50)
,`DayID` int(11)
,`DayOfWeek` varchar(10)
,`TimeID` int(11)
,`TimeSlot` varchar(8)
,`Date` date
,`Status` enum('booked','canceled','available')
);

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `AppointmentID` int(11) NOT NULL,
  `ClinicID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `DayID` int(11) NOT NULL,
  `TimeID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Status` enum('booked','canceled','available') NOT NULL DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`AppointmentID`, `ClinicID`, `PatientID`, `DayID`, `TimeID`, `Date`, `Status`) VALUES
(1, 1, 1, 3, 5, '2024-07-01', 'booked'),
(2, 1, 1, 3, 4, '2024-07-01', 'booked'),
(3, 1, 1, 2, 1, '2024-07-07', 'booked'),
(4, 1, 1, 4, 1, '2024-07-09', 'booked'),
(5, 1, 1, 4, 1, '2024-07-09', 'booked'),
(6, 1, 1, 4, 1, '2024-07-09', 'booked'),
(7, 1, 1, 4, 2, '2024-07-09', 'booked'),
(8, 1, 29, 4, 3, '2024-07-09', 'booked'),
(9, 1, 29, 4, 4, '2024-07-09', 'booked'),
(10, 1, 29, 5, 1, '2024-07-31', 'booked'),
(11, 1, 29, 1, 1, '2024-07-13', 'booked'),
(12, 1, 29, 1, 2, '2024-07-13', 'booked'),
(13, 1, 29, 1, 3, '2024-07-13', 'booked'),
(14, 1, 29, 4, 1, '2024-07-23', 'booked'),
(15, 1, 1, 4, 5, '2024-07-16', 'booked'),
(16, 1, 1, 4, 1, '2024-07-16', 'booked'),
(17, 2, 1, 2, 10, '2024-07-21', 'booked'),
(18, 3, 1, 5, 11, '2024-07-31', 'booked'),
(19, 1, 1, 5, 3, '2024-07-24', 'booked'),
(20, 1, 1, 1, 2, '2024-07-20', 'booked'),
(21, 1, 1, 4, 2, '2024-07-23', 'booked'),
(22, 1, 1, 4, 2, '2024-07-23', 'booked'),
(23, 1, 1, 4, 2, '2024-07-23', 'booked'),
(24, 1, 1, 4, 2, '2024-07-23', 'booked'),
(25, 1, 1, 4, 2, '2024-07-23', 'booked'),
(26, 1, 1, 4, 2, '2024-07-23', 'booked'),
(27, 1, 1, 4, 2, '2024-07-23', 'booked'),
(28, 1, 1, 4, 2, '2024-07-23', 'booked'),
(29, 1, 1, 4, 2, '2024-07-23', 'booked'),
(30, 1, 1, 4, 2, '2024-07-23', 'booked'),
(31, 1, 1, 4, 2, '2024-07-23', 'booked'),
(32, 1, 1, 4, 2, '2024-07-23', 'booked'),
(33, 1, 1, 4, 2, '2024-07-23', 'booked'),
(34, 1, 1, 4, 2, '2024-07-23', 'booked'),
(35, 1, 1, 4, 2, '2024-07-23', 'booked'),
(36, 1, 1, 4, 2, '2024-07-23', 'booked'),
(37, 1, 1, 4, 2, '2024-07-23', 'booked'),
(38, 1, 1, 4, 3, '2024-07-23', 'booked'),
(39, 1, 1, 4, 3, '2024-07-23', 'booked'),
(40, 1, 1, 4, 3, '2024-07-23', 'booked'),
(41, 1, 1, 4, 3, '2024-07-23', 'booked'),
(42, 1, 1, 4, 3, '2024-07-23', 'booked'),
(43, 1, 1, 4, 3, '2024-07-23', 'booked'),
(44, 1, 1, 4, 3, '2024-07-23', 'booked'),
(45, 1, 1, 4, 3, '2024-07-23', 'booked'),
(46, 2, 1, 6, 11, '2024-07-25', 'booked'),
(47, 1, 1, 5, 5, '2024-07-31', 'booked');

-- --------------------------------------------------------

--
-- Table structure for table `clinics`
--

CREATE TABLE `clinics` (
  `ClinicID` int(11) NOT NULL,
  `ClinicName` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clinics`
--

INSERT INTO `clinics` (`ClinicID`, `ClinicName`, `Description`, `icon`) VALUES
(1, 'Pediatric', 'Provides comprehensive medical care for children from infancy through adolescence, ensuring their physical, emotional, and social health needs are met.', 'baby'),
(2, 'Family Medicine', 'Offers medical care for individuals and families across all ages, genders, and diseases, providing preventative care and treatment for acute and chronic illnesses.', 'account-group'),
(3, 'Orthopedic', 'Specializes in the diagnosis, treatment, rehabilitation, and prevention of injuries and diseases of the body’s musculoskeletal system, including bones, joints, ligaments, tendons, and muscles.', 'bone'),
(4, 'Dental', 'Provides dental care services including routine checkups, cleanings, fillings, crowns, bridges, and preventive education to maintain oral health.', 'tooth'),
(5, 'Cardiology', 'Focused on diagnosing and treating heart conditions such as coronary artery disease, heart rhythm disorders, and heart failure, using advanced medical technology and procedures.', 'heart');

-- --------------------------------------------------------

--
-- Table structure for table `clinic_operating_hours`
--

CREATE TABLE `clinic_operating_hours` (
  `ClinicID` int(11) NOT NULL,
  `DayStartID` int(11) NOT NULL,
  `DayEndID` int(11) NOT NULL,
  `StartTimeID` int(11) NOT NULL,
  `EndTimeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clinic_operating_hours`
--

INSERT INTO `clinic_operating_hours` (`ClinicID`, `DayStartID`, `DayEndID`, `StartTimeID`, `EndTimeID`) VALUES
(1, 1, 5, 1, 5),
(2, 2, 6, 10, 19),
(3, 3, 3, 11, 18),
(3, 5, 5, 11, 18),
(3, 7, 7, 11, 18),
(4, 4, 4, 12, 20),
(4, 6, 6, 12, 20),
(5, 3, 6, 21, 17);

-- --------------------------------------------------------

--
-- Stand-in structure for view `clinic_schedule`
-- (See below for the actual view)
--
CREATE TABLE `clinic_schedule` (
`ClinicID` int(11)
,`ClinicName` varchar(100)
,`Description` text
,`icon` varchar(255)
,`DayID` int(11)
,`DayOfWeek` varchar(10)
,`StartTime` varchar(8)
,`EndTime` varchar(8)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `clinic_time_slots`
-- (See below for the actual view)
--
CREATE TABLE `clinic_time_slots` (
`ClinicID` int(11)
,`ClinicName` varchar(100)
,`DayID` int(11)
,`DayOfWeek` varchar(10)
,`TimeID` int(11)
,`TimeSlot` varchar(8)
);

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `DayID` int(11) NOT NULL,
  `DayOfWeek` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`DayID`, `DayOfWeek`) VALUES
(1, 'Saturday'),
(2, 'Sunday'),
(3, 'Monday'),
(4, 'Tuesday'),
(5, 'Wednesday'),
(6, 'Thursday'),
(7, 'Friday');

-- --------------------------------------------------------

--
-- Table structure for table `times`
--

CREATE TABLE `times` (
  `TimeID` int(11) NOT NULL,
  `TimeSlot` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `times`
--

INSERT INTO `times` (`TimeID`, `TimeSlot`) VALUES
(1, '09:00 AM'),
(2, '10:00 AM'),
(3, '11:00 AM'),
(4, '12:00 PM'),
(5, '01:00 PM'),
(6, '02:00 PM'),
(7, '03:00 PM'),
(8, '04:00 PM'),
(9, '05:00 PM'),
(10, '08:00 AM'),
(11, '09:00 AM'),
(12, '10:00 AM'),
(13, '11:00 AM'),
(14, '12:00 PM'),
(15, '01:00 PM'),
(16, '02:00 PM'),
(17, '03:00 PM'),
(18, '04:00 PM'),
(19, '05:00 PM'),
(20, '06:00 PM'),
(21, '07:00 AM'),
(22, '08:00 AM'),
(23, '09:00 AM'),
(24, '10:00 AM'),
(25, '11:00 AM'),
(26, '12:00 PM'),
(27, '01:00 PM'),
(28, '02:00 PM'),
(29, '03:00 PM'),
(30, '04:00 PM'),
(31, '07:00 AM'),
(32, '08:00 AM'),
(33, '09:00 AM'),
(34, '10:00 AM'),
(35, '11:00 AM'),
(36, '12:00 PM'),
(37, '01:00 PM'),
(38, '02:00 PM'),
(39, '03:00 PM'),
(40, '04:00 PM'),
(41, '05:00 PM'),
(42, '06:00 PM'),
(43, '07:00 PM'),
(44, '08:00 PM'),
(45, 'Closed');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('male','female') NOT NULL,
  `maritalstatus` enum('single','married') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `mobile`, `email`, `password`, `city`, `birthdate`, `gender`, `maritalstatus`, `created_at`) VALUES
(1, 'Mohammed', 'Aleshawi', '0599999999', 'mohammed@gmail.com', 'Example32@', 'Riyadh', '1990-01-15', 'male', 'single', '2024-05-28 07:12:41'),
(29, 'David', 'Garcia', '0590123456', 'davidd.garcia@example.com', 'Example4$', 'Boston', '1991-02-14', 'male', 'married', '2024-07-08 07:47:08'),
(31, 'aaaa', 'aaaaaaaaa', '0555556666', 'jessica.jones@example.com', 'Example3!', 'Riadh', '2024-07-14', 'female', 'married', '2024-07-14 23:31:15');

-- --------------------------------------------------------

--
-- Structure for view `all_appointments`
--
DROP TABLE IF EXISTS `all_appointments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_appointments`  AS SELECT `a`.`AppointmentID` AS `AppointmentID`, `a`.`ClinicID` AS `ClinicID`, `c`.`ClinicName` AS `ClinicName`, `c`.`icon` AS `ClinicIcon`, `a`.`PatientID` AS `PatientID`, `u`.`firstname` AS `PatientFirstName`, `u`.`lastname` AS `PatientLastName`, `a`.`DayID` AS `DayID`, `d`.`DayOfWeek` AS `DayOfWeek`, `a`.`TimeID` AS `TimeID`, `t`.`TimeSlot` AS `TimeSlot`, `a`.`Date` AS `Date`, `a`.`Status` AS `Status` FROM ((((`appointments` `a` join `clinics` `c` on(`a`.`ClinicID` = `c`.`ClinicID`)) join `users` `u` on(`a`.`PatientID` = `u`.`id`)) join `days` `d` on(`a`.`DayID` = `d`.`DayID`)) join `times` `t` on(`a`.`TimeID` = `t`.`TimeID`)) ORDER BY `a`.`Date` ASC, `a`.`TimeID` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `clinic_schedule`
--
DROP TABLE IF EXISTS `clinic_schedule`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clinic_schedule`  AS SELECT `cl`.`ClinicID` AS `ClinicID`, `cl`.`ClinicName` AS `ClinicName`, `cl`.`Description` AS `Description`, `cl`.`icon` AS `icon`, `d`.`DayID` AS `DayID`, `d`.`DayOfWeek` AS `DayOfWeek`, `t1`.`TimeSlot` AS `StartTime`, `t2`.`TimeSlot` AS `EndTime` FROM ((((`clinic_operating_hours` `coh` join `days` `d` on(`coh`.`DayStartID` <= `d`.`DayID` and `d`.`DayID` <= `coh`.`DayEndID`)) join `times` `t1` on(`coh`.`StartTimeID` = `t1`.`TimeID`)) join `times` `t2` on(`coh`.`EndTimeID` = `t2`.`TimeID`)) join `clinics` `cl` on(`coh`.`ClinicID` = `cl`.`ClinicID`)) ORDER BY `coh`.`ClinicID` ASC, `d`.`DayID` ASC, `t1`.`TimeSlot` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `clinic_time_slots`
--
DROP TABLE IF EXISTS `clinic_time_slots`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clinic_time_slots`  AS SELECT `coh`.`ClinicID` AS `ClinicID`, `cl`.`ClinicName` AS `ClinicName`, `d`.`DayID` AS `DayID`, `d`.`DayOfWeek` AS `DayOfWeek`, `t`.`TimeID` AS `TimeID`, `t`.`TimeSlot` AS `TimeSlot` FROM (((`clinic_operating_hours` `coh` join `days` `d` on(`coh`.`DayStartID` <= `d`.`DayID` and `d`.`DayID` <= `coh`.`DayEndID`)) join `times` `t` on(`t`.`TimeID` between `coh`.`StartTimeID` and `coh`.`EndTimeID`)) join `clinics` `cl` on(`coh`.`ClinicID` = `cl`.`ClinicID`)) ORDER BY `coh`.`ClinicID` ASC, `d`.`DayID` ASC, `t`.`TimeID` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`AppointmentID`),
  ADD KEY `ClinicID` (`ClinicID`),
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `DayID` (`DayID`),
  ADD KEY `TimeID` (`TimeID`);

--
-- Indexes for table `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`ClinicID`);

--
-- Indexes for table `clinic_operating_hours`
--
ALTER TABLE `clinic_operating_hours`
  ADD PRIMARY KEY (`ClinicID`,`DayStartID`,`DayEndID`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`DayID`);

--
-- Indexes for table `times`
--
ALTER TABLE `times`
  ADD PRIMARY KEY (`TimeID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `AppointmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `clinics`
--
ALTER TABLE `clinics`
  MODIFY `ClinicID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `DayID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `times`
--
ALTER TABLE `times`
  MODIFY `TimeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`ClinicID`) REFERENCES `clinics` (`ClinicID`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`PatientID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`DayID`) REFERENCES `days` (`DayID`),
  ADD CONSTRAINT `appointments_ibfk_4` FOREIGN KEY (`TimeID`) REFERENCES `times` (`TimeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
