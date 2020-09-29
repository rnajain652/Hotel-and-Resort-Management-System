DROP DATABASE IF EXISTS `HOTEL_RESORT`;
CREATE SCHEMA `HOTEL_RESORT`;
USE `HOTEL_RESORT`;

DROP TABLE IF EXISTS `HOTEL`;

CREATE TABLE `HOTEL` (
	`Hotel_id` int(10) NOT NULL,
	`Hotel_name` varchar(50) NOT NULL,
	`Hotel_contact_number` int(10) NOT NULL,
	`Street_number` int(3) NOT NULL,
	`City` varchar(20) NOT NULL,
	`Ratings` int(2) DEFAULT NULL,
	PRIMARY KEY (`Hotel_id`),
	UNIQUE KEY `Hotel_name` (`Hotel_name`)	
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `HOTEL` WRITE;
INSERT INTO `HOTEL` VALUES ('1', 'blah', '1234567890', '2', 'qwerty', '6'),('2', 'blahblah', '1234567890', '6', 'qwerty', '6'),('3', 'b', '1234567890', '2', 'qwerty', '6');
UNLOCK TABLES;

DROP TABLE IF EXISTS `DEPARTMENT`;

CREATE TABLE `DEPARTMENT` (
	`Department_number` int(12) NOT NULL,
	`Department_name` varchar(50) NOT NULL,
	`Department_contact_number` int(10) NOT NULL,
	`H_id` int(10) NOT NULL,
	PRIMARY KEY (`Department_number`),
	CONSTRAINT `DEPARTMENT_ibfk_1` FOREIGN KEY (`H_id`) REFERENCES `HOTEL` (`Hotel_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `DEPARTMENT` WRITE;
INSERT INTO `DEPARTMENT` VALUES ('251', 'blah', '1234567890', '2'),('252', 'blahblah', '1234567890', '3'),('323', 'b', '1234567890', '1');
UNLOCK TABLES;

