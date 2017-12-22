-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `color` varchar(50) NOT NULL,
  `direction` int(11) NOT NULL,
  `reg_number` varchar(10) NOT NULL,
  `year` char(4) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `currency` varchar(4) NOT NULL,
  `planting_costs` float(10,2) NOT NULL,
  `driver_phone` varchar(20) NOT NULL,
  `costs_per_1` float(10,2) NOT NULL,
  `car_photo` varchar(255) NOT NULL,
  `location` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `cars` (`id`, `status`, `color`, `direction`, `reg_number`, `year`, `brand`, `model`, `currency`, `planting_costs`, `driver_phone`, `costs_per_1`, `car_photo`, `location`) VALUES
(1,	1,	'red',	300,	'AA 2334 AE',	'2014',	'Audi',	'A4',	'hrn',	20.00,	'380976357289',	30.00,	'http://example.com/data/cars/mercedes-ml.png',	'{\"lat\":\"23.333\",\"lan\":\"45.3434\"}'),
(2,	1,	'blue',	210,	'AE 4432 AB',	'2011',	'BMW',	'375i',	'hrn',	50.00,	'380676355449',	40.00,	'http://example.com/data/cars/bmw-37-ml.png',	'{\"lat\":\"25.233\",\"lan\":\"44.1434\"}'),
(3,	0,	'green',	300,	'AA 2334 AE',	'2014',	'Opel',	'Insignia',	'hrn',	20.00,	'380976357289',	30.00,	'http://example.com/data/cars/mercedes-ml.png',	'{\"lat\":\"24.333\",\"lan\":\"46.3434\"}'),
(4,	1,	'black',	210,	'AE 4432 AB',	'2011',	'BMW',	'375i',	'hrn',	50.00,	'380676355449',	40.00,	'http://example.com/data/cars/bmw-37-ml.png',	'{\"lat\":\"22.233\",\"lan\":\"43.1434\"}');

