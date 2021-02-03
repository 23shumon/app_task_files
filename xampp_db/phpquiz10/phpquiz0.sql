-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 07, 2018 at 12:50 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpquiz0`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `qid` text NOT NULL,
  `ansid` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `qid`, `ansid`) VALUES
(1, '58027e82e62e3', '58027e82f2412'),
(2, '58027e833dd54', '58027e8347514'),
(3, '58027e8371483', '58027e838f19a');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` text NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `feedback` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `username`, `subject`, `feedback`, `date`, `time`) VALUES
('5bb737e3aba49', '', '', '', '', '2018-10-05', '10:07:31am');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `eid` text NOT NULL,
  `score` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `correct` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp` bigint(50) NOT NULL,
  `status` varchar(40) NOT NULL,
  `score_updated` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `username`, `eid`, `score`, `level`, `correct`, `wrong`, `date`, `timestamp`, `status`, `score_updated`) VALUES
(10, 'sonudoo', '5802790f793b1', 0, 0, 0, 0, '2018-10-04 04:59:10', 1538628211, 'finished', 'true'),
(14, 'test', '5802790f793b1', 5, 1, 1, -1, '2018-10-04 08:16:08', 1538639167, 'finished', 'true'),
(16, 'new', '5802790f793b1', 8, 2, 2, 0, '2018-10-04 14:56:58', 1538664994, 'finished', 'true'),
(17, 'kc', '5802790f793b1', 0, 0, 0, 0, '2018-10-05 06:53:03', 1538721615, 'finished', 'true'),
(18, 'xx', '5802790f793b1', 7, 3, 2, 1, '2018-10-05 10:24:18', 1538733257, 'finished', 'true'),
(19, 'asss', '5802790f793b1', 0, 0, 0, 0, '2018-10-05 09:55:08', 1538733308, 'ongoing', 'false'),
(20, 'php', '5802790f793b1', 7, 3, 2, 1, '2018-10-05 10:37:20', 1538735496, 'finished', 'true'),
(21, 'css', '5802790f793b1', 0, 0, 0, 0, '2018-10-05 10:49:51', 1538736591, 'ongoing', 'false'),
(22, 'er', '5802790f793b1', 0, 0, 0, 0, '2018-10-06 13:19:01', 1538831941, 'ongoing', 'false'),
(24, 'android', '5802790f793b1', 0, 0, 0, 0, '2018-10-06 23:25:06', 1538868306, 'ongoing', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `qid` varchar(50) NOT NULL,
  `option` varchar(5000) NOT NULL,
  `optionid` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `qid`, `option`, `optionid`) VALUES
(1, '58027e82e62e3', 'Yes', '58027e82f2412'),
(2, '58027e82e62e3', 'No', '58027e82f2427'),
(3, '58027e82e62e3', 'Don\'t want to', '58027e82f2433'),
(4, '58027e82e62e3', 'Why should I', '58027e82f243d'),
(5, '58027e833dd54', 'sonudoo', '58027e8347505'),
(6, '58027e833dd54', 'sunnygkp10', '58027e8347514'),
(7, '58027e833dd54', 'markzuckerberg', '58027e834751b'),
(8, '58027e833dd54', 'me', '58027e8347521'),
(9, '58027e8371483', 'sonudoo', '58027e838f19a'),
(10, '58027e8371483', 'sunnygkp10', '58027e838f1b0'),
(11, '58027e8371483', 'me', '58027e838f1ba'),
(12, '58027e8371483', 'markzuckerberg', '58027e838f1c4');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `eid` text NOT NULL,
  `qid` text NOT NULL,
  `qns` text NOT NULL,
  `choice` int(10) NOT NULL,
  `sn` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `eid`, `qid`, `qns`, `choice`, `sn`) VALUES
(1, '5802790f793b1', '58027e82e62e3', 'Have you read the README file?', 4, 1),
(2, '5802790f793b1', '58027e833dd54', 'Who is the Original creator of this quizzing site?', 4, 2),
(3, '5802790f793b1', '58027e8371483', 'Who improved the original version of this quizzing site?', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE IF NOT EXISTS `quiz` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `eid` text NOT NULL,
  `title` varchar(100) NOT NULL,
  `correct` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `time` bigint(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(10) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `eid`, `title`, `correct`, `wrong`, `total`, `time`, `date`, `status`) VALUES
(1, '5802790f793b1', 'Sample Quiz', 4, 1, 3, 30, '2018-10-02 06:58:30', 'enabled');

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
CREATE TABLE IF NOT EXISTS `rank` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `score` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rank`
--

