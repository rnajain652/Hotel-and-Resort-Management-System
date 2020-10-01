DROP DATABASE IF EXISTS `HOTEL_RESORT`;
CREATE SCHEMA `HOTEL_RESORT`;
USE `HOTEL_RESORT`;

DROP TABLE IF EXISTS `HOTEL`;

CREATE TABLE `HOTEL` (
	`Hotel_id` int(10) NOT NULL,
	`Hotel_name` varchar(50) NOT NULL,
	`Hotel_contact_number` int(10) NOT NULL,
	`Street_number` int(3) NOT NULL UNIQUE,
	`City` varchar(20) NOT NULL UNIQUE,
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

DROP TABLE IF EXISTS `ROOM`;

CREATE TABLE `ROOM` (
	`Room_number` int(12) UNIQUE NOT NULL,
	`Room_category` varchar(50) NOT NULL,
	`Is_available` int(1) NOT NULL,
	`Cost` int(5) NOT NULL,
	`Number_of_people_staying` int(2) NOT NULL,
	`H_id` int(10) NOT NULL,
	CONSTRAINT `ROOM_ibfk_1` FOREIGN KEY (`H_id`) REFERENCES `HOTEL` (`Hotel_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `ROOM` WRITE;
INSERT INTO `ROOM` VALUES ('251', 'blah', '1', '2000', '2', '1'),('252', 'blahblah', '0', '1500', '3', '2'),('221', 'b', '1', '3000', '2', '1');
UNLOCK TABLES;


DROP TABLE IF EXISTS `PAYMENT`;

CREATE TABLE `PAYMENT` (
	`Payment_id` varchar(12) NOT NULL,
	`Amount` int(10) NOT NULL,
	`Payment_mode` varchar(50) NOT NULL,
	`Date` date NOT NULL,
	PRIMARY KEY (`Payment_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `PAYMENT` WRITE;
INSERT INTO `PAYMENT` VALUES ('123456789123', '1000', 'Debit card', '1919-04-20'),('123457123478', '1500', 'Cash', '1919-01-27'),('123454569128', '1200', 'Cash', '1919-05-12');
UNLOCK TABLES;


DROP TABLE IF EXISTS `CUSTOMER`;

CREATE TABLE `CUSTOMER` (
	`Customer_id` varchar(12) NOT NULL,
	`Email` varchar(50),
	`F_name` varchar(50) NOT NULL,
	`L_name` varchar(50) NOT NULL,
	PRIMARY KEY (`Customer_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `CUSTOMER` WRITE;
INSERT INTO `CUSTOMER` VALUES ('12345', 'blah', 'Sam', 'Shastri'),('12346', 'blah', 'Tanvi', 'Narsapur'), ('12347', 'blah', 'Pranjal', 'Jain');
UNLOCK TABLES;

CREATE TABLE `CUSTOMER_CONTACT` (
	`Cust_identity` varchar(12) NOT NULL,
	`C_contact_no` int(10) NOT NULL,
	PRIMARY KEY (`C_contact_no`),
	CONSTRAINT `CUSTOMER_CONTACT_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `CUSTOMER` (`Customer_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `CUSTOMER_CONTACT` WRITE;
INSERT INTO `CUSTOMER` VALUES ('12345', '1234567890'),('12346', '1234567891'), ('12347', '1234567892'), ('12345', '1234967890');
UNLOCK TABLES;

CREATE TABLE `CUSTOMER_ADDRESS` (
	`Customer_id` varchar(12) NOT NULL,
	`Cust_address` varchar(100),
	PRIMARY KEY (`Cust_address`),
	CONSTRAINT `CUSTOMER_ADDRESS_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `CUSTOMER` (`Customer_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `CUSTOMER` WRITE;
INSERT INTO `CUSTOMER` VALUES ('12345', 'cidco, abad'),('12346', 'padampura, abad'), ('12347', 'indore');
UNLOCK TABLES;


DROP TABLE IF EXISTS `ID_PROOF`;

CREATE TABLE `ID_PROOF` (
	`Gender` char NOT NULL,
	`ID_Type` varchar(50) NOT NULL,
	`ID_Number` varchar(50) NOT NULL,
	`DOB` date NOT NULL,
	`Cust_id` varchar(12) NOT NULL,
	CONSTRAINT `ID_PROOF_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `CUSTOMER` (`Customer_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `ID_PROOF` WRITE;
INSERT INTO `ID_PROOF` VALUES ('F', 'Aadhar number', '123456780987', '2001-04-20', '12345'),('F', 'Passport', '23456789987', '2001-01-27', '12346'),('F', 'PAN', '234567899HW87', '2001-01-27', '12346');
UNLOCK TABLES;

DROP TABLE IF EXISTS `RESERVATION`;

CREATE TABLE `RESERVATION` (
	`Pay_id` varchar(12) NOT NULL,
	`Hotel_id` int(10) NOT NULL,
	`Room_num` int(12) NOT NULL,
	`Cust_id_num` varchar(12) NOT NULL,
	`Reserve_id` varchar(15) NOT NULL,
	`Checkin_date` date NOT NULL,
	`Checkout_date` date NOT NULL,
	PRIMARY KEY (`Reserve_id`),
	CONSTRAINT `RESERVATION_ibfk_1` FOREIGN KEY (`Cust_id_num`) REFERENCES `CUSTOMER` (`Customer_id`),
	CONSTRAINT `RESERVATION_ibfk_2` FOREIGN KEY (`Room_num`) REFERENCES `ROOM` (`Room_number`),
	CONSTRAINT `RESERVATION_ibfk_3` FOREIGN KEY (`Pay_id`) REFERENCES `PAYMENT` (`Payment_id`),
	CONSTRAINT `RESERVATION_ibfk_4` FOREIGN KEY (`Hotel_id`) REFERENCES `HOTEL` (`Hotel_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `RESERVATION` WRITE;
INSERT INTO `RESERVATION` VALUES ('123456789123', '1', '251', '12345', 'R12312720', '2020-3-12', '2020-3-15'),('123457123478', '2', '252', '12346', 'R12312721', '2020-4-12', '2020-4-15'),('123454569128', '3', '221', '12346', 'R12312722', '2020-5-12', '2020-5-15');  
UNLOCK TABLES;

DROP TABLE IF EXISTS `FOOD_ITEM`;

CREATE TABLE `FOOD_ITEM1` (
	`Item_no` int(5) NOT NULL,
	`Cust_id` varchar(50) NOT NULL,
	CONSTRAINT `FOOD_ITEM_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `CUSTOMER` (`Customer_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `FOOD_ITEM1` WRITE;
INSERT INTO `FOOD_ITEM1` VALUES ('4', '12345'),('2', '12346'),('3', '12346');
UNLOCK TABLES;