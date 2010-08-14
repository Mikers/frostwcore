DROP TABLE IF EXISTS `custom_commands`;
CREATE TABLE `custom_commands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` text,
  `executetime` bigint(15) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `succesfull` smallint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;