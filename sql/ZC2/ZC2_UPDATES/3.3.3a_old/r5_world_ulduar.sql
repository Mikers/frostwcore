-- FOR CTDB **** release
-- Author: Dragon
-- Sql support for Ulduar
-- Start
-- Sending a vehicle ID that doesn't exist will cause the client to hang
UPDATE `creature_template` SET `VehicleId` = 0 WHERE `entry` = 33214;
UPDATE `creature_template` SET `unit_flags` = 33685510, `type_flags` = 0 WHERE `entry` = 34286;
UPDATE `creature_template` SET `vehicleId` = 318 WHERE `entry` = 33118;
DELETE FROM `creature_template` WHERE `entry` IN (33115);
REPLACE INTO `creature_template` VALUES
('33115','0','0','0','0','0','13069','0','0','0','Leviathan trigger','',NULL,'0','83','83','2','16','16','0','2','2','1','3','0','0','0','0','0','0','0','8','34340934','0','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','62548','0','0','0','0','0','0','0','0','0','1305000','1595000','','0','3','310','30','1','0','0','0','0','0','0','0','169','1','0','617299803','1','flame_leviathan_trigger','0');
DELETE FROM creature WHERE `id` IN (33115, 33060, 33062, 33109);
REPLACE INTO `creature` VALUES ('@GUID+1',33115,603,1,1,0,0,-784.969,-135.608,429.774,0.351076,480000,0,0,3458360,279750,0,0);
UPDATE `creature_template` SET `ScriptName` = 'mob_darkrune_watcher' WHERE `entry` = 33453;
UPDATE `creature_template` SET `ScriptName` = 'mob_darkrune_sentinel' WHERE `entry` = 33846;
UPDATE `creature_template` SET `ScriptName` = 'mob_darkrune_guardian' WHERE `entry` = 33388;
UPDATE `creature_template` SET `ScriptName` = 'mob_devouring_flame' WHERE `entry` = 34188;
UPDATE `creature_template` SET `ScriptName` = 'npc_expedition_commander_ulduar' WHERE `entry` = 33210;
UPDATE `creature_template` SET `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33282;
UPDATE `creature_template` SET `unit_flags` = 33685506 WHERE `entry` IN (33245,33233);
DELETE FROM `creature` WHERE `id`=33186;
UPDATE `creature_template` SET `vehicleId` = 332 WHERE `entry` = 33293;
DELETE FROM `creature` WHERE `id`=33282;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33233,33259);
DELETE FROM `creature` WHERE `guid` IN (137582, 136768, 136769, 136055, 136056) OR `id` IN (33632, 33802);
UPDATE `creature_template` SET `unit_flags` = 33685510 WHERE `entry` = 33809;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33661;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `ScriptName` = 'mob_focused_eyebeam' WHERE `entry` IN (33632, 33802);
UPDATE `creature_template` SET `ScriptName` = 'mob_left_arm' WHERE `entry` = 32933;
UPDATE `creature_template` SET `ScriptName` = 'mob_right_arm' WHERE `entry` = 32934;
REPLACE INTO `gameobject_template` VALUES ('194565', '10', '8631', 'Ulduar Raid - Razorscale - Broken Harpoon', '', '', '', '0', '48', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '11723');
DELETE FROM `gameobject` WHERE `id`=194565;
INSERT INTO `gameobject` VALUES ('@GUID+1', '194565', '603', '3', '1', '571.947', '-136.012', '391.517', '2.28638', '0', '0', '0', '1', '180', '255', '1');
INSERT INTO `gameobject` VALUES ('@GUID+1', '194565', '603', '3', '1', '589.923', '-133.622', '391.897', '-2.9845', '0', '0', '0', '1', '180', '255', '1');
REPLACE INTO `creature_template` VALUES (33184, 0, 0, 0, 0, 0, 22524, 0, 0, 0, 'Razorscale Harpoon Gun (Unused)', '', 'vehichleCursor', 0, 80, 80, 2, 35, 35, 0, 1, 1.14286, 1, 0, 422, 586, 0, 642, 1, 2000, 0, 1, 0, 8, 0, 0, 0, 0, 0, 345, 509, 103, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 50, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 1);
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=33184;
DELETE FROM `creature_template` WHERE `entry` IN (33240);
REPLACE INTO `creature_template` VALUES('33240','33240','0','0','0','0','28517','0','0','0','Ulduar Colossus','','','0','80','80','2','1692','1692','0','1.2','1.14286','1','1','422','586','0','642','7.5','2000','0','1','32832','0','0','0','0','0','0','345','509','103','5','524352','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','125','1','1','0','0','0','0','0','0','0','124','1','0','0','0','mob_colossus','11403');
DELETE FROM `creature` WHERE `guid` IN (128936, 128937);
DELETE FROM `creature` WHERE `id`=33113;
REPLACE INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33113, 603, 1, 1, 0, 0, 435.89, -8.417, 409.886, 3.12723, 480000, 0, 0, 23009250, 0, 0, 0);
UPDATE `creature_template` SET `unit_flags` = 33685510, `type_flags` = 0 WHERE `entry` = 34286;
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry` IN (33142, 33139, 34111, 34224);
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=83,`exp`=2,`unit_class`=1 WHERE `entry`=33139;
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=83,`exp`=2,`unit_class`=1 WHERE `entry`=33142;
DELETE FROM `creature` WHERE `guid` IN (129679, 126708);
UPDATE `creature` SET `spawnMask`=3 WHERE `id` IN (33113, 32930, 33240);
UPDATE `creature` SET `spawnMask`=3 WHERE `id` IN (32933, 32934);
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=194553;
DELETE FROM `creature` WHERE `guid` IN (129001, 129002);
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(129001, 33109, 603, 3, 65535, 0, 0, -766.702, -225.033, 430.603, 1.71042, 7200, 0, 0, 630000, 0, 0, 0),
(129002, 33109, 603, 3, 65535, 0, 0, -729.545, -186.269, 430.228, 1.90241, 7200, 0, 0, 630000, 0, 0, 0);
DELETE FROM `creature` WHERE `guid` IN (128985, 128986);
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(128985, 33060, 603, 3, 65535, 0, 0, -784.371, -33.3111, 430.027, 5.09636, 7200, 0, 0, 1134000, 0, 0, 0),
(128986, 33060, 603, 3, 65535, 0, 0, -814.592, -64.5436, 430.027, 5.96903, 7200, 0, 0, 1134000, 0, 0, 0);
DELETE FROM `creature` WHERE `guid` IN (128987, 128988);
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(128987, 33062, 603, 3, 65535, 0, 0, -718.451, -118.248, 430.37, 0.0523599, 7200, 0, 0, 504000, 0, 0, 0),
(128988, 33062, 603, 3, 65535, 0, 0, -717.833, -106.567, 430.124, 0.122173, 7200, 0, 0, 504000, 0, 0, 0);
UPDATE `creature` SET `spawnMask`=3 WHERE `id` IN (33109, 33060, 33062);
UPDATE `creature_template` SET `unit_flags` = 33947654 WHERE `entry` = 33121;
DELETE FROM `creature_template` WHERE `entry` IN (33119);
REPLACE INTO `creature_template` VALUES
('33119','0','0','0','0','0','13069','0','0','0','Scorch trigger','','','0','80','80','2','16','16','0','1','1.14286','85','1','0','0','0','0','1','2000','0','1','0','0','0','0','0','0','0','0','0','0','4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','4','1','1','0','0','0','0','0','0','0','94','1','0','0','0','mob_scorch_ground','11159');
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33119);
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `unit_flags` = 33554434, `ScriptName` = 'mob_iron_construct', `flags_extra` = 0 WHERE `entry` = 33121;
DELETE FROM `creature` WHERE id = 34014;
UPDATE `creature_template` SET `unit_flags` = 0, `type_flags` = 0 WHERE `entry` = 33515;
UPDATE `creature_template` SET `equipment_id` = 2500 WHERE `entry` = 33515;

UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `ScriptName` = 'feral_defender_trigger' WHERE `entry` = 34096;
UPDATE `creature_template` SET `ScriptName` = 'mob_feral_defender' WHERE `entry` = 34035;
UPDATE `creature_template` SET `ScriptName` = 'mob_sanctum_sentry' WHERE `entry` = 34014;
UPDATE `creature_template` SET `ScriptName` = 'seeping_trigger' WHERE `entry` = 34098;

DELETE FROM `creature_equip_template` WHERE entry = 2500;
INSERT INTO `creature_equip_template` VALUES ('2500','45315','0','0');

DELETE FROM `creature_addon` WHERE guid = 137496;
INSERT INTO `creature_addon` VALUES ('137496','1033515','0','0','0','0','0');

DELETE FROM `waypoint_data` WHERE id = 1033515;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES
('1033515','1','1968.46','51.75','417.72','0','0','0','100','0'),
('1033515','2','1956.75','49.22','411.35','0','0','0','100','0'),
('1033515','3','1938.90','42.09','411.35','3000','0','0','100','0'),
('1033515','4','1956.75','49.22','411.35','0','0','0','100','0'),
('1033515','5','1968.46','51.75','417.72','0','0','0','100','0'),
('1033515','6','2011.43','44.91','417.72','0','0','0','100','0'),
('1033515','7','2022.65','37.74','411.36','0','0','0','100','0'),
('1033515','8','2046.65','9.61','411.36','0','0','0','100','0'),
('1033515','9','2053.4','-8.65','421.68','0','0','0','100','0'),
('1033515','10','2053.14','-39.8','421.66','0','0','0','100','0'),
('1033515','11','2046.26','-57.96','411.35','0','0','0','100','0'),
('1033515','12','2022.42','-86.39','411.35','0','0','0','100','0'),
('1033515','13','2011.26','-92.95','417.71','0','0','0','100','0'),
('1033515','14','1969.43','-100.02','417.72','0','0','0','100','0'),
('1033515','15','1956.66','-97.4','411.35','0','0','0','100','0'),
('1033515','16','1939.18','-90.90','411.35','3000','0','0','100','0'),
('1033515','17','1956.66','-97.4','411.35','0','0','0','100','0'),
('1033515','18','1969.43','-100.02','417.72','0','0','0','100','0'),
('1033515','19','2011.26','-92.95','417.71','0','0','0','100','0'),
('1033515','20','2022.42','-86.39','411.35','0','0','0','100','0'),
('1033515','21','2046.26','-57.96','411.35','0','0','0','100','0'),
('1033515','22','2053.14','-39.8','421.66','0','0','0','100','0'),
('1033515','23','2053.4','-8.65','421.68','0','0','0','100','0'),
('1033515','24','2046.65','9.61','411.36','0','0','0','100','0'),
('1033515','25','2022.65','37.74','411.36','0','0','0','100','0'),
('1033515','26','2011.43','44.91','417.72','0','0','0','100','0');
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 137496;
UPDATE `creature_template` SET `ScriptName` = 'boss_steelbreaker' WHERE `entry` = 32867;
UPDATE `creature_template` SET `ScriptName` = 'boss_runemaster_molgeim' WHERE `entry` = 32927;
UPDATE `creature_template` SET `ScriptName` = 'boss_stormcaller_brundir' WHERE `entry` = 32857;

UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` IN (33051, 33691, 33689);
UPDATE creature_template SET faction_A=16, faction_H=16, scriptname='mob_rune_of_power' WHERE entry = 33705;
UPDATE creature_template SET faction_A=16, faction_H=16, scriptname='mob_lightning_elemental', difficulty_entry_1 = 33689 WHERE entry = 32958;
-- end