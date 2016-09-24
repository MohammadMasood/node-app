-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 24, 2016 at 01:27 PM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `node_auth`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(250) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` char(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'user', '$2a$10$tYXU.pvZ/zCGi2.8QJ8lau/9vYn.punOiiH8SPuxom7ewqYT6f.Yq'),
(2, 'admin', '$2a$10$WZTo8pLX0T0QZZGfZQbLCOgO5WmvNQKjEutmyfxIwb6elonp1KeXW'),
(3, 'demo', '$2a$10$vnfeg78Q2SgJze5ywMXVDeHcxU.6S6MjGqD0njgLxRgT1LjYHe0ke'),
(4, 'raja', '$2a$10$jsFo8Y4p12Dg.ndwuajMAeBzHTfpOykNMru/eZCsUe44aiKE9Mj7W'),
(5, 'himanshu', '$2a$10$70di7X478xk.jH75B.iNzem3y6HWhXbGpvfJgH7EopmRiKvin8u56'),
(6, 'aaa', '$2a$10$2nXUY9k0Pl0j1Rkl.cxZ4.pxcBFmr6H2AXwCF0Bu7iuuYlInyoxfu'),
(7, 'aaaaa', '$2a$10$iWSFvwXflqpTCPCsYYQ9AO7LKXb4FHgCrv4qlu1QeZsaKm0GkxhdK'),
(8, 'WWW', '$2a$10$703e0mWsnSG6Q/R//6g54enTSgsiW81EU3sDURB7UKtUV6SpO1jQG'),
(9, 'sasassasa', '$2a$10$g.DB/5FmJav97sVzHCy1yusfLm76DbAWvuXg8PzUY3.OQU.iWIn1S'),
(10, 'gopal', '$2a$10$YsrQ1PSjuSgA28VR0qVJ4O.Fg.OhVqnqqqrRgA5h4LzwmoIX31wRG');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
