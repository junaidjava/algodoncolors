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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Table structure for table `user_role`
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_role_roleid_idx` (`role_id`),
  CONSTRAINT `fk_user_role_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;