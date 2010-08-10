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
INSERT INTO creature VALUES
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
