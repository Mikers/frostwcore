DELETE FROM `locales_creature` WHERE `entry`=100000;
INSERT INTO `locales_creature` VALUES ('100000', '', '', '', '', '', '', '', 'Лафайн', null, null, null, null, null, null, null, 'Телепортационный сервис');
UPDATE `creature_template` SET `scale`=3, `modelid1`=30414, `modelid2`=30414, `modelid3`=30414, `modelid4`=30414 WHERE `entry`=100000;