-- Patch acherus
REPLACE INTO `creature_template` VALUES ('438700', '0', '0', '0', '0', '0', '18', '0', '18', '0', 'Acherus_porter', null, null, '0', '80', '80', '0', '35', '35', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '0', '0');
UPDATE `creature_template` SET `faction_A`=2082 WHERE `entry`=438700;
UPDATE `creature_template` SET `faction_H`=2082 WHERE `entry`=438700;
UPDATE `creature_template` SET `npcflag`=1 WHERE `entry`=438700;
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=438700;
UPDATE `creature_template` SET `flags_extra`=130 WHERE `entry`=438700;
DELETE FROM `creature` WHERE `id`=438700;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
('@GUID+1', 438700, 0, 1, 256, 0, 0, 2390.19, -5641.09, 378.069, 0.760892, 300, 0, 0, 5342, 0, 0, 0),
('@GUID+1', 438700, 609, 1, 1, 0, 0, 2386.42, -5643.42, 420.97, 0.629104, 300, 0, 0, 5342, 0, 0, 0),
('@GUID+1', 438700, 609, 1, 1, 0, 0, 2392.36, -5639.5, 377.518, 0.616926, 300, 0, 0, 5342, 0, 0, 0),
('@GUID+1', 438700, 0, 1, 65535, 0, 0, 2386.39, -5643.9, 421.156, 3.57475, 25, 0, 0, 12, 12, 0, 0);

