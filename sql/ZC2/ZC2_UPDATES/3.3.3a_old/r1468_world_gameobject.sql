DELETE FROM `gameobject` WHERE `id`=194569;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
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