/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.21 : Database - ironworks
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ironworks` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ironworks`;

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `adminid` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `username` varchar(10) DEFAULT '',
  `password` varchar(10) DEFAULT '',
  PRIMARY KEY (`adminid`),
  KEY `userid` (`userid`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admins` */

insert  into `admins`(`adminid`,`userid`,`username`,`password`) values 
(1,1,'mario','password');

/*Table structure for table `businesspremises` */

DROP TABLE IF EXISTS `businesspremises`;

CREATE TABLE `businesspremises` (
  `bpid` int NOT NULL AUTO_INCREMENT,
  `adminid` int NOT NULL,
  `bpname` varchar(20) NOT NULL,
  PRIMARY KEY (`bpid`),
  KEY `adminid` (`adminid`),
  CONSTRAINT `businesspremises_ibfk_1` FOREIGN KEY (`adminid`) REFERENCES `admins` (`adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `businesspremises` */

insert  into `businesspremises`(`bpid`,`adminid`,`bpname`) values 
(1,1,'Herreria Osuna');

/*Table structure for table `clients` */

DROP TABLE IF EXISTS `clients`;

CREATE TABLE `clients` (
  `clientid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  `cemail` varchar(50) NOT NULL,
  `cphone` varchar(10) NOT NULL,
  `cstreet` varchar(20) NOT NULL,
  `csuburb` varchar(15) NOT NULL,
  `ccity` varchar(15) NOT NULL,
  PRIMARY KEY (`clientid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clients` */

insert  into `clients`(`clientid`,`cname`,`cemail`,`cphone`,`cstreet`,`csuburb`,`ccity`) values 
(1,'Jose Osuna','joseosuna@solemti.mx','6691793264','Av estepa 7908','Prados del sol','Mazatlan');

/*Table structure for table `inventory` */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `productid` int NOT NULL AUTO_INCREMENT,
  `bpid` int NOT NULL,
  `pname` varchar(20) NOT NULL,
  `pquantity` int NOT NULL,
  `plastpurchase` date NOT NULL,
  PRIMARY KEY (`productid`),
  KEY `bpid` (`bpid`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`bpid`) REFERENCES `businesspremises` (`bpid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `inventory` */

insert  into `inventory`(`productid`,`bpid`,`pname`,`pquantity`,`plastpurchase`) values 
(1,1,'PTR',3,'2020-08-20'),
(2,1,'Angulo',4,'2020-08-14'),
(3,1,'Varilla',19,'2020-08-20'),
(4,1,'Lamina galvanizada',2,'2020-08-14');

/*Table structure for table `purchases` */

DROP TABLE IF EXISTS `purchases`;

CREATE TABLE `purchases` (
  `purchaseid` int NOT NULL AUTO_INCREMENT,
  `psupplier` int NOT NULL,
  `ptotal` double NOT NULL,
  `pdate` date NOT NULL,
  PRIMARY KEY (`purchaseid`),
  KEY `psupplier` (`psupplier`),
  CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`psupplier`) REFERENCES `suppliers` (`supplierid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `purchases` */

insert  into `purchases`(`purchaseid`,`psupplier`,`ptotal`,`pdate`) values 
(1,1,500,'2020-08-12'),
(2,1,1000,'2020-08-12'),
(3,1,1000,'2020-08-14'),
(4,1,100,'2020-08-14'),
(5,1,1000,'2020-08-14'),
(6,1,500,'2020-08-14'),
(7,1,200,'2020-08-14'),
(8,1,1000,'2020-08-14'),
(9,1,200,'2020-08-20');

/*Table structure for table `purchasesdesc` */

DROP TABLE IF EXISTS `purchasesdesc`;

CREATE TABLE `purchasesdesc` (
  `purchaseid` int NOT NULL,
  `productid` int NOT NULL,
  `pprice` double NOT NULL,
  `pquantity` double NOT NULL,
  KEY `purchaseid` (`purchaseid`),
  KEY `productid` (`productid`),
  CONSTRAINT `purchasesdesc_ibfk_1` FOREIGN KEY (`purchaseid`) REFERENCES `purchases` (`purchaseid`),
  CONSTRAINT `purchasesdesc_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `inventory` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `purchasesdesc` */

insert  into `purchasesdesc`(`purchaseid`,`productid`,`pprice`,`pquantity`) values 
(1,1,200,2),
(1,2,100,1),
(2,1,200,4),
(2,2,100,2),
(3,3,200,4),
(3,4,100,2),
(5,3,100,10),
(6,1,200,2),
(6,2,100,1),
(7,1,200,1),
(8,3,100,2),
(8,1,200,4),
(9,1,200,4);

/*Table structure for table `sales` */

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `saleid` int NOT NULL AUTO_INCREMENT,
  `sname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sclient` int NOT NULL,
  `sdesc` varchar(50) NOT NULL,
  `stotal` double NOT NULL,
  `pdate` date NOT NULL,
  PRIMARY KEY (`saleid`),
  KEY `sclient` (`sclient`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`sclient`) REFERENCES `clients` (`clientid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sales` */

insert  into `sales`(`saleid`,`sname`,`sclient`,`sdesc`,`stotal`,`pdate`) values 
(1,'Porton',1,'Porton principal',7000,'2020-08-18'),
(2,'Proteccion de ventana',1,'Proteccion de ventana de 2 m x 2 m',3000,'2020-08-19'),
(3,'Proteccion de ventana',1,'Proteccion de ventana de 2 m x 2 m',3000,'2020-08-19'),
(4,'Proteccion de ventana',1,'Proteccion de ventana de 2 m x 2 m',3000,'2020-08-19'),
(5,'Proteccion de ventana',1,'Proteccion de ventana de 2 m x 2 m',3000,'2020-08-19'),
(6,'Proteccion de ventana',1,'Proteccion de ventana de 2 m x 2 m',3000,'2020-08-19'),
(7,'Puerta patio',1,'Puerta de 2.2 m x 1.6 m',2000,'2020-08-20'),
(8,'puerta',1,'puerta',4000,'2020-08-20');

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `supplierid` int NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) NOT NULL,
  `semail` varchar(50) NOT NULL,
  `sphone` varchar(10) NOT NULL,
  `sstreet` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ssuburb` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scity` varchar(15) NOT NULL,
  PRIMARY KEY (`supplierid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `suppliers` */

insert  into `suppliers`(`supplierid`,`sname`,`semail`,`sphone`,`sstreet`,`ssuburb`,`scity`) values 
(1,'ACEROS Y PERFILES','EJEMPLO@HOTMAIL.COM','6699234567','CALLE DE EJEMPLO','LEY','MAZATLAN'),
(2,'SERDI MAZATLAN','EJEMPLO@MAIL.COM','6691657687','Internacional KM 2','San Isidro','Mazatlan'),
(3,'Jose Osuna','joseosuna@solemti.mx','6691793264','Av estepa 7908','Prados del sol','Mazatlan');

/*Table structure for table `usedmaterial` */

DROP TABLE IF EXISTS `usedmaterial`;

CREATE TABLE `usedmaterial` (
  `saleid` int NOT NULL,
  `productid` int NOT NULL,
  `mquantity` int NOT NULL,
  KEY `saleid` (`saleid`),
  KEY `productid` (`productid`),
  CONSTRAINT `usedmaterial_ibfk_1` FOREIGN KEY (`saleid`) REFERENCES `sales` (`saleid`),
  CONSTRAINT `usedmaterial_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `inventory` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `usedmaterial` */

insert  into `usedmaterial`(`saleid`,`productid`,`mquantity`) values 
(1,1,5),
(1,4,5),
(2,1,4),
(2,2,8),
(6,1,4),
(6,2,8),
(7,1,6),
(7,2,8),
(8,1,1),
(8,3,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `cphone` varchar(10) NOT NULL,
  `street` varchar(20) NOT NULL,
  `suburb` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `salary` double DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `users` */

insert  into `users`(`userid`,`fname`,`lname`,`email`,`cphone`,`street`,`suburb`,`city`,`salary`) values 
(1,'mario','osuna','marioosuna@hotmail.com','6699256349','Av estepa 7908','Prados del sol','Mazatlan',0),
(2,'Lorenzo','Sanchez','lorenzo@hotmail.com','6692194753','Campeche 308','Sanchez Celis','Mazatlan',300),
(3,'Jose','Osuna','joseosuna@solemti.mx','6691793264','Av estepa 7908','Prados del sol','Mazatlan',100);

/* Procedure structure for procedure `userLogin` */

/*!50003 DROP PROCEDURE IF EXISTS  `userLogin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `userLogin`(IN user VARCHAR(10),IN pass VARCHAR(16))
BEGIN
		IF (EXISTS(SELECT * FROM `admins` WHERE username = user AND BINARY Password = pass)) THEN
			SET @exist = true;
		ELSE
			SET @exist = false;
		END IF;
		SELECT @exist as result;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `addPurchase` */

/*!50003 DROP PROCEDURE IF EXISTS  `addPurchase` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `addPurchase`(In supplier varchar(100),in total double)
BEGIN
		if (exists(Select * from suppliers where sname = supplier)) then
			Insert into purchases(psupplier,ptotal,pdate) values ((SELECT supplierid FROM suppliers WHERE sname = supplier),total,curdate());
			SELECT LAST_INSERT_ID() AS result;
		ELSE 
			SELECT 0 as result;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `addInventoryNPurchaseDesc` */

/*!50003 DROP PROCEDURE IF EXISTS  `addInventoryNPurchaseDesc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `addInventoryNPurchaseDesc`(in purchaseid int,in prodname varchar(100), in pprice double,IN quantity INT)
BEGIN
		IF (Exists(SElect * from inventory WHERE pname = prodname)) then 
			UPDate inventory set pquantity = pquantity + quantity, plastpurchase = curdate() where pname = prodname;
			INSERT INTO purchasesdesc VALUES (purchaseid,(SELECT productid from inventory where pname = prodname),pprice,quantity);
		else
			insert into inventory(bpid,pname,pquantity,plastpurchase) values (1,prodname,quantity,curdate());
			Insert into purchasesdesc values (purchaseid,(select last_insert_id()),pprice,quantity);
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `getInventory` */

/*!50003 DROP PROCEDURE IF EXISTS  `getInventory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `getInventory`()
BEGIN
		Select productid,pname,pquantity,plastpurchase from inventory;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `getSuppliers` */

/*!50003 DROP PROCEDURE IF EXISTS  `getSuppliers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `getSuppliers`()
BEGIN
		Select * From suppliers order by sname ASC;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `addSupplier` */

/*!50003 DROP PROCEDURE IF EXISTS  `addSupplier` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `addSupplier`(in sname varchar(50),in mail varchar(50), in phone varchar(50), in street varchar(50), in suburb varchar(50), in city varchar(50))
BEGIN
		Insert into suppliers(sname,semail,sphone,sstreet,ssuburb,scity) Values (sname,mail,phone,street,suburb,city);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `getUsers` */

/*!50003 DROP PROCEDURE IF EXISTS  `getUsers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `getUsers`()
BEGIN
		Select * from users;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `addUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `addUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `addUser`(in fname varchar(20),in lname varchar(20),in mail varchar(50),in phone varchar(12),in street varchar(50),in suburb varchar(50),in city varchar(20),in salary double)
BEGIN
		insert into users(fname,lname,email,cphone,street,suburb,city,salary) values (fname,lname,mail,phone,street,suburb,city,salary);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `getClients` */

/*!50003 DROP PROCEDURE IF EXISTS  `getClients` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `getClients`()
BEGIN
		Select * From clients;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `addClient` */

/*!50003 DROP PROCEDURE IF EXISTS  `addClient` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `addClient`(in cname varchar(50),in cemail varchar(50),in cphone varchar(12),in street varchar(50),in suburb varchar(50),in city varchar(50))
BEGIN
		Insert into clients(cname,cemail,cphone,cstreet,csuburb,ccity) values (cname,cemail,cphone,street,suburb,city);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `loadPurchases` */

/*!50003 DROP PROCEDURE IF EXISTS  `loadPurchases` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `loadPurchases`()
BEGIN
		SELECT p.purchaseid,s.sname,p.ptotal,p.pdate,pd.pquantity,pd.pprice,i.pname,i.plastpurchase FROM purchasesdesc as pd INNER JOIN purchases as p ON pd.purchaseid=p.purchaseid INNER JOIN suppliers as s ON p.psupplier=s.supplierid inner join inventory as i on pd.productid=i.productid order by p.purchaseid DESC;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `getSales` */

/*!50003 DROP PROCEDURE IF EXISTS  `getSales` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `getSales`()
BEGIN
		SELECT s.saleid,s.sname,s.sdesc,s.stotal,s.pdate,c.cname,c.cphone,i.pname,u.mquantity FROM sales AS s INNER JOIN usedmaterial AS u ON s.saleid=u.saleid INNER JOIN clients AS c ON s.sclient=c.clientid INNER JOIN inventory AS i ON u.productid=i.productid ORDER BY s.saleid DESC;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `addSale` */

/*!50003 DROP PROCEDURE IF EXISTS  `addSale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `addSale`(in cli varchar(50),in sname varchar(50),in sdesc varchar(255),in total double)
BEGIN
		IF (EXISTS(SELECT * FROM clients WHERE cname = cli)) THEN
			INSERT INTO sales(sname,sclient,sdesc,stotal,pdate) VALUES (sname,(SELECT clientid FROM clients WHERE cname = cli),sdesc,total,CURDATE());
			SELECT LAST_INSERT_ID() AS result;
		ELSE 
			SELECT 0 AS result;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `addSaleDesc` */

/*!50003 DROP PROCEDURE IF EXISTS  `addSaleDesc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `addSaleDesc`(in saleid int,in prodname varchar(50),in quantity int)
BEGIN
		IF (EXISTS(SELECT * FROM inventory WHERE pname = prodname)) THEN 
			UPDATE inventory SET pquantity = pquantity - quantity WHERE pname = prodname;
			INSERT INTO usedmaterial VALUES (saleid,(SELECT productid FROM inventory WHERE pname = prodname),quantity);
		END IF;
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
