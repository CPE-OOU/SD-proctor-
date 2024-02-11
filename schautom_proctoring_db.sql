-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 11, 2024 at 03:50 PM
-- Server version: 10.6.16-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schautom_proctoring_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `image`) VALUES
(1, 'admin', 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `exam_question`
--

CREATE TABLE `exam_question` (
  `id` int(11) NOT NULL,
  `question` varchar(700) DEFAULT NULL,
  `opt1` varchar(200) DEFAULT NULL,
  `opt2` varchar(200) DEFAULT NULL,
  `opt3` varchar(200) DEFAULT NULL,
  `opt4` varchar(200) DEFAULT NULL,
  `answer` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `exam_question`
--

INSERT INTO `exam_question` (`id`, `question`, `opt1`, `opt2`, `opt3`, `opt4`, `answer`) VALUES
(2, 'During STP calculation, the port cost is associated with the port bandwidth by default. Which of the following statements about the relationship between port cost and port bandwidth is true?', 'A higher port bandwidth indicates a smaller port cost', 'A higher port bandwidth indicates a larger port cost', 'The port bandwidth is equal to the port cost', 'The port cost varies randomly according to port bandwidth', 'opt2'),
(3, 'If Proto of a route displayed in the routing table is OSPF, the preference of the route must be 10.', 'TRUE', 'FALSE', '', '', 'opt2'),
(4, 'Which of the following protocols is not a file transfer protocol?', 'FTP', 'TFTP', ' SFTP', 'HTTP packet', 'opt4'),
(5, 'no question', 'no ans', NULL, NULL, NULL, NULL),
(6, 'question on React Js', 'no ans', 'ans', NULL, NULL, NULL),
(7, 'which is a framework', NULL, NULL, NULL, NULL, NULL),
(8, 'which is a framework', 'html', 'react', ' git', 'vue', 'vue'),
(15, '', '', '', '', '', ''),
(16, 'qui est la ', 'Moi', 'toi ', 'eux ', 'lui', 'eux'),
(17, 'salut', 'aa', 'a', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(70) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `image2` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `image`, `image2`) VALUES
(3, 'Ojuoye Moshood Olawale', 'kw@me.com', 'PLKPVGV JVYB', 'uuy', ''),
(33, 'john ', 'john@amadi.com', 'john', 'user_33.jpg', 'user_33.jpg'),
(34, 'Faozziyyah', 'omowunmidaud1@gmail.com', 'faasam001', 'user_34.jpg', 'user_34_check.jpg'),
(45, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', 'user_45.jpg', 'user_45_check.jpg'),
(46, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', 'user_46.jpg', ''),
(47, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(49, 'Abolade', 'lawalluqman4@gmail.com', 'Luqman', 'user_49.jpg', 'user_49_check.jpg'),
(50, 'Abdulqudus', 'qudus4real@gmail.com', 'qudus', 'user_50.jpg', 'user_50_check.jpg'),
(51, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', 'user_51.jpg', ''),
(52, 'seunomotola', 'seun@gmail.com', 'seun', 'user_52.jpg', 'user_52_check.jpg'),
(53, '', '', '', NULL, ''),
(58, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(59, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(60, 'OJUOYE MOSHOOD OLAWALE ADIGUN', 'mosh@gmail.com', '123123', 'sdpr', 'user_60_check.jpg'),
(61, 'Adekola', 'kola@gmail.com', 'kola', NULL, 'user_61_check.jpg'),
(62, 'Adekola', 'kola@gmail.com', 'kola', NULL, ''),
(63, 'Adekola', 'kola@gmail.com', 'kola', 'user_63.jpg', ''),
(64, 'Lawalluqman', 'Lawalluqman55019@gmail.com', 'lawal', 'user_64.jpg', ''),
(65, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(66, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(68, 'Mosh', 'mosh@gmail.com', 'ola', 'user_68.jpg', 'user_68_check.jpg'),
(69, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(70, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(71, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(72, 'ileri', 'ilerioluwa@gmail.com', '12345', 'user_72.jpg', 'user_72_check.jpg'),
(75, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', 'user_75.jpg', ''),
(76, 'sam', 'sam@gmail.com', '12345', 'user_76.jpg', 'user_76_check.jpg'),
(77, 'wonder', 'won@gmail.com', '1234', 'user_77.jpg', 'user_77_check.jpg'),
(78, 'okunbor edosa', 'chetexedosa@gmail.com', 'edosa123', 'user_78.jpg', 'user_78_check.jpg'),
(79, 'sho', 'sho@gmail.com', '12345', 'user_79.jpg', 'user_79_check.jpg'),
(80, 'olamide', '', '', NULL, ''),
(81, 'odulele qudus olamide', 'olaqunequn@gmail.com', '1234501', 'user_81.jpg', 'user_81_check.jpg'),
(82, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(83, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', 'user_83.jpg', ''),
(84, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', 'user_84.jpg', ''),
(85, 'py', 'py@gmail.com', '12345', 'user_85.jpg', 'user_85_check.jpg'),
(86, 'favor', 'fa@gmail.com', '12345', 'user_86.jpg', 'user_86_check.jpg'),
(87, 'dev', 'dev@gmail.com', 'gyTwev-nowby4-xiphys', NULL, 'user_87_check.jpg'),
(88, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(89, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(90, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(91, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(92, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(93, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(94, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(95, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(96, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqman', NULL, ''),
(97, 'okunola abdussalam', 'abdussalama142@gmail.com', '@Yekeensalam1', 'user_97.jpg', 'user_97_check.jpg'),
(98, 'okunola abdussalam', 'abdussalama142@gmail.com', '@Yekeensalam1', 'user_98.jpg', ''),
(99, '', 'mosh@gmail.com', 'ola', 'user_99.jpg', ''),
(100, 'ayomide', 'ayo@gmail.com', 'ayo123', 'user_100.jpg', 'user_100_check.jpg'),
(101, '', '', '', NULL, ''),
(102, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqmnan', NULL, ''),
(103, 'Lawal Luqman', 'luqmanlajani@gmail.com', 'Luqmnan', NULL, ''),
(111, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(112, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(113, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(114, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(115, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(116, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(117, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(118, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(119, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(120, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(121, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(122, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(123, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(124, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(125, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(126, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(127, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(128, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(129, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(130, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(131, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(132, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(133, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(134, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(135, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(136, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(137, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(138, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(139, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(140, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(141, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(142, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(143, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(144, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(145, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(146, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(147, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(148, 'Lawal Luqman', 'abdullateefanu@gmail.com', 'Anu ', NULL, ''),
(149, 'WebAutomate', 'm@gmail.com', '1', 'user_149.jpg', 'user_149_check.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_question`
--
ALTER TABLE `exam_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exam_question`
--
ALTER TABLE `exam_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
