-- Thorim adds e Dalaran Portal
UPDATE `creature_template` SET `dmg_multiplier` = 15 WHERE `entry` IN (32876, 32877);
UPDATE `creature_template` SET `dmg_multiplier` = 8 WHERE `entry` = 32904;
UPDATE `creature_template` SET `dmg_multiplier` = 10 WHERE `entry` = 32878;

UPDATE `gameobject_template` SET `faction` = 2007, `data0` = 53141, `data2` = 0 WHERE `entry` = 194481;