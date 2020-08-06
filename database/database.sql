CREATE DATABASE IF NOT EXISTS `ironworks`;

USE `ironworks`;

/* Drop Sequence for Updates */

DROP TABLE IF EXISTS `purchasesdesc`;

DROP TABLE IF EXISTS `purchases`;

DROP TABLE IF EXISTS `suppliers`;

DROP TABLE IF EXISTS `salesdesc`;

DROP TABLE IF EXISTS `sales`;

DROP TABLE IF EXISTS `clients`;

DROP TABLE IF EXISTS `users`;

/* users table structure */

CREATE TABLE `users` (
  `userid` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `cphone` varchar(10) NOT NULL,
  `street` varchar(20) NOT NULL,
  `suburb` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `salary` double DEFAULT 0 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `admins`(
  `adminid` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `userid` int NOT NULL,
  `username` varchar(10) DEFAULT "",
  `password` varchar(10) DEFAULT "",
  FOREIGN KEY (`userid`) REFERENCES `users`(`userid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `businesspremises` (
  `bpid` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `adminid` int NOT NULL,
  `bpname` varchar(20) NOT NULL,
  FOREIGN KEY (`adminid`) REFERENCES `admins`(`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* inventory table structure */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `productid` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `bpid` int NOT NULL,
  `pname` varchar(20) NOT NULL,
  `pquantity` varchar(50) NOT NULL,
  `plastpurchase` date NOT NULL,
  FOREIGN KEY (`bpid`) REFERENCES `businesspremises`(`bpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* clients table structure */

CREATE TABLE `clients` (
  `clientid` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  `cemail` varchar(50) NOT NULL,
  `cphone` varchar(10) NOT NULL,
  `cstreet` varchar(20) NOT NULL,
  `csuburb` varchar(15) NOT NULL,
  `ccity` varchar(15) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* suppliers table structure */

CREATE TABLE `suppliers` (
  `supplierid` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `sname` varchar(20) NOT NULL,
  `semail` varchar(50) NOT NULL,
  `sphone` varchar(10) NOT NULL,
  `sstreet` varchar(20) NOT NULL,
  `ssuburb` varchar(15) NOT NULL,
  `scity` varchar(15) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* purchases table structure */

CREATE TABLE `purchases` (
  `purchaseid` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `psupplier` int NOT NULL,
  `ptotal` double NOT NULL,
  `pdate` date NOT NULL,
  FOREIGN KEY (`psupplier`) REFERENCES `suppliers`(`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* purchasesdesc table structure */

CREATE TABLE `purchasesdesc` (
  `purchaseid` int NOT NULL,
  `productid` int NOT NULL,
  `pprice` double NOT NULL,
  `pquantity` date NOT NULL,
  FOREIGN KEY (`purchaseid`) REFERENCES `purchases`(`purchaseid`),
  FOREIGN KEY (`productid`) REFERENCES `inventory`(`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* sales table structure */

CREATE TABLE `sales` (
  `saleid` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `sname` varchar(20) NOT NULL,
  `sclient` int NOT NULL,
  `sdesc` varchar(50) NOT NULL,
  `stotal` double NOT NULL,
  `pdate` date NOT NULL,
  FOREIGN KEY (`sclient`) REFERENCES `clients`(`clientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* usedmaterial table structure */

CREATE TABLE `usedmaterial` (
  `saleid` int NOT NULL,
  `productid` int NOT NULL,
  `mquantity` int NOT NULL,
  FOREIGN KEY (`saleid`) REFERENCES `sales`(`saleid`),
  FOREIGN KEY (`productid`) REFERENCES `inventory`(`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





