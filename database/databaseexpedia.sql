/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 8.0.43 : Database - expedia
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`expedia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `expedia`;

/*Table structure for table `aircraft` */

DROP TABLE IF EXISTS `aircraft`;

CREATE TABLE `aircraft` (
  `AircraftId` int NOT NULL AUTO_INCREMENT,
  `AirlineId` int DEFAULT NULL,
  `AircraftName` varchar(50) DEFAULT NULL,
  `AircraftType` varchar(30) DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  PRIMARY KEY (`AircraftId`),
  KEY `AirlineId` (`AirlineId`),
  CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`AirlineId`) REFERENCES `airline` (`AirlineId`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `aircraft` */

insert  into `aircraft`(`AircraftId`,`AirlineId`,`AircraftName`,`AircraftType`,`Capacity`) values 
(61,11,'Boeing 737','Passenger',180),
(62,12,'Airbus A320','Passenger',160),
(63,13,'Boeing 777','Passenger',300),
(64,14,'Embraer 190','Passenger',100),
(65,15,'Bombardier CRJ900','Passenger',90),
(66,16,'Cessna 172','Private',4),
(67,17,'Boeing 747','Passenger',400),
(68,18,'Airbus A330','Passenger',280),
(69,19,'Gulfstream G650','Private',18),
(70,20,'Boeing 767','Passenger',250);

/*Table structure for table `airline` */

DROP TABLE IF EXISTS `airline`;

CREATE TABLE `airline` (
  `AirlineId` int NOT NULL AUTO_INCREMENT,
  `CountryId` int DEFAULT NULL,
  `AirlineName` varchar(30) DEFAULT NULL,
  `AirlineLogo` tinyblob,
  `Airlinecode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AirlineId`),
  KEY `CountryId` (`CountryId`),
  CONSTRAINT `airline_ibfk_1` FOREIGN KEY (`CountryId`) REFERENCES `country` (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `airline` */

insert  into `airline`(`AirlineId`,`CountryId`,`AirlineName`,`AirlineLogo`,`Airlinecode`) values 
(11,1,'Kenya Airways',NULL,'KQ'),
(12,2,'Delta Airlines',NULL,'DL'),
(13,3,'Emirates',NULL,'EK'),
(14,4,'Qatar Airways',NULL,'QR'),
(15,5,'British Airways',NULL,'BA'),
(16,6,'Lufthansa',NULL,'LH'),
(17,7,'Air France',NULL,'AF'),
(18,8,'Turkish Airlines',NULL,'TK'),
(19,9,'Singapore Airlines',NULL,'SQ'),
(20,10,'American Airlines',NULL,'AA');

/*Table structure for table `airport` */

DROP TABLE IF EXISTS `airport`;

CREATE TABLE `airport` (
  `AirportId` int NOT NULL AUTO_INCREMENT,
  `CityId` int DEFAULT NULL,
  `AirportCode` varchar(15) DEFAULT NULL,
  `AirportName` varchar(50) DEFAULT NULL,
  `Location` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`AirportId`),
  KEY `CityId` (`CityId`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`CityId`) REFERENCES `city` (`CityId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `airport` */

insert  into `airport`(`AirportId`,`CityId`,`AirportCode`,`AirportName`,`Location`) values 
(1,1,'NBO','Jomo Kenyatta International','Nairobi, Kenya'),
(2,2,'JFK','John F. Kennedy International','New York, USA'),
(3,3,'DXB','Dubai International','Dubai, UAE'),
(4,4,'DOH','Hamad International','Doha, Qatar'),
(5,5,'LHR','Heathrow Airport','London, UK'),
(6,6,'FRA','Frankfurt Airport','Frankfurt, Germany'),
(7,7,'CDG','Charles de Gaulle Airport','Paris, France'),
(8,8,'IST','Istanbul Airport','Istanbul, Turkey'),
(9,9,'SIN','Singapore Changi','Singapore'),
(10,10,'YYZ','Toronto Pearson International','Toronto, Canada'),
(11,11,'LAX','Los Angeles International','Los Angeles, USA');

/*Table structure for table `baggage` */

DROP TABLE IF EXISTS `baggage`;

