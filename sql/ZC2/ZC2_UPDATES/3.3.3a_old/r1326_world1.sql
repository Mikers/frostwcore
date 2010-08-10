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
INSERT INTO creature (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33224, 571, 3, 1, 0, 0, 3730.57, -4302.91, 182.097, 2.35789, 300, 0, 0, 40, 120, 0, 0),  
(33224, 571, 3, 1, 0, 0, 3726.49, -4312.76, 179.671, 1.68559, 300, 0, 0, 40, 120, 0, 0),  
(33224, 571, 3, 1, 0, 0, 3714.32, -4311.07, 181.014, 0.81772, 300, 0, 0, 40, 120, 0, 0),  
(33224, 571, 3, 1, 0, 0, 3715.14, -4305.41, 182.313, 1.36436, 300, 0, 0, 40, 120, 0, 0),
(33224, 571, 3, 1, 0, 0, 3723.58, -4306.54, 182.245, 1.89215, 300, 0, 0, 40, 120, 0, 0);  
