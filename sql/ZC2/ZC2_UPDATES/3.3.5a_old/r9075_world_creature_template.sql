DELETE FROM creature_template WHERE `entry`=13;
INSERT INTO `creature_template` VALUES (13, 0, 0, 0, 0, 0, 17771, 17771, 17771, 17771, 'Beltez', 'Guildhouse Keeper', '', 0, 80, 80, 0, 35, 35, 1, 1.48, 1.14286, 0.75, 0, 181, 189, 0, 158, 1, 1400, 1900, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1360, 0, 0, 'guildmaster', 0);
UPDATE `creature_template` SET `ScriptName`='guildmaster' WHERE `entry`=13;
DELETE FROM `locales_creature` WHERE `entry`=13;
INSERT INTO `locales_creature` VALUES ('13', '', '', '', '', '', '', '', 'Бельтез', null, null, null, null, null, null, null, 'Продавец домов гильдии');

