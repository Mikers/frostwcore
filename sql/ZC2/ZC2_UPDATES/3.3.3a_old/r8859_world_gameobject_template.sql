-- Dalaran Teleport (Ulduar)
UPDATE `gameobject_template` SET `type` = 22, `data0` = 53141, `data2` = 1, `data3` = 1 WHERE `entry` = 194481;

DELETE FROM `creature` WHERE `id`=33672 AND guid IN (136552, 136553);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(136553, 33672, 603, 1, 1, 28935, 0, -815.68, -197.498, 429.925, 5.525, 180, 0, 0, 9416, 8459, 0, 0);