CREATE TABLE `baggage` (
  `BaggageId` int NOT NULL AUTO_INCREMENT,
  `PassengerId` int DEFAULT NULL,
  `FlightId` int DEFAULT NULL,
  `BaggageWeight` decimal(20,0) DEFAULT NULL,
  `BaggageStatus` varchar(15) DEFAULT NULL,
  `TagNumber` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`BaggageId`),
  KEY `FlightId` (`FlightId`),
  KEY `baggage_ibfk_2` (`PassengerId`),
  CONSTRAINT `baggage_ibfk_2` FOREIGN KEY (`PassengerId`) REFERENCES `passenger` (`PassengerId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `baggage` */

insert  into `baggage`(`BaggageId`,`PassengerId`,`FlightId`,`BaggageWeight`,`BaggageStatus`,`TagNumber`) values 
(1,1,1,24,'Checked-in','TAG001'),
(2,2,1,18,'Checked-in','TAG002'),
(3,3,2,25,'Checked-in','TAG003'),
(4,4,2,21,'Checked-in','TAG004'),
(5,5,3,29,'Checked-in','TAG005'),
(6,6,3,22,'Checked-in','TAG006'),
(7,7,4,20,'Checked-in','TAG007'),
(8,8,4,24,'Checked-in','TAG008'),
(9,9,5,21,'Checked-in','TAG009'),
(10,10,5,26,'Checked-in','TAG010');

/*Table structure for table `booking` */

DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
  `BookingId` int unsigned NOT NULL AUTO_INCREMENT,
  `SeatId` int DEFAULT NULL,
  `PassengerId` int DEFAULT NULL,
  `FlightId` int DEFAULT NULL,
  `AircraftId` int DEFAULT NULL,
  `RouteId` int DEFAULT NULL,
  `DocumentId` int DEFAULT NULL,
  `BookingClassId` int DEFAULT NULL,
  `PaymentStatus` tinytext,
  PRIMARY KEY (`BookingId`),
  KEY `booking_ibfk_1` (`FlightId`),
  KEY `booking_ibfk_2` (`PassengerId`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`FlightId`) REFERENCES `flight` (`FlightId`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`PassengerId`) REFERENCES `passenger` (`PassengerId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `booking` */

insert  into `booking`(`BookingId`,`SeatId`,`PassengerId`,`FlightId`,`AircraftId`,`RouteId`,`DocumentId`,`BookingClassId`,`PaymentStatus`) values 
(11,1,1,1,1,1,1,1,'Paid'),
(12,2,2,1,1,1,2,2,'Pending'),
(13,3,3,2,2,2,3,1,'Paid'),
(14,4,4,2,2,2,4,2,'Pending'),
(15,5,5,3,3,3,5,3,'Paid'),
(16,6,6,3,3,3,6,3,'Pending'),
(17,7,7,4,4,4,7,4,'Paid'),
(18,8,8,4,4,4,8,4,'Pending'),
(19,9,9,5,5,5,9,5,'Paid'),
(20,10,10,5,5,5,10,5,'Pending');

/*Table structure for table `bookingclass` */

DROP TABLE IF EXISTS `bookingclass`;

CREATE TABLE `bookingclass` (
  `BookingClassId` int NOT NULL AUTO_INCREMENT,
  `BookingClassName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BookingClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `bookingclass` */

insert  into `bookingclass`(`BookingClassId`,`BookingClassName`) values 
(1,'Economy'),
(2,'Premium Economy'),
(3,'Business'),
(4,'First Class'),
(5,'Luxury'),
(6,'Discount'),
(7,'Charter'),
(8,'Flexible'),
(9,'Standard');

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `CityId` int NOT NULL AUTO_INCREMENT,
  `CityName` varchar(90) NOT NULL,
  `CountryId` int DEFAULT NULL,
  PRIMARY KEY (`CityId`),
  KEY `CountryId` (`CountryId`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`CountryId`) REFERENCES `country` (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `city` */

insert  into `city`(`CityId`,`CityName`,`CountryId`) values 
(1,'Nairobi',1),
(2,'New York',2),
(3,'Dubai',3),
(4,'Doha',4),
(5,'London',5),
(6,'Frankfurt',6),
(7,'Paris',7),
(8,'Istanbul',8),
(9,'Singapore',9),
(10,'Toronto',10),
(11,'Los Angeles',2),
(13,'Berlin',6),
(14,'Mainz',6);

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `CountryId` int NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `country` */

insert  into `country`(`CountryId`,`CountryName`) values 
(1,'Kenya'),
(2,'USA'),
(3,'UAE'),
(4,'Qatar'),
(5,'UK'),
(6,'Germany'),
(7,'France'),
(8,'Turkey'),
(9,'Singapore'),
(10,'Canada'),
(11,'Jamaica'),
(12,'Trinidad'),
(13,'Guyana'),
(14,'Lebanon'),
(15,'Morocco'),
(17,'Puerto Rico');

/*Table structure for table `flight` */

DROP TABLE IF EXISTS `flight`;

CREATE TABLE `flight` (
  `FlightId` int NOT NULL AUTO_INCREMENT,
  `FlightNo` int DEFAULT NULL,
  `AirlineId` int DEFAULT NULL,
  `DepartureAirport` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DestinationAirport` varchar(90) DEFAULT NULL,
  `Duration` time DEFAULT NULL,
  PRIMARY KEY (`FlightId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `flight` */

insert  into `flight`(`FlightId`,`FlightNo`,`AirlineId`,`DepartureAirport`,`DestinationAirport`,`Duration`) values 
(1,101,1,'Jomo Kenyatta International','Heathrow Airport','08:30:00'),
(2,102,2,'Heathrow Airport','JFK Airport','07:50:00'),
(3,103,3,'Dubai International','London Heathrow','07:10:00'),
(4,104,4,'Hamad International','Charles de Gaulle','06:45:00'),
(5,105,5,'Heathrow Airport','John F. Kennedy Airport','07:50:00'),
(6,106,6,'Frankfurt Airport','Singapore Changi','12:00:00'),
(7,107,7,'Charles de Gaulle','Dubai International','06:40:00'),
(8,108,8,'Istanbul Airport','Heathrow Airport','04:00:00'),
(9,109,9,'Singapore Changi','Los Angeles Airport','16:30:00'),
(10,110,10,'Toronto Pearson','John F. Kennedy Airport','01:50:00');

/*Table structure for table `passenger` */

DROP TABLE IF EXISTS `passenger`;

CREATE TABLE `passenger` (
  `PassengerId` int NOT NULL AUTO_INCREMENT,
  `PassengerName` varchar(50) DEFAULT NULL,
  `Nationality` varchar(90) DEFAULT NULL,
  `DateOfBirth` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`PassengerId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `passenger` */

insert  into `passenger`(`PassengerId`,`PassengerName`,`Nationality`,`DateOfBirth`) values 
(1,'John Doe','Kenya','1990-05-15 00:00:00.000000'),
(2,'Jane Smith','USA','1985-12-02 00:00:00.000000'),
(3,'Ali Mohamed','Egypt','1992-07-21 00:00:00.000000'),
(4,'Mary Johnson','Canada','1988-03-10 00:00:00.000000'),
(5,'Peter Okello','Uganda','1995-11-05 00:00:00.000000'),
(6,'Linda Wang','China','1991-08-17 00:00:00.000000'),
(7,'Samuel Kimani','Kenya','1987-02-25 00:00:00.000000'),
(8,'Fatima Hassan','Somalia','1993-06-30 00:00:00.000000'),
(9,'David Brown','UK','1984-09-12 00:00:00.000000'),
(10,'Sophia Martinez','Mexico','1996-01-20 00:00:00.000000');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `PaymentId` int NOT NULL AUTO_INCREMENT,
  `BookingId` int unsigned DEFAULT NULL,
  `PaymentDate` datetime(6) DEFAULT NULL,
  `PaymentMethod` varchar(15) DEFAULT NULL,
  `AmountPaid` decimal(20,0) DEFAULT NULL,
  PRIMARY KEY (`PaymentId`),
  KEY `payment_ibfk_1` (`BookingId`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BookingId`) REFERENCES `booking` (`BookingId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `payment` */

insert  into `payment`(`PaymentId`,`BookingId`,`PaymentDate`,`PaymentMethod`,`AmountPaid`) values 
(41,11,'2025-08-17 10:00:00.000000','Credit Card',500),
(42,12,'2025-08-17 10:15:00.000000','Debit Card',450),
(43,13,'2025-08-17 10:30:00.000000','PayPal',600),
(44,14,'2025-08-17 10:45:00.000000','Credit Card',550),
(45,15,'2025-08-17 11:00:00.000000','Bank Transfer',700),
(46,16,'2025-08-17 11:15:00.000000','Debit Card',650),
(47,17,'2025-08-17 11:30:00.000000','PayPal',800),
(48,18,'2025-08-17 11:45:00.000000','Credit Card',750),
(49,19,'2025-08-17 12:00:00.000000','Bank Transfer',900),
(50,20,'2025-08-17 12:15:00.000000','Debit Card',850);

/*Table structure for table `route` */

DROP TABLE IF EXISTS `route`;

CREATE TABLE `route` (
  `RouteId` int NOT NULL AUTO_INCREMENT,
  `AirportId` int DEFAULT NULL,
  `AirlineId` int DEFAULT NULL,
  `SourceAirportCode` varchar(15) DEFAULT NULL,
  `DestinationAirportCode` varchar(15) DEFAULT NULL,
  `Distance` decimal(20,0) DEFAULT NULL,
  `Duration` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`RouteId`),
  KEY `AirlineId` (`AirlineId`),
  KEY `route_ibfk_1` (`AirportId`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`AirportId`) REFERENCES `airport` (`AirportId`),
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`AirlineId`) REFERENCES `airline` (`AirlineId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `route` */

insert  into `route`(`RouteId`,`AirportId`,`AirlineId`,`SourceAirportCode`,`DestinationAirportCode`,`Distance`,`Duration`) values 
(21,1,11,'NBO','LHR',6801,'08:30'),
(22,2,15,'LHR','JFK',5540,'07:50'),
(23,3,13,'DXB','LHR',5500,'07:10'),
(24,4,14,'DOH','CDG',4900,'06:45'),
(25,6,16,'FRA','SIN',10200,'12:00'),
(26,7,17,'CDG','DXB',5200,'06:40'),
(27,8,18,'IST','LHR',2500,'04:00'),
(28,9,19,'SIN','LAX',14100,'16:30'),
(29,10,20,'YYZ','JFK',600,'01:50');

/*Table structure for table `seat` */

DROP TABLE IF EXISTS `seat`;

CREATE TABLE `seat` (
  `SeatId` int NOT NULL AUTO_INCREMENT,
  `FlightId` int DEFAULT NULL,
  `SeatName` varchar(10) DEFAULT NULL,
  `BookingClassId` int DEFAULT NULL,
  `AvailabilityStatus` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SeatId`),
  KEY `seat_ibfk_2` (`FlightId`),
  KEY `seat_ibfk_1` (`BookingClassId`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`BookingClassId`) REFERENCES `bookingclass` (`BookingClassId`),
  CONSTRAINT `seat_ibfk_2` FOREIGN KEY (`FlightId`) REFERENCES `flight` (`FlightId`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `seat` */

insert  into `seat`(`SeatId`,`FlightId`,`SeatName`,`BookingClassId`,`AvailabilityStatus`) values 
(41,1,'1A',1,'Available'),
(42,1,'1B',2,'Available'),
(43,1,'1C',3,'Available'),
(44,2,'2A',1,'Available'),
(45,2,'2B',2,'Available'),
(46,2,'2C',3,'Available'),
(47,3,'3A',1,'Available'),
(48,3,'3B',2,'Available'),
(49,3,'3C',3,'Available'),
(50,4,'4A',1,'Available'),
(51,4,'4B',2,'Available'),
(52,4,'4C',3,'Available'),
(53,5,'5A',1,'Available'),
(54,5,'5B',2,'Available'),
(55,5,'5C',3,'Available'),
(56,6,'6A',1,'Available'),
(57,6,'6B',2,'Available'),
(58,6,'6C',3,'Available'),
(59,7,'7A',1,'Available'),
(60,7,'7B',2,'Available'),
(61,8,'8A',1,'Available'),
(62,8,'8B',2,'Available'),
(63,9,'9A',1,'Available'),
(64,9,'9B',2,'Available'),
(65,10,'10A',1,'Available'),
(66,10,'10B',2,'Available');

/*Table structure for table `ticket` */

DROP TABLE IF EXISTS `ticket`;

CREATE TABLE `ticket` (
  `TicketId` int NOT NULL AUTO_INCREMENT,
  `BookingId` int unsigned DEFAULT NULL,
  `SeatId` int DEFAULT NULL,
  `PassengerId` int DEFAULT NULL,
  `TicketType` varchar(15) DEFAULT NULL,
  `IssueDate` timestamp(6) NULL DEFAULT NULL,
  `Price` decimal(20,0) DEFAULT NULL,
  PRIMARY KEY (`TicketId`),
  KEY `SeatId` (`SeatId`),
  KEY `ticket_ibfk_3` (`PassengerId`),
  KEY `ticket_ibfk_2` (`BookingId`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`SeatId`) REFERENCES `seat` (`SeatId`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`BookingId`) REFERENCES `booking` (`BookingId`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`PassengerId`) REFERENCES `passenger` (`PassengerId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ticket` */

insert  into `ticket`(`TicketId`,`BookingId`,`SeatId`,`PassengerId`,`TicketType`,`IssueDate`,`Price`) values 
(11,11,41,1,'Economy','2025-08-17 09:00:00.000000',500),
(12,12,42,2,'Premium Economy','2025-08-17 09:15:00.000000',550),
(13,13,44,3,'Economy','2025-08-17 09:30:00.000000',600),
(14,14,45,4,'Premium Economy','2025-08-17 09:45:00.000000',650),
(15,15,47,5,'Business','2025-08-17 10:00:00.000000',700),
(16,16,48,6,'Business','2025-08-17 10:15:00.000000',750),
(17,17,50,7,'First Class','2025-08-17 10:30:00.000000',800),
(18,18,51,8,'First Class','2025-08-17 10:45:00.000000',850),
(19,19,53,9,'Luxury','2025-08-17 11:00:00.000000',900),
(20,20,54,10,'Luxury','2025-08-17 11:15:00.000000',950);

/*Table structure for table `traveldocument` */

DROP TABLE IF EXISTS `traveldocument`;

CREATE TABLE `traveldocument` (
  `TravelDocumentId` int NOT NULL AUTO_INCREMENT,
  `DocumentType` varchar(30) DEFAULT NULL,
  `PassengerId` int DEFAULT NULL,
  `DocumentValidity` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`TravelDocumentId`),
  KEY `travel document_ibfk_1` (`PassengerId`),
  CONSTRAINT `traveldocument_ibfk_1` FOREIGN KEY (`PassengerId`) REFERENCES `passenger` (`PassengerId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `traveldocument` */

insert  into `traveldocument`(`TravelDocumentId`,`DocumentType`,`PassengerId`,`DocumentValidity`) values 
(1,'Passport',1,'2030-12-31'),
(2,'Passport',2,'2029-05-20'),
(3,'National ID',3,'2027-08-15'),
(4,'Passport',4,'2031-01-01'),
(5,'Visa',5,'2026-09-30'),
(6,'Passport',6,'2028-07-14'),
(7,'Driving License',7,'2027-04-10'),
(8,'Passport',8,'2032-11-25'),
(9,'National ID',9,'2026-12-19'),
(10,'Passport',10,'2033-02-05');

/* Procedure structure for procedure `sp_createAircraft` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_createAircraft` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createAircraft`(
    IN p_airlineid INT,
    IN p_aircraftname VARCHAR(50),
    IN p_aircrafttype VARCHAR(30),
    IN p_capacity INT
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Aircraft
        WHERE Airlineid = p_airlineid
          AND Aircraftname = p_aircraftname
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An aircraft with this name already exists for this airline.';
    ELSE
        INSERT INTO Aircraft(Airlineid, Aircraftname, Aircrafttype, Capacity)
        VALUES (p_airlineid, p_aircraftname, p_aircrafttype, p_capacity);
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_createAirline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_createAirline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createAirline`(
    IN p_countryid INT,
    IN p_airlinename VARCHAR(30),
    IN p_airlinelogo BLOB,
    IN p_airlinecode VARCHAR(20)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Airline
        WHERE Countryid = p_countryid
          AND airlinecode = p_airlinecode
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An airline with this code already exists in this country.';
    ELSE
        INSERT INTO Airline(Countryid, airlinename, airlinelogo, airlinecode)
        VALUES (p_countryid, p_airlinename, p_airlinelogo, p_airlinecode);
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_createAirport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_createAirport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createAirport`(
    IN p_cityid INT,
    IN p_airportcode VARCHAR(15),
    IN p_airportname VARCHAR(50),
    IN p_location VARCHAR(30)
)
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM Airport 
        WHERE Cityid = p_cityid 
          AND Airportcode = p_airportcode
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An airport with this code already exists in this city.';
    ELSE
        INSERT INTO Airport(Cityid, Airportcode, Airportname, location)
        VALUES (p_cityid, p_airportcode, p_airportname, p_location);
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CreateBaggage` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CreateBaggage` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CreateBaggage`(
    IN p_passengerid INT,
    IN p_flightid INT,
    IN p_baggageweight DECIMAL(20,2),
    IN p_baggagestatus VARCHAR(15),
    IN p_tagnumber VARCHAR(18),
    OUT p_newbaggageid INT
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Baggage
        WHERE Passengerid = p_passengerid
          AND Flightid = p_flightid
          AND Tagnumber = p_tagnumber
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This baggage already exists for this passenger, flight, and tag number.';
    ELSE
        INSERT INTO Baggage(Passengerid, Flightid, Baggageweight, Baggagestatus, Tagnumber)
        VALUES (p_passengerid, p_flightid, p_baggageweight, p_baggagestatus, p_tagnumber);
        
        SET p_newbaggageid = LAST_INSERT_ID();
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_createBooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_createBooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createBooking`(
    IN p_seatid INT,
    IN p_passengerid INT,
    IN p_flightid INT,
    IN p_aircraftid INT,
    IN p_routeid INT,
    IN p_documentid INT,
    IN p_bookingclassid INT,
    IN p_paymentstatus VARCHAR(50)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Booking
        WHERE Passengerid = p_passengerid
          AND Flightid = p_flightid
          AND Seatid = p_seatid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This passenger already has a booking for this seat on this flight.';
    ELSE
        INSERT INTO Booking(
            Seatid, Passengerid, Flightid, Aircraftid, Routeid, Documentid, Bookingclassid, paymentstatus
        ) VALUES (
            p_seatid, p_passengerid, p_flightid, p_aircraftid, p_routeid, p_documentid, p_bookingclassid, p_paymentstatus
        );
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CreateBookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CreateBookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CreateBookingclass`(
    IN p_bookingclassname VARCHAR(30)
)
BEGIN
   
    IF EXISTS (
        SELECT 1
        FROM Bookingclass
        WHERE Bookingclassname = p_bookingclassname
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This booking class name already exists.';
    ELSE
       
        INSERT INTO Bookingclass(Bookingclassname)
        VALUES (p_bookingclassname);
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_createCity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_createCity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createCity`(
    IN p_cityname VARCHAR(90),
    IN p_countryid INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM City WHERE Cityname = p_cityname AND Countryid = p_countryid) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'City already exists in this country.';
    ELSE
        INSERT INTO City (Cityname, Countryid)
        VALUES (p_cityname, p_countryid);
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_createCountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_createCountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createCountry`(IN p_countryname VARCHAR(50))
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Country WHERE Countryname = p_countryname) THEN
        INSERT INTO Country(Countryname) VALUES (p_countryname);
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_createFlight` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_createFlight` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createFlight`(
    IN p_flightno INT,
    IN p_airlineid INT,
    IN p_departureairport VARCHAR(90),
    IN p_destinationairport VARCHAR(90),
    IN p_duration TIME
)
BEGIN
    IF EXISTS (SELECT 1 FROM Flight WHERE flightno = p_flightno AND airlineid = p_airlineid) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Flight already exists for this airline.';
    ELSE
        INSERT INTO Flight (flightno, airlineid, departureairport, destinationairport, duration)
        VALUES (p_flightno, p_airlineid, p_departureairport, p_destinationairport, p_duration);
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_createPassenger` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_createPassenger` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createPassenger`(
    IN p_passengername VARCHAR(50),
    IN p_dateofbirth DATETIME(6),
    IN p_nationality VARCHAR(90)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Passenger
        WHERE PassengerName = p_passengername
          AND Nationality = p_nationality
          AND DateOfBirth = p_dateofbirth
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This passenger already exists.';
    ELSE
        INSERT INTO Passenger (PassengerName, DateOfBirth, Nationality)
        VALUES (p_passengername, p_dateofbirth, p_nationality);
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_createPayment` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_createPayment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createPayment`(
    IN p_bookingid INT,
    IN p_paymentdate DATETIME,
    IN p_paymentmethod VARCHAR(15),
    IN p_amountpaid DECIMAL(20,2)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Payment
        WHERE Bookingid = p_bookingid
          AND Paymentdate = p_paymentdate
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A payment for this booking at this date already exists.';
    ELSE
        INSERT INTO Payment(Bookingid, Paymentdate, paymentmethod, Amountpaid)
        VALUES (p_bookingid, p_paymentdate, p_paymentmethod, p_amountpaid);
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_createRoute` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_createRoute` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createRoute`(
    IN p_airportid INT,
    IN p_airlineid INT,
    IN p_sourceairportcode VARCHAR(15),
    IN p_destinationairportcode VARCHAR(15),
    IN p_distance DECIMAL(20,2),
    IN p_duration VARCHAR(18)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM route
        WHERE airlineid = p_airlineid
          AND sourceairportcode = p_sourceairportcode
          AND destinationairportcode = p_destinationairportcode
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This route already exists for this airline.';
    ELSE
        INSERT INTO route(airportid, airlineid, sourceairportcode, destinationairportcode, distance, duration)
        VALUES (p_airportid, p_airlineid, p_sourceairportcode, p_destinationairportcode, p_distance, p_duration);
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CreateSeat` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CreateSeat` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CreateSeat`(
    IN p_flightid INT,
    IN p_seatname VARCHAR(10),
    IN p_bookingclassid INT,
    IN p_availabilitystatus VARCHAR(30),
    OUT p_newseatid INT
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Seat
        WHERE Flightid = p_flightid
          AND Seatname = p_seatname
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This seat already exists for this flight.';
    ELSE
        INSERT INTO Seat(Flightid, Seatname, Bookingclassid, Availabilitystatus)
        VALUES (p_flightid, p_seatname, p_bookingclassid, p_availabilitystatus);
        
        SET p_newseatid = LAST_INSERT_ID();
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_createTicket` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_createTicket` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createTicket`(
    IN p_bookingid INT,
    IN p_seatid INT,
    IN p_passengerid INT,
    IN p_tickettype VARCHAR(15),
    IN p_issuedate TIMESTAMP,
    IN p_price DECIMAL(20,2)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Ticket
        WHERE Bookingid = p_bookingid
          AND Seatid = p_seatid
          AND Passengerid = p_passengerid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This passenger already has a ticket for this seat in this booking.';
    ELSE
        INSERT INTO Ticket(Bookingid, Seatid, Passengerid, Tickettype, issuedate, Price)
        VALUES (p_bookingid, p_seatid, p_passengerid, p_tickettype, p_issuedate, p_price);
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CreateTravelDocument` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CreateTravelDocument` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CreateTravelDocument`(
    IN p_documenttype VARCHAR(30),
    IN p_passengerid INT,
    IN p_documentvalidity VARCHAR(20),
    OUT p_newdocumentid INT
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM traveldocument
        WHERE PassengerId = p_passengerid
          AND DocumentType = p_documenttype
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This document type already exists for this passenger.';
    ELSE
        INSERT INTO traveldocument (DocumentType, PassengerId, DocumentValidity)
        VALUES (p_documenttype, p_passengerid, p_documentvalidity);
        
        SET p_newdocumentid = LAST_INSERT_ID();
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteAircraft` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteAircraft` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteAircraft`(
    IN p_aircraftid INT
)
BEGIN
    DELETE FROM Aircraft
    WHERE Aircraftid = p_aircraftid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteAirline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteAirline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteAirline`(
    IN p_airlineid INT
)
BEGIN
    DELETE FROM Airline
    WHERE Airlineid = p_airlineid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteAirport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteAirport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteAirport`(
    IN p_airportid INT
)
BEGIN
    DELETE FROM Airport
    WHERE Airportid = p_airportid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_DeleteBaggage` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_DeleteBaggage` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteBaggage`(
    IN p_baggageid INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Baggage
        WHERE Baggageid = p_baggageid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Baggage does not exist.';
    ELSE
        DELETE FROM Baggage
        WHERE Baggageid = p_baggageid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteBooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteBooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteBooking`(
    IN p_bookingid INT
)
BEGIN
    DELETE FROM Booking
    WHERE Bookingid = p_bookingid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_DeleteBookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_DeleteBookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteBookingclass`(
    IN p_bookingclassid INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Bookingclass
        WHERE Bookingclassid = p_bookingclassid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Booking class does not exist.';
    ELSE
        DELETE FROM Bookingclass
        WHERE Bookingclassid = p_bookingclassid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteCity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteCity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteCity`(
    IN p_cityid INT
)
BEGIN
    DELETE FROM City WHERE Cityid = p_cityid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteCountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteCountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteCountry`(IN p_countryid INT)
BEGIN
    DELETE FROM Country WHERE Countryid = p_countryid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteFlight` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteFlight` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteFlight`(
    IN p_flightid INT
)
BEGIN
    DELETE FROM Flight WHERE flightid = p_flightid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletePassenger` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletePassenger` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletePassenger`(
    IN p_passengerid INT
)
BEGIN
    DELETE FROM Passenger
    WHERE PassengerId = p_passengerid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletePayment` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletePayment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletePayment`(
    IN p_paymentid INT
)
BEGIN
    DELETE FROM Payment
    WHERE Paymentid = p_paymentid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteRoute` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteRoute` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteRoute`(
    IN p_routeid INT
)
BEGIN
    DELETE FROM route
    WHERE routeid = p_routeid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_DeleteSeat` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_DeleteSeat` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteSeat`(
    IN p_seatid INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error occurred during seat deletion.';
    END;

    START TRANSACTION;

    IF NOT EXISTS (
        SELECT 1
        FROM Seat
        WHERE Seatid = p_seatid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Seat does not exist.';
    ELSE
        DELETE FROM Seat
        WHERE Seatid = p_seatid;
        COMMIT;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteTicket` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteTicket` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteTicket`(
    IN p_ticketid INT
)
BEGIN
    DELETE FROM Ticket
    WHERE Ticketid = p_ticketid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_DeleteTravelDocument` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_DeleteTravelDocument` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteTravelDocument`(
    IN p_documentid INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Travel_document
        WHERE Documentid = p_documentid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Travel document does not exist.';
    ELSE
        DELETE FROM Travel_document
        WHERE Documentid = p_documentid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getAllAircraft` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getAllAircraft` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllAircraft`()
BEGIN
    SELECT * FROM Aircraft;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getAllAirlines` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getAllAirlines` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllAirlines`()
BEGIN
    SELECT * FROM Airline;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getAllAirports` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getAllAirports` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllAirports`()
BEGIN
    SELECT * FROM Airport;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_GetAllBaggage` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_GetAllBaggage` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAllBaggage`()
BEGIN
    SELECT Baggageid, Passengerid, Flightid, Baggageweight, Baggagestatus, Tagnumber
    FROM Baggage
    ORDER BY Passengerid, Flightid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_GetAllBookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_GetAllBookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAllBookingclasses`()
BEGIN
    SELECT Bookingclassid, Bookingclassname
    FROM Bookingclass
    ORDER BY Bookingclassname;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getAllBookings` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getAllBookings` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllBookings`()
BEGIN
    SELECT * FROM Booking;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getAllCities` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getAllCities` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllCities`()
BEGIN
    SELECT * FROM City;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getAllCountries` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getAllCountries` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllCountries`()
BEGIN
    SELECT * FROM Country;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getAllFlights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getAllFlights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllFlights`()
BEGIN
    SELECT *
    FROM flight;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getAllPassengers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getAllPassengers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllPassengers`()
BEGIN
    SELECT * FROM Passenger;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getAllPayments` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getAllPayments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllPayments`()
BEGIN
    SELECT * FROM Payment;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getAllRoutes` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getAllRoutes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllRoutes`()
BEGIN
    SELECT * FROM route;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_GetAllSeats` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_GetAllSeats` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAllSeats`()
BEGIN
    SELECT Seatid, Flightid, Seatname, Bookingclassid, Availabilitystatus
    FROM Seat
    ORDER BY Flightid, Seatname;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getAllTickets` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getAllTickets` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllTickets`()
BEGIN
    SELECT * FROM Ticket;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_GetAllTravelDocuments` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_GetAllTravelDocuments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAllTravelDocuments`()
BEGIN
    SELECT Documentid, Documenttype, Passengerid, Documentvalidity
    FROM Travel_document
    ORDER BY Passengerid, Documenttype;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updateAircraft` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updateAircraft` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateAircraft`(
    IN p_aircraftid INT,
    IN p_airlineid INT,
    IN p_aircraftname VARCHAR(50),
    IN p_aircrafttype VARCHAR(30),
    IN p_capacity INT
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Aircraft
        WHERE Airlineid = p_airlineid
          AND Aircraftname = p_aircraftname
          AND Aircraftid <> p_aircraftid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Another aircraft with this name already exists for this airline.';
    ELSE
        UPDATE Aircraft
        SET Airlineid = p_airlineid,
            Aircraftname = p_aircraftname,
            Aircrafttype = p_aircrafttype,
            Capacity = p_capacity
        WHERE Aircraftid = p_aircraftid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updateAirline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updateAirline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateAirline`(
    IN p_airlineid INT,
    IN p_countryid INT,
    IN p_airlinename VARCHAR(30),
    IN p_airlinelogo BLOB,
    IN p_airlinecode VARCHAR(20)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Airline
        WHERE Countryid = p_countryid
          AND airlinecode = p_airlinecode
          AND Airlineid <> p_airlineid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Another airline with this code already exists in this country.';
    ELSE
        UPDATE Airline
        SET Countryid = p_countryid,
            airlinename = p_airlinename,
            airlinelogo = p_airlinelogo,
            airlinecode = p_airlinecode
        WHERE Airlineid = p_airlineid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updateAirport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updateAirport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateAirport`(
    IN p_airportid INT,
    IN p_cityid INT,
    IN p_airportcode VARCHAR(15),
    IN p_airportname VARCHAR(50),
    IN p_location VARCHAR(30)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Airport
        WHERE Cityid = p_cityid
          AND Airportcode = p_airportcode
          AND Airportid <> p_airportid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Another airport with this code already exists in this city.';
    ELSE
        UPDATE Airport
        SET Cityid = p_cityid,
            Airportcode = p_airportcode,
            Airportname = p_airportname,
            location = p_location
        WHERE Airportid = p_airportid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_UpdateBaggage` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_UpdateBaggage` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateBaggage`(
    IN p_baggageid INT,
    IN p_passengerid INT,
    IN p_flightid INT,
    IN p_baggageweight DECIMAL(20,2),
    IN p_baggagestatus VARCHAR(15),
    IN p_tagnumber VARCHAR(18)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Baggage
        WHERE Baggageid = p_baggageid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Baggage does not exist.';
    ELSEIF EXISTS (
        SELECT 1
        FROM Baggage
        WHERE Passengerid = p_passengerid
          AND Flightid = p_flightid
          AND Tagnumber = p_tagnumber
          AND Baggageid != p_baggageid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A baggage with this passenger, flight, and tag number already exists.';
    ELSE
        UPDATE Baggage
        SET Passengerid = p_passengerid,
            Flightid = p_flightid,
            Baggageweight = p_baggageweight,
            Baggagestatus = p_baggagestatus,
            Tagnumber = p_tagnumber
        WHERE Baggageid = p_baggageid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updateBooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updateBooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateBooking`(
    IN p_bookingid INT,
    IN p_seatid INT,
    IN p_passengerid INT,
    IN p_flightid INT,
    IN p_aircraftid INT,
    IN p_routeid INT,
    IN p_documentid INT,
    IN p_bookingclassid INT,
    IN p_paymentstatus VARCHAR(50)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Booking
        WHERE Passengerid = p_passengerid
          AND Flightid = p_flightid
          AND Seatid = p_seatid
          AND Bookingid <> p_bookingid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Another booking already exists for this passenger, seat, and flight.';
    ELSE
        UPDATE Booking
        SET Seatid = p_seatid,
            Passengerid = p_passengerid,
            Flightid = p_flightid,
            Aircraftid = p_aircraftid,
            Routeid = p_routeid,
            Documentid = p_documentid,
            Bookingclassid = p_bookingclassid,
            paymentstatus = p_paymentstatus
        WHERE Bookingid = p_bookingid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_UpdateBookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_UpdateBookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateBookingclass`(
    IN p_bookingclassid INT,
    IN p_bookingclassname VARCHAR(30)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Bookingclass
        WHERE Bookingclassid = p_bookingclassid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Booking class does not exist.';
    ELSEIF EXISTS (
        SELECT 1
        FROM Bookingclass
        WHERE Bookingclassname = p_bookingclassname
          AND Bookingclassid != p_bookingclassid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A booking class with this name already exists.';
    ELSE
        UPDATE Bookingclass
        SET Bookingclassname = p_bookingclassname
        WHERE Bookingclassid = p_bookingclassid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updateCity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updateCity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateCity`(
    IN p_cityid INT,
    IN p_cityname VARCHAR(90),
    IN p_countryid INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM City WHERE Cityname = p_cityname AND Countryid = p_countryid AND Cityid <> p_cityid) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Another city with this name already exists in this country.';
    ELSE
        UPDATE City
        SET Cityname = p_cityname, Countryid = p_countryid
        WHERE Cityid = p_cityid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updateCountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updateCountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateCountry`(IN p_countryid INT, IN p_countryname VARCHAR(50))
BEGIN
    IF EXISTS (SELECT 1 FROM Country WHERE Countryid = p_countryid) THEN
        UPDATE Country SET Countryname = p_countryname WHERE Countryid = p_countryid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updateFlight` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updateFlight` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateFlight`(
    IN p_flightid INT,
    IN p_flightno INT,
    IN p_airlineid INT,
    IN p_departureairport VARCHAR(90),
    IN p_destinationairport VARCHAR(90),
    IN p_duration DATETIME
)
BEGIN
    IF EXISTS (SELECT 1 FROM Flight WHERE flightno = p_flightno AND airlineid = p_airlineid AND flightid <> p_flightid) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Another flight with this number already exists for this airline.';
    ELSE
        UPDATE Flight
        SET flightno = p_flightno,
            airlineid = p_airlineid,
            departureairport = p_departureairport,
            destinationairport = p_destinationairport,
            duration = p_duration
        WHERE flightid = p_flightid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updatePassenger` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updatePassenger` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatePassenger`(
    IN p_passengerid INT,
    IN p_passengername VARCHAR(50),
    IN p_dateofbirth DATETIME(6),
    IN p_nationality VARCHAR(90)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Passenger
        WHERE PassengerName = p_passengername
          AND Nationality = p_nationality
          AND DateOfBirth = p_dateofbirth
          AND PassengerId <> p_passengerid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Another passenger with the same details already exists.';
    ELSE
        UPDATE Passenger
        SET PassengerName = p_passengername,
            DateOfBirth = p_dateofbirth,
            Nationality = p_nationality
        WHERE PassengerId = p_passengerid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updatePayment` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updatePayment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatePayment`(
    IN p_paymentid INT,
    IN p_bookingid INT,
    IN p_paymentdate DATETIME,
    IN p_paymentmethod VARCHAR(15),
    IN p_amountpaid DECIMAL(20,2)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Payment
        WHERE Bookingid = p_bookingid
          AND Paymentdate = p_paymentdate
          AND Paymentid <> p_paymentid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Another payment for this booking at this date already exists.';
    ELSE
        UPDATE Payment
        SET Bookingid = p_bookingid,
            Paymentdate = p_paymentdate,
            paymentmethod = p_paymentmethod,
            Amountpaid = p_amountpaid
        WHERE Paymentid = p_paymentid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updateRoute` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updateRoute` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateRoute`(
    IN p_routeid INT,
    IN p_airportid INT,
    IN p_airlineid INT,
    IN p_sourceairportcode VARCHAR(15),
    IN p_destinationairportcode VARCHAR(15),
    IN p_distance DECIMAL(20,2),
    IN p_duration VARCHAR(18)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM route
        WHERE airlineid = p_airlineid
          AND sourceairportcode = p_sourceairportcode
          AND destinationairportcode = p_destinationairportcode
          AND routeid <> p_routeid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Another route with the same source and destination exists for this airline.';
    ELSE
        UPDATE route
        SET airportid = p_airportid,
            airlineid = p_airlineid,
            sourceairportcode = p_sourceairportcode,
            destinationairportcode = p_destinationairportcode,
            distance = p_distance,
            duration = p_duration
        WHERE routeid = p_routeid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_UpdateSeat` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_UpdateSeat` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateSeat`(
    IN p_seatid INT,
    IN p_flightid INT,
    IN p_seatname VARCHAR(10),
    IN p_bookingclassid INT,
    IN p_availabilitystatus VARCHAR(30)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Seat
        WHERE Seatid = p_seatid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Seat does not exist.';
    ELSEIF EXISTS (
        SELECT 1
        FROM Seat
        WHERE Flightid = p_flightid
          AND Seatname = p_seatname
          AND Seatid != p_seatid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A seat with this flight and seat name already exists.';
    ELSE
        UPDATE Seat
        SET Flightid = p_flightid,
            Seatname = p_seatname,
            Bookingclassid = p_bookingclassid,
            Availabilitystatus = p_availabilitystatus
        WHERE Seatid = p_seatid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updateTicket` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updateTicket` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateTicket`(
    IN p_ticketid INT,
    IN p_bookingid INT,
    IN p_seatid INT,
    IN p_passengerid INT,
    IN p_tickettype VARCHAR(15),
    IN p_issuedate TIMESTAMP,
    IN p_price DECIMAL(20,2)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Ticket
        WHERE Bookingid = p_bookingid
          AND Seatid = p_seatid
          AND Passengerid = p_passengerid
          AND Ticketid <> p_ticketid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Another ticket already exists for this passenger, seat, and booking.';
    ELSE
        UPDATE Ticket
        SET Bookingid = p_bookingid,
            Seatid = p_seatid,
            Passengerid = p_passengerid,
            Tickettype = p_tickettype,
            issuedate = p_issuedate,
            Price = p_price
        WHERE Ticketid = p_ticketid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_UpdateTravelDocument` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_UpdateTravelDocument` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateTravelDocument`(
    IN p_documentid INT,
    IN p_documenttype VARCHAR(30),
    IN p_passengerid INT,
    IN p_documentvalidity VARCHAR(20)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Travel_document
        WHERE Documentid = p_documentid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Travel document does not exist.';
    ELSEIF EXISTS (
        SELECT 1
        FROM Travel_document
        WHERE Passengerid = p_passengerid
          AND Documenttype = p_documenttype
          AND Documentid != p_documentid
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A document with this type already exists for this passenger.';
    ELSE
        UPDATE Travel_document
        SET Documenttype = p_documenttype,
            Passengerid = p_passengerid,
            Documentvalidity = p_documentvalidity
        WHERE Documentid = p_documentid;
    END IF;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
