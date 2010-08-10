UPDATE `creature_template` SET `unit_flags` = 2 WHERE `entry` = 33686;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33779;
DELETE FROM `creature_template` WHERE entry = 33115;
DELETE FROM creature WHERE id = 33115;

-- Emblem of Valor
UPDATE creature_loot_template SET item = 40753 WHERE entry IN (33113, 33186, 33118, 33293, 32927, 32857, 33515, 33271) AND item = 45624;
UPDATE gameobject_loot_template SET item = 40753 WHERE entry IN (27061, 26963, 27078, 27081, 26955, 26946, 27068) AND item = 40752;

-- Flame Leviathan
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803 WHERE `entry` = 33113;
