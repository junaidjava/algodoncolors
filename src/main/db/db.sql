-- connect with root
mysql -uroot -hlocalhost

CREATE DATABASE  IF NOT EXISTS `db_algodon`;
USE `db_algodon`;

-- User creation and grant permission
CREATE USER 'junaid'@'localhost' IDENTIFIED BY 'junaid';
GRANT ALL ON db_algodon.* TO 'junaid'@'localhost';

-- conect with user junaid
mysql -ujunaid -pjunaid -hlocalhost db_algodon

-- Table structure for table `role`
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Dumping data for table `role`
LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (1,'ROLE_USER');
INSERT INTO `role` VALUES (2,'ROLE_MANAGER');
INSERT INTO `role` VALUES (3,'ROLE_ADMIN');
UNLOCK TABLES;

-- Table structure for table `user`
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `username` varchar(32) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `active` BIT(1) DEFAULT true COMMENT 'True or False, used by admin to active or inactive user',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Table structure for table `user_role`
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` BIGINT(20) NOT NULL,
  `role_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_role_roleid_idx` (`role_id`),
  CONSTRAINT `fk_user_role_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contactPerson` varchar(255) NOT NULL,
  `createdOn` DATETIME NOT NULL ,
  `phone` varchar(20) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(512) DEFAULT NULL,
  `active` BIT(1) DEFAULT true,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` LIKE `buyer`;

DROP TABLE IF EXISTS `item_group`;
CREATE TABLE `item_group` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `name` varchar(255) NOT NULL,
  `measurementUnit` varchar(100) NOT NULL,
  `active` BIT(1) DEFAULT true,
  `createdOn` DATETIME NOT NULL ,
  `updatedOn` DATETIME NOT NULL ,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `item_group` VALUES (1,'Jeans','cm',1,now(),now());
INSERT INTO `item_group` VALUES (2,'Trouser','cm',1,now(),now());
INSERT INTO `item_group` VALUES (3,'Formal Shirt','inch',1,now(),now());
INSERT INTO `item_group` VALUES (4,'Casual Shirt','inch',1,now(),now());

  
DROP TABLE IF EXISTS algodon_order;
CREATE TABLE algodon_order (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `ancNo` varchar(255) NOT NULL,
  `orderNo` varchar(255) NOT NULL,
  `techPack` varchar(500),  
  `techPack2` varchar(500),  
  `techPack3` varchar(500),  
  `buyerId` BIGINT(20) NOT NULL,
  `washStandard` BIT(1) DEFAULT true,
  `swatch` BIT(1) DEFAULT true,
  `styleNo` varchar(255) NOT NULL,
  `fabricDesc` varchar(1000) NOT NULL,
  `color` varchar(500) NOT NULL,
  `itemDesc` varchar(1000),
  `collection` varchar(255) NOT NULL,
  `remarks` varchar(255),
  `itemGroupId` BIGINT(20) NOT NULL,
  `size` varchar(2000) NOT NULL,
  `productLabel` varchar(255),
  `shipmentDate` DATETIME NOT NULL,
  `shipmentDate2` DATETIME NOT NULL,
  `shipmentDate3` DATETIME NOT NULL,
  `shipmentMode` varchar(100) NOT NULL,
  `shipmentMode2` varchar(100) NOT NULL,
  `shipmentMode3` varchar(100) NOT NULL,
  `sample` BIT(1) DEFAULT false,
  `createdOn` DATETIME NOT NULL ,
  `updatedOn` DATETIME NOT NULL ,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `ancNo_UNIQUE` (`ancNo` ASC),
  UNIQUE INDEX `orderNo_UNIQUE` (`orderNo` ASC),
  CONSTRAINT `fk_order_buyerId` FOREIGN KEY (`buyerId`) REFERENCES `buyer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_itemGroupId` FOREIGN KEY (`itemGroupId`) REFERENCES `item_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE  
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `algodon_order_picture`;
CREATE TABLE `algodon_order_picture` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `orderId` BIGINT(20) NOT NULL,
  `label` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `createdOn` DATETIME NOT NULL ,
  `updatedOn` DATETIME NOT NULL ,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_picture_orderId` FOREIGN KEY (`orderId`) REFERENCES `algodon_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `algodon_order_picture`;
ALTER TABLE algodon_order DROP COLUMN category;
ALTER TABLE algodon_order CHANGE tackPack techPack varchar(500);
-- dated 21-oct-2017
ALTER TABLE algodon_order DROP COLUMN `sampleType` ;
ALTER TABLE algodon_order DROP COLUMN `weight` ;
ALTER TABLE algodon_order DROP COLUMN `packing` ;

ALTER TABLE algodon_order ADD COLUMN `techPack2` varchar(500) AFTER `techPack`;
ALTER TABLE algodon_order ADD COLUMN `techPack3` varchar(500) AFTER `techPack2`;
ALTER TABLE algodon_order ADD COLUMN `shipmentMode2` varchar(100) AFTER `shipmentMode`;
ALTER TABLE algodon_order ADD COLUMN `shipmentMode3` varchar(100) AFTER `shipmentMode2`;
ALTER TABLE algodon_order ADD COLUMN `sample` BIT(1) DEFAULT false AFTER `shipmentMode3`;

ALTER TABLE algodon_order ADD COLUMN `shipmentDate2` DATETIME AFTER `shipmentDate`;
ALTER TABLE algodon_order ADD COLUMN `shipmentDate3` DATETIME AFTER `shipmentDate2`;
  