DROP TABLE IF EXISTS `drivers`;
CREATE TABLE `drivers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `car_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `drivers` (`id`, `name`, `car_id`, `status`) VALUES
(1,	'Anton',	1,	1),
(2,	'Slava',	2,	1),
(3,	'Dima',	3,	0);

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passanger_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) DEFAULT NULL,
  `user_location` text NOT NULL,
  `car_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `pass_phone` varchar(50) NOT NULL,
  `region_id` int(11) NOT NULL,
  `route_points` text NOT NULL,
  `start_time` datetime NOT NULL,
  `pass_count` tinyint(1) NOT NULL,
  `callme` tinyint(1) NOT NULL,
  `large` tinyint(1) NOT NULL,
  `pets` tinyint(1) NOT NULL,
  `wishlist_option_id` text NOT NULL,
  `baby_chair` varchar(255) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `deffered_payment` tinyint(4) NOT NULL,
  `duration` int(11) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `passanger_id` (`passanger_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`passanger_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `orders` (`id`, `passanger_id`, `status`, `active`, `user_location`, `car_id`, `driver_id`, `country_id`, `pass_phone`, `region_id`, `route_points`, `start_time`, `pass_count`, `callme`, `large`, `pets`, `wishlist_option_id`, `baby_chair`, `payment_type_id`, `deffered_payment`, `duration`, `extension`, `comment`) VALUES
(2,	3,	5,	NULL,	'[\"22.333\",\"34.455\"]',	32,	1,	1,	'380996783492',	2,	'[\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\"]',	'2016-09-25 14:55:00',	4,	0,	1,	1,	'[\"1\",\"2\"]',	'1-4',	1,	1,	12,	'1:33:00',	'test comment'),
(3,	3,	0,	0,	'[\"22.333\",\"34.455\"]',	32,	1,	1,	'380996783492',	2,	'[\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\"]',	'2016-09-25 14:55:00',	4,	0,	1,	1,	'[\"1\",\"2\"]',	'1-4',	1,	1,	12,	'1:33:00',	'test comment'),
(4,	3,	0,	0,	'[\"22.333\",\"34.455\"]',	32,	1,	1,	'380996783492',	2,	'[\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\"]',	'2016-09-25 14:55:00',	4,	0,	1,	1,	'[\"1\",\"2\"]',	'1-4',	1,	1,	12,	'1:33:00',	'test comment'),
(5,	3,	0,	0,	'[\"22.333\",\"34.455\"]',	32,	1,	1,	'380996783492',	2,	'[\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\"]',	'2016-09-25 14:55:00',	4,	0,	1,	1,	'[\"1\",\"2\"]',	'1-4',	1,	1,	12,	'1:33:00',	'test comment'),
(6,	3,	0,	0,	'[\"22.333\",\"34.455\"]',	32,	1,	1,	'380996783492',	2,	'[\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\"]',	'2016-09-25 14:55:00',	4,	0,	1,	1,	'[\"1\",\"2\"]',	'1-4',	1,	1,	12,	'1:33:00',	'test comment'),
(7,	3,	0,	0,	'[\"22.333\",\"34.455\"]',	32,	1,	1,	'380996783492',	2,	'[\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\"]',	'2016-09-25 14:55:00',	4,	0,	1,	1,	'[\"1\",\"2\"]',	'1-4',	1,	1,	12,	'1:33:00',	'test comment'),
(8,	3,	0,	0,	'[\"22.333\",\"34.455\"]',	32,	1,	1,	'380996783492',	2,	'[\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\"]',	'2016-09-25 14:55:00',	4,	0,	1,	1,	'[\"1\",\"2\"]',	'1-4',	1,	1,	12,	'1:33:00',	'test comment'),
(9,	3,	0,	0,	'[\"22.333\",\"34.455\"]',	32,	1,	1,	'380996783492',	2,	'[\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\"]',	'2016-09-25 14:55:00',	4,	0,	1,	1,	'[\"1\",\"2\"]',	'1-4',	1,	1,	12,	'1:33:00',	'test comment'),
(10,	3,	0,	0,	'[\"22.333\",\"34.455\"]',	32,	1,	1,	'380996783492',	2,	'[\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\"]',	'2016-09-25 14:55:00',	4,	0,	1,	1,	'[\"1\",\"2\"]',	'1-4',	1,	1,	12,	'1:33:00',	'test comment'),
(11,	3,	0,	0,	'[\"22.333\",\"34.455\"]',	32,	1,	1,	'380996783492',	2,	'[\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\"]',	'2016-09-25 14:55:00',	4,	0,	1,	1,	'[\"1\",\"2\"]',	'1-4',	1,	1,	12,	'1:33:00',	'test comment'),
(12,	3,	0,	0,	'[\"22.333\",\"34.455\"]',	32,	1,	1,	'380996783492',	2,	'[\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\"]',	'2016-09-25 14:55:00',	4,	0,	1,	1,	'[\"1\",\"2\"]',	'1-4',	1,	1,	12,	'1:33:00',	'test comment'),
(13,	3,	0,	0,	'[\"22.333\",\"34.455\"]',	32,	1,	1,	'380996783492',	2,	'[\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\",\"\\\"adress\\\":\\\"Ukraine, Dnipro, Malinovskogo 2\\\",\\\"lat\\\":\\\"45.32323\\\",\\\"lon\\\":\\\"39.544645\\\",\\\"sort\\\":\\\"1\\\"\"]',	'2016-09-25 14:55:00',	4,	0,	1,	1,	'[\"1\",\"2\"]',	'1-4',	1,	1,	12,	'1:33:00',	'test comment');

DROP TABLE IF EXISTS `orders_status`;
CREATE TABLE `orders_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `orders_status` (`id`, `status`) VALUES
(1,	'Водитель принял заказ'),
(5,	'Водитель отклонил заказ');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `access_token` char(16) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `name`, `password`, `phone`, `access_token`, `status`, `country_id`) VALUES
(1,	'slava',	'827ccb0eea8a706c4c34a16891f84e7b',	'+380501883638',	'q1w2e3r4t5y6uf27',	1,	1),
(2,	'testuser',	'827ccb0eea8a706c4c34a16891f84e7b',	'+380501883639',	'67a8e0f3c8438f27',	1,	1),
(3,	'testuser1',	'827ccb0eea8a706c4c34a16891f84e7b',	'+380501883637',	'37d18fc1616795af',	1,	1),
(4,	'testuser2',	'fe703d258c7ef5f50b71e06565a65aa07194907f',	'+380501883636',	'9cdbd1a3af233f1c',	1,	1);

-- 2017-12-22 02:09:36