REPLACE INTO `trinity_string` VALUES ('756', 'Battle begins!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('757', '%s has successfully defended the fortress!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('758', '%s has taken over the fortress!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('759', 'The %s siege workshop has been damaged by the %s!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('760', 'The %s siege workshop has been destroyed by the %s!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('761', 'The %s tower has been damaged!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('762', 'The %s tower has been destroyed!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('763', 'Wintergrasp fortress is under attack!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('764', 'Wintergrasp is now under the control of the %s.', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('765', 'Wintergrasp timer set to %s.', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('766', 'Wintergrasp battle started.', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('767', 'Wintergrasp battle finished.', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('768', 'Wintergrasp info: %s controlled. Timer: %s. Wartime: %s. Number of Players: (Horde: %u, Alliance: %u)', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('769', 'Wintergrasp outdoorPvP is disabled.', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('770', 'Wintergrasp outdoorPvP is enabled.', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('771', 'You have reached Rank 1: Corporal', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('772', 'You have reached Rank 2: First Lieutenant', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('780', 'Before the Battle of  Wintergrasp left 30 minutes!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('781', 'Before the Battle of  Wintergrasp left 10 minutes!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('782', 'The battle for Wintergrasp  has stopped! Not enough defenders. Wintergrasp Fortress remains  Attackers.', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('783', 'The battle for Wintergrasp  has stopped! Not enough attackers. Wintergrasp Fortress remains  Defenders.', '', '', '', '', '', '', '', '');

DELETE FROM `command` WHERE name IN ('wg','wg enable','wg start','wg status','wg stop','wg switch','wg timer');
REPLACE INTO `command` VALUES ('wg', '3', 'Syntax: .wg $subcommand.');
REPLACE INTO `command` VALUES ('wg enable', '3', 'Syntax: .wg enable [on/off] Enable/Disable Wintergrasp outdoorPvP.');
REPLACE INTO `command` VALUES ('wg start', '3', 'Syntax: .wg start\r\nForce Wintergrasp battle start.');
REPLACE INTO `command` VALUES ('wg status', '3', 'Syntax: .wg status\r\nWintergrasp info, defender, timer, wartime.');
REPLACE INTO `command` VALUES ('wg stop', '3', 'Syntax: .wg stop\r\nForce Wintergrasp battle stop (No rewards).');
REPLACE INTO `command` VALUES ('wg switch', '3', 'Syntax: .wg switch\r\nSwitchs Wintergrasp defender team.');
REPLACE INTO `command` VALUES ('wg timer', '3', 'Syntax: .wg timer $minutes\r\nChange the current timer. Min value = 1, Max value 60 (Wartime), 1440 (Not Wartime)');

DELETE FROM gameobject WHERE id IN ('194323', '194162');

REPLACE INTO `spell_linked_spell` VALUES ('54640','54643','0','Defender\'s Portal Activate Proper Spell');

REPLACE INTO `spell_target_position` VALUES ('59096', '571', '4561.58', '2835.33', '389.79', '0.34');
REPLACE INTO `spell_target_position` VALUES ('60035', '571', '5325.06', '2843.36', '409.285', '3.20278');

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
REPLACE INTO `gameobject` VALUES ('@GUID+1', '194565', '603', '3', '1', '571.947', '-136.012', '391.517', '2.28638', '0', '0', '0', '1', '180', '255', '1');
REPLACE INTO `gameobject` VALUES ('@GUID+1', '194565', '603', '3', '1', '589.923', '-133.622', '391.897', '-2.9845', '0', '0', '0', '1', '180', '255', '1');
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
REPLACE INTO `creature_equip_template` VALUES ('2500','45315','0','0');

DELETE FROM `creature_addon` WHERE guid = 137496;
REPLACE INTO `creature_addon` VALUES ('137496','1033515','0','0','0','0','0');

DELETE FROM `waypoint_data` WHERE id = 1033515;
REPLACE INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES
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

UPDATE creature_template SET minlevel=83, maxlevel=83, faction_A=14, faction_H=14, unit_flags=0x02000000, flags_extra=0x00000002, ScriptName="npc_flame_tsunami" WHERE entry=30616;
DELETE FROM `gameobject` WHERE `id`=193988;
REPLACE INTO `gameobject` VALUES
('@guid+1', 193988, 615, 3, 1, 3137.26, 501.08, 87.9118, 0.846795, 0, 0, 0.41086,0.911698, -30, 0, 1),
('@guid+1', 193988, 615, 3, 1, 3238.37, 518.595, 58.9057, 0.739184, 0, 0, 0.361235,0.932475, -30, 0, 1),
('@guid+1', 193988, 615, 3, 1, 3362.01, 553.726, 95.7068, 4.56818, 0, 0, 0.756211,-0.654328, -30, 0, 1),
('@guid+1', 193988, 615, 3, 1, 3219.67, 656.795, 87.2898, 5.92596, 0, 0, 0.177664,-0.984091, 25, 0, 1);
UPDATE creature_template SET ScriptName="npc_twilight_fissure" WHERE entry=30641; 
UPDATE creature_template SET ScriptName="npc_flame_tsunami" WHERE entry=30616;
UPDATE creature_template SET faction_A = 103, faction_H = 103 WHERE entry IN (30641, 31521);
UPDATE creature_template SET flags_extra = 0 WHERE entry IN (30641, 31521);
UPDATE creature_template SET modelid1 = 29038 WHERE entry IN (30641, 31521);
UPDATE creature_template SET flags_extra = 2 WHERE entry IN (31138, 31550);
UPDATE creature_template SET dmg_multiplier = 15 WHERE entry IN (30451, 30449, 30452);
UPDATE creature_template SET dmg_multiplier = 20 WHERE entry IN (31520, 31535, 31534); 

DELETE FROM `spell_proc_event` WHERE `entry`='67712';
REPLACE INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
('67712','0','0','0','0','0','0','2','0','0','2'),('67758','0','0','0','0','0','0','2','0','0','2');

UPDATE creature_template SET unit_flags = 33554434 WHERE entry IN (30641, 31521, 31103);

-- Ulduar, vehicle system for Leviathan.
UPDATE `creature_template` SET `unit_flags` = 0, `ScriptName` = 'npc_keeper_norgannon' WHERE `entry` = 33686;
DELETE FROM `creature_template` WHERE `entry`=33115;
DELETE FROM creature WHERE `id`=33115;

UPDATE `creature_template` SET `unit_flags` = 0, `type_flags` = 0, `ScriptName` = 'boss_hodir' WHERE `entry` = 32845;

UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0 WHERE `entry` IN (34188, 33632, 33802, 34096, 34098);
UPDATE `creature_template` SET `modelid1` = 25865, `modelid2` = 0, `flags_extra` = 0, `ScriptName` = 'mob_flash_freeze' WHERE `entry` = 32938;
UPDATE `creature_template` SET `modelid1` = 28470, `modelid2` = 0, `ScriptName` = 'mob_icicle' WHERE `entry` = 33169;
UPDATE `creature_template` SET `modelid1` = 28470, `modelid2` = 0, `ScriptName` = 'mob_icicle_snowdrift' WHERE `entry` = 33173;
UPDATE `creature_template` SET `modelid1` = 15880, `modelid2` = 0 WHERE `entry` = 33174;
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 194173;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 61990;
REPLACE INTO `spell_linked_spell` VALUES 
(61990, -62457, 2, "Ice Shards Immunity (Hodir)"),
(61990, -65370, 2, "Ice Shards Immunity (Hodir)");

UPDATE `creature_template` SET `unit_flags` = 33817094 WHERE `entry` = 33174;
UPDATE `creature_template` SET `mechanic_immune_mask` = 612581215 WHERE `entry` = 32938;
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 32941;
UPDATE `creature_template` SET `unit_flags` = 33686016, `flags_extra` = 2 WHERE `entry` = 30298;

DELETE FROM `creature` WHERE `id` = 32938;

DELETE FROM `creature` WHERE `id`=33186;
REPLACE INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33186, 603, 3, 1, 0, 0, 587.073, -203.205, 441.237, 1.60532, 604800, 0, 0, 3555975, 0, 0, 0);
UPDATE `creature_template` SET `unit_flags` = 33554438 WHERE `entry` = 33184;

UPDATE `creature_template` SET `unit_flags` = 393220, `ScriptName` = '' WHERE `entry` = 32938;
UPDATE `creature_template` SET `unit_flags` = 33948166 WHERE `entry` = 33174;

DELETE FROM `creature` WHERE `id` IN (32941, 33333, 33332, 32950, 33331, 32946, 32948, 33330);

UPDATE `creature_template` SET `faction_A` = 1665, `faction_H` = 1665, `unit_flags` = 32768 WHERE `entry` IN (33325, 32901, 33328, 32901, 32893, 33327, 32897, 33326, 32941, 33333, 33332, 32950, 33331, 32946, 32948, 33330);
UPDATE `creature_template` SET `ScriptName` = 'mob_hodir_priest' WHERE `entry` IN (32897, 33326, 32948, 33330);
UPDATE `creature_template` SET `ScriptName` = 'mob_hodir_shaman' WHERE `entry` IN (33328, 32901, 33332, 32950);
UPDATE `creature_template` SET `ScriptName` = 'mob_hodir_druid' WHERE `entry` IN (33325, 32900, 32941, 33333);
UPDATE `creature_template` SET `ScriptName` = 'mob_hodir_mage' WHERE `entry` IN (32893, 33327, 33331, 32946);
UPDATE `creature_template` SET `modelid1` = 15880, `modelid2` = 0, `ScriptName` = 'toasty_fire' WHERE `entry` = 33342;
UPDATE creature_template SET scriptname = 'npc_zulaman_harrison_jones' WHERE entry = 24358;

UPDATE `script_texts` SET `content_default`='<ZeoneCore2 Text Entry Missing!>' WHERE `entry`=-1000000;

UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (33113, 33118, 33186, 33293, 32867, 32927, 32930, 33515, 32906, 32845, 33350, 32865, 33271, 33288, 32871);
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299547 WHERE `entry` = 32857;

UPDATE `script_texts` SET `content_default` = "Welcome, champions! All of our attempts at grounding her have failed. We could use a hand in bring her down with these harpoon guns.", `type` = 0  WHERE `entry` = -1603260;
UPDATE `script_texts` SET `content_default` = "Move! Quickly! She won’t remain grounded for long.", `type` = 1  WHERE `entry` = -1603261;
UPDATE `script_texts` SET `type` = 2  WHERE `entry` = -1603053;
UPDATE `script_texts` SET `type` = 2  WHERE `entry` = -1603214;

UPDATE creature_template SET faction_H = 16, faction_A = 16, ScriptName = 'npc_disciple_of_vesperon' WHERE entry = 30858;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (61990, -61990);
REPLACE INTO `spell_linked_spell` VALUES 
(61990, 7940, 2, "Hodir Flash Freeze immunity");

UPDATE `creature_template` SET `ScriptName` = 'boss_elder_brightleaf' WHERE `entry` =32915;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_ironbranch' WHERE `entry` =32913;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_stonebark' WHERE `entry` =32914;
UPDATE `creature_template` SET `ScriptName` = 'creature_sun_beam', `unit_flags` = 33685510, `modelid1` = 11686, `modelid2` = 0 WHERE `entry` =33170;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 393220, `ScriptName` = 'creature_iron_roots' WHERE `entry` = 33168;

DELETE FROM `spell_linked_spell` WHERE `spell_effect` = -62243;
REPLACE INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(62217, -62243, 1, 'cancels the effects of Unstable Sun Beam'),
(62922, -62243, 1, 'cancels the effects of Unstable Sun Beam');

DELETE FROM `creature_template` WHERE `ScriptName` IN('boss_freya','creature_eonars_gift','creature_nature_bomb','creature_detonating_lasher','creature_ancient_conservator','creature_healthy_spore','creature_storm_lasher','creature_snaplasher','creature_ancient_water_spirit');
UPDATE `creature_template` SET `ScriptName` = 'boss_freya' WHERE `entry` =32906;
UPDATE `creature_template` SET `unit_flags` = 393220, `ScriptName` = 'creature_eonars_gift' WHERE `entry` =33228;
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `unit_flags` = 33685508, `ScriptName` = 'creature_nature_bomb' WHERE `entry` =34129;
UPDATE `creature_template` SET `unit_class` = 2, `ScriptName` = 'creature_detonating_lasher' WHERE `entry` =32918;
UPDATE `creature_template` SET `ScriptName` = 'creature_ancient_conservator' WHERE `entry` =33203;
UPDATE `creature_template` SET `unit_flags` = 33686022, `ScriptName` = 'creature_healthy_spore' WHERE `entry` =33215;
UPDATE `creature_template` SET `ScriptName` = 'creature_storm_lasher' WHERE `entry` =32919;
UPDATE `creature_template` SET `ScriptName` = 'creature_snaplasher' WHERE `entry` =32916;
UPDATE `creature_template` SET `ScriptName` = 'creature_ancient_water_spirit' WHERE `entry` =33202;

DELETE FROM `creature` WHERE `guid` = 136607;

DELETE FROM `spell_linked_spell` WHERE `spell_effect` = -62532;
REPLACE INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(64321, -62532, 1, 'Potent Pheromones ward off the Conservator''s Grip'),
(62619, -62532, 1, 'Pheromones ward off the Conservator''s Grip');

-- (71611) Item - Icecrown 25 Normal Healer Trinket 2 
DELETE FROM `spell_proc_event` WHERE `entry` IN (71611); 
REPLACE INTO `spell_proc_event` VALUES (71611, 0x00, 0, 0x00000000, 0x00000000, 0x00000000, 0x0000A200, 0x00000006, 0, 30, 45);

REPLACE INTO `spell_dbc` VALUES ('56817', '0', '0', '384', '0', '0', '0', '0', '0', '0', '1', '0', '16', '101', '1', '0', '67', '67', '1', '1', '0', '-1', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rune strike proc');

UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `unit_flags` = 33686022, `ScriptName` = 'creature_unstable_sun_beam' WHERE `entry` = 33050;

DELETE FROM `gameobject` WHERE `id` = '194905';
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('@GUID+1','194905','603','3','1','401.308','-13.8236','409.524','3.14159','0','0','0','1','180','255','0');

UPDATE `creature_template` SET `speed_walk` = 0.5 WHERE `entry` = 33113;
UPDATE `creature_template` SET `unit_flags` = 0, `type_flags` = 8, `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;

DELETE FROM spell_linked_spell WHERE spell_trigger IN (57658, 57660, 57662, 57663);
REPLACE INTO spell_linked_spell VALUES
(57658, 30708, 0, "Totem of Wrath crit (rank1)"),
(57660, 30708, 0, "Totem of Wrath crit (rank2)"),
(57662, 30708, 0, "Totem of Wrath crit (rank3)"),
(57663, 30708, 0, "Totem of Wrath crit (rank4)");

UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0, `ScriptName` = 'mob_scorch_ground' WHERE `entry` = 33221;
DELETE FROM `creature_template` WHERE `entry` = 33119;

UPDATE creature SET spawntimesecs = -30 WHERE id = 193988;

UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'mob_pre_phase' WHERE `entry` IN (32882, 32908, 32885, 33110);
UPDATE `creature_template` SET `unit_flags` = 0, `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'mob_arena_phase' WHERE `entry` IN (32876, 32904, 32878, 32877, 32874, 32875);

UPDATE `creature` SET `spawndist` = 0 WHERE `guid` = 136384;
UPDATE `creature` SET `position_x` = 2135.078, `position_y` = -298.758, `orientation` = 1.61 WHERE `guid` = 136384;

DELETE FROM `creature` WHERE `id` IN (32882, 32908, 32885, 32879, 33140, 33141);

UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (32892, 32879, 32780, 33140, 33141);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62042;
REPLACE INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62042','62470','1','Thorim: Deafening Thunder');

UPDATE `creature_template` SET `unit_flags` = 33686020 WHERE `entry` = 33378;

DELETE FROM `creature` WHERE `id` IN (33378, 32892);
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
('@GUID+1', 33378, 603, 3, 1, 16925, 0, 2104.99, -233.484, 433.573, 5.49779, 604800, 0, 0, 12600, 0, 0, 1),
('@GUID+1', 33378, 603, 3, 1, 16925, 0, 2092.64, -262.594, 433.576, 6.26573, 604800, 0, 0, 12600, 0, 0, 1),
('@GUID+1', 33378, 603, 3, 1, 16925, 0, 2104.76, -292.719, 433.181, 0.785398, 604800, 0, 0, 12600, 0, 0, 1),
('@GUID+1', 33378, 603, 3, 1, 16925, 0, 2164.97, -293.375, 433.526, 2.35619, 604800, 0, 0, 12600, 0, 0, 1),
('@GUID+1', 33378, 603, 3, 1, 16925, 0, 2164.58, -233.333, 433.892, 3.90954, 604800, 0, 0, 12600, 0, 0, 1),
('@GUID+1', 33378, 603, 3, 1, 16925, 0, 2145.8, -222.196, 433.293, 4.45059, 604800, 0, 0, 12600, 0, 0, 1),
('@GUID+1', 33378, 603, 3, 1, 16925, 0, 2123.91, -222.443, 433.375, 4.97419, 604800, 0, 0, 12600, 0, 0, 1);

UPDATE `creature_template` SET `unit_flags` = 0, `ScriptName` = 'mob_runic_colossus' WHERE `entry` = 32872;
UPDATE `creature_template` SET `unit_flags` = 0, `ScriptName` = 'mob_rune_giant' WHERE `entry` = 32873;
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0, `ScriptName` = 'thorim_trap_bunny' WHERE `entry` IN (33725, 33282);
UPDATE `creature_template` SET `flags_extra` = 0, `ScriptName` = 'thorim_energy_source' WHERE `entry` = 32892;
UPDATE `creature_template` SET `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;

DELETE FROM `gameobject_scripts` WHERE `id`=55194;
REPLACE INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(55194, 0, 11, 34155, 15, '0', 0, 0, 0, 0);

UPDATE `gameobject` SET `id` = 101855, `rotation2` = 1, `rotation3` = 0, `spawntimesecs` = 7200, `animprogress` = 100 WHERE `guid` = 55194;

-- Eliminata porta a Blood furnace
DELETE FROM gameobject WHERE id = 181819;
-- Alcuni mob senza lootid
UPDATE creature_template SET lootid = entry WHERE entry IN (26800, 26805, 27949, 26802, 26734, 26722, 26735, 26716, 26737, 26782, 26792, 28231, 26799, 26803, 27947, 26801, 26727, 26728, 26730 );
-- Fix Art of War
UPDATE spell_proc_event SET procFlags = 20, procEx = 2 WHERE entry = 53486;



DELETE FROM `creature` WHERE `id` IN (33378, 32892);
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0 WHERE `entry`IN (33378, 32892);
DELETE FROM `creature` WHERE `guid` IN (136718, 136694, 136757, 136700, 136754, 136666, 136718, 136653);

DELETE FROM `gameobject_template` WHERE `entry`=194265;
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194265','1','295','Lever','','','','0','16','3','0','0','0','0','0','0','0','0','6000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','11403');

UPDATE `gameobject` SET `id` = 194265, `rotation2` = 1, `rotation3` = 0, `spawntimesecs` = 7200, `animprogress` = 100 WHERE `guid` = 55194;

DELETE FROM `creature` WHERE `guid`=136816;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('@GUID+1','33725','603','1','1','16925','0','2134.93','-339.696','437.311','0','604800','0','0','12600','0','0','0');

UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 33725;
UPDATE `creature_template` SET `flags_extra` = 2, `ScriptName` = 'thorim_phase_trigger' WHERE `entry` = 32892;

DELETE FROM `creature_addon` WHERE `guid`IN (136059, 136816);
REPLACE INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('136059','0','0','0','1','0','40775 0'),
('136816','0','0','0','1','0','40775 0');

UPDATE `creature_template` SET `mindmg` = 488, `maxdmg` = 642, `attackpower` = 682, `dmg_multiplier` = 7.5, `equipment_id` = 1852 WHERE `entry` = 32908;
UPDATE `creature_template` SET `mindmg` = 488, `maxdmg` = 642, `attackpower` = 482, `dmg_multiplier` = 7.5, `equipment_id` = 1847 WHERE `entry` = 32885;
UPDATE `creature_template` SET `ScriptName` = 'mob_pre_phase' WHERE `entry` IN (32907, 32883);

DELETE FROM `gameobject` WHERE `id`=194314;
REPLACE INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(194314, 603, 3, 1, 2134.58, -286.908, 419.495, 1.55988, 0, 0, 0.703237, 0.710955, -604800, 0, 1);

UPDATE `creature_template` SET `dmgschool` = 4, `dmg_multiplier` = 7.5, `unit_flags` = 33587202, `ScriptName` = 'npc_sif' WHERE `entry` = 33196;

-- Fix a tutta la chain dei Druid per la Flight form 280%
UPDATE quest_template SET NextQuestInChain = 10961 WHERE entry = 10955;
-- SQL per Achievement Leeroy
UPDATE gameobject_template SET flags = 1, data0 = 0, data3 = 15745, data4 = 1, data5 = 300, data7 = 5, ScriptName = 'go_rookery_egg' WHERE entry = 175124;
DELETE FROM spell_linked_spell WHERE spell_trigger = 15750;
REPLACE INTO spell_linked_spell VALUES
(15750, 15745, 0, 'Hatch rookery egg and Spawn rookery whelp');
DELETE FROM gameobject WHERE id = 175124;
REPLACE INTO gameobject (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(175124, 229, 1, 1, 92.5357, -309.449, 91.4441, 0.19126, 0, 0, 0.095486, 0.995431, 300, 0, 1), 
(175124, 229, 1, 1, 80.8269, -306.774, 91.4364, 4.82858, 0, 0, 0.664858, -0.74697, 300, 0, 1), 
(175124, 229, 1, 1, 87.7017, -323.206, 91.4441, 0.19126, 0, 0, 0.095486, 0.995431, 300, 0, 1), 
(175124, 229, 1, 1, 94.3771, -285.049, 91.4464, 0.19754, 0, 0, 0.098612, 0.995126, 300, 0, 1), 
(175124, 229, 1, 1, 90.2378, -274.429, 91.4473, 0.85728, 0, 0, 0.415635, 0.909532, 300, 0, 1), 
(175124, 229, 1, 1, 78.6885, -264.371, 91.4759, 4.51095, 0, 0, 0.774622, -0.632425, 300, 0, 1), 
(175124, 229, 1, 1, 75.0817, -273.637, 91.5158, 4.51095, 0, 0, 0.774622, -0.632425, 300, 0, 1), 
(175124, 229, 1, 1, 71.3066, -289.746, 91.4315, 4.17166, 0, 0, 0.870276, -0.492564, 300, 0, 1), 
(175124, 229, 1, 1, 74.6356, -297.189, 91.4362, 4.17166, 0, 0, 0.870276, -0.492564, 300, 0, 1), 
(175124, 229, 1, 1, 83.8499, -274.465, 91.4631, 5.32305, 0, 0, 0.461838, -0.886964, 300, 0, 1), 
(175124, 229, 1, 1, 80.4038, -280.173, 91.4595, 5.32305, 0, 0, 0.461838, -0.886964, 300, 0, 1), 
(175124, 229, 1, 1, 84.5663, -286.677, 91.4495, 5.32305, 0, 0, 0.461838, -0.886964, 300, 0, 1), 
(175124, 229, 1, 1, 87.2716, -290.730, 91.4473, 4.25884, 0, 0, 0.847986, -0.530019, 300, 0, 1), 
(175124, 229, 1, 1, 86.8243, -296.265, 91.4474, 3.33050, 0, 0, 0.995543, -0.094311, 300, 0, 1), 
(175124, 229, 1, 1, 87.5156, -300.959, 91.4445, 2.70610, 0, 0, 0.976387, 0.216027, 300, 0, 1), 
(175124, 229, 1, 1, 84.0487, -305.832, 91.4443, 1.54529, 0, 0, 0.698030, 0.716068, 300, 0, 1), 
(175124, 229, 1, 1, 77.9442, -305.676, 91.4246, 1.54529, 0, 0, 0.698030, 0.716068, 300, 0, 1), 
(175124, 229, 1, 1, 80.7936, -301.279, 91.4403, 4.82858, 0, 0, 0.664858, -0.74697, 300, 0, 1), 
(175124, 229, 1, 1, 78.7729, -294.968, 91.4458, 4.81208, 0, 0, 0.670995, -0.741461, 300, 0, 1), 
(175124, 229, 1, 1, 74.8663, -290.366, 91.4486, 4.81208, 0, 0, 0.670995, -0.741461, 300, 0, 1), 
(175124, 229, 1, 1, 79.2071, -288.836, 91.4516, 5.03514, 0, 0, 0.584305, -0.811534, 300, 0, 1), 
(175124, 229, 1, 1, 76.6967, -310.336, 91.4219, 4.82858, 0, 0, 0.664858, -0.74697, 300, 0, 1), 
(175124, 229, 1, 1, 73.4492, -314.179, 91.4317, 4.82858, 0, 0, 0.664858, -0.74697, 300, 0, 1), 
(175124, 229, 1, 1, 72.4902, -319.147, 91.4439, 6.17868, 0, 0, 0.052229, -0.998635, 300, 0, 1), 
(175124, 229, 1, 1, 75.4051, -322.063, 91.4455, 0.43977, 0, 0, 0.218119, 0.975922, 300, 0, 1), 
(175124, 229, 1, 1, 80.1899, -322.750, 91.4455, 1.27387, 0, 0, 0.594733, 0.803923, 300, 0, 1), 
(175124, 229, 1, 1, 84.5511, -319.779, 91.4455, 1.90768, 0, 0, 0.815644, 0.578554, 300, 0, 1), 
(175124, 229, 1, 1, 85.8381, -317.104, 91.4404, 1.90768, 0, 0, 0.815644, 0.578554, 300, 0, 1), 
(175124, 229, 1, 1, 81.5623, -315.025, 91.4342, 1.90768, 0, 0, 0.815644, 0.578554, 300, 0, 1), 
(175124, 229, 1, 1, 89.3050, -312.546, 91.4439, 1.81108, 0, 0, 0.786758, 0.617261, 300, 0, 1), 
(175124, 229, 1, 1, 85.5140, -310.614, 91.4439, 1.49064, 0, 0, 0.678206, 0.734872, 300, 0, 1), 
(175124, 229, 1, 1, 75.5634, -327.404, 91.4546, 0.13032, 0, 0, 0.065116, 0.997878, 300, 0, 1), 
(175124, 229, 1, 1, 79.7329, -327.027, 91.4496, 0.13032, 0, 0, 0.065116, 0.997878, 300, 0, 1), 
(175124, 229, 1, 1, 84.5119, -324.820, 91.4464, 5.05163, 0, 0, 0.577594, -0.816324, 300, 0, 1), 
(175124, 229, 1, 1, 86.7307, -329.953, 91.4481, 3.75101, 0, 0, 0.953935, -0.300014, 300, 0, 1), 
(175124, 229, 1, 1, 85.6798, -333.713, 91.4941, 2.76141, 0, 0, 0.981987, 0.188951, 300, 0, 1), 
(175124, 229, 1, 1, 81.2523, -335.119, 91.5145, 2.19827, 0, 0, 0.890816, 0.454365, 300, 0, 1), 
(175124, 229, 1, 1, 74.8478, -336.431, 91.5275, 2.19827, 0, 0, 0.890816, 0.454365, 300, 0, 1), 
(175124, 229, 1, 1, 70.9943, -332.916, 91.4938, 1.38067, 0, 0, 0.636797, 0.771031, 300, 0, 1), 
(175124, 229, 1, 1, 71.8472, -326.393, 91.4560, 0.48532, 0, 0, 0.240286, 0.970702, 300, 0, 1), 
(175124, 229, 1, 1, 70.4087, -311.347, 91.4250, 0.93064, 0, 0, 0.448709, 0.893678, 300, 0, 1), 
(175124, 229, 1, 1, 82.5604, -295.547, 91.4460, 1.77652, 0, 0, 0.775974, 0.630765, 300, 0, 1), 
(175124, 229, 1, 1, 83.8027, -291.565, 91.4480, 1.77652, 0, 0, 0.775974, 0.630765, 300, 0, 1), 
(175124, 229, 1, 1, 86.5843, -283.761, 91.4480, 0.24027, 0, 0, 0.119849, 0.992792, 300, 0, 1), 
(175124, 229, 1, 1, 85.0713, -280.016, 91.4512, 1.45372, 0, 0, 0.664525, 0.747266, 300, 0, 1), 
(175124, 229, 1, 1, 87.3083, -276.251, 91.4546, 1.45372, 0, 0, 0.664525, 0.747266, 300, 0, 1), 
(175124, 229, 1, 1, 85.8825, -272.356, 91.4555, 1.45372, 0, 0, 0.664525, 0.747266, 300, 0, 1), 
(175124, 229, 1, 1, 80.4378, -270.532, 91.4701, 1.45372, 0, 0, 0.664525, 0.747266, 300, 0, 1), 
(175124, 229, 1, 1, 77.7467, -269.364, 91.4764, 1.38774, 0, 0, 0.639518, 0.768776, 300, 0, 1), 
(175124, 229, 1, 1, 72.3476, -273.436, 91.9490, 5.60769, 0, 0, 0.331364, -0.943503, 300, 0, 1), 
(175124, 229, 1, 1, 72.0917, -278.473, 92.3898, 5.60769, 0, 0, 0.331364, -0.943503, 300, 0, 1), 
(175124, 229, 1, 1, 76.4959, -277.941, 91.4718, 5.60769, 0, 0, 0.331364, -0.943503, 300, 0, 1), 
(175124, 229, 1, 1, 81.8386, -266.386, 91.4679, 1.02489, 0, 0, 0.490309, 0.871548, 300, 0, 1), 
(175124, 229, 1, 1, 80.7404, -261.534, 91.4721, 1.02489, 0, 0, 0.490309, 0.871548, 300, 0, 1), 
(175124, 229, 1, 1, 82.1547, -258.241, 91.4727, 6.02866, 0, 0, 0.126919, -0.991913, 300, 0, 1), 
(175124, 229, 1, 1, 85.2454, -256.426, 91.4664, 6.02866, 0, 0, 0.126919, -0.991913, 300, 0, 1), 
(175124, 229, 1, 1, 86.2106, -252.011, 91.4640, 5.16786, 0, 0, 0.529203, -0.848495, 300, 0, 1), 
(175124, 229, 1, 1, 82.8484, -253.065, 91.4711, 5.16786, 0, 0, 0.529203, -0.848495, 300, 0, 1), 
(175124, 229, 1, 1, 80.2270, -254.349, 91.4753, 5.16786, 0, 0, 0.529203, -0.848495, 300, 0, 1), 
(175124, 229, 1, 1, 83.2917, -300.747, 91.4429, 4.43822, 0, 0, 0.797102, -0.603845, 300, 0, 1), 
(175124, 229, 1, 1, 88.9124, -305.909, 91.4467, 4.43822, 0, 0, 0.797102, -0.603845, 300, 0, 1), 
(175124, 229, 1, 1, 91.9227, -315.237, 91.4454, 4.43822, 0, 0, 0.797102, -0.603845, 300, 0, 1), 
(175124, 229, 1, 1, 84.6920, -328.950, 91.4478, 3.32374, 0, 0, 0.995855, -0.09095, 300, 0, 1), 
(175124, 229, 1, 1, 82.5760, -311.082, 91.4300, 1.74745, 0, 0, 0.766725, 0.641975, 300, 0, 1), 
(175124, 229, 1, 1, 74.7861, -283.433, 91.6486, 5.95483, 0, 0, 0.163443, -0.986553, 300, 0, 1), 
(175124, 229, 1, 1, 80.0918, -284.581, 91.4505, 5.49144, 0, 0, 0.385613, -0.922661, 300, 0, 1), 
(175124, 229, 1, 1, 72.1011, -286.175, 91.9243, 2.86036, 0, 0, 0.990130, 0.140155, 300, 0, 1), 
(175124, 229, 1, 1, 80.1427, -275.407, 91.4708, 0.04470, 0, 0, 0.022349, 0.99975, 300, 0, 1), 
(175124, 229, 1, 1, 85.0524, -268.201, 91.4611, 1.13641, 0, 0, 0.538118, 0.842869, 300, 0, 1), 
(175124, 229, 1, 1, 86.4947, -264.407, 91.4594, 1.63513, 0, 0, 0.729484, 0.683998, 300, 0, 1); 
-- Rookery Whelps 
UPDATE creature_template SET unit_flags = 1, ScriptName = 'npc_rookery_whelp' WHERE entry = 10161;


UPDATE gameobject_template SET ScriptName = "go_blackrock_altar" WHERE entry = 175706;
UPDATE gameobject_template SET ScriptName = "go_room_rune" WHERE entry IN (175194, 175195, 175196, 175197, 175198, 175199, 175200);


UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0, `flags_extra` = 2, `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33282;

UPDATE `gameobject_template` SET `flags` = 32, `data2` = 3000, `ScriptName` = 'go_call_tram' WHERE `entry` IN (194914, 194912, 194437);
DELETE FROM gameobject WHERE id = '194437';
REPLACE INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('194437','603','3','1','2306.87','274.237','424.288','1.52255','0','0','0.689847','0.723956','300','0','1');

DELETE FROM gameobject_template WHERE entry = '194438';
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194438','1','8504','Activate Tram','','','','0','32','1','0','0','0','0','0','0','0','0','3000','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','go_call_tram','11159');
DELETE FROM gameobject WHERE id = '194438';
REPLACE INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(194438, 603, 1,1,2306.99, 2589.35, 424.382, 4.71676, 0, 0, 0.705559, -0.708651, 300, 0, 1);

UPDATE `creature_template` SET `vehicleid` = 342 WHERE `entry` = 33118;

-- Ultimi item buggato che chiede rep inesistenti,Grazie Medea per l'aiuto del cliccaggio :P
UPDATE item_template SET RequiredReputationFaction = 1037 WHERE entry = 44701;
UPDATE item_template SET RequiredReputationRank = 0 WHERE entry IN (21914, 29333, 29334, 29335, 29336, 30483, 31747, 31748, 31939, 31942, 32540, 32541, 32797, 32798, 32799, 32800, 32802, 32803, 32804, 32805, 32806, 32807, 32808, 32979, 32988, 32998, 33593, 33592, 33590, 33591, 34190, 34790, 34810, 35501, 35756, 35577, 35587, 35633, 37083, 37099, 37112, 37169, 37360, 37389, 37616, 37681, 37791, 39225, 39256, 40252, 40348, 40410, 40489, 40722, 41383, 41384, 41607, 41608, 41609, 41610, 42172, 42173, 42175, 42176, 42177, 42178, 43988, 44067, 44068, 44069, 44075, 44134, 44135, 44136, 44149, 44150, 44152, 44159, 44579, 44597, 44957, 45085, 45171, 45234, 45319, 45322, 45457, 45479, 45886, 45934, 46014, 46025, 46350, 47892, 47900, 47275, 48036, 47743, 47960, 47063, 47815, 47968, 47042, 48675, 47524, 47247, 48670, 47436, 48045, 47246, 47525, 45496, 50805, 50466, 50273, 49992, 49832, 49801, 49790, 47550, 50966, 50859, 50074, 51582, 50181, 47549, 51799, 50166, 50167, 50168, 51898, 50429, 50648, 50718, 51887); 
-- Primi fix a Eye of Eternity
UPDATE instance_template SET script = 'instance_eye_of_eternity' WHERE map = 616;
UPDATE creature_template SET VehicleId=264 WHERE entry = 30248;
UPDATE `gameobject_template` SET `ScriptName` = 'go_malygos_iris' WHERE `entry` IN (193960,193958); 
UPDATE gameobject_template SET flags = 4, data0 = 43 WHERE gameobject_template.entry in (193967, 193905);
UPDATE creature_template SET ScriptName = 'boss_malygos' WHERE entry = 28859;
UPDATE creature_template SET ScriptName = 'mob_nexus_lord' WHERE entry = 30245;
UPDATE creature_template SET ScriptName = 'mob_scion_of_eternity' WHERE entry = 30249;
UPDATE creature_template SET ScriptName = 'mob_power_spark' WHERE entry = 30084;
UPDATE creature_template SET ScriptName = 'npc_arcane_overload' WHERE entry = 30282;


UPDATE `creature_template` SET `vehicleid` = 353 WHERE `entry` = 33293;
UPDATE `creature_template` SET `speed_walk` = 0.5, `speed_run` = 0.5, `faction_A` = 16, `faction_H` = 16 WHERE `entry` IN (33343, 33346);
UPDATE `creature_template` SET `modelid1` = 19139, `modelid2` = 0, `modelid3` = 0, `dmg_multiplier` = 35 WHERE `entry` = 33346;

UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `flags_extra` = 2, `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33245;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 33282;

-- Fix ai GOB
UPDATE creature_template SET flags_extra = flags_extra | 2, faction_A = 35, faction_H = 35 WHERE entry = 30118; -- Portal (Malygos)
UPDATE `gameobject_template` SET `ScriptName` = 'go_malygos_iris' WHERE `entry` IN (193960,193958); 
-- Fix malygos,reso attaccabile
UPDATE creature_template SET unit_flags = 1 WHERE entry = 28859;
-- Fix ai danni di Malygos e dei suoi add
UPDATE creature_template SET mindmg = 3684, maxdmg = 4329, dmg_multiplier = 7.5, mechanic_immune_mask = 1072918979 WHERE entry = 30245; -- Nexus Lord
UPDATE creature_template SET mindmg = 3684, maxdmg = 4329, dmg_multiplier = 13,  mechanic_immune_mask = 1072918979 WHERE entry = 31750; -- Nexus Lord (1)
UPDATE creature_template SET mechanic_immune_mask = 1072918979 WHERE entry IN (30249, 31751);
UPDATE creature_template SET faction_A = 14, faction_H = 14 WHERE entry IN (31750, 31751);
-- Fix a blade for a fit Champion (Quest argent tournament)
UPDATE creature_template SET ScriptName = 'npc_lake_frog' WHERE 'entry' = 33224;
-- Spawn di lake frog
DELETE FROM creature WHERE id = 33224;
REPLACE INTO creature (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33224, 571, 3, 1, 0, 0, 3730.57, -4302.91, 182.097, 2.35789, 300, 0, 0, 40, 120, 0, 0),  
(33224, 571, 3, 1, 0, 0, 3726.49, -4312.76, 179.671, 1.68559, 300, 0, 0, 40, 120, 0, 0),  
(33224, 571, 3, 1, 0, 0, 3714.32, -4311.07, 181.014, 0.81772, 300, 0, 0, 40, 120, 0, 0),  
(33224, 571, 3, 1, 0, 0, 3715.14, -4305.41, 182.313, 1.36436, 300, 0, 0, 40, 120, 0, 0),
(33224, 571, 3, 1, 0, 0, 3723.58, -4306.54, 182.245, 1.89215, 300, 0, 0, 40, 120, 0, 0);  


DELETE FROM `creature_model_info` WHERE `modelid` IN (28638, 28821, 28822);
REPLACE INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28638, 0.15, 20, 2, 0),
(28821, 0.35, 20, 2, 0),
(28822, 0.35, 20, 2, 0);

UPDATE `creature_template` SET `resistance4` = 1000 WHERE `entry` IN (33325, 32901, 33328, 32900, 32893, 33327, 32897, 33326, 32941, 33333, 33332, 32950, 33331, 32946, 32948, 33330);

-- Teleport DOWN Orb of Traslocation
UPDATE `gameobject_template` SET `data10` = 26572 WHERE `entry`=180912;
-- Teleport UP Orb of Traslocation
UPDATE `gameobject_template` SET `data10` = 26566 WHERE `entry`=180911;
-- Drake 
UPDATE creature_template SET dynamicflags = 8 WHERE entry = 28859;
-- Realm First!
DELETE FROM achievement_criteria_data WHERE criteria_id = 1400;
REPLACE INTO achievement_criteria_data VALUES
(1400, 1, 28859, 0); -- Realm First Magic Seeker
-- Veicoli e hover disk
UPDATE creature_template SET flags_extra = flags_extra | 2 WHERE entry = 30090; -- Vortex  'Arcane Overload', 'Hover Disk');
UPDATE creature_template SET flags_extra = flags_extra | 2, faction_A = 35, faction_H = 35, VehicleId = 165 WHERE entry IN (30234, 30248); -- Hover Disk
-- Bug vari
UPDATE creature_template SET flags_extra = flags_extra | 2, faction_A = 35, faction_H = 35 WHERE entry = 30118; -- Portal (Malygos)
UPDATE creature_template SET flags_extra = flags_extra | 2 WHERE entry = 30282; -- Arcane Overload
UPDATE creature_template SET mindmg = 1, maxdmg = 1, dmg_multiplier = 1 WHERE entry = 30592; -- Static Field
UPDATE creature_template SET modelid1 = 11686, modelid2 = 11686 WHERE entry = 22517; -- Some world trigger
-- Wyrmest Drake Spell & mount
UPDATE creature_template SET spell1 = 56091, spell2 = 56092, spell3 = 57090, spell4 = 57143, spell5 = 57108, spell6 = 57403, VehicleId = 165 WHERE entry IN (30161, 31752);
-- Versione Heroic di Malygos
DELETE FROM creature_template WHERE entry = 50000;
REPLACE INTO creature_template (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, 
modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, 
rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, 
trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, 
skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, 
spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, 
questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified) VALUES 
(50000, 0, 0, 0, 0, 0, 26752, 0, 0, 0, 'Malygos', '', '', 0, 83, 83, 2, 16, 16, 0, 1, 1.14286, 1, 3, 496, 674, 0, 783, 35, 2000, 0, 2, 64, 8, 0, 0, 0, 0, 0, 365, 529, 98, 2, 108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 5, 500, 50, 1, 0, 44650, 0, 0, 0, 0, 0, 227, 1, 0, 0, 1, 'boss_malygos', 1);
UPDATE creature_template SET mindmg = 4602, maxdmg = 5502, dmg_multiplier = 13, Health_mod = 1400, questItem1 = 44651, mechanic_immune_mask = 617299803 WHERE entry = 50000;
-- Update malygos
UPDATE creature_template SET mindmg = 4602, maxdmg = 5502, dmg_multiplier = 7.5, difficulty_entry_1 = 50000, mechanic_immune_mask = 617299803 WHERE entry = 28859;
UPDATE creature_template SET flags_extra = flags_extra | 1 WHERE entry IN (28859, 50000);
-- Add di malygos e Gameobject
UPDATE gameobject_template SET flags = 4, data0 = 43 WHERE entry in (193967, 193905);
UPDATE creature_template SET ScriptName = 'boss_malygos', unit_flags = unit_flags & ~256 WHERE entry = 28859;
UPDATE creature SET MovementType = 0, spawndist = 0 WHERE id = 28859; -- Malygos, don't move
UPDATE creature_template SET ScriptName = 'mob_nexus_lord' WHERE entry = 30245; -- Nexus Lord
UPDATE creature_template SET ScriptName = 'mob_scion_of_eternity' WHERE entry = 30249; -- Scion of Eternity
UPDATE creature_template SET faction_A = 14, faction_H = 14, ScriptName = 'mob_power_spark' WHERE entry = 30084; -- Power Spark
UPDATE creature_template SET faction_A = 14, faction_H = 14 WHERE entry = 32187; -- Power Spark (1)
UPDATE creature_template SET ScriptName = 'npc_arcane_overload' WHERE entry = 30282; -- Arcane Overload
-- Fix alle rane
UPDATE creature_template SET ScriptName = 'npc_lake_frog' WHERE entry = 33224;

UPDATE `creature_template` SET `vehicleId` = 336 WHERE `entry` = 33432; -- Leviathan Mk II
DELETE FROM creature WHERE id = 34071;
DELETE FROM vehicle_accessory WHERE entry = 33432;
REPLACE INTO vehicle_accessory VALUE (33432, 34071, 7, 1, 'Leviathan Mk II turret');
UPDATE creature_template SET ScriptName = 'boss_mimiron' WHERE entry = 33350;
UPDATE creature_template SET ScriptName = 'boss_leviathan_mk' WHERE entry = 33432;
UPDATE creature_template SET ScriptName = 'boss_leviathan_mk_turret' WHERE entry = 34071;
UPDATE creature_template SET ScriptName = 'mob_proximity_mine' WHERE entry = 34362;
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
REPLACE INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0.5, 7, 2, 0);

-- Surge of power (NPC)
DELETE FROM creature WHERE id = 30334;
DELETE FROM creature_addon WHERE guid = 132303;
-- Spawn Focusing iris per summonare malygos
DELETE FROM gameobject WHERE id IN (193958, 193960);
REPLACE INTO gameobject VALUES
(NULL, 193958, 616, 1, 1, 754.362, 1301.61, 266.171, 6.23742, 0, 0, 0.022883, -0.999738, 300, 0, 1), 
(NULL, 193960, 616, 2, 1, 754.362, 1301.61, 266.171, 6.23742, 0, 0, 0.022883, -0.999738, 300, 0, 1); 
-- Fix alla chest dei drop
UPDATE gameobject_template SET faction = 35, flags = 0 WHERE entry IN (193967, 193905);
-- Fix loot for Malygos (Alexstrasza's Gift)
DELETE FROM reference_loot_template WHERE entry = 50008;
REPLACE INTO reference_loot_template (entry, item, ChanceOrQuestChance, lootmode, groupid, mincountOrRef, maxcount) VALUES
(50008, 40474, 0, 1, 1, 1, 1), -- Surge Needle Ring
(50008, 40497, 0, 1, 1, 1, 1), -- Black Ice
(50008, 40489, 0, 1, 1, 1, 1), -- Greatstaff of the Nexus
(50008, 40526, 0, 1, 1, 1, 1), -- Gown of the Spell-Weaver
(50008, 40511, 0, 1, 1, 1, 1), -- Focusing Energy Epaulets
(50008, 40475, 0, 1, 1, 1, 1), -- Barricade of Eternity
(50008, 40488, 0, 1, 1, 1, 1), -- Ice Spire Scepter
(50008, 40491, 0, 1, 1, 1, 1), -- Hailstorm
(50008, 40519, 0, 1, 1, 1, 1), -- Footsteps of Malygos
(50008, 40486, 0, 1, 1, 1, 1); -- Necklace of the Glittering Chamber
-- Fix loot 25 Man
DELETE FROM reference_loot_template WHERE entry = 50009;
REPLACE INTO reference_loot_template (entry, item, ChanceOrQuestChance, lootmode, groupid, mincountOrRef, maxcount) VALUES
(50009, 40592, 0, 1, 1, 1, 1), -- Boots of Healing Energies
(50009, 40566, 0, 1, 1, 1, 1), -- Unravelling Strands of Sanity
(50009, 40194, 0, 1, 1, 1, 1), -- Blanketing Robes of Snow
(50009, 40543, 0, 1, 1, 1, 1), -- Blue Aspect Helm
(50009, 40590, 0, 1, 1, 1, 1), -- Elevated Lair Pauldrons
(50009, 40560, 0, 1, 1, 1, 1), -- Leggings of the Wanton Spellcaster
(50009, 40589, 0, 1, 1, 1, 1), -- Legplates of Sovereignty
(50009, 40555, 0, 1, 1, 1, 1), -- Mantle of Dissemination
(50009, 40591, 0, 1, 1, 1, 1), -- Melancholy Sabatons
(50009, 40594, 0, 1, 1, 1, 1), -- Spaulders of Catatonia
(50009, 40588, 0, 1, 1, 1, 1), -- Tunic of the Artifact Guardian
(50009, 40549, 0, 1, 1, 1, 1), -- Boots of the Renewed Flight
(50009, 40539, 0, 1, 1, 1, 1), -- Chestguard of the Recluse
(50009, 40541, 0, 1, 1, 1, 1), -- Frosted Adroit Handguards
(50009, 40562, 0, 1, 1, 1, 1), -- Hood of Rationality
(50009, 40561, 0, 1, 1, 1, 1), -- Leash of Heedless Magic
(50009, 40532, 0, 1, 1, 1, 1), -- Living Ice Crystals
(50009, 40531, 0, 1, 1, 1, 1), -- Mark of Norgannon
(50009, 40564, 0, 1, 1, 1, 1), -- Winter Spectacle Gloves
(50009, 40558, 0, 1, 1, 1, 1); -- Arcanic Tramplers

-- Fix Text 
DELETE FROM script_texts WHERE entry BETWEEN -1616034 AND -1616000;
REPLACE INTO script_texts (npc_entry, entry, content_default, sound, type, language, emote, comment) VALUES
(28859, -1616000, 'Lesser beings, intruding here! A shame that your excess courage does not compensate for your stupidity!', 14512, 1, 0, 0, 'Malygos INTRO 1'),
(28859, -1616001, 'None but the blue dragonflight are welcome here! Perhaps this is the work of Alexstrasza? Well then, she has sent you to your deaths.', 14513, 1, 0, 0, 'Malygos INTRO 2'),
(28859, -1616002, 'What could you hope to accomplish, to storm brazenly into my domain? To employ MAGIC? Against ME?', 14514, 1, 0, 0, 'Malygos INTRO 3'),
(28859, -1616003, 'I am without limits here... the rules of your cherished reality do not apply... In this realm, I am in control...', 14515, 1, 0, 0, 'Malygos INTRO 4'),
(28859, -1616004, 'I give you one chance. Pledge fealty to me, and perhaps I won\'t slaughter you for your insolence!', 14516, 1, 0, 0, 'Malygos INTRO 5'),
(28859, -1616005, 'My patience has reached its limit, I WILL BE RID OF YOU!', 14517, 1, 0, 0, 'Malygos AGGRO 1'),
(28859, -1616006, 'Watch helplessly as your hopes are swept away...', 14525, 1, 0, 0, 'Malygos VORTEX'),
(28859, -1616007, 'I AM UNSTOPPABLE!', 14533, 1, 0, 0, 'Malygos SPARK BUFF'),
(28859, -1616008, 'Your stupidity has finally caught up to you!', 14519, 1, 0, 0, 'Malygos SLAY 1-1'),
(28859, -1616009, 'More artifacts to confiscate...', 14520, 1, 0, 0, 'Malygos SLAY 1-2'),
(28859, -1616010, 'How very... naive...', 14521, 1, 0, 0, 'Malygos SLAY 1-3'),
(28859, -1616012, 'I had hoped to end your lives quickly, but you have proven more...resilient then I had anticipated. Nonetheless, your efforts are in vain, it is you reckless, careless mortals who are to blame for this war! I do what I must...And if it means your...extinction...THEN SO BE IT!', 14522, 1, 0, 0, 'Malygos PHASEEND 1'),
(28859, -1616013, 'Few have experienced the pain I will now inflict upon you!', 14523, 1, 0, 0, 'Malygos AGGRO 2'),
(28859, -1616014, 'YOU WILL NOT SUCCEED WHILE I DRAW BREATH!', 14518, 1, 0, 0, 'Malygos DEEP BREATH'),
(28859, -1616016, 'I will teach you IGNORANT children just how little you know of magic...', 14524, 1, 0, 0, 'Malygos ARCANE OVERLOAD'),
(28859, -1616020, 'Your energy will be put to good use!', 14526, 1, 0, 0, 'Malygos SLAY 2-1'),
(28859, -1616021, 'I AM THE SPELL-WEAVER! My power is INFINITE!', 14527, 1, 0, 0, 'Malygos SLAY 2-2'),
(28859, -1616022, 'Your spirit will linger here forever!', 14528, 1, 0, 0, 'Malygos SLAY 2-3'),
(28859, -1616017, 'ENOUGH! If you intend to reclaim Azeroth\'s magic, then you shall have it...', 14529, 1, 0, 0, 'Malygos PHASEEND 2'),
(28859, -1616018, 'Now your benefactors make their appearance...But they are too late. The powers contained here are sufficient to destroy the world ten times over! What do you think they will do to you?', 14530, 1, 0, 0, 'Malygos PHASE 3 INTRO'),
(28859, -1616019, 'SUBMIT!', 14531, 1, 0, 0, 'Malygos AGGRO 3'),
(28859, -1616026, 'The powers at work here exceed anything you could possibly imagine!', 14532, 1, 0, 0, 'Malygos STATIC FIELD'),
(28859, -1616023, 'Alexstrasza! Another of your brood falls!', 14534, 1, 0, 0, 'Malygos SLAY 3-1'),
(28859, -1616024, 'Little more then gnats!', 14535, 1, 0, 0, 'Malygos SLAY 3-2'),
(28859, -1616025, 'Your red allies will share your fate...', 14536, 1, 0, 0, 'Malygos SLAY 3-3'),
(28859, -1616027, 'Still standing? Not for long...', 14537, 1, 0, 0, 'Malygos SPELL 1'),
(28859, -1616028, 'Your cause is lost!', 14538, 1, 0, 0, 'Malygos SPELL 1'),
(28859, -1616029, 'Your fragile mind will be shattered!', 14539, 1, 0, 0, 'Malygos SPELL 1'),
(28859, -1616030, 'UNTHINKABLE! The mortals will destroy... e-everything... my sister... what have you-', 14540, 1, 0, 0, 'Malygos DEATH'),
(32295, -1616031, 'I did what I had to, brother. You gave me no alternative.', 14406, 1, 0, 0, 'Alexstrasza OUTRO 1'),
(32295, -1616032, 'And so ends the Nexus War.', 14407, 1, 0, 0, 'Alexstrasza OUTRO 2'),
(32295, -1616033, 'This resolution pains me deeply, but the destruction, the monumental loss of life had to end. Regardless of Malygos\' recent transgressions, I will mourn his loss. He was once a guardian, a protector. This day, one of the world\'s mightiest has fallen.', 14408, 1, 0, 0, 'Alexstrasza OUTRO 3'),
(32295, -1616034, 'The red dragonflight will take on the burden of mending the devastation wrought on Azeroth. Return home to your people and rest. Tomorrow will bring you new challenges, and you must be ready to face them. Life...goes on.', 14409, 1, 0, 0, 'Alexstrasza OUTRO 4');

-- Tentativo fix della chain dei druidi
DELETE FROM creature_involvedrelation WHERE quest IN (10955, 10961, 10964, 10965, 10978, 10979, 10980, 10986, 10987, 10988, 10990, 10991, 10992, 10993, 10994, 11001);
REPLACE INTO creature_involvedrelation VALUES
(22832, 10955),
(22832, 10961),
(22832, 10978),
(22832, 10994),
(22832, 11001),
(22834, 10964),
(22837, 10965),
(22924, 10979),
(22924, 10980),
(22924, 10988),
(22924, 10992),
(22981, 10986),
(22981, 10987),
(23338, 10990),
(23338, 10991);
DELETE FROM creature_questrelation WHERE quest IN (10955, 10961, 10964, 10965, 10978, 10979, 10980, 10986, 10987, 10988, 10990, 10991, 10992, 10993, 10994, 11001);
REPLACE INTO creature_questrelation VALUES
(12042, 10955),
(22832, 10961),
(22832, 10994),
(22832, 10979),
(22832, 11001),
(22834, 11001),
(22834, 10965),
(22837, 10978),
(22924, 10980),
(22924, 10986),
(22924, 10990),
(22924, 10993),
(22981, 10987),
(22981, 10988),
(23338, 10991),
(23338, 10992);


-- Aggro Malygos
UPDATE creature_model_info SET combat_reach = '30' WHERE modelid = 26752;
-- Script GO Focusing Iris
UPDATE `gameobject_template` SET `ScriptName` = 'go_malygos_iris' WHERE `entry` IN (193960,193958); 
-- Spawn Water Revenanat by JGC
DELETE FROM creature WHERE id = 30877;
REPLACE INTO creature
(`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`)
VALUES
(30877, 571, 1, 1, 27391, 0, 4701.05, 2620.23, 335.868, 3.42586, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 5164.58, 3538.6, 353.628, 0.479253, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 5226.99, 3385.88, 353.644, 0.787289, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4718.32, 3353.8, 336.015, 3.46938, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4852.41, 3513.47, 331.376, 5.56367, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4680.12, 3261.2, 335.64, 5.7209, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 5068.52, 3514.3, 354.219, 5.94507, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4650.11, 3216.19, 336.037, 0.462086, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4704.64, 3453.58, 353.475, 5.79484, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4555.87, 2976.34, 335.639, 0.399384, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 5141.5, 3416.66, 353.632, 5.51932, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4972.7, 3210.85, 346.899, 2.70996, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4781.65, 3148.91, 346.899, 5.31853, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4715.96, 3519.97, 344.724, 0.793317, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4653.8, 2342.48, 334.472, 1.18402, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4576.24, 2360.43, 334.347, 3.19344, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4539.82, 2426.31, 345.484, 1.58316, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4757.16, 2220.46, 335.432, 2.83542, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4788.23, 1975.37, 420.174, 0.598566, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4902.13, 2235, 347.502, 0.766064, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4883.96, 1985.27, 410.708, 3.55263, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4822.82, 2041.69, 404.181, 2.35956, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4903.36, 2049.29, 402.789, 2.98618, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4595.95, 2848.9, 335.764, 0.52775, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4639.69, 2769.04, 335.584, 3.56645, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4612.82, 2909.1, 335.637, 3.27896, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4811.98, 2179.59, 334.711, 0.231615, 180, 5, 0, 25200, 3994, 0, 1);
-- Loot Water Revenanat by JGC
UPDATE creature_template SET lootid = 30877 WHERE entry = 30877;
DELETE FROM creature_loot_template WHERE item IN (43322,44808);
REPLACE INTO creature_loot_template VALUES
(30877, 43322, -60, 1, 0, 2, 5),
(30877, 44808, -60, 1, 0, 2, 5),
(30846, 43322, -100, 1, 0, 1, 1),
(30846, 44808, -100, 1, 0, 1, 1); 

-- Vanish fix
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = -1784;
REPLACE INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(-1784, -11327, 0, 'Vanish - Rank 1'),
(-1784, -11329, 0, 'Vanish - Rank 2'),
(-1784, -26888, 0, 'Vanish - Rank 3');


-- Aggro Malygos
UPDATE creature_model_info SET combat_reach = '30' WHERE modelid = 26752;
-- Script GO Focusing Iris
UPDATE `gameobject_template` SET `ScriptName` = 'go_malygos_iris' WHERE `entry` IN (193960,193958); 
-- Spawn Water Revenanat by JGC
DELETE FROM creature WHERE id = 30877;
REPLACE INTO creature
(`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`, `orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`)
VALUES
(30877, 571, 1, 1, 27391, 0, 4701.05, 2620.23, 335.868, 3.42586, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 5164.58, 3538.6, 353.628, 0.479253, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 5226.99, 3385.88, 353.644, 0.787289, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4718.32, 3353.8, 336.015, 3.46938, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4852.41, 3513.47, 331.376, 5.56367, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4680.12, 3261.2, 335.64, 5.7209, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 5068.52, 3514.3, 354.219, 5.94507, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4650.11, 3216.19, 336.037, 0.462086, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4704.64, 3453.58, 353.475, 5.79484, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4555.87, 2976.34, 335.639, 0.399384, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 5141.5, 3416.66, 353.632, 5.51932, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4972.7, 3210.85, 346.899, 2.70996, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4781.65, 3148.91, 346.899, 5.31853, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4715.96, 3519.97, 344.724, 0.793317, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4653.8, 2342.48, 334.472, 1.18402, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4576.24, 2360.43, 334.347, 3.19344, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4539.82, 2426.31, 345.484, 1.58316, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4757.16, 2220.46, 335.432, 2.83542, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4788.23, 1975.37, 420.174, 0.598566, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4902.13, 2235, 347.502, 0.766064, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4883.96, 1985.27, 410.708, 3.55263, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4822.82, 2041.69, 404.181, 2.35956, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4903.36, 2049.29, 402.789, 2.98618, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4595.95, 2848.9, 335.764, 0.52775, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4639.69, 2769.04, 335.584, 3.56645, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4612.82, 2909.1, 335.637, 3.27896, 180, 5, 0, 25200, 3994, 0, 1),
(30877, 571, 1, 1, 27391, 0, 4811.98, 2179.59, 334.711, 0.231615, 180, 5, 0, 25200, 3994, 0, 1);
-- Loot Water Revenanat by JGC
UPDATE creature_template SET lootid = 30877 WHERE entry = 30877;
DELETE FROM creature_loot_template WHERE item IN (43322,44808);
REPLACE INTO creature_loot_template VALUES
(30877, 43322, -60, 1, 0, 2, 5),
(30877, 44808, -60, 1, 0, 2, 5),
(30846, 43322, -100, 1, 0, 1, 1),
(30846, 44808, -100, 1, 0, 1, 1); 
-- Gob
UPDATE gameobject_template set data17 = 0 where entry = 193908; -- Exit portal


-- Summon Novos
UPDATE creature_template SET mindmg = 400, maxdmg = 600, attackpower = 400, dmg_multiplier = 2 WHERE entry = 27598;
UPDATE gameobject_template set data17 = 0 where entry = 193908; -- Exit portal

-- Fix quest Additional Runecloth per i troll
DELETE FROM creature_involvedrelation WHERE id = 14727 AND quest = 7832;
DELETE FROM creature_questrelation WHERE id = 14727 AND quest = 7832;
REPLACE INTO creature_involvedrelation VALUES
(14727, 7837);
REPLACE INTO creature_questrelation VALUES
(14727, 7837);



DELETE FROM `creature_model_info` WHERE `modelid`=28831;
REPLACE INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0, 0, 2, 0);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33856, 34143, 34050);
UPDATE `creature_template` SET `unit_flags` = 33686018 WHERE `entry` = 34050;
UPDATE `creature` SET `position_x` = 2736.92, `position_y` = 2572.30, `orientation` = 5.723 WHERE `guid` = 137630;
UPDATE `creature_template` SET `ScriptName` = 'boss_vx_001', `unit_flags` = 0, `vehicleid` = 371, `Health_mod` = 375 WHERE `entry` = 33651;
UPDATE `creature_template` SET `ScriptName` = 'boss_aerial_unit', `unit_flags` = 0, `vehicleid` = 388, `Health_mod` = 250 WHERE `entry` = 33670;
UPDATE `creature_template` SET `vehicleid` = 370, `Health_mod` = 156.185 WHERE `entry` = 33432;
UPDATE `creature_template` SET `Health_mod` = 156.185 WHERE `entry` = 34071;

DELETE FROM vehicle_accessory WHERE entry = 33432;
REPLACE INTO vehicle_accessory VALUE (33432, 34071, 3, 1, 'Leviathan Mk II turret');
UPDATE `creature_template` SET `modelid1` = 17188, `modelid2` = 0 WHERE `entry` = 25171;
UPDATE `creature_template` SET `speed_walk` = 0.5, `speed_run` = 0.5, `ScriptName` = 'mob_boom_bot' WHERE `entry` = 33836;

DELETE FROM `creature` WHERE `id`=33651;
REPLACE INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33651, 603, 1, 1, 28841, 0, 2744.65, 2569.46, 364.397, 3.14159, 604800, 0, 0, 1742400, 0, 0, 0);
UPDATE `creature_template` SET `unit_flags` = 33686020, `flags_extra` = 2, `ScriptName` = 'rocket_strike' WHERE `entry` = 34047;

DELETE FROM `creature` WHERE `id`=33670;
REPLACE INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33670, 603, 1, 1, 28979, 0, 2744.65, 2569.46, 380.040, 3.14159, 604800, 0, 0, 1742400, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 33686020, `type_flags` = 0, `flags_extra` = 2, `ScriptName` = 'magnetic_core' WHERE `entry` = 34068;


UPDATE `gameobject_template` SET `size` = 1.5 WHERE `entry` = 194956;
DELETE FROM `gameobject` WHERE `id`=194956;
REPLACE INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(194956, 603, 1, 1, 2744.65, 2569.46, 364.397, 3.14159, 0, 0, 0.703237, 0.710955, -604800, 0, 1);

UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (33432, 33651, 33670);

DELETE FROM `gameobject` WHERE `id`=194569;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
('@GUID+1', 194569, 603, 3, 1, 1859.65, -24.9121, 448.811, 0, 0, 0, 0, 1, 180, 255, 0),
('@GUID+1', 194569, 603, 3, 1, 553.233, -12.3247, 409.679, 0, 0, 0, 0, 1, 180, 255, 0),
('@GUID+1', 194569, 603, 3, 1, 2086.26, -23.9948, 421.316, 0, 0, 0, 0, 1, 180, 255, 0),
('@GUID+1', 194569, 603, 3, 1, -706.122, -92.6024, 429.876, 0, 0, 0, 0, 1, 180, 255, 0),
('@GUID+1', 194569, 603, 3, 1, 131.248, -35.3802, 409.804, 0, 0, 0, 0, 1, 180, 255, 0),
('@GUID+1', 194569, 603, 3, 1, 926.292, -11.4635, 418.595, 0, 0, 0, 0, 1, 180, 255, 0),
('@GUID+1', 194569, 603, 3, 1, 1854.82, -11.5608, 334.175, 0, 0, 0, 0, 1, 180, 255, 0),
('@GUID+1', 194569, 603, 3, 1, 1498.05, -24.3509, 420.966, 0, 0, 0, 0, 1, 180, 255, 0),
('@GUID+1', 194569, 603, 3, 1, 2518.16, 2569.03, 412.299, 0, 0, 0, 0, 1, 180, 255, 0);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33184;

UPDATE creature_template SET InhabitType = 4, VehicleId = 223 WHERE entry IN (30234, 30248);
UPDATE creature_template SET spell6 = 57092, spell7 = 57403 WHERE entry IN (30161, 31752);

DELETE FROM spell_bonus_data WHERE entry = 63338;
REPLACE INTO spell_bonus_data VALUES (63338, 0, 0, 0, 0, "Saronite Vapors");


UPDATE spell_proc_event SET procFlags = 20, procEx = 2 WHERE entry IN (53486, 53488);

UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803, `flags_extra` = 257, `ScriptName` = 'boss_general_vezax' WHERE `entry` = 33271;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `ScriptName` = 'mob_saronite_vapors' WHERE `entry` = 33488;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `ScriptName` = 'mob_saronite_animus' WHERE `entry` = 33524;

UPDATE `battleground_template` SET `MaxPlayersPerTeam`=40 WHERE `id`=32;

-- XT-002
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 10 WHERE `modelid` = 28611;
UPDATE `creature_template` SET `dmg_multiplier` = 70 WHERE `entry` = 33293;
-- Assembly of Iron
UPDATE `creature_model_info` SET `bounding_radius` = 0.45, `combat_reach` = 25 WHERE `modelid` = 28313;
UPDATE `creature_model_info` SET `bounding_radius` = 0.45, `combat_reach` = 6 WHERE `modelid` = 28344;
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299547 WHERE `entry` = 32857;
UPDATE `creature_template` SET `dmg_multiplier` = 60 WHERE `entry` = 32867;
UPDATE `creature_template` SET `dmg_multiplier` = 45 WHERE `entry` = 32927;
-- Kologarn
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 15 WHERE `modelid` = 28638;
UPDATE `creature_model_info` SET `bounding_radius` = 0.35, `combat_reach` = 15 WHERE `modelid` = 28821;
UPDATE `creature_model_info` SET `bounding_radius` = 0.35, `combat_reach` = 15 WHERE `modelid` = 28822;
UPDATE `creature_template` SET `baseattacktime` = 1800 WHERE `entry` = 32930;
-- Auriaya
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 5 WHERE `modelid` = 28651;
UPDATE `creature_template` SET `dmg_multiplier` = 60 WHERE `entry` = 33515;
-- Freya
UPDATE `creature_template` SET `baseattacktime` = 1500 WHERE `entry` = 32906;
-- Mimiron
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 7 WHERE `modelid` = 28831;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 5 WHERE `modelid` = 28841;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 4 WHERE `modelid` = 28979;
-- Genaral Vezax
UPDATE `creature_template` SET `baseattacktime` = 1800, `dmg_multiplier` = 45 WHERE `entry` = 33271;
UPDATE `creature_model_info` SET `bounding_radius` = 0.62, `combat_reach` = 12 WHERE `modelid` = 28548;
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` = 33838;

-- Guided by honor
UPDATE quest_template SET SpecialFlags = 0 WHERE entry = 11289;
-- Drop it then rock it!
UPDATE quest_template SET ReqCreatureOrGOId1 = 0, ReqCreatureOrGOCount1 = 0, Method = 0, SpecialFlags = 0 WHERE entry = 11429;
-- Master and Servant
UPDATE quest_template SET ReqCreatureOrGOId1 = 25793, ReqSpellCast1 = 46023 WHERE entry = 11730;
-- Truce?
UPDATE quest_template SET ReqSpellCast1 = 50141, ReqCreatureOrGOId1 = 26423 WHERE entry = 11989;
-- Rallying the troops
UPDATE quest_template SET ReqSpellCast1 = 47394 WHERE entry = 12070;
-- Words of Power (3 npc)
UPDATE creature_template SET faction_A = 21, faction_H = 21, unit_flags = 1, type_flags = 1 WHERE entry IN (25392, 26076, 26073);
-- Focusing iris (Cambio script)
UPDATE `gameobject_template` SET `ScriptName` = 'go_malygos_iris' WHERE `entry` IN (193960,193958); 
-- Too Much of a Good Thing
UPDATE creature_template SET minlevel = 76, maxlevel = 76, exp = 2, faction_A = 2069, faction_H = 2069, mindmg = 300, maxdmg = 436, attackpower = 193, Health_mod = 5 WHERE entry = 28151;
-- Absholutely... Thish Will Work!
UPDATE creature_template SET faction_A = 94, faction_H = 94 WHERE entry = 24284;
-- Spawn npc Petrov,Glrggl, Kibli Killohertz, Orbaz Bloodbane <The Hand of Suffering>
-- Spostamento npc dall'aeronave di Icecrown,ora sono alle coordinate 61,31 CIRCA!
DELETE FROM creature WHERE id IN (26932, 31259, 30344, 32302, 30345, 29799, 30824, 32301, 30825, 29795, 32444, 25203, 31283);
REPLACE INTO creature VALUES
(NULL, 26932, 571, 1, 1, 0, 0, 4697.33, -4004.72, 212.393, 3.78881, 300, 0, 0, 8326, 0, 0, 0), 
(NULL, 29795, 571, 1, 1, 0, 0, 7927.31, 1708.2, 381.896, 2.24193, 300, 0, 0, 252000, 79880, 0, 0), 
(NULL, 29799, 571, 1, 1, 0, 613, 7987.4, 1774.7, 390.726, 2.45672, 300, 0, 0, 252000, 0, 0, 0),  
(NULL, 30344, 571, 1, 1, 0, 1648, 7993.61, 1782.31, 391.563, 2.45672, 300, 0, 0, 21368, 0, 0, 0),  
(NULL, 30345, 571, 1, 1, 0, 1007, 7989.11, 1776.81, 390.857, 2.45672, 300, 0, 0, 5342, 0, 0, 0),  
(NULL, 30824, 571, 1, 1, 0, 0, 7936.73, 1715.67, 383.917, 2.24193, 300, 0, 0, 21368, 0, 0, 0),  
(NULL, 30825, 571, 1, 1, 0, 1007, 7930.34, 1710.6, 382.693, 2.24193, 300, 0, 0, 12600, 0, 0, 0),  
(NULL, 31259, 571, 1, 1, 0, 0, 7994.59, 1786.57, 391.751, 3.2162, 300, 0, 0, 37800, 31952, 0, 0),  
(NULL, 32301, 571, 1, 1, 0, 996, 7933, 1712.71, 383.197, 2.24193, 300, 0, 0, 630000, 0, 0, 0),  
(NULL, 32302, 571, 1, 1, 0, 788, 7991.36, 1779.56, 391.151, 2.45672, 300, 0, 0, 630000, 0, 0, 0),  
(NULL, 25203, 571, 1, 1, 0, 0, 4425.97, 6257.19, 55.2716, 5.79521, 300, 0, 0, 9291, 0, 0, 0),   
(NULL, 31283, 571, 1, 1, 0, 0, 5924.62, 2065.87, 636.041, 0.790128, 300, 0, 0, 2500, 0, 0, 0),   
(NULL, 32444, 571, 1, 1, 0, 0, 7553.3, 2055.78, 500.312, 2.88389, 300, 0, 0, 12600, 3994, 0,  0);
-- Glrggl
UPDATE creature_template SET faction_A = 1970, faction_H = 1970, mindmg = 300, maxdmg = 420 WHERE entry = 24203;
-- Orbaz 
UPDATE creature_template SET minlevel = 80, maxlevel = 80, faction_A = 16, faction_H = 16, mindmg = 800, maxdmg = 1200, dmg_multiplier = 3 WHERE entry = 31283


-- Ap corretto di Blood boil (DK)
UPDATE spell_bonus_data SET ap_bonus = 0.06 WHERE entry = 49941;


UPDATE `gameobject_template` SET `type` = 1, `flags` = 32, `ScriptName` = 'not_push_button' WHERE `entry` = 194739;
UPDATE `creature_template` SET `unit_flags` = 33554946, `speed_walk` = 0.15, `speed_run` = 0.15, `ScriptName` = 'mob_mimiron_flame' WHERE `entry` = 34363;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'mob_frost_bomb' WHERE `entry` = 34149;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 7.5, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112, `ScriptName` = 'mob_junk_bot' WHERE `entry` = 33855;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 15, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112, `ScriptName` = 'mob_assault_bot' WHERE `entry` = 34057;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 10, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112, `ScriptName` = 'mob_boom_bot' WHERE `entry` = 33836;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'mob_emergency_bot' WHERE `entry` = 34147;

UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 25, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 33524;
UPDATE `creature_model_info` SET `bounding_radius` = 0.62, `combat_reach` = 10 WHERE `modelid` = 28992;

UPDATE gameobject SET spawntimesecs = 25 WHERE id = 193988; 

DELETE FROM spell_proc_event WHERE entry IN (47201,47202,47203,47204,47205);
REPLACE INTO spell_proc_event VALUES 
(47201,32,5,0x00004009,0x00040000,0x00000000,0x00010000,0x0000000,0,0,0),
(47202,32,5,0x00004009,0x00040000,0x00000000,0x00010000,0x0000000,0,0,0),
(47203,32,5,0x00004009,0x00040000,0x00000000,0x00010000,0x0000000,0,0,0),
(47204,32,5,0x00004009,0x00040000,0x00000000,0x00010000,0x0000000,0,0,0),
(47205,32,5,0x00004009,0x00040000,0x00000000,0x00010000,0x0000000,0,0,0);


UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `flags_extra` = 2, `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33245;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 33282;


UPDATE `creature_template` SET `unit_flags` = 2 WHERE `entry` = 33686;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33779;
DELETE FROM `creature_template` WHERE entry = 33115;
DELETE FROM creature WHERE id = 33115;

-- Emblem of Valor
UPDATE creature_loot_template SET item = 40753 WHERE entry IN (33113, 33186, 33118, 33293, 32927, 32857, 33515, 33271) AND item = 45624;
UPDATE gameobject_loot_template SET item = 40753 WHERE entry IN (27061, 26963, 27078, 27081, 26955, 26946, 27068) AND item = 40752;

-- Flame Leviathan
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803 WHERE `entry` = 33113;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62475;
REPLACE INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62475','9032','2','System Shutdown');

DELETE FROM areatrigger_scripts WHERE entry IN (5369, 5423);
REPLACE INTO areatrigger_scripts VALUES
(5369,'at_RX_214_repair_o_matic_station'),
(5423,'at_RX_214_repair_o_matic_station');

UPDATE `gameobject` SET `position_x` = 130.553 WHERE `guid` = 55126;

-- Dalaran Teleport (Ulduar)
UPDATE `gameobject_template` SET `type` = 22, `data0` = 53141, `data2` = 1, `data3` = 1 WHERE `entry` = 194481;

DELETE FROM `creature` WHERE `id`=33672 AND guid IN (136552, 136553);
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(136553, 33672, 603, 1, 1, 28935, 0, -815.68, -197.498, 429.925, 5.525, 180, 0, 0, 9416, 8459, 0, 0);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10578, 10579, 10580, 10581, 10598, 10599);
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(10578, 12, 0, 0),
(10580, 12, 0, 0),
(10598, 12, 0, 0),
(10579, 12, 1, 0),
(10581, 12, 1, 0),
(10599, 12, 1, 0);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10578, 10579, 10580, 10581);
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(10578, 12, 0, 0),
(10580, 12, 0, 0),
(10579, 12, 1, 0),
(10581, 12, 1, 0);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10598, 10599, 10559, 10444, 10563, 10455, 10558, 10438, 10561, 10454, 10408, 10560, 10453, 10562);
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Freya
(10559, 12, 0, 0),
(10444, 12, 0, 0),
(10563, 12, 1, 0),
(10455, 12, 1, 0),
-- Thorim
(10558, 12, 0, 0),
(10438, 12, 0, 0),
(10561, 12, 1, 0),
(10454, 12, 1, 0),
-- Hodir
(10408, 12, 0, 0),
(10560, 12, 0, 0),
(10453, 12, 1, 0),
(10562, 12, 1, 0);

UPDATE `creature_template` SET Health_mod = 50 WHERE `entry` = 33109;
UPDATE `creature_template` SET Health_mod = 90 WHERE `entry` = 33060;
UPDATE `creature_template` SET Health_mod = 40 WHERE `entry` = 33062;

UPDATE `creature_template` SET `dmg_multiplier` = 55, `flags_extra` = 9 WHERE `entry` = 33118;
UPDATE `creature_template` SET `dmg_multiplier` = 50, flags_extra = 1 WHERE `entry` = 33186;
UPDATE `creature_template` SET `dmg_multiplier` = 75, flags_extra = 1 WHERE `entry` = 33293;
UPDATE `creature_template` SET flags_extra = 257 WHERE entry IN (33113, 33271); 
UPDATE `creature_template` SET flags_extra = 1 WHERE entry IN (32867, 32927, 32857, 32930, 33515, 32906, 32845, 33350, 33432, 33651, 33670, 32865, 33288);

-- Thorim adds e Dalaran Portal
UPDATE `creature_template` SET `dmg_multiplier` = 15 WHERE `entry` IN (32876, 32877);
UPDATE `creature_template` SET `dmg_multiplier` = 8 WHERE `entry` = 32904;
UPDATE `creature_template` SET `dmg_multiplier` = 10 WHERE `entry` = 32878;

UPDATE `gameobject_template` SET `faction` = 2007, `data0` = 53141, `data2` = 0 WHERE `entry` = 194481;

-- Ulduar Keepers Images
DELETE FROM `creature` WHERE `id` IN (33213, 33241, 33242, 33244);
REPLACE INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33241, 603, 3, 1, 0, 0, 2057.81, -24.0768, 421.532, 3.12904, 604800, 0, 0, 14433075, 0, 0, 0),
(33242, 603, 3, 1, 0, 0, 2036.81, -73.7053, 411.353, 2.43575, 604800, 0, 0, 14433075, 0, 0, 0),
(33244, 603, 3, 1, 0, 0, 2036.74, 25.4642, 411.357, 3.81412, 604800, 0, 0, 14433075, 0, 0, 0),
(33213, 603, 3, 1, 0, 0, 1939.29, -90.6994, 411.357, 1.02595, 604800, 0, 0, 14433075, 0, 0, 0);

UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `npcflag` = 1, `flags_extra` = 2, `ScriptName` = 'npc_keeper_image' WHERE `entry` IN (33213, 33241, 33242, 33244);

-- Ulduar vehicle regen and Freya's Healthy Spores
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 33215;
UPDATE `creature_template` SET `RegenHealth` = 0 WHERE `entry` IN (33060, 33062, 33109);

-- razorscale yell fix
UPDATE `script_texts` SET `content_default` = "Move! Quickly! She won't remain grounded for long.", `type` = 1  WHERE `entry` = -1603261;

REPLACE INTO `npc_vendor` VALUES
(26384, 45970, 0, 0, 2633),
(26384, 45958, 0, 0, 2634);

UPDATE `battleground_template` SET `Disable`=0 WHERE `id` IN (10,11);

-- Burst Target (Mimiron)
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `faction_A` = 35, `faction_H` = 35, `unit_flags` = 33686020 WHERE `entry` = 34211;

UPDATE `creature_template` SET `mechanic_immune_mask` = 634339327 WHERE `entry` = 36855;

UPDATE gameobject SET spawntimesecs = -60 WHERE id = 193988;

UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239 WHERE `entry` = 32865;

REPLACE INTO `gameobject_template` VALUES ('300148', '8', '1287', 'TEMP Ruins of Stardust Fountain', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '223', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('300147', '8', '1287', 'TEMP Spring Well', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '226', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('300146', '8', '1287', 'TEMP Quilboar Watering Hole', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '224', '35', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('300140', '8', '299', 'TEMP Grom\'s Monument', '', '', '', '0', '0', '1.5', '0', '0', '0', '0', '0', '0', '1324', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('300145', '8', '1287', 'TEMP Uther\'s Tomb Statue', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1323', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210312', '5', '6486', 'Ahn\'Qiraj Ossirian Crystal', '', '', '', '0', '0', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210313', '5', '6486', 'Ahn\'Qiraj Ossirian Crystal', '', '', '', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210327', '0', '6427', 'Communication Crystal', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210328', '0', '6426', 'Communication Crystal', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210329', '0', '6425', 'Communication Crystal', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210330', '0', '6427', 'Communication Crystal', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '879', '655360', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210331', '0', '6426', 'Communication Crystal', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '879', '655360', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210332', '0', '6425', 'Communication Crystal', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '879', '655360', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210334', '2', '4675', 'Ahn\'Qiraj Gong', '', '', '', '84', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210335', '5', '6419', 'Twilight Tablet', '', '', '', '0', '40', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210336', '5', '6420', 'Twilight Tablet', '', '', '', '0', '40', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210337', '8', '6431', 'Glyphed Crystal', '', '', '', '0', '0', '3', '0', '0', '0', '0', '0', '0', '643', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210338', '8', '3431', 'Gorishi Silithid Crystal', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '643', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210339', '5', '6483', 'Ahn\'Qiraj Sand Trap', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210341', '5', '6667', 'Hive Fireflies 01', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210342', '5', '6431', 'Glyphed Crystal', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210343', '5', '6559', 'Sand Worm Rock Base', '', '', '', '0', '0', '6.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210344', '5', '6570', 'Silithus Crystal Formation 03', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210345', '5', '6571', 'Floating Red Crystal Broken 03', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210346', '5', '6573', 'Floating Red Crystal Broken 01', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210347', '0', '6470', 'Ahn\'Qiraj Door 01', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210348', '5', '1667', 'Floating Purple Crystal Broken 01', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210349', '2', '6486', 'Gastric Exit', '', '', '', '0', '40', '1', '0', '0', '0', '0', '0', '0', '0', '76', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('300131', '8', '433', 'TEMP Foulweald Totem Mound', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1063', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('300132', '8', '0', 'TEMP Cliffspring River Waterfall', '', '', '', '0', '0', '1.5', '0', '0', '0', '0', '0', '0', '705', '13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('300133', '8', '0', 'TEMP First Tide Pool', '', '', '', '0', '0', '1.5', '0', '0', '0', '0', '0', '0', '443', '25', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('300134', '8', '0', 'TEMP Second Tide Pool', '', '', '', '0', '0', '1.5', '0', '0', '0', '0', '0', '0', '444', '25', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('300135', '8', '0', 'TEMP Third Tide Pool', '', '', '', '0', '0', '1.5', '0', '0', '0', '0', '0', '0', '445', '25', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('300136', '8', '0', 'TEMP Fourth Tide Pool', '', '', '', '0', '0', '1.5', '0', '0', '0', '0', '0', '0', '446', '25', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('300138', '8', '433', 'TEMP Equinex Monolith', '', '', '', '210', '0', '1', '0', '0', '0', '0', '0', '0', '283', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('300139', '8', '433', 'TEMP Shards of Myzrael', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '5', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('300144', '8', '299', 'TEMP The Great Ossuary', '', '', '', '0', '0', '2.49', '0', '0', '0', '0', '0', '0', '1283', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210068', '5', '6707', 'Warsong Clan Banner 07', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210210', '5', '6545', 'New Year Alliance Hanging Banner', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210211', '5', '6546', 'New Year Alliance Hanging Banner 02', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210212', '5', '6547', 'New Year Horde Hanging Banner', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210213', '5', '6548', 'New Year Horde Hanging Banner 02', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210214', '5', '6549', 'New Year Alliance Standing Banner', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210215', '5', '6550', 'New Year Horde Standing Banner', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `gameobject_template` VALUES ('210286', '5', '6738', 'Excavation Tent Pavillion', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');


delete from trinity_string where entry in
(12001, 12002, 12003, 12004, 12005, 12006, 12007, 12008, 12009, 12010, 12011, 12012, 12013, 12014, 12015);
INSERT INTO `trinity_string` VALUES ('12001', 'The battle will begin in two minutes!', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('12002', 'The battle will begin in one minute!', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('12003', 'The battle will begin in 30 seconds!', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('12004', 'The battle has begun!', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('12005', 'The %s has taken the %s', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('12006', 'Alliance', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('12007', 'Horde', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('12008', 'Workshop', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('12009', 'Quarry', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('12010', 'Refinery', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('12011', 'Docks', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('12012', 'Hangar', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('12013', '$n has assaulted the %s', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('12014', '$n has defended the %s', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('12015', '$n claims the %s! If left unchallenged, the %s will control it in 1 minute!', '', null, null, null, null, null, null, null);

/*
MySQL Data Transfer
Source Host: localhost
Source Database: world
Target Host: localhost
Target Database: world
Date: 26.07.2010 14:03:01
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for guildhouses
-- ----------------------------
DROP TABLE IF EXISTS `guildhouses`;
CREATE TABLE `guildhouses` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `guildId` bigint(20) NOT NULL DEFAULT '0',
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `map` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `guildhouses` VALUES ('1', '0', '-10711', '2483', '8', '1', 'Tauren village at Veiled Sea (Silithus)');
INSERT INTO `guildhouses` VALUES ('2', '0', '-8323', '-343', '146', '0', 'Fishing outside an Northshire Abbey (Elwynn Forest');
INSERT INTO `guildhouses` VALUES ('3', '0', '7368', '-1560', '163', '1', 'Troll Village in mountains (Darkshore)');
INSERT INTO `guildhouses` VALUES ('4', '0', '-4151', '-1400', '198', '0', 'Dwarven village outside Ironforge (Wetlands)');
INSERT INTO `guildhouses` VALUES ('5', '0', '-1840', '-4233', '2.14', '0', 'Dwarven village (Arathi Highlands, Forbidding Sea)');
INSERT INTO `guildhouses` VALUES ('6', '0', '-723', '-1076', '179', '1', 'Tauren camp (Mulgore, Red Rock)');
INSERT INTO `guildhouses` VALUES ('7', '0', '-6374', '1262', '7', '0', 'Harbor house outside Stormwind (Elwynn Forest)');
INSERT INTO `guildhouses` VALUES ('8', '0', '-4844', '-1066', '502', '0', 'Old Ironforge');
INSERT INTO `guildhouses` VALUES ('9', '0', '-4863', '-1658', '503.5', '0', 'Ironforge Airport');
INSERT INTO `guildhouses` VALUES ('10', '0', '1146', '-165', '313', '37', 'Azshara Crater instance (Alliance entrance)');
INSERT INTO `guildhouses` VALUES ('11', '0', '4303', '-2760', '16.8', '0', 'Quel\'Thalas Tower');
INSERT INTO `guildhouses` VALUES ('12', '0', '-6161', '-790', '423', '0', 'Crashed gnome airplane (between Dun Morogh and Searing Gorge)');
INSERT INTO `guildhouses` VALUES ('13', '0', '-11805', '-4754', '6', '1', 'Goblin village (Tanaris, South Seas)');
INSERT INTO `guildhouses` VALUES ('14', '0', '4654', '-3772', '944', '1', 'Kalimdor Hyjal (Aka World Tree)');
INSERT INTO `guildhouses` VALUES ('15', '0', '1951.512085', '1530.475586', '247.288147', '1', 'Stonetalon Logging Camp');
INSERT INTO `guildhouses` VALUES ('16', '0', '2813.660645', '2248.552979', '215.524643', '1', 'Stonetalon Ruins');
INSERT INTO `guildhouses` VALUES ('17', '0', '9725.27', '-21.43', '20.03', '1', 'Teldrassil Furbold camp');
INSERT INTO `guildhouses` VALUES ('18', '0', '-5362', '-2540', '485', '0', 'Ortell\'s Hideout');
INSERT INTO `guildhouses` VALUES ('19', '0', '-12865', '-1396', '115', '0', 'Stranglethorn Secret Cave');
INSERT INTO `guildhouses` VALUES ('20', '0', '-11084', '-1801', '53', '0', 'Well of the Forgotten (Aka. Karazhan Crypt or Lower Karazhan)');
INSERT INTO `guildhouses` VALUES ('21', '0', '-5933', '452', '509', '0', 'Forgotten gnome camp');


DELETE FROM creature_template WHERE `entry`=13;
INSERT INTO `creature_template` VALUES (13, 0, 0, 0, 0, 0, 17771, 17771, 17771, 17771, 'Beltez', 'Guildhouse Keeper', '', 0, 80, 80, 0, 35, 35, 1, 1.48, 1.14286, 0.75, 0, 181, 189, 0, 158, 1, 1400, 1900, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1360, 0, 0, 'guildmaster', 0);
UPDATE `creature_template` SET `ScriptName`='guildmaster' WHERE `entry`=13;
DELETE FROM `locales_creature` WHERE `entry`=13;
INSERT INTO `locales_creature` VALUES ('13', '', '', '', '', '', '', '', 'Бельтез', null, null, null, null, null, null, null, 'Продавец домов гильдии');

-- Keepers (Yogg Saron Encounter)
DELETE FROM `creature` WHERE `id` IN (33410, 33411, 33412, 33413);
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33410, 603, 1, 1, 0, 0, 2036.739, 25.464, 338.296, 3.814, 604800, 0, 0, 14433075, 0, 0, 0),
(33411, 603, 1, 1, 0, 0, 1939.094, -90.699, 338.296, 1.026, 604800, 0, 0, 14433075, 0, 0, 0),
(33412, 603, 1, 1, 0, 0, 1939.094, 42.534, 338.296, 5.321, 604800, 0, 0, 14433075, 0, 0, 0),
(33413, 603, 1, 1, 0, 0, 2036.739, -73.705, 338.296, 2.435, 604800, 0, 0, 14433075, 0, 0, 0);

UPDATE `creature_template` SET `ScriptName` = 'npc_ys_freya' WHERE `entry` = 33410;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_hodir' WHERE `entry` = 33411;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_mimiron' WHERE `entry` = 33412;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_thorim' WHERE `entry` = 33413;

UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `minlevel` = 80, `maxlevel` = 80, `unit_flags` = 33686018, `type_flags` = 0, `ScriptName` = 'npc_sanity_well' WHERE `entry` = 33991;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `custom_npc_tele_category`;
-- ----------------------------
-- Table structure for custom_npc_tele_category
-- ----------------------------
CREATE TABLE `custom_npc_tele_category` (
  `id` int(6) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `flag` tinyint(3) unsigned NOT NULL default '0',
  `data0` bigint(20) unsigned NOT NULL default '0',
  `data1` int(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `custom_npc_tele_category` VALUES ('1', '1. Города', '0', '1', '0');
INSERT INTO `custom_npc_tele_category` VALUES ('2', '1. Города', '0', '2', '0');
INSERT INTO `custom_npc_tele_category` VALUES ('3', '2. Подземелья уровня 10-40', '0', '0', '0');
INSERT INTO `custom_npc_tele_category` VALUES ('4', '3. Подземелья уровня 41-69', '0', '0', '0');
INSERT INTO `custom_npc_tele_category` VALUES ('5', '4. Подземелья уровня 70-80', '0', '0', '0');
INSERT INTO `custom_npc_tele_category` VALUES ('6', '5. Рейдовые подземелья', '0', '0', '0');
INSERT INTO `custom_npc_tele_category` VALUES ('7', '6. Арены', '0', '0', '0');

DROP TABLE IF EXISTS `custom_npc_tele_destination`;
-- ----------------------------
-- Table structure for custom_npc_tele_destination
-- ----------------------------
CREATE TABLE `custom_npc_tele_destination` (
  `id` int(6) unsigned NOT NULL auto_increment,
  `name` char(100) NOT NULL default '',
  `pos_X` float NOT NULL default '0',
  `pos_Y` float NOT NULL default '0',
  `pos_Z` float NOT NULL default '0',
  `map` smallint(5) unsigned NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `level` tinyint(3) unsigned NOT NULL default '0',
  `cost` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `custom_npc_tele_destination` VALUES ('1', '01. Огненная пропасть (13-20)', '1810.38', '-4408.05', '-18.8377', '1', '5.18594', '8', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('2', '02. Пещеры стенаний (17-23)', '-722.53', '-2226.3', '16.94', '1', '2.71', '12', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('3', '03. Мертвые копи (17-23)', '-11212', '1658.58', '25.67', '0', '1.45', '12', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('4', '04. Крепость Темного Клыка (18-23)', '-240.11', '1548.83', '76.89', '0', '1.13981', '13', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('5', '05. Непроглядная Пучина (22-27)', '4249.99', '740.1', '-25.67', '1', '1.34062', '17', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('6', '06. Тюрьма Штормграда (23-27)', '-8774.25', '838.965', '91.9284', '0', '0.689341', '18', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('7', '07. Лабиринты Иглошкурых (21-31)', '-4484.04', '-1739.4', '86.47', '1', '1.23', '16', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('8', '08. Гномреган (25-32)', '-5163.54', '925.42', '257.17', '0', '1.57423', '20', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('9', '09. Монастырь Алого Ордена: Кладбище  (29-35)', '2913.01', '-802.75', '160.33', '0', '0.339072', '25', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('10', '10. Монастырь Алого Ордена: Библиотека (31-35)', '2872.08', '-820.06', '160.33', '0', '3.46299', '26', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('11', '11. Курганы Иглошкурых (33-37)', '-4645.08', '-2470.85', '85.53', '1', '4.39', '28', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('12', '12. Монастырь Алого Ордена: Оружейная (33-37)', '2885.54', '-825.1', '160.33', '0', '5.12803', '28', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('13', '13. Монастырь Алого Ордена: Собор (37-44)', '2907.48', '-816.101', '160.33', '0', '5.0652', '32', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('14', '14. Ульдаман (37-44)', '-6119.7', '-2957.3', '204.11', '0', '0.03', '32', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('15', '01. Зул\'Фаррак (42-46)', '-6839.39', '-2911.03', '8.87', '1', '0.41', '37', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('16', '02. Мародон (42-52)', '-1433.33', '2955.34', '96.21', '1', '4.82', '37', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('17', '03. Храм Атал\'Хаккара  (47-52)', '-10346.9', '-3851.9', '-43.41', '0', '6.09', '42', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('18', '04. Глубины Черной Горы (48-60)', '-7179.33', '-918.7', '165.49', '0', '4.73078', '43', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('19', '05. Забытй город: Восток  (55-60)', '-3981.41', '781.85', '161.004', '1', '4.6741', '50', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('20', '06. Забытй город: Запад  (57-60)', '-3829.17', '1250.51', '160.22', '1', '3.09938', '52', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('21', '07. Забытй город: Север  (57-60)', '-3520.64', '1077.71', '161.13', '1', '4.68176', '52', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('22', '08. Стратхольм  (56-61)', '3263.54', '-3379.46', '143.59', '0', '0', '51', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('23', '09. Некроситет (56-61)', '1219.01', '-2604.66', '85.61', '0', '0.5', '51', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('24', '10. Бастионы Адского Пламени (60-62)', '-359.69', '3069.36', '-15.1135', '530', '1.8637', '55', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('25', '11. Кузня Крови (61-63)', '-300.137', '3160.08', '31.6914', '530', '2.25967', '56', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('26', '12. Узилище (62-64)', '721.256', '7008.33', '-73.4791', '530', '0.450804', '57', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('27', '13. Нижетопь (63-65)', '779.66', '6767.33', '-71.77', '530', '4.7', '58', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('28', '14. Гробницы Маны (64-66)', '-3104.17', '4945.52', '-101.507', '530', '0.054137', '59', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('29', '15. Аукенайские гробницы (65-67)', '-3362.04', '5209.85', '-101.05', '530', '1.52677', '60', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('30', '16. Старые предгорья Хилсбрада (66-68)', '-8367.11', '-4059.21', '-208.31', '1', '0.108172', '61', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('31', '17. Сетеккские залы (67-69)', '-3361.91', '4678.85', '-101.048', '530', '4.68897', '62', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('32', '18. Паровое подземелье (68-70)', '815.701', '6928.7', '-80.0444', '530', '1.46476', '63', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('33', '19. Темный лабиринт (69-70)', '-3627.03', '4942.75', '-101.049', '530', '3.12505', '64', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('34', '20. Разрушенные залы (69-70)', '-308.4', '3072.7', '-3.65004', '530', '1.75536', '64', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('35', '01. Черны топи (70)', '-8752.98', '-4205.76', '-209.5', '1', '2.23792', '65', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('36', '02. Механар (70)', '2880.38', '1562.57', '248.88', '530', '3.84869', '65', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('37', '03. Ботаника (70)', '3396.79', '1495.11', '179.56', '530', '5.68591', '65', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('38', '04. Аркатрац (70)', '3304.99', '1349.93', '502.29', '530', '4.99889', '65', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('39', '05. Терасса Магистров (70)', '12889', '-7320.27', '65.5023', '530', '4.43379', '65', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('40', '06. Крепость утгард (70-72)', '1224.31', '-4862.99', '41.2493', '571', '0.265729', '65', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('41', '07. Нексус (71-73)', '3880.71', '6984.41', '73.761', '571', '0.093386', '66', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('42', '08. Азжол-неруб (72-74)', '3692.49', '2157.36', '34.9193', '571', '2.54456', '67', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('43', '09. Ан\'кахет: Старое Королевство(73-75)', '3647.05', '2045.8', '1.78771', '571', '4.33625', '68', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('44', '10. Крепость Драк\'Тарон (74-76)', '4774.2', '-2032.44', '229.37', '571', '1.56251', '69', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('45', '11. Аметистовая Крепость (75-77)', '5695.6', '505.81', '652.68', '571', '4.11793', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('46', '12. Гундрак (76-78)', '6929.22', '-4443.09', '450.52', '571', '0.748567', '71', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('47', '13. Чертоги Камня (77-79)', '8923.25', '-1014.92', '1039.61', '571', '1.53846', '72', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('48', '14. Чертоги Молний (80)', '9128.79', '-1338.15', '1061.4', '571', '5.43122', '75', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('49', '15. Окулус (80)', '3879.32', '6984.34', '106.32', '571', '3.06023', '75', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('50', '16. Очищение Стратхольма (Culling/COS) (80)', '-8752.93', '-4444.03', '-199.009', '1', '4.34869', '75', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('51', '17. Вершина Утгард (80)', '1253.46', '-4853.82', '215.73', '571', '3.4309', '75', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('52', '18. Испытание Чемпиона (80)', '8575.03', '792.278', '558.514', '571', '3.16778', '75', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('53', '20. Кузни душ (80+)', '5672.19', '2002.17', '798.182', '571', '5.47579', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('54', '19. Яма Сарона (80+)', '5591.99', '2010.32', '798.182', '571', '3.92227', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('55', '21. Залы Отражений (80+)', '5629.33', '1986.66', '800.027', '571', '4.72024', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('56', '01. Пик Черной Горы (54-60) (10 man)', '-7535.43', '-1212.04', '285.45', '0', '5.29', '49', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('58', '03. Зул\'Гуруб (56-60+) (20 man)', '-11916.7', '-1212.82', '92.2868', '0', '4.6095', '50', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('59', '04. Огненные Недра (60+) (40 man)', '1121.45', '-454.317', '-101.33', '230', '3.5', '55', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('60', '05. Логово Крыла Тьмы (60+) (40 man)', '-7665.55', '-1102.49', '400.679', '469', '0', '60', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('61', '06. Руины Ан\'Киража (60+) (20 man)', '-8409.03', '1498.83', '27.3615', '1', '2.49757', '60', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('62', '07. Ан\'Кираж (60+) (40 man)', '-8245.84', '1983.74', '129.072', '1', '0.936195', '60', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('63', '08. Каражан (70+) (10 man)', '-11118.8', '-2010.84', '47.0807', '0', '0', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('64', '09. Логово Груула (70+) (25 man)', '3539.01', '5082.36', '1.69107', '530', '0', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('65', '10. Логово Магтеридона (70+) (25 man)', '-317.43', '3095.03', '-116.42', '530', '5.1927', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('66', '11. Зул\'Аман (70+) (10 man)', '6846.95', '-7954.5', '170.028', '530', '4.61501', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('67', '12. Змеиное святилище (70+) (25 man)', '795.188', '6865.64', '-64.8004', '530', '6.2096', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('68', '13. Око (70+) (25 man)', '3090.03', '1402.73', '188.81', '530', '4.60991', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('69', '14. Битва за гору Хиджал (70+) (25 man)', '-8184.08', '-4196.08', '-171.38', '1', '1.24845', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('70', '15. Черный храм (70+) (25 man)', '-3610.72', '324.988', '37.4', '530', '3.28298', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('71', '16. Плато солнечного колодца (70+) (25 man)', '12574.1', '-6774.81', '15.09', '530', '3.13788', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('72', '17. Наксрамас (10 man & 25 man) (80+)', '3668.71', '-1262.45', '243.62', '571', '4.785', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('73', '18. Обсидиановое святилище (10 man & 25 man) (80+)', '3516.29', '269.49', '-114.15', '571', '3.19766', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('74', '19. Склеп Аркавона (10 man & 25 man) (80+)', '5478.16', '2840.41', '418.67', '571', '6.26748', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('75', '20. Око вечности(10 man & 25 man) (80+)', '3878.58', '6979.56', '152.04', '571', '2.70778', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('76', '21. Ульдуар (10 man & 25 man) (80+)', '9329.55', '-1114.16', '1245.14', '571', '6.24202', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('77', '22. Испытание крестоносца/чемпиона (10 man, 25 man & Heroic) (80+)', '8515.45', '728.919', '558.247', '571', '1.59726', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('78', '23. Логово Ониксии (10 man, 25 man & Heroic) (80+)', '-4707.44', '-3726.82', '54.6723', '1', '3.8', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('79', '24. Цитадель Ледяной Короны (10 man, 25 man & Heroic) 80 (80+)', '5790', '2071.47', '636.065', '571', '3.62348', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('80', '1. Штормграде', '-8960.14', '516.266', '96.3568', '0', '0', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('81', '2. Стальгорн', '-4991.78', '-870.59', '496.98', '0', '5.30771', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('82', '3. Дарнас', '8781.82', '965.93', '30.23', '1', '0.240982', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('83', '4. Екзодар', '-4073.03', '-12020.4', '-1.47', '530', '0', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('84', '1. Оргриммар', '1377.78', '-4369.87', '26.0264', '1', '0.15315', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('85', '2. Громовой утёс', '-1290', '147.034', '129.682', '1', '4.919', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('86', '3. Подгород', '1642.13', '239.71', '62.5916', '0', '3.15534', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('87', '4. Луносвет', '9338.74', '-7277.27', '13.7895', '530', '0', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('88', '5. Шаттрат', '-1850.21', '5435.82', '-10.9614', '530', '3.40391', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('89', '6. Остров Кель\'Данас', '12947.4', '-6893.31', '5.68398', '530', '3.09154', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('90', '7. Даларан', '5807.67', '588.207', '660.93', '571', '1.70185', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('91', '5. Шаттрат', '-1850.21', '5435.82', '-10.9614', '530', '3.40391', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('92', '6. Остров Кель\'Данас', '12947.4', '-6893.31', '5.68398', '530', '3.09154', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('93', '7. Даларан', '5807.67', '588.207', '660.93', '571', '1.70185', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('94', '1. Арена гурубаши', '-13261.3', '168.294', '35.0792', '0', '1.00688', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('95', '2. Круг крови', '2839.44', '5930.17', '11.1002', '530', '3.16284', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('96', '3. Кольцо испытаний', '-1999.94', '6581.71', '11.32', '530', '2.3', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('97', '4. The Maul', '-3739.86', '1093.8', '131.968', '1', '0.155619', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('98', '25. Рубиновое святилище (10 man/heroic & 25 man/heroic) (80+)', '3516.29', '269.49', '-114.15', '571', '3.19766', '80', '0');

DROP TABLE IF EXISTS `custom_npc_tele_association`;
-- ----------------------------
-- Table structure for custom_npc_tele_association
-- ----------------------------
CREATE TABLE `custom_npc_tele_association` (
  `cat_id` int(6) unsigned NOT NULL default '0',
  `dest_id` int(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`,`dest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `custom_npc_tele_association` VALUES ('1', '80');
INSERT INTO `custom_npc_tele_association` VALUES ('1', '81');
INSERT INTO `custom_npc_tele_association` VALUES ('1', '82');
INSERT INTO `custom_npc_tele_association` VALUES ('1', '83');
INSERT INTO `custom_npc_tele_association` VALUES ('1', '88');
INSERT INTO `custom_npc_tele_association` VALUES ('1', '89');
INSERT INTO `custom_npc_tele_association` VALUES ('1', '90');
INSERT INTO `custom_npc_tele_association` VALUES ('2', '84');
INSERT INTO `custom_npc_tele_association` VALUES ('2', '85');
INSERT INTO `custom_npc_tele_association` VALUES ('2', '86');
INSERT INTO `custom_npc_tele_association` VALUES ('2', '87');
INSERT INTO `custom_npc_tele_association` VALUES ('2', '91');
INSERT INTO `custom_npc_tele_association` VALUES ('2', '92');
INSERT INTO `custom_npc_tele_association` VALUES ('2', '93');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '1');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '2');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '3');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '4');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '5');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '6');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '7');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '8');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '9');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '10');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '11');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '12');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '13');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '14');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '15');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '16');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '17');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '18');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '19');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '20');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '21');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '22');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '23');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '24');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '25');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '26');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '27');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '28');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '29');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '30');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '31');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '32');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '33');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '34');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '35');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '36');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '37');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '38');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '39');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '40');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '41');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '42');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '43');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '44');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '45');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '46');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '47');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '48');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '49');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '50');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '51');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '52');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '53');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '54');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '55');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '56');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '58');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '59');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '60');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '61');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '62');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '63');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '64');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '65');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '66');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '67');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '68');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '69');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '70');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '71');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '72');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '73');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '98');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '74');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '75');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '76');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '77');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '78');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '79');
INSERT INTO `custom_npc_tele_association` VALUES ('7', '95');
INSERT INTO `custom_npc_tele_association` VALUES ('7', '96');
INSERT INTO `custom_npc_tele_association` VALUES ('7', '97');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '98');

DELETE FROM creature_template WHERE `entry`=100000;
INSERT INTO `creature_template` VALUES ('100000', '0', '0', '0', '0', '0', '26789', '0', '0', '0', 'Lafain', 'Teleport Service', '', '0', '80', '80', '0', '35', '35', '1', '1', '1.14286', '0.75', '1', '1755', '1755', '0', '1504', '1', '1500', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_teleport', '0');

DELETE FROM npc_text WHERE `ID`=100000;
INSERT INTO `npc_text` VALUES ('100000', 'Choose your Category.', null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0');

DELETE FROM npc_text WHERE `ID`=100001;
INSERT INTO `npc_text` VALUES ('100001', 'Choose your Destination.', null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0');

DELETE FROM `locales_creature` WHERE `entry`=100000;
INSERT INTO `locales_creature` VALUES ('100000', '', '', '', '', '', '', '', 'Лафайн', null, null, null, null, null, null, null, 'Телепортационный сервис');
UPDATE `creature_template` SET `scale`=3, `modelid1`=30414, `modelid2`=30414, `modelid3`=30414, `modelid4`=30414 WHERE `entry`=100000;

DELETE FROM `creature` WHERE `id`=13;
INSERT INTO `creature` VALUES
(@GUID+1, 13, 0, 1, 1, 0, 1360, -1847.26, -4129.53, 11.1216, 3.14817, 300, 0, 0, 5342, 0, 0, 0),
(@GUID+1, 13, 1, 1, 1, 0, 0, 10079, 2192.44, 1346.62, 1.77527, 300, 0, 0, 5342, 0, 0, 0),
(@GUID+1, 13, 530, 1, 1, 0, 0, -4097.68, -11632.6, -138.83, 0.498251, 300, 0, 0, 5342, 0, 0, 0),
(@GUID+1, 13, 530, 1, 1, 0, 0, 9462.82, -7346.9, 16.1004, 0.174264, 300, 0, 0, 5342, 0, 0, 0),
(@GUID+1, 13, 0, 1, 1, 0, 0, 1598.59, 203.806, -55.3429, 1.7411, 300, 0, 0, 5342, 0, 0, 0),
(@GUID+1, 13, 1, 1, 1, 0, 0, -1290.03, 129.823, 131.64, 5.14219, 300, 0, 0, 5342, 0, 0, 0),
(@GUID+1, 13, 571, 1, 128, 0, 1360, 5760.67, 628.767, 650.092, 4.53708, 300, 0, 0, 5342, 0, 0, 0),
(@GUID+1, 13, 0, 1, 1, 0, 0, -8883.97, 610.267, 95.4976, 3.65835, 300, 0, 0, 5342, 0, 0, 0),
(@GUID+1, 13, 1, 1, 1, 0, 0, 1578.83, -4295.81, 26.2374, 3.08361, 300, 0, 0, 5342, 0, 0, 0),
(@GUID+1, 13, 0, 1, 1, 0, 0, -5014.83, -999.079, 503.882, 2.86357, 300, 0, 0, 5342, 0, 0, 0);


# GameObject
UPDATE `gameobject_template` SET `ScriptName` = 'icecrown_teleporter' WHERE `entry` IN (202223,202235,202242,202243,202244,202245,202246);
UPDATE `gameobject_template` SET `flags` = 52 WHERE `entry` = 202223;
UPDATE `gameobject_template` SET `faction` = 0, `data10` = 70311 WHERE `entry` = 201584;
UPDATE `gameobject` SET `phaseMask` = '1' WHERE `id` IN (202242,202243,202244,202245,202235,202223,202246);

# Boss
UPDATE `creature_template` SET `ScriptName`='boss_blood_queen_lanathel' WHERE `entry` = 37955;
UPDATE `creature_template` SET `ScriptName`='boss_festergut' WHERE `entry` = 36626;
UPDATE `creature_template` SET `ScriptName`='boss_saurfang' WHERE `entry` = 37813;
UPDATE `creature_template` SET `ScriptName`='boss_lady_deathwisper' WHERE `entry` = 36855;
UPDATE `creature_template` SET `ScriptName`='boss_professor_putricide' WHERE `entry` = 36678;
UPDATE `creature_template` SET `ScriptName`='boss_blood_elf_valanar_icc' WHERE `entry` = 37970;
UPDATE `creature_template` SET `ScriptName`='boss_blood_elf_keleset_icc' WHERE `entry` = 37972;
UPDATE `creature_template` SET `ScriptName`='boss_blood_elf_taldaram_icc' WHERE `entry` = 37973;
UPDATE `creature_template` SET `ScriptName`='boss_sindragosa' WHERE `entry` = 36853;
UPDATE `creature_template` SET `ScriptName`='boss_valithria' WHERE `entry` = 36789;
UPDATE `creature_template` SET `ScriptName`='boss_the_lich_king' WHERE `entry` = 36597;
UPDATE `creature_template` SET `ScriptName`='boss_rotface' WHERE `entry`= 36627;
UPDATE `creature_template` SET `ScriptName`='boss_lord_marrowgar' WHERE `entry` = 36612;

# Mobs
UPDATE `creature_template` SET `ScriptName`='npc_tirion_icc' WHERE `entry`= 38995;
UPDATE `creature_template` SET `ScriptName`='npc_swarming_shadows' WHERE `entry` = 38163;
UPDATE `creature_template` SET `ScriptName`='npc_bloodbeast' WHERE `entry` = 38508;
UPDATE `creature_template` SET `ScriptName`='npc_cold_flame' WHERE `entry` = 36672;
UPDATE `creature_template` SET `ScriptName`='npc_bone_spike' WHERE `entry` = 38711;
UPDATE `creature_template` SET `ScriptName`='npc_volatile_ooze' WHERE `entry` = 37697;
UPDATE `creature_template` SET `ScriptName`='npc_ice_puls_icc' WHERE `entry` = 36633;
UPDATE `creature_template` SET `ScriptName`='npc_valkyr_icc' WHERE `entry` = 36609;
UPDATE `creature_template` SET `ScriptName`='npc_ghoul_icc' WHERE `entry` = 37695;
UPDATE `creature_template` SET `ScriptName`='npc_defile_icc' WHERE `entry` = 38757;
UPDATE `creature_template` SET `ScriptName`='npc_raging_spirit_icc' WHERE `entry`= 36701;
UPDATE `creature_template` SET `ScriptName`='npc_shambling_horror_icc' WHERE `entry` = 37698;
UPDATE `creature_template` SET `ScriptName`='npc_ooze_little' WHERE `entry`= 36897;
UPDATE `creature_template` SET `ScriptName`='npc_ooze_big' WHERE `entry`= 36899;
UPDATE `creature_template` SET `ScriptName`='npc_shade' WHERE `entry` = 38222;
UPDATE `creature_template` SET `ScriptName`='npc_skellmage_icc' WHERE `entry` = 37868;
UPDATE `creature_template` SET `ScriptName`='npc_fireskell_icc' WHERE `entry` = 36791;
UPDATE `creature_template` SET `ScriptName`='npc_suppressor_icc' WHERE `entry` = 37863;
UPDATE `creature_template` SET `ScriptName`='npc_manavoid_icc' WHERE `entry` = 38068;
UPDATE `creature_template` SET `ScriptName`='npc_glutabomination_icc' WHERE `entry` = 37886;
UPDATE `creature_template` SET `ScriptName`='npc_blistzombie_icc' WHERE `entry` = 37934;
UPDATE `creature_template` SET `ScriptName`='npc_dreamcloud_icc' WHERE `entry` = 37985;
UPDATE `creature_template` SET `ScriptName`='npc_dreamportal_icc' WHERE `entry` = 37945;
UPDATE `creature_template` SET `ScriptName`='npc_icecrown_trash' WHERE `entry` IN (37949,37890);
UPDATE `creature_template` SET `ScriptName`='npc_rimefang' WHERE `entry`= 37533;
UPDATE `creature_template` SET `ScriptName`='npc_spinestalker' WHERE `entry`= 37534;
UPDATE `creature_template` SET `ScriptName`='npc_ice_tomb' WHERE `entry`= 36980;
UPDATE `creature_template` SET `ScriptName`='npc_frost_bomb' WHERE `entry`= 37186;
UPDATE `creature_template` SET `spell1` = 72527, `spell2` = 70539, `spell3` = 70542, `VehicleId` = 591, `ScriptName`='npc_abomination' WHERE `entry` = 37672;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = '14', `ScriptName`='npc_sticky_ooze' WHERE `entry`= 37006;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = '14', `ScriptName`='npc_ooze_stalker' WHERE `entry`= 37013;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = '14', `ScriptName`='npc_ooze_spray_stalker' WHERE `entry`= 37986;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = '14', `ScriptName`='npc_ooze_explode_stalker' WHERE `entry` = 38107;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = '14', `ScriptName`='npc_vile_gas_stalker' WHERE `entry`= 38548;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = '14', `ScriptName`='npc_orange_gas_stalker' WHERE `entry` = 36659;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = '14', `ScriptName`='npc_growing_ooze' WHERE `entry` = 37690;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = '14', `ScriptName`='npc_gas_cloud_icc' WHERE `entry` = 37562;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = '14', `ScriptName`='npc_bomb_icc' WHERE `entry` = 38159;

# Other
UPDATE `creature_template` SET `faction_A` = '1802', `faction_H` = '1801', `type_flags` = '67113036' WHERE `entry` IN (36789,10067,10068,10069);
UPDATE `creature_template` SET `minlevel` = 82,`maxlevel` = 82,`faction_A` = 14,`faction_H` = 14,`unit_flags` = 2 WHERE `entry` = 36672;
UPDATE `creature_template` SET `VehicleId` = 639 WHERE `entry` IN (37813,13106,13107,13108);
UPDATE `creature_template` SET `vehicleId` = 318 WHERE `entry` IN (36609,10242,10243,10244);
UPDATE `creature_model_info` SET `bounding_radius` = 5,`combat_reach` = 5 WHERE `modelid` = 31119;
UPDATE `creature_template` SET  `flags_extra` = 2 WHERE `entry` = 36672;
UPDATE `creature_template` SET `mechanic_immune_mask` = 634339327 WHERE `entry` = 36855;

# Instance
UPDATE `instance_template` SET `script`='instance_icecrown_citadel' WHERE `map` = 631;

# Creature loot template

DELETE FROM creature_loot_template WHERE item = 49426 AND entry IN
(SELECT id FROM creature WHERE map = 631);

# Creature addon template

DELETE FROM `creature_addon` WHERE `guid` = 136107;

INSERT INTO creature_addon
   (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`)
VALUES
   (136107, 0, 0, 0, 1, 0, '18950 0 18950 1 72242 0');

#Thanks YTDB

# Conditions

DELETE FROM `conditions` WHERE `SourceEntry` IN (69508,69783,69248,69240);

INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`) VALUES ('13','0','69783','0','18','1','37013','0');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`) VALUES ('13','0','69508','0','18','1','37986','0');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`) VALUES ('13','0','69248','0','18','1','38548','0');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`) VALUES ('13','0','69240','0','18','1','38548','0');

#creature

DELETE FROM `creature` WHERE `id`=37013;

DELETE FROM `spell_proc_event` WHERE `entry` IN (70107);
INSERT INTO `spell_proc_event` VALUES (70107, 0x08, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000054, 0x00000000, 0, 20, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (69762);
INSERT INTO `spell_proc_event` VALUES (69762, 0x00, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00014000, 0x00000000, 0, 101, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (72178);
INSERT INTO `spell_proc_event` VALUES (72178, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00055510, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (72176);
INSERT INTO `spell_proc_event` VALUES (72176, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00051154, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (70602);
INSERT INTO `spell_proc_event` VALUES (70602, 0x20, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x000AAA20, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (71494);
INSERT INTO `spell_proc_event` VALUES (71494, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000004, 0x00000000, 0, 101, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (72176);
INSERT INTO `spell_proc_event` VALUES (72176, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00051154, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (72178);
INSERT INTO `spell_proc_event` VALUES (72178, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00055510, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (71617);
INSERT INTO `spell_proc_event` VALUES (71617, 0x28, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (71604);
INSERT INTO `spell_proc_event` VALUES (71604, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000004, 0x00000000, 0, 100, 0);

DELETE FROM script_texts WHERE entry <= -1665892 AND entry >= -1666080;
DELETE FROM script_texts WHERE entry <= -1810001 AND entry >= -1810031;

# 1
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1665892,'This is the beginning AND the end, mortals. None may enter the master''s sanctum!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16950,0,0,0,''),
(0,-1665893,'The Scourge will wash over this world as a swarm of death and destruction!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16941,0,0,0,''),
(0,-1665894,'BONE STORM!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16946,1,0,0,''),
(0,-1665895,'Bound by bone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16947,1,0,0,''),
(0,-1665896,'Stick Around!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16948,1,0,0,''),
(0,-1665897,'The only escape is death!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16949,1,0,0,''),
(0,-1665898,'More bones for the offering!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16942,1,0,0,''),
(0,-1665899,'Languish in damnation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16943,1,0,0,''),
(0,-1665900,'I see... only darkness...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16944,1,0,0,''),
(0,-1665901,'THE MASTER''S RAGE COURSES THROUGH ME!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16945,1,0,0,'');

#2
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1665902,'You have found your way here, because you are among the few gifted with true vision in a world cursed with blindness!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17272,0,0,0,''),
(0,-1665903,'You can see through the fog that hangs over this world like a shroud and grasp where true power lies!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17273,0,0,0,''),
(0,-1665904,'Fix your eyes upon your crude hands! The sinew, the soft meat, the dark blood coursing within!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16878,1,0,0,''),
(0,-1665905,'It is a weakness! A crippling flaw! A joke played by the creators upon their own creations!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17268,1,0,0,''),
(0,-1665906,'The sooner you come to accept your condition as a defect, the sooner you will find yourselves in a position to transcend it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17269,1,0,0,''),
(0,-1665907,'Through our master all things are possible! His power is without limit, and his will unbending!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17270,1,0,0,''),
(0,-1665908,'Those who oppose him will be destroyed utterly! And those who serve, who serve wholly, unquestioningly, with utter devotion of mind and soul? Elevated! To heights beyond your ken!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17271,1,0,0,''),
(0,-1665909,'What is this disturbance?! You dare trespass upon this hallowed ground? This shall be your final resting place.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16868,1,0,0,''),
(0,-1665910,'Enough! I see I must take matters into my own hands!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16877,1,0,0,''),
(0,-1665911,'Take this blessing and show these intruders a taste of our master''s power.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16873,1,0,0,''),
(0,-1665912,'I release you from the curse of flesh!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16874,1,0,0,''),
(0,-1665913,'Arise and exult in your pure form!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16875,1,0,0,''),
(0,-1665914,'You are weak, powerless to resist my will!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16876,1,0,0,''),
(0,-1665915,'This charade has gone on long enough.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16872,1,0,0,''),
(0,-1665916,'All part of the masters plan! Your end is... inevitable!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16871,1,0,0,''),
(0,-1665917,'Do you yet grasp of the futility of your actions?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16869,1,0,0,''),
(0,-1665918,'Embrace the darkness... Darkness eternal!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16870,1,0,0,'');

# 3
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1665919,'Thank the spirits for you, brothers and sisters. The Skybreaker has already left. Quickly now, to Orgrim''s Hammer! If you leave soon, you may be able to catch them.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,''),
(0,-1665920,'This should be helpin''ya!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,''),
(0,-1665921,'Aka''Magosh, brave warriors. The alliance is in great number here.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665922,'Captain Saurfang will be pleased to see you aboard Orgrim''s Hammer. Make haste, we will secure the area until you are ready for take-off.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665923,'A screeching cry pierces the air above!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665924,'A Spire Frostwyrm lands just before Orgrim''s Hammer.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665925,'Rise up, sons and daughters of the Horde! Today we battle a hated enemy of the Horde! LOK''TAR OGAR! Kor''kron, take us out!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665926,'What is that?! Something approaching in the distance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665927,'ALLIANCE GUNSHIP! ALL HANDS ON DECK!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665928,'Move yer jalopy or we''ll blow it out of the sky, orc! The Horde''s got no business here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665929,'You will know our business soon! KOR''KRON, ANNIHILATE THEM!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665930,'Marines, Sergeants, attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665931,'You DARE board my ship? Your death will come swiftly.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665932,'Riflemen, shoot faster!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665933,'Mortar team, reload!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665934,'We''re taking hull damage, get a sorcerer out here to shut down those cannons!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665935,'The Alliance falter. Onward to the Lich King!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665936,'Damage control! Put those fires out! You haven''t seen the last of the Horde!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665937,'Thank goodness you arrived when you did, heroes. Orgrim''s Hammer has already left. Quickly now, to The Skybreaker! If you leave soon, you may be able to catch them.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665938,'This ought to help!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665939,'Skybreaker Sorcerer summons a Skybreaker Battle Standard.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665940,'You have my thanks. We were outnumbered until you arrived.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665941,'Captain Muradin is waiting aboard The Skybreaker. We''ll secure the area until you are ready for take off.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665942,'Skybreaker infantry, hold position!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665943,'A screeching cry pierces the air above!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665944,'A Spire Frostwyrm lands just before The Skybreaker. ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665945,'Fire up the engines! We got a meetin with destiny, lads!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665946,'Hold on to yer hats!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665947,'What in the world is that? Grab me spyglass, crewman!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665948,'By me own beard! HORDE SAILIN IN FAST N HOT!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665949,'EVASIVE ACTION! MAN THE GUNS!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665950,'Cowardly dogs! Ye blindsighted us!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665951,'This is not your battle, dwarf. Back down or we will be forced to destroy your ship.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665952,'Not me battle? I dunnae who ye? think ye are, mister, but I got a score to settle with Arthas and yer not gettin in me way! FIRE ALL GUNS! FIRE! FIRE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665953,'Reavers, Sergeants, attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665954,'What''s this then?! Ye won''t be takin this son o Ironforge''s vessel without a fight!.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665955,'Axethrowers, hurl faster!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665956,'Rocketeers, reload!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665957,'We''re taking hull damage, get a battle-mage out here to shut down those cannons!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665958,'Don''t say I didn''t warn ya, scoundrels! Onward, brothers and sisters!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665959,'Captain Bartlett, get us out of here! We''re taken too much damage to stay afloat!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'');

# 4
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1665960,'For every Horde soldier that you killed, for every Alliance dog that fell, the Lich King''s armies grew. Even now the Val''kyr work to raise your fallen... As Scourge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665961,'Things are about to get much worse. Come, taste the power that the Lich King has bestowed upon me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665962,'A lone orc, against the might of the Alliance? Charge!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665963,'Hahahaha! Dwarves.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665964,'Kor''kron, move out! Champions, watch your backs! The Scourge have been...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665965,'Join me, father. Join me and we will crush this world in the name of the Scourge. For the glory of the Lich King!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665966,'My boy died at the Wrathgate. I am here only to collect his body!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665967,'Stubborn and old. What chance do you have? I am stronger and more powerful than you ever were!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665968,'We named him Dranosh. It means "Heart of Draenor" in Orcish. I would not let the warlocks take him. My boy would be safe, hidden away by the elders of Garadar.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665969,'I made a promise to his mother before she died: that I would cross the Dark Portal alone - whether I lived or died, my son would be safe. Untainted...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665970,'Today, I fulfill that promise.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665971,'High Overlord Saurfang charges!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665972,'Pathetic old orc. Come then heroes, come and face the might of the Scourge!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665973,'BY THE MIGHT OF THE LICH KING!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16694,1,0,0,''),
(0,-1665974,'The ground runs red with your blood!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16699,1,0,0,''),
(0,-1665975,'Feast, my minions!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16700,1,0,0,''),
(0,-1665976,'You are nothing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16695,1,0,0,''),
(0,-1665977,'Your soul will find no redemption here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16696,1,0,0,''),
(0,-1665978,'I have become...DEATH!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16698,1,0,0,''),
(0,-1665979,'I... Am... Released.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16697,1,0,0,''),
(0,-1665980,'Muradin Bronzebeard gasps for air.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665981,'That was Saurfang''s boy - the Horde commander at the Wrath Gate. Such a tragic end...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665982,'What in the... There, in the distance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665983,'A Horde Zeppelin flies up to the rise',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665984,'Soldiers, fall in! Looks like the Horde are comin in to take another shot!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665985,'The Zeppelin docks, and High Overlord Saurfang hops out, confronting the Alliance soldiers and Muradin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665986,'Don''t force my hand, orc. We can''t let you pass.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665987,'Behind you lies the body of my only son. Nothing will keep me from him.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665988,'He... I can''t do it. Get back on your ship and we''ll spare your life.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665989,'Stand down, Muradin. Let a grieving father pass.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16690,1,0,0,''),
(0,-1665990,'High Overlord Saurfang kneels over his son''s body.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665991,'[Orcish] No''ku kil zil''nok ha tar.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665992,'Higher Overlord Saurfang picks up the body of his son and walks over towards Varian',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665993,'I will not forget this kindess. I thank you, highness.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665994,'I... I was not at the Wrathgate. But the soldiers who survived told me much of what happened. Your son fought with honor. He died a hero''s death. He deserves a hero''s burial.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16691,1,0,0,''),
(0,-1665995,'Lady Jaina Proudmoore cries.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665996,'Jaina, why are you crying?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16692,1,0,0,''),
(0,-1665997,'It was nothing, your majesty. Just... I''m proud of my king.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665998,'Muradin, secure the deck and prepare our soldiers for an assault on the Upper Citadel. I''ll send out another regiment from Stormwind.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16693,1,0,0,''),
(0,-1665999,'Let''s get the move then. Move out!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666000,'High Overlord Saurfang coughs.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666001,'High Overlord Saurfang weeps over the corpse of his son.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666002,'You will have a proper ceremony in Nagrand next to the pyres of your mother and ancestors.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666003,'Honor, young heroes... no matter how dire the battle... Never forsake it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'');

# 5
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666004,'NOOOO! You kill Stinky! You pay!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16907,1,0,0,''),
(0,-1666005,'Fun time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16901,1,0,0,''),
(0,-1666006,'Just an ordinary gas cloud. But watch out, because that''s no ordinary gas cloud!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17119,1,0,0,''),
(0,-1666007,'Festergut farts.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16911,4,0,0,''),
(0,-1666008,'Gyah! Uhhh, I not feel so good...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16906,1,0,0,''),
(0,-1666009,'Festergut vomits.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16910,1,0,0,''),
(0,-1666010,'Daddy, I did it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16902,1,0,0,''),
(0,-1666011,'Dead, dead, dead! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16903,1,0,0,''),
(0,-1666012,'Fun time over!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16905,1,0,0,''),
(0,-1666013,'Da...Daddy...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16904,1,0,0,''),
(0,-1666014,'Oh, Festergut. You were always my favorite. Next to Rotface. The good news is you left behind so much gas, I can practically taste it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17124,1,0,0,'');

# 6
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666015,'What? Precious? Noooooooooo!!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16993,1,0,0,''),
(0,-1666016,'WEEEEEE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16986,1,0,0,''),
(0,-1666017,'Icky sticky.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16991,1,0,0,''),
(0,-1666018,'I think I made an angry poo-poo. It gonna blow! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16992,1,0,0,''),
(0,-1666019,'Great news, everyone! The slime is flowing again!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17126,1,0,0,''),
(0,-1666020,'Good news, everyone! I''ve fixed the poison slime pipes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17123,1,0,0,''),
(0,-1666021,'Daddy make toys out of you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16988,1,0,0,''),
(0,-1666022,'I brokes-ded it...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16987,1,0,0,''),
(0,-1666023,'Sleepy Time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16990,1,0,0,''),
(0,-1666024,'Bad news daddy.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16989,1,0,0,''),
(0,-1666025,'Terrible news, everyone, Rotface is dead! But great news everyone, he left behind plenty of ooze for me to use! Whaa...? I''m a poet, and I didn''t know it? Astounding!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'');

# 7
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666026,'Good news, everyone! I think I perfected a plague that will destroy all life on Azeroth!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17144,1,0,0,''),
(0,-1666027,'You can''t come in here all dirty like that! You need that nasty flesh scrubbed off first!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17125,1,0,0,''),
(0,-1666028,'Two oozes, one room! So many delightful possibilities...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17122,1,0,0,''),
(0,-1666029,'Hmm. I don''t feel a thing. Whaa...? Where''d those come from?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17120,1,0,0,''),
(0,-1666030,'Tastes like... Cherry! Oh! Excuse me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17121,1,0,0,''),
(0,-1666031,'Hmm... Interesting...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17115,1,0,0,''),
(0,-1666032,'That was unexpected!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17116,1,0,0,''),
(0,-1666033,'Great news, everyone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17118,1,0,0,''),
(0,-1666034,'Bad news, everyone! I don''t think I''m going to make it.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17117,1,0,0,'');

# 8
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666035,'Foolish mortals. You thought us defeated so easily? The San''layn are the Lich King''s immortal soldiers! Now you shall face their might combined!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16795,1,0,0,''),
(0,-1666036,'Rise up, brothers, and destroy our enemies.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666037,'Such wondrous power! The Darkfallen Orb has made me INVINCIBLE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666038,'Blood will flow!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666039,'Were you ever a threat?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666040,'Truth is found in death.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666041,'Prince Keleseth cackles maniacally!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,''),
(0,-1666042,'My queen... they come...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666043,'Tremble before Taldaram, mortals, for the power of the orb flows through me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666044,'Delight in the pain!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666045,'Worm food.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666046,'Beg for mercy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666047,'Prince Taldaram laughs.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,''),
(0,-1666048,'Prince Taldaram gurgles and dies.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,''),
(0,-1666049,'Naxxanar was merely a setback! With the power of the orb, Valanar will have his vengeance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16685,1,0,0,''),
(0,-1666050,'Dinner... is served.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16681,1,0,0,''),
(0,-1666051,'Do you see NOW the power of the Darkfallen?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16682,1,0,0,''),
(0,-1666052,'BOW DOWN BEFORE THE SAN''LAYN!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16684,1,0,0,''),
(0,-1666053,'...why...?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16683,1,0,0,'');

# 9
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666054,'You have made an... unwise... decision.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16782,1,0,0,''),
(0,-1666055,'Just a taste...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16783,1,0,0,''),
(0,-1666056,'Know my hunger!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16784,1,0,0,''),
(0,-1666057,'SUFFER!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16786,1,0,0,''),
(0,-1666058,'Can you handle this?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16787,1,0,0,''),
(0,-1666059,'Yes... feed my precious one! You''re mine now! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16790,1,0,0,''),
(0,-1666060,'Here it comes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16788,1,0,0,''),
(0,-1666061,'THIS ENDS NOW!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16793,1,0,0,''),
(0,-1666062,'But... we were getting along... so well...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16794,1,0,0,'');

# 10
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666063,'Heroes, lend me your aid! I... I cannot hold them off much longer! You must heal my wounds!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17064,1,0,0,''),
(0,-1666064,'I have opened a portal into the Emerald Dream. Your salvation lies within, heroes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17068,1,0,0,''),
(0,-1666065,'My strength is returning! Press on, heroes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17070,1,0,0,''),
(0,-1666066,'I will not last much longer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17069,1,0,0,''),
(0,-1666067,'Forgive me for what I do! I... cannot... stop... ONLY NIGHTMARES REMAIN!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17072,1,0,0,''),
(0,-1666068,'A tragic loss...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17066,1,0,0,''),
(0,-1666069,'FAILURES!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17067,1,0,0,''),
(0,-1666070,'I am renewed! Ysera grants me the favor to lay these foul creatures to rest!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17071,1,0,0,'');

# 11
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666071,'You are fools to have come to this place! The icy winds of Northrend will consume your souls!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17007,1,0,0,''),
(0,-1666072,'Suffer, mortals, as your pathetic magic betrays you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17014,1,0,0,''),
(0,-1666073,'Can you feel the cold hand of death upon your heart?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17013,1,0,0,''),
(0,-1666074,'Aaah! It burns! What sorcery is this?!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17015,1,0,0,''),
(0,-1666075,'Your incursion ends here! None shall survive!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17012,1,0,0,''),
(0,-1666076,'Now feel my master''s limitless power and despair!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17016,1,0,0,''),
(0,-1666077,'Perish!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17008,1,0,0,''),
(0,-1666078,'A flaw of mortality...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17009,1,0,0,''),
(0,-1666079,'Enough! I tire of these games!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17011,1,0,0,''),
(0,-1666080,'Free...at last...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17010,1,0,0,'');

# 12
INSERT INTO script_texts (entry,content_default,content_loc1,content_loc2,content_loc3,content_loc4,content_loc5,content_loc6,content_loc7,content_loc8,sound,type,language,emote,comment)VALUES
(-1810001, 'So...the Light''s vaunted justice has finally arrived. Shall I lay down Frostmourne and throw myself at your mercy, Fordring?',null,null,null,null,null,null,null,null,17349,1,0,0,''),
(-1810002, 'We will grant you a swift death, Arthas. More than can be said for the thousands you''ve tortured and slain.',null,null,null,null,null,null,null,null,17390,1,0,0,''),
(-1810003, 'You will learn of that first hand. When my work is complete, you will beg for mercy -- and I will deny you. Your anguished cries will be testament to my unbridled power.',null,null,null,null,null,null,null,null,17350,1,0,0,''),
(-1810004, 'So be it. Champions, attack!',null,null,null,null,null,null,null,null,17391,1,0,0,''),
(-1810005, 'I''ll keep you alive to witness the end, Fordring. I would not want the Light''s greatest champion to miss seeing this wretched world remade in my image.',null,null,null,null,null,null,null,null,17351,1,0,0,''),
(-1810006, 'Come then champions, feed me your rage!',null,null,null,null,null,null,null,null,17352,1,0,0,''),
(-1810007, 'I will freeze you from within until all that remains is an icy husk!',null,null,null,null,null,null,null,null,17369,1,0,0,''),
(-1810008, 'Apocalypse!',null,null,null,null,null,null,null,null,17371,1,0,0,''),
(-1810009, 'Bow down before your lord and master!',null,null,null,null,null,null,null,null,17372,1,0,0,''),
(-1810010, 'Hope wanes!',null,null,null,null,null,null,null,null,17363,1,0,0,''),
(-1810011, 'The end has come!',null,null,null,null,null,null,null,null,17364,1,0,0,''),
(-1810012, 'Face now your tragic end!',null,null,null,null,null,null,null,null,17365,1,0,0,''),
(-1810013, 'No question remains unanswered. No doubts linger. You are Azeroth''s greatest champions! You overcame every challenge I laid before you. My mightiest servants have fallen before your relentless onslaught, your unbridled fury... Is it truly righteousness that drives you? I wonder.',null,null,null,null,null,null,null,null,17353,1,0,0,''),
(-1810014, 'You trained them well, Fordring. You delivered the greatest fighting force this world has ever known... right into my hands -- exactly as I intended. You shall be rewarded for your unwitting sacrifice.',null,null,null,null,null,null,null,null,17355,1,0,0,''),
(-1810015, 'Watch now as I raise them from the dead to become masters of the Scourge. They will shroud this world in chaos and destruction. Azeroth''s fall will come at their hands -- and you will be the first to die.',null,null,null,null,null,null,null,null,17356,1,0,0,''),
(-1810016, 'I delight in the irony.',null,null,null,null,null,null,null,null,17357,1,0,0,''),
(-1810017, 'LIGHT, GRANT ME ONE FINAL BLESSING. GIVE ME THE STRENGTH... TO SHATTER THESE BONDS!',null,null,null,null,null,null,null,null,17392,1,0,0,''),
(-1810018, 'Impossible...',null,null,null,null,null,null,null,null,17358,1,0,0,''),
(-1810020, 'No more, Arthas! No more lives will be consumed by your hatred!',null,null,null,null,null,null,null,null,17393,1,0,0,''),
(-1810021, 'Free at last! It is over, my son. This is the moment of reckoning.',null,null,null,null,null,null,null,null,17397,1,0,0,''),
(-1810022, 'The Lich King must fall!',null,null,null,null,null,null,null,null,17389,1,0,0,''),
(-1810023, 'Rise up, champions of the Light!',null,null,null,null,null,null,null,null,17398,1,0,0,''),
(-1810024, 'Now I stand, the lion before the lambs... and they do not fear.',null,null,null,null,null,null,null,null,17361,1,0,0,''),
(-1810025, 'They cannot fear.',null,null,null,null,null,null,null,null,17362,1,0,0,''),
(-1810026, 'Argh... Frostmourne, obey me!',null,null,null,null,null,null,null,null,17367,1,0,0,''),
(-1810027, 'Frostmourne hungers...',null,null,null,null,null,null,null,null,17366,1,0,0,''),
(-1810028, 'Frostmourne feeds on the soul of your fallen ally!',null,null,null,null,null,null,null,null,17368,1,0,0,''),
(-1810029, 'Val''kyr, your master calls!',null,null,null,null,null,null,null,null,17373,1,0,0,''),
(-1810030, 'Watch as the world around you collapses!',null,null,null,null,null,null,null,null,17370,1,0,0,''),
(-1810031, 'You gnats actually hurt me! Perhaps I''ve toyed with you long enough, now taste the vengeance of the grave!',null,null,null,null,null,null,null,null,17359,1,0,0,'');

(-1810030, 'Watch as the world around you collapses!',null,null,null,null,null,null,null,null,17370,1,0,0,''),
(-1810031, 'You gnats actually hurt me! Perhaps I''ve toyed with you long enough, now taste the vengeance of the grave!',null,null,null,null,null,null,null,null,17359,1,0,0,'');