INSERT INTO `rank` (`id`, `username`, `score`, `time`) VALUES
(1, 'sonudoo', 12, '2018-10-04 04:59:10'),
(2, 'test', 12, '2018-10-04 08:16:08'),
(3, 'new', 8, '2018-10-04 14:56:58'),
(4, 'kc', 0, '2018-10-05 06:53:03'),
(5, 'xx', 7, '2018-10-05 10:24:18'),
(6, 'php', 7, '2018-10-05 10:37:20'),
(7, 'android', 0, '2018-10-06 23:07:33');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(512) NOT NULL,
  `photo` varbinary(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `photo`) VALUES
(1, 'test', 'test', '098f6bcd4621d373cade4e832627b4f6', ''),
(2, 'name', 'mail@mail.com', '202cb962ac59075b964b07152d234b70', 0x30),
(3, 'name2', 'mail2@mail.com', '1232', 0x3230),
(4, 'name2', 'mail2@mail.com', '1232', 0x3230),
(5, 'new', 'new@mail.com', 'new', 0x3230),
(6, 'not', 'not@mail.com', '$2y$10$Qq84LOvnyN2eqI3Fs1MFheYrMRJotbeo6JAAP4p/SJPTCOaY5Dvaq', 0x687474703a2f2f31302e38302e3131312e3130332f6a756c7932306d2f70726f66696c655f696d6167652f4141303030362e6a706567),
(7, 'photo', 'photo@mail.com', 'photo', 0x75706c6f6164732f),
(8, 'img', 'img@mail.com', 'img', 0x75706c6f6164732f),
(9, 'pic', 'pic@mail.com', 'pic', 0x75706c6f6164732f),
(10, 'assult47', 'sss@mail.com', 'sss', 0x75706c6f6164732f4141303030322e6a706567),
(11, 'aaa', 'aaa@mail.com', 'aaa', 0x75706c6f6164732f),
(12, 'again', 'again@mail.com', 'again', 0x687474703a2f2f31302e38302e3131312e3130332f7068707175697a31302f75706c6f6164732f414130303032392e6a706567),
(13, 'kickme', 'kickme@mail.com', '$2y$10$QdCzDaAt3w4OSKLglhkqf.15cjchU8EY6AGK02aKcQVdLdnu0TlC6', 0x687474703a2f2f31302e38302e3131312e3130332f7068707175697a31302f75706c6f6164732f4141303030312e6a706567),
(14, 'doit', 'doit@mail.com', '$2y$10$4lqw67y0W4IG1M0oMKsxROgSe7o2GmJOgdfJb1B.RVn9JfceVoJhy', 0x2f75706c6f6164732f4141303030322e6a706567),
(15, '55', 'sss@mail.com', '$2y$10$d9wdW7igZJVHpymBZLGo/e54EUU0BGjPpEWzBf4JksY8yhVJuxEei', 0x75706c6f6164732f414130303031342e6a706567),
(16, 'jj', '4546@mail.om', '$2y$10$oQz5aOheKyClsLQzi3MfYe3/Al7eVbvUS/AI2hBp.mF0PlM7YsUQO', 0x75706c6f6164732f4141303030372e6a706567),
(17, 'extract', 'extract@php.com', '$2y$10$6XS3OF/q6uJrXef36kR6C.Lxes67HGNtOOwGvohYvtCsag3Vwsx8.', 0x75706c6f61642f414130303031312e6a706567),
(18, 'now', 'now@mail.com', '$2y$10$dkMsXDDGWxbS9uLhoaUvj.qfT8F7A1cd7k7SPNM6tWpCh9ry4LPbm', 0x75706c6f61642f414130303031342e6a706567),
(19, 'dd', 'dd@mail.com', '$2y$10$S1XUuEEw0hROfLGbHjYaQ.yw32lN9h//KP14IwLlqJVk2/hukXWfC', 0x687474703a2f2f31302e38302e3131312e3130332f7068707175697a31302f75706c6f61642f414130303031392e6a706567),
(20, 'ddd', 'ddd@mail.com', '$2y$10$ioL9dbk.iGBo2ZO555uu5.Kj8NpFpLkZsoIexur.l6/mRgu4V3QRm', 0x687474703a2f2f31302e38302e3131312e3130332f7068707175697a31302f75706c6f6164732f414130303032302e6a706567),
(21, 'ddd4', 'ddd4@mail.com', '$2y$10$7t0tjqR4I.3zb3j2LAqFKumCn31kb2RSHv.4qXeiM0uzZrusfys42', 0x687474703a2f2f31302e38302e3131312e3130332f6a756c7932306d2f70726f66696c655f696d6167652f414130303032312e6a706567),
(22, 'er', 'er@er.com', '$2y$10$OaXFkwfVPebonOhbyJ12QegDI62cAxfYtjWjQqptt8UXWvaR7D4Fm', 0x687474703a2f2f31302e38302e3131312e3130332f7068707175697a31302f75706c6f6164732f414130303032322e6a706567),
(23, 'faltu', 'faltu@mail.com', '$2y$10$mvyny50n8I2Mp0q4PvodPuubJopQzCkG1nf26QhVvpnDYmw78wwT6', 0x75706c6f61642f4141303030392e6a706567),
(24, 'erd', 'erd@er.com', '$2y$10$Bd8gohdvhz.cNx2bMTW6h.KcXNJ2KOKCZeMje0x0yKO.H12Nlcovy', 0x687474703a2f2f31302e38302e3131312e3130332f7068707175697a31302f75706c6f6164732f414130303032342e6a706567),
(25, 'erds', 'erds@er.com', '$2y$10$hVrGzTqEU9ZY2SMt/A7VgOwLCmVrk9znANV9OagcaqkTbFKB.XHou', 0x687474703a2f2f31302e38302e3131312e3130332f7068707175697a31302f75706c6f6164732f414130303032352e6a706567),
(26, 'asss', 'asss@mail.com', '$2y$10$wB0fdRpwmb9pWIeKdmLxSu8A2.x4Qdco2WCqM9TJopgieWSt4BJES', 0x687474703a2f2f31302e38302e3131312e3130332f7068707175697a31302f75706c6f6164732f414130303032362e6a706567),
(27, 'user_table', 'user@mail.com', '$2y$10$msAtzMovJoyzfyztoGazfuUm5BbxHDwKSO8KSdHuCedxc/bFHbQzm', 0x75706c6f6164732f323031382d30382d3236202832292e706e67),
(28, 'lg', 'log@mail.com', '$2y$10$27nQcOyqAjuI/M45XPa4uuM99ZaO9Qzsfl.mJtzTb0fGYqoTy6wXS', 0x75706c6f6164732f4141303030312e6a706567),
(29, 'bb', 'bb@mail.com', '$2y$10$WV1tDrhjPaog3A59Z9NogeXrVNI4TnZY7dy2L62Sr.3QTwGt37yo.', 0x414130303031312e6a706567),
(30, 'ddd', 'dd@mail.com', '$2y$10$uoWoUjPnNgG7mCNxgau.9uGaEEpiw53Kd/4creNs1Xan2eXO.fbSm', 0x414130303031342e6a706567),
(31, 'xx', 'xx@mail.com', '$2y$10$eNEfK2i4I5csX2JmNiw0qeU8ou3yMxaR9AtlSC7DVqrgqy1rju9ky', 0x414130303032302e6a706567),
(32, 'zz', 'zx@mail.com', '$2y$10$udeH/kJ1DFe6jZXoreBd7.wcseosIgwdHUebRlwIcUlrQZDa.exW2', 0x75706c6f6164732f4141303030332e6a706567),
(33, 'change', 'change@mail.com', '$2y$10$ZnINv/uNi0bNwwzVF61pD.DHXvEDfQmvTwws6iWSet0rrxTKrT0oW', 0x414130303032322e6a706567),
(34, 'kc', 'ck@mail.ocm', '$2y$10$U0XT54w2sARtUWwYRUKlW.gfbAwu0Aug.29kw7t/3NfBEB9Ota.e.', 0x414130303031392e6a706567),
(35, 'zzz', 'zzz@amil.com', '$2y$10$6Q6wNtshhdLfpt4Xst6DtelLH53YSVWfUXuBdmgZFlvDA6eN9IGy.', 0x687474703a2f2f31302e38302e3131312e3130332f7068707175697a31302f75706c6f6164732f414130303033352e6a706567),
(36, 'php', 'php@mail.com', '$2y$10$F2rSc5HNPeQKj.rmPb1zYOBHvr4YkFPluh7nAESaiW8ZGBikCxa8K', 0x687474703a2f2f31302e38302e3131312e3130332f7068707175697a31302f75706c6f6164732f414130303033362e6a706567),
(37, 'css', 'css@mail.com', '$2y$10$BAJSqC0RgZSwMZfudd7KEumG/yKp7mEuX9VI35uySFykIrrLFvDgu', 0x687474703a2f2f31302e38302e3131312e3130332f7068707175697a31302f75706c6f6164732f414130303033372e6a706567),
(38, 'android', 'android@mail.com', '$2y$10$YPMdgU5GI7tsndjeMuN3KO9.UHMVj4FGxzumM5Irfst89sELUwbB.', 0x687474703a2f2f31302e38302e3131312e3130332f7068707175697a31302f75706c6f6164732f414130303033382e6a706567);

