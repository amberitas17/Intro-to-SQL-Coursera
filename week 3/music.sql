-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2021 at 04:52 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `album_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`album_id`, `title`, `artist_id`) VALUES
(1, 'Beyonce', 3),
(2, '4', 3),
(3, 'Motion', 2),
(4, 'Thank You', 1),
(5, 'Title', 1);

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_id`, `name`) VALUES
(1, 'Meghan Trainor'),
(2, 'Calvin Harris'),
(3, 'Beyonce');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `name`) VALUES
(1, 'Pop'),
(2, 'Electro Music'),
(3, 'R&B');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `track_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`track_id`, `title`, `len`, `rating`, `count`, `album_id`, `genre_id`) VALUES
(1, 'Drunk in Love', 323, 5, 0, 1, 3),
(2, 'XO', 215, 5, 0, 1, 3),
(3, 'Partition', 319, 5, 0, 1, 3),
(4, 'Pretty Hurts', 257, 5, 0, 1, 3),
(5, '1+1', 428, 5, 0, 2, 3),
(6, 'Run the World (Girls)', 450, 5, 0, 2, 3),
(7, 'Rather Die Young', 342, 5, 0, 2, 3),
(8, 'Love on Top', 316, 5, 0, 2, 3),
(9, 'Thinking About You', 247, 5, 0, 3, 2),
(10, 'Under Control', 184, 5, 0, 3, 2),
(11, 'Summer', 222, 5, 0, 3, 2),
(12, 'Outside', 227, 5, 0, 3, 2),
(13, 'NO', 334, 5, 0, 4, 1),
(14, 'Me Too', 301, 5, 0, 4, 1),
(15, 'Better', 248, 5, 0, 4, 1),
(16, 'I Love Me', 248, 5, 0, 4, 1),
(17, 'All About That Bass', 311, 5, 0, 5, 1),
(18, 'Dear Future Husband', 304, 5, 0, 5, 1),
(19, 'Lips Are Movin', 302, 5, 0, 5, 1),
(20, 'Bang Dem Sticks', 301, 5, 0, 5, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `title` (`title`) USING BTREE,
  ADD KEY `artist_id` (`artist_id`);

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`track_id`),
  ADD KEY `title` (`title`) USING BTREE,
  ADD KEY `album_id` (`album_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `track_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `track_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