-- --------------------------------------------------------

--
-- Table structure for table `user_answer`
--

DROP TABLE IF EXISTS `user_answer`;
CREATE TABLE IF NOT EXISTS `user_answer` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `qid` varchar(50) NOT NULL,
  `ans` varchar(50) NOT NULL,
  `correctans` varchar(50) NOT NULL,
  `eid` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_answer`
--

INSERT INTO `user_answer` (`id`, `qid`, `ans`, `correctans`, `eid`, `username`) VALUES
(2, '58027e833dd54', '58027e8347514', '58027e8347514', '5802790f793b1', 'sonudoo'),
(3, '58027e8371483', '58027e838f19a', '58027e838f19a', '5802790f793b1', 'sonudoo'),
(4, '58027e82e62e3', '58027e82f2412', '58027e82f2412', '5802790f793b1', 'sonudoo'),
(5, '58027e82e62e3', '58027e82f2412', '58027e82f2412', '5802790f793b1', 'test'),
(6, '58027e833dd54', '58027e8347514', '58027e8347514', '5802790f793b1', 'test'),
(7, '58027e8371483', '58027e838f19a', '58027e838f19a', '5802790f793b1', 'test'),
(8, '58027e82e62e3', '58027e82f2412', '58027e82f2412', '5802790f793b1', 'new'),
(9, '58027e833dd54', '58027e8347514', '58027e8347514', '5802790f793b1', 'new'),
(10, '58027e82e62e3', '58027e82f2412', '58027e82f2412', '5802790f793b1', 'xx'),
(11, '58027e833dd54', '58027e8347514', '58027e8347514', '5802790f793b1', 'xx'),
(12, '58027e8371483', '58027e838f1ba', '58027e838f19a', '5802790f793b1', 'xx'),
(13, '58027e82e62e3', '58027e82f2412', '58027e82f2412', '5802790f793b1', 'php'),
(14, '58027e833dd54', '58027e8347514', '58027e8347514', '5802790f793b1', 'php'),
(15, '58027e8371483', '58027e838f1b0', '58027e838f19a', '5802790f793b1', 'php');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
