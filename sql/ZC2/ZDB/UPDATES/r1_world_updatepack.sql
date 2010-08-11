-- Fix quest for warlock VOID
UPDATE `creature_template` SET `faction_h`=7,`faction_a`=7 WHERE `entry` IN (15571,5676);

-- Violet hold
-- By Dragon
-- Ichor Globule
UPDATE `creature_template` SET `modelid1`=525 WHERE `entry`=29321;
UPDATE `creature_template` SET `modelid3`=525 WHERE `entry`=29321;
-- Ichor Globule(heroic)
UPDATE `creature_template` SET `modelid1`=525 WHERE `entry`=31515;
UPDATE `creature_template` SET `modelid3`=525 WHERE `entry`=31515;

-- VoC
-- By Dragon
-- <delete heisei scripts
-- Creature ai scripts (VoC)
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (38433, 10065, 35013, 10186, 33993, 33994, 31125, 31722);
-- Toravon
UPDATE `creature_template` SET `spell1`='0' WHERE `entry`=38433;
UPDATE `creature_template` SET `spell2`='0' WHERE `entry`=38433;
UPDATE `creature_template` SET `spell3`='0' WHERE `entry`=38433;
UPDATE `creature_template` SET `spell4`='0' WHERE `entry`=38433;
-- Toravon(heroic)
UPDATE `creature_template` SET `spell1`='0' WHERE `entry`=10065;
UPDATE `creature_template` SET `spell2`='0' WHERE `entry`=10065;
UPDATE `creature_template` SET `spell3`='0' WHERE `entry`=10065;
UPDATE `creature_template` SET `spell4`='0' WHERE `entry`=10065;
-- Koralon
UPDATE `creature_template` SET `spell1`='0' WHERE `entry`=35013;
UPDATE `creature_template` SET `spell2`='0' WHERE `entry`=35013;
UPDATE `creature_template` SET `spell3`='0' WHERE `entry`=35013;
UPDATE `creature_template` SET `spell4`='0' WHERE `entry`=35013;
-- Koralon(heroic)
UPDATE `creature_template` SET `spell1`='0' WHERE `entry`=10186;
UPDATE `creature_template` SET `spell2`='0' WHERE `entry`=10186;
UPDATE `creature_template` SET `spell3`='0' WHERE `entry`=10186;
UPDATE `creature_template` SET `spell4`='0' WHERE `entry`=10186;
-- Emalon
UPDATE `creature_template` SET `spell1`='0' WHERE `entry`=33993;
UPDATE `creature_template` SET `spell2`='0' WHERE `entry`=33993;
UPDATE `creature_template` SET `spell3`='0' WHERE `entry`=33993;
UPDATE `creature_template` SET `spell4`='0' WHERE `entry`=33993;
-- Emalon heroic
UPDATE `creature_template` SET `spell1`='0' WHERE `entry`=33994;
UPDATE `creature_template` SET `spell2`='0' WHERE `entry`=33994;
UPDATE `creature_template` SET `spell3`='0' WHERE `entry`=33994;
UPDATE `creature_template` SET `spell4`='0' WHERE `entry`=33994;
-- Archavon
UPDATE `creature_template` SET `spell1`='0' WHERE `entry`=31125;
UPDATE `creature_template` SET `spell2`='0' WHERE `entry`=31125;
UPDATE `creature_template` SET `spell3`='0' WHERE `entry`=31125;
UPDATE `creature_template` SET `spell4`='0' WHERE `entry`=31125;
-- Archavon heroic
UPDATE `creature_template` SET `spell1`='0' WHERE `entry`=31722;
UPDATE `creature_template` SET `spell2`='0' WHERE `entry`=31722;
UPDATE `creature_template` SET `spell3`='0' WHERE `entry`=31722;
UPDATE `creature_template` SET `spell4`='0' WHERE `entry`=31722;
-- Delete heisei scripts>

-- update achievement criteria data for 4-Horsemen related achievements
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (7192,7805,8746,7193,7806,8747,7600,7601,13233,13237);
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(7192,12,0,0),
(7805,12,0,0),
(8746,12,0,0),
(7193,12,1,0),
(7806,12,1,0),
(8747,12,1,0),
(7600,18,0,0),
(7601,18,0,0),
(13233,18,0,0),
(13237,18,0,0);

-- update achievement criteria data for achievements Epic (556), Superior (557). 
-- Use new criteria type ACHIEVEMENT_CRITERIA_DATA_TYPE_S_EQUIPED_ITEM (19) to check item level AND quality
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN
(2342,2343,2344,2345,2346,2347,2348,2349,2350,2351,2353,2355,2356,2357,5816,5817,3723,3724,3725,3726,3727,3728,3729,3730,3731,3732,3733,3734,3735,3736,3737,3738);
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(2342,19,213,4),
(2343,19,213,4),
(2344,19,213,4),
(2345,19,213,4),
(2346,19,213,4),
(2347,19,213,4),
(2348,19,213,4),
(2349,19,213,4),
(2350,19,213,4),
(2351,19,213,4),
(2353,19,213,4),
(2355,19,213,4),
(2356,19,213,4),
(2357,19,213,4),
(5816,19,213,4),
(5817,19,213,4),
(3723,19,187,3),
(3724,19,187,3),
(3725,19,187,3),
(3726,19,187,3),
(3727,19,187,3),
(3728,19,187,3),
(3729,19,187,3),
(3730,19,187,3),
(3731,19,187,3),
(3732,19,187,3),
(3733,19,187,3),
(3734,19,187,3),
(3735,19,187,3),
(3736,19,187,3),
(3737,19,187,3),
(3738,19,187,3);

-- Movement speed fixes
-- Disable movement properly for current creatures with null speed
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|4,`speed_walk`=0, `speed_run`=0 WHERE `entry` IN (2674,5202,5674,16897,20251,27894,31280,32795,33229,33243,33272);

-- Achievements
-- update achievement criteria data for Tribunal of Ages (HoS) related achievements 
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (6935,6936);
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(6935,12,0,0),
(6936,12,1,0);

-- Achievements
-- update achievement criteria data for Tribunal of Ages (HoS) related achievements 
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (6935,6936);
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(6935,12,0,0),
(6936,12,1,0);
-- update achievement criteria data for Prophet Tharon'ja (Drak'Tharon Keep) related achievements 
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (5880,9098,9099,9259,9261);
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(5880,12,1,0),
(9098,12,0,0),
(9099,12,1,0),
(9259,12,0,0),
(9261,12,1,0);

-- Wild Turkey delete
DELETE FROM `creature` WHERE `id`=32820;

-- Dual Specialization Achievement.
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=9619;
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES (9619,0,0,0);

-- Startup error fix
UPDATE `creature_template` SET `ScriptName`= 'npc_seaforium_depth_charge' WHERE `entry`=25401;

-- CoS
-- Fix Untarget flag on Gob
UPDATE `gameobject_template` SET `flags`=6553636 WHERE `entry`=187711;
UPDATE `gameobject_template` SET `flags`=6553636 WHERE `entry`=187723;
UPDATE `gameobject_template` SET `flags`=6553636 WHERE `entry`=188686;

-- Zul'Aman door fix
UPDATE `gameobject_template` SET `flags`=36 WHERE `entry`=186728;

-- delete unused eventai scripts
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (32195,32196,32197,32199);
UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (32195,32196,32197,32199);

-- REPLACE new areatrigger entries.
DELETE FROM areatrigger_scripts WHERE `entry` IN (5284,5285,5285,5286,5287,4871,4872,4873,5108);
REPLACE INTO areatrigger_scripts (`entry`,`ScriptName`) VALUES 
(5284,'at_aldurthar_gate'),
(5285,'at_aldurthar_gate'),
(5286,'at_aldurthar_gate'),
(5287,'at_aldurthar_gate'),
(5108,'at_stormwright_shelf'),
(4871,'at_warsong_farms'),
(4872,'at_warsong_farms'),
(4873,'at_warsong_farms');

-- Fix wintergrasp location... 
UPDATE `creature_template` SET `speed_walk` = 0, `speed_run` = 0, `unit_flags` = 4 WHERE `entry` IN (28833,28366); 

-- Trial of Chamption
-- Faction fix
-- By Dragon/Wild/Draco-hunt/Draco
-- 5 man mode
UPDATE `creature_template` SET `faction_H`=14 WHERE `entry`=33299;
UPDATE `creature_template` SET `faction_A`=14 WHERE `entry`=33299;
-- 5 man heroic mode

-- Sql support for Forge of Souls
-- Bronjahm Teleport position.
DELETE FROM `spell_target_position` WHERE `id`=68988;
REPLACE INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(68988,632,5297.326,2506.305,686.069,0);

-- Fix arena reward for BG quest.
UPDATE `quest_template` SET `RewardArenaPoints`=25 WHERE `entry`=11341;

-- Pathing for Patchwerk and Grobbulus from YTDB
-- Subbmitted by Kiper tested by me.
SET @NPC :=128135;
SET @PATH :=@NPC*10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3257.23,`position_y`=-3230.15,`position_z`=294.063 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
REPLACE INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
REPLACE INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3305.03,-3231.81,294.063,0,0,0,100,0),
(@PATH,2,3257.44,-3230.36,294.063,0,0,0,100,0),
(@PATH,3,3232.6,-3210.97,294.063,0,0,0,100,0),
(@PATH,4,3208.7,-3188.16,294.063,0,0,0,100,0),
(@PATH,5,3182.32,-3163.56,294.063,0,0,0,100,0),
(@PATH,6,3161.25,-3145.45,294.063,0,0,0,100,0),
(@PATH,7,3134.11,-3140.88,294.063,0,0,0,100,0),
(@PATH,8,3107.4,-3145.3,294.063,60000,0,0,100,0),
(@PATH,9,3134.25,-3140.29,294.063,0,0,0,100,0),
(@PATH,10,3160.95,-3145.5,294.063,0,0,0,100,0),
(@PATH,11,3182.92,-3162.53,294.063,0,0,0,100,0),
(@PATH,12,3209.04,-3188.25,294.063,0,0,0,100,0),
(@PATH,13,3233.26,-3210.67,294.063,0,0,0,100,0),
(@PATH,14,3257.23,-3230.15,294.063,0,0,0,100,0);
SET @NPC :=127781;
SET @PATH :=@NPC*10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3204.9,`position_y`=-3307.64,`position_z`=320.331 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
REPLACE INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
REPLACE INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3175.73,-3306.47,319.743,60000,0,0,100,0),
(@PATH,2,3205.07,-3307.83,320.33,0,0,0,100,0),
(@PATH,3,3204.72,-3340.48,320.475,0,0,0,100,0),
(@PATH,5,3215.45,-3388.52,311.328,0,0,0,100,0),
(@PATH,4,3204.57,-3376.77,311.38,0,0,0,100,0),
(@PATH,6,3228.06,-3377.11,311.331,0,0,0,100,0),
(@PATH,7,3227.86,-3341.57,292.766,0,0,0,100,0),
(@PATH,8,3227.4,-3310.33,292.595,0,0,0,100,0),
(@PATH,9,3258.99,-3310.57,292.595,60000,0,0,100,0),
(@PATH,10,3228.88,-3310.92,292.595,0,0,0,100,0),
(@PATH,11,3229.02,-3341.03,292.595,0,0,0,100,0),
(@PATH,12,3227.76,-3377.09,311.332,0,0,0,100,0),
(@PATH,13,3217.04,-3389.15,311.328,0,0,0,100,0),
(@PATH,14,3206.07,-3377.28,311.317,0,0,0,100,0),
(@PATH,15,3205.18,-3340.84,320.432,0,0,0,100,0),
(@PATH,16,3204.9,-3307.64,320.331,0,0,0,100,0);

-- Ulduar fix for vechile
UPDATE `creature_template` SET `speed_walk`=0 WHERE `entry`=33067;

-- Ulduar fix for DOOR
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=194630;

-- Delete reward
UPDATE `quest_template` SET `RewardArenaPoints`=0 WHERE `entry` IN (11342, 11340, 11339, 11338, 11336, 11335, 11337, 14163, 14164, 13405, 13407);

-- Fix for quest
UPDATE `creature_template` SET `faction_a`=14, `faction_h`=14 WHERE `entry` IN (27727);
UPDATE `creature_template` SET `faction_A`=1734, `faction_H`=1734 WHERE `entry` IN (4949);

-- Battlegrouns holidays
-- Set game_event.entry for the two new events
SET @EventID_sota := 124;
SET @EventID_ic := 125;
-- Update olds BG holidays start times and occurence
UPDATE game_event SET occurence=60480 WHERE entry IN (18,19,20,21);
UPDATE `game_event` SET `start_time` =  '2010-04-30 00:00:00'  WHERE `entry` =21; -- Call to Arms: Eye of the Storm!
UPDATE `game_event` SET `start_time` =  '2010-05-07 00:00:00'  WHERE `entry` =18; -- Call to Arms: Alterac Valley!
UPDATE `game_event` SET `start_time` =  '2010-04-23 00:00:00'  WHERE `entry` =20; -- Call to Arms: Arathi Basin!
UPDATE `game_event` SET `start_time` =  '2010-04-02 00:00:00'  WHERE `entry` =19; -- Call to Arms: Warsong Gulch!
-- REPLACE new game_events for IC and SOTA holiday with proper start time and occurence
REPLACE INTO game_event (entry,start_time,end_time,occurence,length,holiday,description,world_event) VALUES
(@EventID_sota, '2010-04-09 00:00:00' , '2020-12-31 02:00:00' ,60480,6240,0, 'Call to Arms: Strand of the Ancients!' ,0), -- Call to Arms: Strand of Ancients!
(@EventID_ic, '2010-04-16 00:00:00' , '2020-12-31 02:00:00' ,60480,6240,0, 'Call to Arms: Isle of Conquest!' ,0);  -- Call to Arms: Isle of Conquest!
-- Finally REPLACE in battleground holiday table for the new events
REPLACE INTO `game_event_battleground_holiday` (event,bgflag) VALUES
(@EventID_sota,512),
(@EventID_ic,4096);

-- Arena season event time
DELETE FROM `season_linked_event` WHERE `season` IN (1,2,3,4,5,6,7,8);
REPLACE INTO `season_linked_event` (`season`,`event`) VALUES
(1,124),
(2,125),
(3,126),
(4,127),
(5,128),
(6,129),
(7,130),
(8,131);

DELETE FROM `game_event` WHERE `entry` IN (124,125,126,127,128,129,130,131);
REPLACE INTO `game_event` (`entry`,`start_time`,`end_time`,`occurence`,`length`,`holiday`,`description`,`world_event`) VALUES
(124, '0000-00-00 00:00:00', '0000-00-00 00:00:00',5184000,2592000,0, 'Arena Season 1',0),
(125, '0000-00-00 00:00:00', '0000-00-00 00:00:00',5184000,2592000,0, 'Arena Season 2',0),
(126, '0000-00-00 00:00:00', '0000-00-00 00:00:00',5184000,2592000,0, 'Arena Season 3',0),
(127, '0000-00-00 00:00:00', '0000-00-00 00:00:00',5184000,2592000,0, 'Arena Season 4',0),
(128, '0000-00-00 00:00:00', '0000-00-00 00:00:00',5184000,2592000,0, 'Arena Season 5',0),
(129, '0000-00-00 00:00:00', '0000-00-00 00:00:00',5184000,2592000,0, 'Arena Season 6',0),
(130, '0000-00-00 00:00:00', '0000-00-00 00:00:00',5184000,2592000,0, 'Arena Season 7',0),
(131, '0000-00-00 00:00:00', '0000-00-00 00:00:00',5184000,2592000,0, 'Arena Season 8',0);

-- Add 10% healing reduction in PvP zones (by click)
DELETE FROM `spell_area` WHERE `spell` IN (74411,74410) AND `area` IN (3358,2597,4384,3277,3820,4710,4197,4378,4406,3968,3702,3698);
REPLACE INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_start_active`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`) VALUES
(74411,3358,0,0,0,0,0,2,1), -- Battleground Dampening
(74411,2597,0,0,0,0,0,2,1), -- Battleground Dampening
(74411,4384,0,0,0,0,0,2,1), -- Battleground Dampening
(74411,3277,0,0,0,0,0,2,1), -- Battleground Dampening
(74411,3820,0,0,0,0,0,2,1), -- Battleground Dampening
(74411,4710,0,0,0,0,0,2,1), -- Battleground Dampening
(74411,4197,0,0,0,0,0,2,1), -- Battleground Dampening
(74410,4378,0,0,0,0,0,2,1), -- Arena dampening
(74410,4406,0,0,0,0,0,2,1), -- Arena dampening
(74410,3968,0,0,0,0,0,2,1), -- Arena dampening
(74410,3702,0,0,0,0,0,2,1), -- Arena dampening
(74410,3698,0,0,0,0,0,2,1); -- Arena dampening

-- update achievement criteria data for Timed Achievements (killing boss in instance)
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (7126,7127,7128,7129,7130,7133,7143,7144,7145,7181,7182,7183,10072,10073,10080,10081,10291,10292,10284,10722,12564,12567,10446,10882,10720,10721,10780,10782,11778,12258,11818,11860,12756);
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(7126,12,0,0), -- patchwerk
(7127,12,1,0),
(7128,12,0,0), -- Anub'rekhan -> Maexnna in 20 min
(7129,12,1,0),
(7130,12,1,0), -- Anub'arak
(7133,12,1,0), -- Volazj
(7143,12,1,0), -- Maiden of Grief
(7144,12,1,0), -- Loken
(7145,12,1,0), -- Drakos -> Eregos in 20 min
(7181,12,1,0), -- Skadi
(7182,12,0,0), -- Malygos
(7183,12,1,0),
(10073,12,0,0), -- Ignis
(10072,12,1,0),
(10080,12,0,0), -- XT002
(10081,12,1,0),
(10291,12,0,0), -- Yogg-Saron
(10292,12,1,0),
(10284,12,0,0), -- Kologarn (Disarmed)
(10722,12,1,0),
(12564,12,0,0), -- Onyxia
(12567,12,1,0),
(10446,12,0,0), -- Con-speed-atory
(10882,12,1,0),
(10720,12,0,0), -- Lumberjacked
(10721,12,1,0),
(10780,12,0,0), -- Supermassive
(10782,12,1,0),
(11778,12,0,0), -- Salt and Pepper
(12258,12,2,0),
(11818,12,1,0),
(11860,12,3,0),
(12756,12,1,0); -- We're Not Retreating; We're Advancing in a Different Direction


-- ICC: door <Marrowgar entrance>
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry` IN (201857);

-- Frozen Halls: HoR
-- Door untarget
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry` IN (197341);
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry` IN (202302,202236);

-- ICC: delete npc, but spawn script
DELETE FROM `creature` WHERE `guid` IN (115781);

-- ToCr: fix factions
UPDATE `creature_template` SET `faction_A`=35, `faction_H`=35 WHERE `entry` IN (34567,34568,34628,34630);

-- Halls of Reflection
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry` IN (197343);
UPDATE `creature_template` SET `unit_flags`=2 WHERE `entry` IN (37226);

-- Non comment
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=37704;

-- Non comment
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=201976;

-- Celestial steed: mount
DELETE FROM `item_template` WHERE `entry`=54811;
DELETE FROM `creature_template` WHERE `entry`=40625;
REPLACE INTO `item_template` VALUES (54811, 15, 5, -1, 'Celestial Steed', 67452, 4, 32768, 0, 1, 0, 0, 0, 262143, 32767, 20, 20, 762, 75, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 483, 0, -1, 0, -1, 330, 3000, 75614, 6, 0, 0, -1, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'Teaches you how to summon this mount.', 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0);
REPLACE INTO creature_template VALUES (40625, 0, 0, 0, 0, 0, 31957, 0, 31957, 0, 'Celestial Steed', '', '', 0, 80, 80, 0, 73, 73, 0, 1, 1.14286, 1, 0, 420, 630, 0, 158, 1.4, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 336, 504, 126, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 2.35867, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 0);

-- ICC: mobs 
UPDATE `creature_template` SET `unit_flags`=6, `type_flags`=2220 WHERE `entry` IN (37119,39372,39371,37200,37190,37996,37967,37965,37689,37859,38194,37187,37189,38316,37688,37696,37687,38054,38858,38181,38841,37793,37992,37991,38284,38182,38840,37998,37999,37997,38283,37586,37120);

-- ICC: objects
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry` IN (201618,201617);

-- ToCr
UPDATE `creature_template` SET `unit_flags`=6 WHERE `entry`=34813;

-- Fix mage summon waterelemntal
UPDATE `spell_proc_event` SET Cooldown = 45 WHERE entry = 61356;
UPDATE `spell_bonus_data` SET dot_bonus = 0.052 WHERE entry = 14914;
UPDATE `creature_template` SET unit_flags = 0 WHERE entry = 510;
-- Zul Drak db relate
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=30022);
DELETE FROM `quest_start_scripts` WHERE `id` IN (12932,12933,12934,12935,12936,12948);
REPLACE INTO `quest_start_scripts` VALUES ('12948', '5', '10', '30022', '1200000', '0', '5773.31', '-2981.64', '272.98', '5.24');
-- Icecrown arena fix
UPDATE `quest_template` SET `NextQuestId` = 13215 WHERE `entry` = 13214;
UPDATE `quest_template` SET `PrevQuestId` = 13214, `NextQuestId` = 13216 WHERE `entry` = 13215;
UPDATE `quest_template` SET `PrevQuestId` = 13215, `NextQuestId` = 13217 WHERE `entry` = 13216;
UPDATE `quest_template` SET `PrevQuestId` = 13216, `NextQuestId` = 13218 WHERE `entry` = 13217;
UPDATE `quest_template` SET `PrevQuestId` = 13217, `NextQuestId` = 13219 WHERE `entry` = 13218;
UPDATE `quest_template` SET `PrevQuestId` = 13218 WHERE `entry` = 13219;
DELETE FROM quest_start_scripts WHERE id IN (13214,13215,13216,13216,13217,13218,13218,13219);
REPLACE INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(13214, 15, 10, 31191, 180000, 0, 8190.40, 3569.77, 629.37, 4.82),
(13214, 15, 10, 31192, 180000, 0, 8180.69, 3567.77, 629.71, 5.24),
(13214, 15, 10, 31193, 180000, 0, 8176.58, 3561.77, 628.68, 5.50),
(13214, 15, 10, 31194, 180000, 0, 8170.96, 3556.77, 630.37, 5.50), 
(13214, 15, 10, 31195, 180000, 0, 8165.47, 3551.62, 633.06, 5.75), 
(13214, 15, 10, 31196, 180000, 0, 8163.07, 3545.77, 632.40, 5.70), 
(13215, 15, 10, 31222, 180000, 0, 8170.96, 3556.77, 630.37, 5.50), 
(13216, 15, 10, 31242, 180000, 0, 8170.96, 3556.77, 630.37, 5.50),
(13217, 15, 10, 31271, 180000, 0, 8170.96, 3556.77, 630.37, 5.50),
(13218, 15, 10, 31277, 180000, 0, 8170.96, 3556.77, 630.37, 5.50),
(13219, 15, 10, 14688, 180000, 0, 8170.96, 3556.77, 630.37, 5.50);
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 31191, `ReqCreatureOrGOCount1` = 1, `DetailsEmote1` = 4, `CompleteEmote` = 4, `StartScript` = 13214, `SpecialFlags` = 0 WHERE `entry` = 13214;
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 31222, `ReqCreatureOrGOCount1` = 1, `DetailsEmote1` = 4, `CompleteEmote` = 4, `StartScript` = 13215, `SpecialFlags` = 0 WHERE `entry` = 13215;
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 31242, `ReqCreatureOrGOCount1` = 1, `DetailsEmote1` = 4, `CompleteEmote` = 4, `StartScript` = 13216, `SpecialFlags` = 0 WHERE `entry` = 13216;
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 31271, `ReqCreatureOrGOCount1` = 1, `DetailsEmote1` = 4, `CompleteEmote` = 4, `StartScript` = 13217, `SpecialFlags` = 0 WHERE `entry` = 13217;
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 31277, `ReqCreatureOrGOCount1` = 1, `DetailsEmote1` = 4, `CompleteEmote` = 4, `StartScript` = 13218, `SpecialFlags` = 0 WHERE `entry` = 13218;
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 14688, `ReqCreatureOrGOCount1` = 1, `DetailsEmote1` = 4, `CompleteEmote` = 4, `StartScript` = 13219, `SpecialFlags` = 0 WHERE `entry` = 13219;

UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `mindmg` = 300, `maxdmg` = 800, `attackpower` = 300, `baseattacktime` = 1500 WHERE `entry` = 32484;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `faction_A` = 14, `faction_H` = 14, `spell1` = 15586, `spell2` = 25054, `InhabitType` = 1, `movementId` = 0, `MovementType` = 1, `InhabitType` = 3, `movementId` = 199, `mindmg` = 800, `maxdmg` = 1200, `attackpower` = 300, `baseattacktime` = 1500 WHERE `entry` = 31191;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `faction_A` = 14, `faction_H` = 14, `spell1` = 15496, `spell2` = 41057, `InhabitType` = 1, `movementId` = 0, `MovementType` = 1, `InhabitType` = 3, `movementId` = 199, `mindmg` = 800, `maxdmg` = 1200, `attackpower` = 300, `baseattacktime` = 1500 WHERE `entry` = 31192;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `faction_A` = 14, `faction_H` = 14, `spell1` = 61041, `spell2` = 46182, `InhabitType` = 1, `movementId` = 0, `MovementType` = 1, `InhabitType` = 3, `movementId` = 199, `mindmg` = 800, `maxdmg` = 1200, `attackpower` = 300, `baseattacktime` = 1500 WHERE `entry` = 31193;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `faction_A` = 14, `faction_H` = 14, `spell1` = 14873, `InhabitType` = 1, `movementId` = 0, `MovementType` = 1, `InhabitType` = 3, `movementId` = 199, `mindmg` = 800, `maxdmg` = 1200, `attackpower` = 300, `baseattacktime` = 1500 WHERE `entry` = 31194;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `faction_A` = 14, `faction_H` = 14, `spell1` = 34829, `spell2` = 44475, `spell3` = 15620, `InhabitType` = 1, `movementId` = 0, `MovementType` = 1, `InhabitType` = 3, `movementId` = 199, `mindmg` = 800, `maxdmg` = 1200, `attackpower` = 300, `baseattacktime` = 1500 WHERE `entry` = 31195;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `faction_A` = 14, `faction_H` = 14, `spell1` = 61044, `spell2` = 58461, `InhabitType` = 1, `movementId` = 0, `MovementType` = 1, `InhabitType` = 3, `movementId` = 199, `mindmg` = 800, `maxdmg` = 1200, `attackpower` = 300, `baseattacktime` = 1500 WHERE `entry` = 31196;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `faction_A` = 14, `faction_H` = 14, `spell1` = 61055, `spell2` = 22884, `spell2` = 38243, `InhabitType` = 1, `movementId` = 0, `MovementType` = 1, `InhabitType` = 3, `movementId` = 199, `mindmg` = 800, `maxdmg` = 1600, `attackpower` = 100, `baseattacktime` = 1500 WHERE `entry` = 31222;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `faction_A` = 14, `faction_H` = 14, `spell1` = 61165, `spell2` = 57635, `spell3` = 61170, `InhabitType` = 1, `movementId` = 0, `MovementType` = 1, `InhabitType` = 3, `movementId` = 199, `mindmg` = 800, `maxdmg` = 1200, `attackpower` = 300, `baseattacktime` = 1500 WHERE `entry` = 31242;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80,  `faction_A` = 14, `faction_H` = 14, `spell1` = 61070, `spell2` = 61065, `InhabitType` = 1, `movementId` = 0, `MovementType` = 1, `InhabitType` = 3, `movementId` = 199, `mindmg` = 1200, `maxdmg` = 1800, `attackpower` = 800, `baseattacktime` = 1500 WHERE `entry` = 31271;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `faction_A` = 14, `faction_H` = 14, `spell1` = 61133, `spell2` = 13737, `spell3` = 61139, `InhabitType` = 1, `movementId` = 0, `MovementType` = 1, `InhabitType` = 3, `movementId` = 199, `mindmg` = 1000, `maxdmg` = 1700, `attackpower` = 800, `baseattacktime` = 1500 WHERE `entry` = 31277;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `faction_A` = 14, `faction_H` = 14, `spell1` = 61162, `spell2` = 61145, `spell3` = 61163, `InhabitType` = 1, `movementId` = 0, `MovementType` = 1, `InhabitType` = 3, `movementId` = 199, `mindmg` = 6000, `maxdmg` = 900, `attackpower` = 500, `baseattacktime` = 1500 WHERE `entry` = 14688;
DELETE FROM creature_ai_scripts WHERE creature_id IN (31191,31192,31193,31194,31195,31196,31222,31242,31271,31277,14688);
REPLACE INTO `creature_ai_scripts` VALUES 
( 3119101, 31191, 0, 0, 100, 0, 10000, 15000, 20000, 0, 11, 15586, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3119102, 31191, 0, 0, 100, 0, 5000, 7000, 17000, 0, 11, 25054, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3119201, 31192, 0, 0, 100, 0, 10000, 15000, 20000, 0, 11, 15496, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3119202, 31192, 0, 0, 100, 0, 5000, 7000, 17000, 0, 11, 41057, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3119301, 31193, 0, 0, 100, 0, 10000, 15000, 20000, 0, 11, 61041, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3119302, 31193, 0, 0, 100, 0, 5000, 7000, 17000, 0, 11, 46182, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3119401, 31194, 0, 0, 100, 0, 10000, 15000, 20000, 0, 11, 14873, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3119501, 31195, 0, 0, 100, 0, 10000, 15000, 20000, 0, 11, 34829, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3119502, 31195, 0, 0, 100, 0, 5000, 7000, 17000, 0, 11, 44475, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3119503, 31195, 0, 0, 100, 0, 5000, 7000, 17000, 0, 11, 15620, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3119601, 31196, 0, 0, 100, 0, 10000, 15000, 20000, 0, 11, 61044, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3119602, 31196, 0, 0, 100, 0, 5000, 7000, 17000, 0, 11, 58461, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3122201, 31222, 0, 0, 100, 0, 10000, 15000, 20000, 0, 11, 61055, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3122202, 31222, 0, 0, 100, 0, 5000, 7000, 17000, 0, 11, 22884, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3122203, 31222, 0, 0, 100, 0, 8000, 7000, 17000, 0, 11, 38243, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3124201, 31242, 0, 0, 100, 0, 10000, 15000, 20000, 0, 11, 61165, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3124202, 31242, 0, 0, 100, 0, 5000, 7000, 17000, 0, 11, 57635, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3127101, 31271, 0, 0, 100, 0, 10000, 15000, 20000, 0, 11, 61070, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3127102, 31271, 0, 0, 100, 0, 5000, 7000, 17000, 0, 11, 61065, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3127701, 31277, 0, 0, 100, 0, 10000, 15000, 20000, 0, 11, 61133, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3127702, 31277, 0, 0, 100, 0, 5000, 7000, 17000, 0, 11, 13737, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 3127703, 31277, 0, 0, 100, 0, 5000, 7000, 17000, 0, 11, 61139, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 1468801, 14688, 0, 0, 100, 0, 10000, 15000, 20000, 0, 11, 61162, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 1468802, 14688, 0, 0, 100, 0, 45000, 50000, 67000, 0, 11, 61145, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
( 1468803, 14688, 0, 0, 100, 0, 8000, 15000, 20000, 0, 11, 61163, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Core DB relate content
-- Proper spawn Injured Goblin Miner and rmeoved dupe (by Supabad)
DELETE FROM `creature` WHERE `id`=29434;
REPLACE INTO `creature` (`guid`,`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('@GUID+1',29434,571,1,1,0,254,6629.44,-1251.64,395.942,5.38386,25,0,0,9416,0,0,2);
-- Naga Brazier set state properly for script (by Supabad)
UPDATE `gameobject` SET `state`=1 WHERE `guid`=47873;
-- Gossip flag for new script (by Rat)
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry` IN (35364,35365);
-- by Elron103

UPDATE `instance_template` SET `parent`=0 WHERE `map` IN (33,34,36,70,90,109,189,229,230,289,309,329,532);

UPDATE `instance_template` SET `parent`=1 WHERE `map` IN (43,47,48,129,209,249,269,349,389,429,509,531,534,560,595);

UPDATE `instance_template` SET `parent`=530 WHERE `map` IN (540,542,543,544,545,546,547,548,550,552,553,554,555,556,557,558,564,565,568,580,585);

UPDATE `instance_template` SET `parent`=571 WHERE `map` IN (615,574,575,576,578,533,608,604,602,599,601,619,600,616,624,603,650,649);

-- The Molten Bridge
UPDATE `instance_template` SET `parent`=230 WHERE `map`=409;

-- Blackwing Lair - Blackrock Mountain - Eastern Kingdoms
UPDATE `instance_template` SET `parent`=229 WHERE `map`=469;

UPDATE `instance_template` SET `parent`=0 WHERE `map` IN (489,529,566,559,562,572,628,607);

UPDATE `instance_template` SET `parent`=4294967295 WHERE `map`=30;
-- MovementType require for cpp script (by Supabad)
UPDATE `creature_template` SET `MovementType`=2 WHERE `entry`=28787;
-- Dalinda Malem set as civilian and hostile to Horde (by click)
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2,`faction_A`=35,`faction_H`=14 WHERE `entry`=5644;
-- MovementType require for cpp script (by Supabad)
UPDATE `creature_template` SET `MovementType`=2 WHERE `entry`=29434;

-- 28166 is just spawned by Drakaos.
DELETE FROM `creature` WHERE `id`=28166;

-- ICC: delete
DELETE FROM `creature_addon` WHERE `guid` IN (136105,125585,59803,59768,59779,114722,136191,10011,59765,59774,59789,10098,136297,136267,136272,136271,136193,136192,136355);

-- IoC
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry` IN (195491,195703);

-- Spawn in script
DELETE FROM `creature` WHERE `id`=38177;
DELETE FROM `creature` WHERE `id`=38176;
DELETE FROM `creature` WHERE `id`=38173;
DELETE FROM `creature` WHERE `id`=38172;
DELETE FROM `creature` WHERE `id`=38567;
DELETE FROM `creature` WHERE `id`=38175;
DELETE FROM `creature` WHERE `id`=36940;
DELETE FROM `creature` WHERE `id`=36941;
DELETE FROM `creature` WHERE `id`=37069;

-- x-53 touring rocket
UPDATE `creature_template` SET `IconName`='vehichleCursor',`VehicleId`=774 WHERE `entry`=40725;

-- New onyxia
-- Use the same faction of the creatures to the egg
UPDATE `gameobject_template` SET `faction`=103 WHERE `entry`=176511;
-- Hacks on the TDB: WDB object made since we don't have the real deal to make Ony work!
DELETE FROM `gameobject_template` WHERE `entry`=176510;
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
(176510,5,11686, 'Onyxia Whelp Spawner' ,'','','',14,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',1);
-- Modifying World Invisible Trigger since it was lv 60... (it was making all eruptions miss)
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80 WHERE `entry`=12999;
-- Update achievement criteria data for Onyxia related achievements 
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (12558,12559,12564,12565,12566,12567,12568,12569);
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(12558,12,0,0),
(12559,12,1,0),
(12564,12,0,0),
(12565,12,0,0),
(12566,12,0,0),
(12567,12,1,0),
(12568,12,1,0),
(12569,12,1,0),
(12565,18,0,0),
(12566,18,0,0),
(12568,18,0,0),
(12569,18,0,0);
-- Create EventAI for LairGuards
UPDATE `creature_ai_scripts` SET `event_flags`=7 WHERE `creature_id` =12129;
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=36561;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=36561;
REPLACE INTO `creature_ai_scripts` VALUES 
(3656101,36561,0,0,75,7,15000,15000,30000,30000,11,68958,0,0,0,0,0,0,0,0,0,0, "Onyxia Lair Guard - Cast Blast Nova" ),
(3656102,36561,0,0,90,7,5000,5000,20000,20000,11,68960,1,0,0,0,0,0,0,0,0,0, "Onyxia Lair Guard - Cast Ignite Weapon" ),
(3656103,36561,0,0,80,7,7000,7000,9000,11000,11,15284,1,0,0,0,0,0,0,0,0,0, "Onyxia Lair Guard - Cast Cleave" );
-- Add instance portals inside and outside (4 gameobject guids required)
DELETE FROM `gameobject` WHERE `id` IN (200292,200293,200294,200295);
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES 
('@GUID+1', 200292,249,3,31.2081,-49.8496,-4.6301,4.65461,0.727236,-0.686387,25,0,1),
('@GUID+1', 200293,249,3,31.2081,-49.8496,-4.6301,4.65461,0.727236,-0.686387,25,0,1),
('@GUID+1', 200294,1,3,-4751.97,-3754.08,48.5708,0.317681,0.158174,0.987411,25,0,1),
('@GUID+1', 200295,1,3,-4751.97,-3754.08,48.5708,0.317681,0.158174,0.987411,25,0,1);
-- Some creature data that might be wrong
-- Onyxia
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`|33554464 WHERE `entry` IN (10184,1018401); -- Adds Onyxia immunity to GRIP and INTERRUPT

-- Spell target
-- REPLACE spell target position for Urom`s teleport spells
DELETE FROM `spell_target_position` WHERE `id` IN (50476,50495,50496,51112);
REPLACE INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(50476,578,968.66,1042.53,527.32,0.077),
(50495,578,1164.02,1170.85,527.321,3.66),
(50496,578,1118.31,1080.377,508.361,4.250),
(51112,578,1103.69,1048.76,512.279,1.16);

-- Lich King
DELETE FROM `creature` WHERE `id`=36597;
DELETE FROM `creature` WHERE `id`=38995;
INSERT INTO `creature` VALUES ('@GUID+1', '36597', '631', '15', '1', '0', '0', '428.597', '-2123.88', '1064.96', '0.120937', '604800', '0', '0', '17431250', '0', '0', '0');
INSERT INTO `creature`  VALUES (115781, 38995, 631, 15, 1, 0, 0, 505.212, -2124.35, 1040.94, 3.14159, 604800, 0, 0, 13945000, 4258000, 0, 0);
UPDATE `creature` SET `spawnmask`=15 WHERE `id`=36597;
UPDATE `creature` SET `spawnmask`=15 WHERE `id`=38995;

-- Deathbringers will trinket relate
-- Add missing creature_templates for Deathbringers Will
DELETE FROM `creature_template` WHERE `entry` IN (38292,38271);
REPLACE INTO `creature_template` (`entry`,`modelid1`,`faction_A`,`faction_H`,`unit_class`) VALUES
(38292,31015,35,35,1),
(38271,31015,35,35,1);
DELETE FROM `creature_model_info` WHERE `modelid`=31015;
REPLACE INTO `creature_model_info` (`modelid`) VALUES (31015);

-- Sunwell
/*!40101 SET NAMES utf8 */;

DELETE FROM creature WHERE id IN (25319, 25588);

-- Stat update for entry 25319 - Kalecgos 
UPDATE `creature_template` SET `minlevel`=73,`maxlevel`=73,`exp`=1,`unit_class`=2 WHERE `entry`=25319;
REPLACE INTO creature (id, map, spawnMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(25319, 580, 1, 0, 0, 1701.7, 635.515, 72.2884, 4.65461, 25, 0, 0, 1, 0, 0, 0);

-- Stat update for entry 25315 - Kil'jaeden 
UPDATE `creature_template` SET `minlevel`=73,`maxlevel`=73,`exp`=1,`unit_class`=2 WHERE `entry`=25315; 


-- Stat update for entry 25502 - Shield Orb 
UPDATE `creature_template` SET `minlevel`=70,`maxlevel`=70,`exp`=1,`unit_class`=1 WHERE `entry`=25502; 


-- Stat update for entry 25588 - Hand of the Deceiver 
UPDATE `creature_template` SET `minlevel`=72,`maxlevel`=72,`exp`=1,`unit_class`=2 WHERE `entry`=25588; 


-- Stat update for entry 25735 - Armageddon Target  - not sure
UPDATE `creature_template` SET `minlevel`=72,`maxlevel`=72,`exp`=1,`unit_class`=2 WHERE `entry`=25735; 

-- Stat update for entry 30598 - Spike Target  - not sure
UPDATE `creature_template` SET `minlevel`=72,`maxlevel`=72,`exp`=1,`unit_class`=2 WHERE `entry`=30598; 

-- Stat update for entry 30614 - Spike Target  2- not sure
UPDATE `creature_template` SET `minlevel`=72,`maxlevel`=72,`exp`=1,`unit_class`=2 WHERE `entry`=30614; 

-- Stat update for entry 25708 - Sinister Reflection - not sure
UPDATE `creature_template` SET `minlevel`=70,`maxlevel`=70,`exp`=1,`unit_class`=1 WHERE `entry`=25708; 

-- Stat update for entry 25653 - Power of the Blue Flight - not sure
UPDATE `creature_template` SET `minlevel`=70,`maxlevel`=70,`exp`=1,`unit_class`=1,`spell1`=45848,`spell2`=45862,`spell3`=45860,`spell4`=45856 WHERE `entry`=25653; 

-- Stat update for entry 26046 - Anveena 
UPDATE `creature_template` SET `minlevel`=70,`maxlevel`=70,`exp`=1,`unit_class`=2 WHERE `entry`=26046; 


-- go_orb_of_the_blue_flight
DELETE FROM `gameobject` WHERE `id`=188415;
REPLACE INTO gameobject (id, map, spawnMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(188415, 580, 1, 1653.12, 635.41, 28.0932, 0.0977725, 0, 0, 0.0488668, 0.998805, 25, 0, 1),
(188415, 580, 1, 1704.14, 583.591, 28.1696, 1.59003, 0, 0, 0.713874, 0.700274, 25, 0, 1),
(188415, 580, 1, 1745.68, 621.823, 28.0505, 2.93777, 0, 0, 0.994812, 0.101733, 25, 0, 1),
(188415, 580, 1, 1694.48, 674.29, 28.0502, 4.86985, 0, 0, 0.649302, -0.760531, 25, 0, 1);
DELETE FROM `gameobject_template` WHERE `entry` = 188415;
REPLACE into `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`) values('188415','5','4891','Orb of the Blue Flight','','','','0','0','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','go_orb_of_the_blue_flight');

-- REPLACE spell_target_position for spells 63986,63987
DELETE FROM `spell_target_position` WHERE `id` IN (63986,63987);
REPLACE INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(63986,571,8574.87,700.595,547.29,5.48),
(63987,571,8460,700,547.4,3.839);

-- TDBSTUFF
-- Provided by SnakeIce (it's working but needs review for perfect Blizzlike values)
-- Stuff related to Skadi The Ruteless
-- Invisible Mob that shouldn't attack
UPDATE `creature_template` SET `modelid1`=11686,`modelid2`=11686,`flags_extra`=2 WHERE `entry`=19871;
UPDATE `creature_template` SET `modelid1`=11686,`modelid2`=11686,`flags_extra`=2 WHERE `entry`=30684;

-- Skadi Harpoon Launchers
UPDATE `gameobject_template` SET `ScriptName`= 'go_harpoon_launcher' WHERE `entry` IN (192175,192176,192177);

-- Skadi
UPDATE `creature_template` SET `unit_flags`=33554434 WHERE `entry` IN (26693,2669301);

-- Skadi Summons
-- Ymirjar Warrior
UPDATE `creature_template` SET `mindmg`=300 ,`maxdmg`=400,`attackpower`=1500,`dmg_multiplier`=7,`faction_A`=21,`faction_H`=21,`AIName`= 'EventAI' WHERE `entry` IN (26690,2669001);
UPDATE `creature_template` SET `dmg_multiplier`=14,`minlevel`=80,`maxlevel`=80,`exp`=2,`equipment_id`=6 WHERE `entry`=2669001;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=26690);
REPLACE INTO `creature_ai_scripts` VALUES 
(2669001,26690,0,0,70,7,2000,25000,2000,25000,11,48639,1,2,0,0,0,0,0,0,0,0, 'Hamstring'),
(2669002,26690,0,0,70,7,3000,35000,3000,35000,11,48640,1,2,0,0,0,0,0,0,0,0, 'Strike');

-- Ymirjar Witch Doctor
UPDATE `creature_template` SET `mindmg`=300 ,`maxdmg`=400,`attackpower`=1500,`dmg_multiplier`=7,`faction_A`=21,`faction_H`=21,`AIName`= 'EventAI' WHERE `entry` IN (26691,2669101);
UPDATE `creature_template` SET `dmg_multiplier`=14,`minlevel`=80,`maxlevel`=80,`exp`=2,`equipment_id`=484  WHERE `entry`=2669101;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=26691);
REPLACE INTO `creature_ai_scripts` VALUES 
(2669101,26691,0,0,70,7,2500,30000,2500,30000,11,49084,1,2,0,0,0,0,0,0,0,0, 'Shadow Bolt'),
(2669102,26691,0,0,70,7,4000,45000,4000,45000,11,49089,1,2,0,0,0,0,0,0,0,0, 'Shrink');

-- Ymirjar Harpooner
UPDATE `creature_template` SET `mindmg`=300,`maxdmg`=400,`attackpower`=1500,`dmg_multiplier`=7,`faction_A`=21,`faction_H`=21,`AIName`= 'EventAI' WHERE `entry` IN (26692,2669201);
UPDATE `creature_template` SET `dmg_multiplier`=14,`minlevel`=80,`maxlevel`=80,`exp`=2,`equipment_id`=2013  WHERE `entry`=2669201;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=26692);
REPLACE INTO `creature_ai_scripts` VALUES 
(2669201,26692,0,0,70,7,4000,45000,4000,45000,11,49092,1,2,0,0,0,0,0,0,0,0, 'Net'),
(2669202,26692,0,0,70,7,2000,25000,2000,25000,11,49091,1,2,0,0,0,0,0,0,0,0, 'Throw'),
(2669203,26692,6,0,100,6,0,0,0,0,11,56789,6,7,0,0,0,0,0,0,0,0, 'DEATH - Give Harpoon');

-- Tyrranius fix
DELETE FROM `creature` WHERE `id`=36658;
REPLACE INTO `creature` VALUES ('@GUID+1', '36658', '658', '1', '128', '0', '2013', '987.209', '164.296', '628.156', '0.0486725', '300', '0', '0', '653694', '0', '0', '0');
UPDATE `creature` SET `spawnmask`=3 WHERE `id`=36658;
-- Ick fix
DELETE FROM `creature` WHERE `id`=36476;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
('@GUID+1', 36476, 658, 3, 1, 0, 0, 852.322, 127.969, 509.89, 3.82145, 43200, 0, 0, 600533, 0, 0, 0);
UPDATE `creature` SET `spawnmask`=3 WHERE `id`=36476;

-- ToCn: fix factions
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=195650;
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry` IN (35327,35314,35641,33414,35634,33299,35461,33300,35640,35309,35305,35307,35119,35635,33418,35638,34928,35491,33409,33297,35637,33408,35636,35768,33416,33301,35633);

-- Dalaran: Juwanamana
UPDATE `creature_template` SET `faction_A`=1602, `faction_H`=1602, `type_flags`=0 WHERE `entry` IN (32713); 

-- Remove scourgestone from DKs 
DELETE FROM `playercreateinfo_item` WHERE `class`=6 AND `itemid`=40582; 
REPLACE INTO `playercreateinfo_item` VALUES (0,6,40582,-1);

-- Malygos state
DELETE FROM `creature` WHERE `id`=28859;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
('@GUID+1', 28859, 616, 3, 1, 26752, 0, 808.535, 1213.55, 295.972, 3.22503, 604800, 5, 0, 6972500, 212900, 0, 1);

-- Fix Xt-002 door
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=194631;

-- Quest
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry` IN (15571);

-- Malygos relates
DELETE FROM `gameobject` WHERE `id`=193960;
REPLACE INTO `gameobject` VALUES('@GUID+1', 193960, 616, 3, 1, 754.395, 1301.03, 266.171, 4.99728, 0, 0, 0.599561, -0.800329, 43200, 100, 1);
UPDATE `gameobject_template` SET `flags`=0 WHERE `entry` IN(194554);
UPDATE `gameobject_template` SET `flags`=0 WHERE `entry` IN (193960);
UPDATE `gameobject_template` SET `flags`=0 WHERE `entry`=193958;

-- Core db realte conent
UPDATE `npc_vendor` SET `ExtendedCost`=-`ExtendedCost` WHERE `item` IN (
-- MONEY+TOKENS (should move to negative entries)
17348, -- Major Healing Draught
17349, -- Superior Healing Draught
17351, -- Major Mana Draught
17352, -- Superior Mana Draught
18839, -- Combat Healing Potion
18841, -- Combat Mana Potion
19316, -- Ice Threaded Arrow
19317, -- Ice Threaded Bullet
32453, -- Star's Tears
32455 -- Star's Lament
);

-- Utgarde pinnace
DELETE FROM `creature` WHERE `id`=26668;
UPDATE `creature` SET `spawnMask`=3 WHERE `id`=29281;
DELETE FROM `creature` WHERE `id`=26893;

-- Utgarde Keep
UPDATE `creature_template` SET `unit_flags`=33554562 WHERE `entry` IN (24068,31655);

-- Violet hold
UPDATE `creature_template` SET `unit_flags`=33554562 WHERE `entry` IN (31079,31492);

-- Ulduar:
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=191527;
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry` IN (193907, 191670, 191669, 191671);

-- HoR
UPDATE `gameobject_template` SET `flags`=0 WHERE `entry` IN (201710,202212);
DELETE FROM `creature` WHERE `id`=37226;

-- Ulduar spawns
UPDATE `gameobject` SET `spawnMask`=3 WHERE `id` IN (194905,194416);

-- ICC: fix doors
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=201563;

-- Juwanama
DELETE FROM `creature` WHERE `id`=32713;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(48865, 32713, 571, 1, 1, 28187, 0, 5693.53, 680.925, 645.901, 4.68183, 180, 5, 0, 8508, 7981, 0, 1);

-- Ulduar: Thorim door fix
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry` IN (194560);

-- ICC: Lady door fix
update `gameobject_template` SET `flags`=4 WHERE `entry`=201563;

-- Grulls door
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry` IN (184468);

-- ICC door: ICEWALL
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry` IN (201911,201910);

-- Totems for factions
-- SoulForge
-- Fix to totem visuals for horde/alliance side. This needs to be done for every UP probably, we'll see. 
-- Earth Totems.
UPDATE `creature_template` SET `modelid1`=19073,`modelid3`=4588 WHERE `entry` IN (3579,3911,3912,3913,7398,15478,31122,31120,31121); -- Stoneclaw Totems
UPDATE `creature_template` SET `modelid1`=19073,`modelid3`=4588 WHERE `entry` IN (5874,5921,5922,7403,15464,15479,30647,31129); -- Strength of Earth Totems
UPDATE `creature_template` SET `modelid1`=19073,`modelid3`=4588 WHERE `entry`=2630; -- Earthbind Totem
UPDATE `creature_template` SET `modelid1`=19073,`modelid3`=4588 WHERE `entry` IN (5873,5919,5920,7366,7367,7368,15470,15474,31175,31176); -- Stoneskin Totems
UPDATE `creature_template` SET `modelid1`=19073,`modelid3`=4588 WHERE `entry`=5913; -- Tremor Totem
UPDATE `creature_template` SET `modelid1`=19073,`modelid3`=4588 WHERE `entry`=15430; -- Earth Elemental Totem
-- Fire Totems.
UPDATE `creature_template` SET `modelid1`=19074,`modelid3`=4589 WHERE `entry` IN (2523,3902,3903,3904,7400,7402,15480,31162,31164,31165); -- Searing Totems
UPDATE `creature_template` SET `modelid1`=19074,`modelid3`=4589 WHERE `entry` IN (5879,24320,6110,6111,7844,32775,32776,7845,15482,15483); -- Fire Nova Totems
UPDATE `creature_template` SET `modelid1`=19074,`modelid3`=4589 WHERE `entry` IN (5926,7412,7413,15486,31171,31172); -- Frost Resistance Totems
UPDATE `creature_template` SET `modelid1`=19074,`modelid3`=4589 WHERE `entry` IN (5929,7464,7465,7466,31167,32887,15484,31166); -- Magma Totems
UPDATE `creature_template` SET `modelid1`=19074,`modelid3`=4589 WHERE `entry` IN (5950,6012,7423,10557,15485,31132,31133,31158); -- Flametongue Totems
UPDATE `creature_template` SET `modelid1`=19074,`modelid3`=4589 WHERE `entry`=15439; -- Fire Elemental Totem
UPDATE `creature_template` SET `modelid1`=19074,`modelid3`=4589 WHERE `entry` IN (17539,30653,30652,30654); -- Totem of Wrath Totems
-- Water Totems.
UPDATE `creature_template` SET `modelid1`=19075,`modelid3`=4587 WHERE `entry` IN (3527,3906,3907,3908,3909,15488,31181,31182,31185,34686); -- Healing Stream Totems
UPDATE `creature_template` SET `modelid1`=19075,`modelid3`=4587 WHERE `entry` IN (5927,7424,7425,15487,31169,31170); -- Fire Resistance Totems
UPDATE `creature_template` SET `modelid1`=19075,`modelid3`=4587 WHERE `entry` IN (3573,7414,7415,7416,15489,31186,31189,31190); -- Mana Spring Totems
UPDATE `creature_template` SET `modelid1`=19075,`modelid3`=4587 WHERE `entry`=5924; -- Cleansing Totem
UPDATE `creature_template` SET `modelid1`=19075,`modelid3`=4587 WHERE `entry`=10467; -- Mana Tide Totem
-- Air Totems
UPDATE `creature_template` SET `modelid1`=19071,`modelid3`=4590 WHERE `entry`=5925; -- Grounding Totem
UPDATE `creature_template` SET `modelid1`=19071,`modelid3`=4590 WHERE `entry` IN (7467,7468,7469,15490,31173,31174); -- Nature Resistance Totems
UPDATE `creature_template` SET `modelid1`=19071,`modelid3`=4590 WHERE `entry`=6112; -- Windfury Totem
UPDATE `creature_template` SET `modelid1`=19071,`modelid3`=4590 WHERE `entry`=3968; -- Sentry Totem
UPDATE `creature_template` SET `modelid1`=19071,`modelid3`=4590 WHERE `entry`=15447; -- Wrath of Air Totem

-- Timed lady deathwhisper delete.
DELETE FROM `creature` WHERE `id`=36855;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(136105, 36855, 631, 15, 1, 0, 0, -645.265, 2211.71, 51.5517, 6.18224, 604800, 0, 0, 3346800, 3264800, 0, 0);


-- Fix engineer portal
UPDATE `creature_template` SET `unit_flags`=134, `type_flags`=1048706 WHERE `entry`=35646;

-- Dk last quest relate
DELETE FROM `creature` WHERE `id` IN (29179,29182,29180,29176,29181,29175,29177,29174,29178,29174);

-- IoC hack
REPLACE INTO `gameobject_template` VALUES (599995, 0, 0, '', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '1');
REPLACE INTO `gameobject_template` VALUES (599996, 0, 0, '', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '1');
REPLACE INTO `gameobject_template` VALUES (599997, 0, 0, '', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '1');
REPLACE INTO `gameobject_template` VALUES (599998, 0, 0, '', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '1');
REPLACE INTO `gameobject_template` VALUES (599999, 0, 0, '', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '1');

-- remove most of troll cage script, it's handled in TrinityScript now
DELETE FROM `event_scripts` WHERE `id`=2609 AND (`delay` > 0 OR `command` !=11);

-- create waypoints for trolls to run up the stairs
DELETE FROM `waypoint_data` WHERE `id`=81553;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(81553,1,1884.869,1228.621,9.70,0,1,0,100,0),
(81553,2,1887.53,1263,41.52,0,1,0,100,0);

-- sandfury acolyte & oro eyegouge: eventAI is preventing it from being moved up the stairs, fix movement suppressors:
UPDATE `creature_ai_scripts` SET `event_type`=11 WHERE `id` IN (887601,760601);
UPDATE `creature_ai_scripts` SET `action1_type`=29, `action1_param1`=15 WHERE `creature_id` IN (8876,7606) AND `action1_type`=21 AND `action1_param1`=0;

-- sgt bly & crew shouldn't regen when out of battle (they have a healer, after all)
UPDATE `creature_template` SET `RegenHealth`=0 WHERE `entry` IN (7608,7606,7605,7604,7607);

-- murta should heal herself, too
DELETE FROM `creature_ai_scripts` WHERE `id`=760805;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(760805,7608,2,0,85,3,50,0,10000,12000,11,11642,0,0,0,0,0,0,0,0,0,0,'Murta Grimgut - Cast Heal on Self');

-- Ramparts 
INSERT INTO `gameobject` VALUES
(40114, 185168, 543, 1, 1, -1432.31, 1771.16, 82.0504, 5.41551, 0, 0, 0.420357, -0.907359, -43200, 100, 1);
DELETE FROM `gameobject` WHERE `id` IN (185168);

-- Defenders portal
DELETE FROM `spell_scripts` WHERE `id`=54640;
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES (54640,0,15,54643,2,0,0,0,0,0);

-- Data courtesy of NoFantasy
TRUNCATE `reputation_reward_rate`;
INSERT INTO `reputation_reward_rate` (faction,quest_rate,creature_rate,spell_rate) VALUES 
(529,  2.0, 1.0, 2.0), -- Argent Dawn
(609,  2.0, 1.0, 2.0), -- Cenarion Circle
(576,  4.0, 1.0, 4.0), -- Timbermaw Hold
(1073, 2.0, 2.0, 2.0), -- Kalu'ak
(1119, 1.3, 1.3, 1.3), -- Sons of Hodir
(1106, 1.3, 1.3, 1.3), -- Argent Crusade
(1090, 1.3, 1.3, 1.3), -- Kirin Tor
(1098, 1.3, 1.3, 1.3), -- Knights of the Ebon Blade
(1091, 1.3, 1.3, 1.3), -- Wyrmrest Accord
(970,  3.0, 1.0, 3.0), -- Sporeggar
(978,  2.0, 1.0, 2.0), -- Kurenai
(941,  2.0, 1.0, 2.0), -- Mag'har
(1105, 2.0, 2.0, 2.0), -- The Oracles
(1104, 2.0, 2.0, 2.0); -- Frenzyheart

-- Spillover data courtesy of NoFantasy
TRUNCATE `reputation_spillover_template`;
INSERT INTO `reputation_spillover_template` VALUES 
-- 25% gain to each city
(72,  47,0.25,7, 54,0.25,7, 69,0.25,7, 930,0.25,7),
(47,  72,0.25,7, 54,0.25,7, 69,0.25,7, 930,0.25,7),
(54,  47,0.25,7, 72,0.25,7, 69,0.25,7, 930,0.25,7),
(69,  47,0.25,7, 54,0.25,7, 72,0.25,7, 930,0.25,7),
(930, 47,0.25,7, 54,0.25,7, 69,0.25,7, 72, 0.25,7),

(68,  76,0.25,7, 81,0.25,7, 530,0.25,7, 911,0.25,7),
(76,  68,0.25,7, 81,0.25,7, 530,0.25,7, 911,0.25,7),
(81,  76,0.25,7, 68,0.25,7, 530,0.25,7, 911,0.25,7),
(530, 76,0.25,7, 81,0.25,7, 68, 0.25,7, 911,0.25,7),
(911, 76,0.25,7, 81,0.25,7, 530,0.25,7, 68, 0.25,7),

-- 50% gain to each city
(21,  369,0.50,7, 470,0.50,7, 577,0.50,7, 0,0,0),
(369, 21, 0.50,7, 470,0.50,7, 577,0.50,7, 0,0,0),
(470, 369,0.50,7, 21, 0.50,7, 577,0.50,7, 0,0,0),
(577, 369,0.50,7, 470,0.50,7, 21, 0.50,7, 0,0,0),

-- 110% loss with scryer vs. aldor, 50% gain with sha'tar (capped once reaching honored with sha'tar)
(932, 934,-1.1,7, 935,0.50,4, 0,0,0, 0,0,0),
(934, 932,-1.1,7, 935,0.50,4, 0,0,0, 0,0,0),

-- 50% to Alliance Vanguard + members
(1050, 1037,0.50,7, 1068,0.50,7, 1094,0.50,7, 1126,0.50,7),
(1068, 1037,0.50,7, 1050,0.50,7, 1094,0.50,7, 1126,0.50,7),
(1094, 1037,0.50,7, 1050,0.50,7, 1068,0.50,7, 1126,0.50,7),
(1126, 1037,0.50,7, 1050,0.50,7, 1068,0.50,7, 1094,0.50,7),
-- 50% to Horde Expedition + members
(1064, 1052,0.50,7, 1067,0.50,7, 1085,0.50,7, 1124,0.50,7),
(1067, 1052,0.50,7, 1064,0.50,7, 1085,0.50,7, 1124,0.50,7),
(1085, 1052,0.50,7, 1064,0.50,7, 1067,0.50,7, 1124,0.50,7),
(1124, 1052,0.50,7, 1064,0.50,7, 1067,0.50,7, 1085,0.50,7),

-- 220% loss with frenzyheart vs oracles
(1104, 1105,-2.2,7, 0,0,0, 0,0,0, 0,0,0),
(1105, 1104,-2.2,7, 0,0,0, 0,0,0, 0,0,0);

DELETE FROM `spell_scripts` WHERE id IN (44997,45030,49625,49634,53343,53341);
INSERT INTO `spell_scripts`(`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES 
(44997,0,0,15,45009,1,1,0,0,0,0), -- Converting Sentry
(45030,1,0,15,45088,1,1,0,0,0,0), -- Impale Emissary
(49625,0,0,15,43106,1,1,0,0,0,0), -- Brave's Flare
(49634,0,0,15,43068,1,1,0,0,0,0), -- Sergeant's Flare
(53343,1,0,15,54586,1,1,0,0,0,0), -- Rune of Razorice
(53341,1,0,15,54586,1,1,0,0,0,0); -- Rune of Cinderglacier

-- Zul'Farrak doorfix
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry` IN (146084);

-- Core db relate content from forum.TrinityCore.org
TRUNCATE `access_requirement`;
INSERT INTO `access_requirement` VALUES
(33,0,14,0,0,0,0,0,0, NULL, 'Shadowfang Keep Entrance'),
(34,0,15,0,0,0,0,0,0, NULL, 'Stormwind Stockades Entrance'),
(36,0,10,0,0,0,0,0,0, NULL, 'DeadMines Entrance'),
(43,0,10,0,0,0,0,0,0, NULL, 'The Barrens - Wailing Caverns'),
(47,0,17,0,0,0,0,0,0, NULL, 'Razorfen Kraul Entrance'),
(48,0,19,0,0,0,0,0,0, NULL, 'Blackphantom Deeps Entrance'),
(70,0,30,0,0,0,0,0,0, NULL, 'Uldaman Entrance'),
(90,0,15,0,0,0,0,0,0, NULL, 'Gnomeregan Entrance'),
(109,0,35,0,0,0,0,0,0, NULL, 'Altar of Atal''Hakkar Entrance'),
(129,0,25,0,0,0,0,0,0, NULL, 'Razorfen Downs Entrance'),
(189,0,20,0,0,0,0,0,0, NULL, 'Scarlet Monastery - Graveyard (Entrance)'),
(209,0,35,0,0,0,0,0,0, NULL, 'Zul''Farrak Entrance'),
(229,0,45,0,0,0,0,0,0, NULL, 'Blackrock Spire - Searing Gorge Instance (Inside)'),
(230,0,40,0,0,0,0,0,0, NULL, 'Blackrock Mountain - Searing Gorge Instance?'),
(249,0,80,0,0,0,0,0,0, NULL, 'Onyxia''s Lair Entrance'),
(249,1,80,0,0,0,0,0,0, NULL, 'Onyxia''s Lair Entrance'),
(269,0,66,0,0,0,10285,10285,0, 'You must complete the quest \"Return to Andormu\" before entering the Black Morass.', 'Caverns Of Time, Black Morass (Entrance)'),
(269,1,70,0,30635,0,10285,10285,0, 'You must complete the quest \"Return to Andormu\" and be level 70 before entering the Heroic difficulty of the Black Morass.', 'Caverns Of Time, Black Morass (Entrance)'),
(289,0,45,0,0,0,0,0,0, NULL, 'Scholomance Entrance'),
(309,0,50,0,0,0,0,0,0, NULL, 'Zul''Gurub Entrance '),
(329,0,45,0,0,0,0,0,0, NULL, 'Stratholme - Eastern Plaguelands Instance'),
(349,0,30,0,0,0,0,0,0, NULL, 'Maraudon'),
(389,0,8,0,0,0,0,0,0, NULL, 'Ragefire Chasm - Ogrimmar Instance'),
(409,0,50,0,0,0,0,0,0, NULL, 'The Molten Bridge'),
(429,0,45,0,0,0,0,0,0, NULL, 'Dire Maul'),
(469,0,60,0,0,0,0,0,0, NULL, 'Blackwing Lair - Blackrock Mountain - Eastern Kingdoms'),
(509,0,50,0,0,0,0,0,0, NULL, 'Ruins Of Ahn\'Qiraj (Outside)'),
(531,0,50,0,0,0,0,0,0, NULL, 'Ahn\'Qiraj Temple (Outside)'),
(532,0,68,0,0,0,0,0,0, NULL, 'Karazhan, Main (Entrance)'),
(533,0,80,0,0,0,0,0,0, NULL, 'Naxxramas'),
(533,1,80,0,0,0,0,0,0, NULL, 'Naxxramas'),
(534,0,70,0,0,0,0,0,0, NULL, 'Battle Of Mount Hyjal, Alliance Base (Entrance)'),
(540,0,55,0,0,0,0,0,0, NULL, 'The Shattered Halls (Entrance)'),
(540,1,70,0,30637,30622,0,0,0, NULL, 'The Shattered Halls (Entrance)'),
(542,0,55,0,0,0,0,0,0, NULL, 'The Blood Furnace (Entrance)'),
(542,1,70,0,30637,30622,0,0,0, NULL, 'The Blood Furnace (Entrance)'),
(543,0,55,0,0,0,0,0,0, NULL, 'Hellfire Ramparts (Entrance)'),
(543,1,70,0,30637,30622,0,0,0, NULL, 'Hellfire Ramparts (Entrance)'),
(544,0,65,0,0,0,0,0,0, NULL, 'Magtheridon''s Lair (Entrance)'),
(545,0,55,0,0,0,0,0,0, NULL, 'The Steamvault (Entrance)'),
(545,1,70,0,30623,0,0,0,0, NULL, 'The Steamvault (Entrance)'),
(546,0,55,0,0,0,0,0,0, NULL, 'The Underbog (Entrance)'),
(546,1,70,0,30623,0,0,0,0, NULL, 'The Underbog (Entrance)'),
(547,0,55,0,0,0,0,0,0, NULL, 'The Slave Pens (Entrance)'),
(547,1,70,0,30623,0,0,0,0, NULL, 'The Slave Pens (Entrance)'),
(548,0,68,0,0,0,0,0,0, NULL, 'Serpentshrine Cavern (Entrance)'),
(550,0,70,0,0,0,0,0,0, NULL, 'The Eye (Entrance)'),
(552,0,68,0,0,0,0,0,0, NULL, 'The Arcatraz (Entrance)'),
(552,1,70,0,30634,0,0,0,0, NULL, 'The Arcatraz (Entrance)'),
(553,0,68,0,0,0,0,0,0, NULL, 'The Botanica (Entrance)'),
(553,1,70,0,30634,0,0,0,0, NULL, 'The Botanica (Entrance)'),
(554,0,68,0,0,0,0,0,0, NULL, 'The Mechanar (Entrance)'),
(554,1,70,0,30634,0,0,0,0, NULL, 'The Mechanar (Entrance)'),
(555,0,65,0,0,0,0,0,0, NULL, 'Shadow Labyrinth (Entrance)'),
(555,1,70,0,30633,0,0,0,0, NULL, 'Shadow Labyrinth (Entrance)'),
(556,0,55,0,0,0,0,0,0, NULL, 'Sethekk Halls (Entrance)'),
(556,1,70,0,30633,0,0,0,0, NULL, 'Sethekk Halls (Entrance)'),
(557,0,55,0,0,0,0,0,0, NULL, 'Mana Tombs (Entrance)'),
(557,1,70,0,30633,0,0,0,0, NULL, 'Mana Tombs (Entrance)'),
(558,0,55,0,0,0,0,0,0, NULL, 'Auchenai Crypts (Entrance)'),
(558,1,70,0,30633,0,0,0,0, NULL, 'Auchenai Crypts (Entrance)'),
(560,0,66,0,0,0,0,0,0, NULL, 'Caverns Of Time, Old Hillsbrad Foothills (Entrance)'),
(560,1,70,0,30635,0,0,0,0, NULL, 'Caverns Of Time, Old Hillsbrad Foothills (Entrance)'),
(564,0,70,0,0,0,0,0,0, NULL, 'Black Temple (Entrance)'),
(565,0,70,0,0,0,0,0,0, NULL, 'Gruul''s Lair (Entrance)'),
(568,0,70,0,0,0,0,0,0, NULL, 'Zul''Aman (Entrance)'),
(574,0,65,0,0,0,0,0,0, NULL, 'Utgarde Keep (entrance)'),
(574,1,80,0,0,0,0,0,0, NULL, 'Utgarde Keep (entrance)'),
(575,0,75,0,0,0,0,0,0, NULL, 'Utgarde Pinnacle (entrance)'),
(575,1,80,0,0,0,0,0,0, NULL, 'Utgarde Pinnacle (entrance)'),
(576,0,66,0,0,0,0,0,0, NULL, 'The Nexus (entrance)'),
(576,1,80,0,0,0,0,0,0, NULL, 'The Nexus (entrance)'),
(578,0,75,0,0,0,0,0,0, NULL, 'The Oculus (entrance)'),
(578,1,80,0,0,0,0,0,0, NULL, 'The Oculus (entrance)'),
(580,0,70,0,0,0,0,0,0, NULL, 'Sunwell Plateau (Entrance)'),
(585,0,65,0,0,0,0,0,0, NULL, 'Magisters\' Terrace (Entrance)'),
(585,1,70,0,0,0,11492,11492,0, NULL, 'Magisters\' Terrace (Entrance)'),
(595,0,75,0,0,0,0,0,0, NULL, 'Culling of Stratholme (entrance)'),
(595,1,80,0,0,0,0,0,0, NULL, 'Culling of Stratholme (entrance)'),
(599,0,72,0,0,0,0,0,0, NULL, 'Ulduar, Halls of Stone (entrance)'),
(599,1,80,0,0,0,0,0,0, NULL, 'Ulduar, Halls of Stone (entrance)'),
(600,0,69,0,0,0,0,0,0, NULL, 'Drak''Tharon Keep (entrance)'),
(600,1,80,0,0,0,0,0,0, NULL, 'Drak''Tharon Keep (entrance)'),
(601,0,67,0,0,0,0,0,0, NULL, 'Azjol-Nerub (entrance)'),
(601,1,80,0,0,0,0,0,0, NULL, 'Azjol-Nerub (entrance)'),
(602,0,75,0,0,0,0,0,0, NULL, 'Ulduar, Halls of Lightning (entrance)'),
(602,1,80,0,0,0,0,0,0, NULL, 'Ulduar, Halls of Lightning (entrance)'),
(603,0,80,0,0,0,0,0,0, NULL, 'Ulduar Raid entrance'),
(603,1,80,0,0,0,0,0,0, NULL, 'Ulduar Raid entrance'),
(604,0,71,0,0,0,0,0,0, NULL, 'Gundrak (entrance north)'),
(604,1,80,0,0,0,0,0,0, NULL, 'Gundrak (entrance north)'),
(608,0,70,0,0,0,0,0,0, NULL, 'Violet Hold (entrance)'),
(608,1,80,0,0,0,0,0,0, NULL, 'Violet Hold (entrance)'),
(615,0,80,0,0,0,0,0,0, NULL, 'Chamber of Aspects, Obsidian Sanctum (entrance)'),
(615,1,80,0,0,0,0,0,0, NULL, 'Chamber of Aspects, Obsidian Sanctum (entrance)'),
(616,0,80,0,0,0,0,0,0, NULL, 'The Eye of Eternity (entrance)'),
(616,1,80,0,0,0,0,0,0, NULL, 'The Eye of Eternity (entrance)'),
(619,0,68,0,0,0,0,0,0, NULL, 'Ahn''Kahet (entrance)'),
(619,1,80,0,0,0,0,0,0, NULL, 'Ahn''Kahet (entrance)'),
(624,0,80,0,0,0,0,0,0, NULL, 'Vault of Archavon (Entrance)'),
(624,1,80,0,0,0,0,0,0, NULL, 'Vault of Archavon (Entrance)'),
(631,0,80,0,0,0,0,0,0, NULL, 'IceCrown Citadel (Entrance)'),
(631,1,80,0,0,0,0,0,0, NULL, 'IceCrown Citadel (Entrance)'),
(631,2,80,0,0,0,0,0,4530, NULL, 'IceCrown Citadel (Entrance)'),
(631,3,80,0,0,0,0,0,4597, NULL, 'IceCrown Citadel (Entrance)'),
(632,0,80,0,0,0,0,0,0, NULL, 'Forge of Souls (Entrance)'),
(632,1,80,0,0,0,0,0,0, NULL, 'Forge of Souls (Entrance)'),
(649,0,80,0,0,0,0,0,0, NULL, 'Trial of the Crusader'),
(649,1,80,0,0,0,0,0,0, NULL, 'Trial of the Crusader'),
(649,2,80,0,0,0,0,0,0, NULL, 'Trial of the Crusader'),
(649,3,80,0,0,0,0,0,0, NULL, 'Trial of the Crusader'),
(650,0,75,0,0,0,0,0,0, NULL, 'Trial of the Champion'),
(650,1,80,0,0,0,0,0,0, NULL, 'Trial of the Champion'),
(658,0,80,0,0,0,24499,24511,0, NULL, 'Pit of Saron (Entrance)'),
(658,1,80,0,0,0,24499,24511,0, NULL, 'Pit of Saron (Entrance)'),
(668,0,80,0,0,0,24710,24712,0, NULL, 'Halls of Reflection (Entrance)'),
(668,1,80,0,0,0,24710,24712,0, NULL, 'Halls of Reflection (Entrance)'),
(724,0,80,0,0,0,0,0,0, NULL, 'The Ruby Sanctum (Entrance)'),
(724,1,80,0,0,0,0,0,0, NULL, 'The Ruby Sanctum (Entrance)'),
(724,2,80,0,0,0,0,0,0, NULL, 'The Ruby Sanctum (Entrance)'),
(724,3,80,0,0,0,0,0,0, NULL, 'The Ruby Sanctum (Entrance)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `ConditionTypeOrReference` = 18 AND `SourceEntry` IN (42703, 47939, 39844);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `Comment`) VALUES
(13,0,47939,0,18,0,188539,0,0, 'Gather Lumber - limit GO targets to Coldwind Tree'),
(13,0,42703,0,18,0,186403,0,0, 'Steelring\'s Foolproof Dynamite - limit GO targets to Whisper Gulch Ore'),
(13,0,42703,0,18,0,186470,0,0, 'Steelring\'s Foolproof Dynamite - limit GO targets to Whisper Gulch Ore'),
(13,0,39844,0,18,0,185549,0,0, 'Skyguard Blasting Charge - limit GO targets to Monstrous Kaliri Egg');

-- Missing criteria for Subtraction achievements
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (7608,7609);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(7608,12,0,0),
(7608,13,8,0),  -- Subtraction (10 player)
(7609,12,1,0),
(7609,13,20,0); -- Subtraction (25 player)

-- Now that criteria are defined, we can enable them
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (7608,7609);

-- Archavon immune
UPDATE `creature_template` SET `mechanic_immune_mask`=797655039 WHERE `entry`=31125;

-- Core db relate content
DELETE FROM `creature_transport`;
INSERT INTO `creature_transport` (`guid`,`transport_entry`,`npc_entry`,`TransOffsetX`,`TransOffsetY`,`TransOffsetZ`,`TransOffsetO`,`emote`) VALUES
(11,164871,25075,4.22547,-13.2054,-23.6771,1.54314,0),
(17,176310,25012,18.1475,-7.41572,6.09809,1.88535,0),
(3,192241,30753,-26.8391,-10.402,35.5991,1.29366,432),
(66,192241,29795,45.6197,7.29317,30.0955,4.67642,0),
(5,192241,30754,-54.639,-15.3254,34.3972,3.83128,0),
(1,176310,25013,0.194107,9.84585,6.09941,3.08731,0),
(7,190536,31790,34.0851,0.015993,19.7141,3.03935,0),
(8,192241,30752,7.30473,24.2619,34.9491,4.43536,0),
(27,176310,25010,13.2057,-2.817,6.09989,3.88733,0),
(10,192241,30755,7.49121,6.05275,34.4239,3.16615,0),
(15,176310,25009,25.2165,6.9111,16.1459,3.94958,0),
(16,176310,25015,34.0669,0.119702,18.287,3.17832,0),
(1,190536,31792,-4.5113,-0.220224,9.36188,1.57535,432),
(2,190536,31791,-11.4596,-8.43786,9.52534,4.77978,432),
(2,176310,25014,-0.532552,-8.68575,6.09815,3.19019,0),
(3,176310,25017,6.22581,9.13103,11.4836,1.53614,0),
(17,192241,30755,37.6428,-9.00797,30.0954,0.004917,0),
(70,192241,30754,-18.9215,-26.8371,89.9664,0.087792,0),
(19,192241,30866,-36.528,23.9373,33.9184,1.89617,0),
(20,192241,30755,-3.46042,28.0231,34.2784,4.66548,0),
(5,190536,31793,16.8969,-3.34782,9.82203,5.62173,432),
(22,192241,30754,-54.7182,15.5861,34.3897,2.50086,0),
(6,190536,31789,28.0019,6.04888,19.2448,3.26161,0),
(24,192241,30866,-36.1494,-23.2606,33.9568,4.2232,0),
(25,192241,30753,-26.9812,10.5208,35.5936,4.74156,432),
(26,176310,25016,-11.1276,6.60326,6.09852,3.05167,432),
(27,192241,30866,15.9225,26.2539,35.4586,1.60085,0),
(9,176310,25018,10.2474,2.78122,11.803,3.46823,432),
(29,192241,30755,7.21494,-6.31021,34.4191,3.11118,0),
(30,192241,32301,-3.37706,0.007499,34.0151,4.65055,0),
(31,192241,30752,8.25547,-21.6199,34.8875,1.73515,0),
(32,192241,30755,-5.59682,-28.2501,34.1226,1.55058,0),
(33,192241,30866,17.7216,-26.2695,35.5686,5.06367,0),
(34,192241,30755,37.6401,8.9586,30.0954,0.012771,0),
(35,192241,30755,37.6428,-9.00797,30.0954,0.004917,0),
(71,192241,30753,-7.63407,0.007234,86.0904,6.2728,0),
(37,192241,30827,45.884,-8.99976,30.0955,1.52942,0),
(7,176310,25011,19.2178,-8.20848,12.1102,4.81518,0),
(39,192241,30753,-34.939,-11.6484,11.4697,5.50858,432),
(40,192241,30753,-34.785,11.9312,11.4869,0.836243,432),
(41,192241,30755,-26.188,-6.1712,9.33333,3.14217,0),
(42,192241,30755,-26.1511,6.90449,9.405,3.12647,0),
(43,192241,30825,38.4745,0.038424,10.1868,3.15788,0),
(44,192241,30753,46.382,7.89944,10.4129,3.96271,0),
(45,192241,30753,45.981,-6.55312,10.3636,2.23091,0),
(46,192241,30755,24.5852,6.86575,7.06382,3.11055,0),
(47,192241,30755,24.3302,-6.97827,7.08356,3.34184,0),
(48,192241,31243,15.2483,-33.3678,10.5837,4.72649,0),
(49,192241,31243,1.91814,-32.9286,10.0097,4.6891,0),
(50,192241,31243,-11.0915,-32.8872,10.5819,4.68507,0),
(51,192241,31243,-11.2408,33.2155,10.5949,1.58668,0),
(52,192241,31243,1.99373,33.0756,10.0105,1.53853,0),
(53,192241,31243,15.239,32.5832,10.5826,1.52441,0),
(54,192241,30755,8.85995,18.8224,8.7027,4.69035,0),
(55,192241,30755,-4.43012,18.742,8.62646,4.66286,0),
(56,192241,30755,-4.46811,-18.5567,8.62604,1.53698,0),
(57,192241,30755,9.06884,-18.7113,8.70787,1.56054,0),
(58,192241,30753,1.98831,-18.0873,9.16057,4.66993,0),
(59,192241,30753,2.15579,17.0338,9.16353,1.54405,0),
(60,192241,30752,15.4321,28.6642,9.92277,1.54012,0),
(61,192241,30752,2.01988,28.7211,9.33565,1.58332,0),
(62,192241,30752,-11.241,28.5576,9.91826,1.5519,0),
(68,192241,30826,55.0542,-3.74557,30.0955,2.77577,0),
(69,192241,30755,29.8693,-29.5825,89.7663,3.05267,0),
(67,192241,30824,55.5028,0.080449,30.5268,3.15669,0),
(1,192242,30352,48.8813,8.78624,40.0817,3.1426,433),
(2,192242,30352,48.8649,-8.72834,40.0818,3.12642,433),
(3,192242,30352,-17.337,3.98796,20.7652,3.1541,433),
(4,192242,30351,39.976,44.3876,25.0331,3.16019,0),
(5,192242,30867,36.8757,45.226,25.0331,2.16509,0),
(6,192242,30352,-17.2379,-3.94242,20.7667,3.1541,433),
(7,192242,30867,36.9277,-44.9241,25.0318,4.11052,0),
(8,192242,32566,34.6465,-41.7087,25.0325,3.20731,0),
(9,192242,29799,34.5332,-38.5618,25.0323,3.15234,0),
(10,192242,30351,2.42088,-23.0053,22.5625,0.046087,432),
(11,192242,30867,-11.0475,-22.7053,22.5096,4.51265,0),
(12,192242,30867,-32.9158,-22.1469,22.5861,4.59982,0),
(13,192242,30394,-57.9337,6.01148,23.5029,1.54855,432),
(14,192242,30351,-36.4471,6.81573,20.4485,4.73177,432),
(15,192242,30351,-36.1811,-6.90251,20.4501,1.6483,432),
(16,192242,30352,-49.1048,0.044213,20.6694,0.029782,433),
(17,192242,30351,1.44228,9.63379,20.4566,3.15096,432),
(18,192242,30351,1.29162,-9.37181,20.458,3.17295,432),
(19,192242,30833,6.18656,-0.008156,20.5756,6.28313,0),
(20,192242,30352,16.5684,2.46962,20.4252,3.1329,44),
(64,192242,30350,16.4056,-2.2827,20.4235,3.11453,0),
(22,192242,30392,28.7566,7.6217,23.2872,6.08285,0),
(23,192242,30347,28.6378,-7.55243,23.2873,0.157027,0),
(24,192242,30344,43.6738,0.121325,25.1341,3.10227,0),
(25,192242,32777,42.9517,4.20903,25.1088,3.47298,0),
(26,192242,31259,16.8761,-17.8635,20.4597,2.02864,0),
(27,192242,30351,0.773476,22.5004,22.5503,3.2248,432),
(28,192242,30867,-10.0824,23.2226,22.5129,1.54405,0),
(29,192242,30867,-33.4747,22.2096,22.5895,1.56211,0),
(30,192242,30346,25.0778,-0.047958,9.59893,3.13291,0),
(31,192242,30352,36.4909,6.11523,9.60666,3.01117,433),
(32,192242,30352,36.436,-6.06257,9.60687,3.09364,433),
(33,192242,30380,3.92454,20.827,9.67354,1.30372,0),
(34,192242,30380,-6.13984,21.6533,9.991,1.48436,0),
(35,192242,30380,-17.4619,22.2092,9.60018,1.58254,0),
(36,192242,30380,-30.2521,21.9534,9.5974,1.54169,0),
(37,192242,30380,-37.3836,19.9617,9.59771,1.87549,0),
(38,192242,30380,-37.1975,-20.2765,9.65711,4.32467,0),
(39,192242,30380,-30.1731,-21.9358,9.59686,4.72914,0),
(40,192242,30380,-18.0212,-22.0926,9.60068,4.66788,0),
(41,192242,30380,-6.33308,-21.7722,9.99575,4.85167,0),
(42,192242,30380,3.99105,-21.2539,9.67311,4.9577,0),
(43,192242,30394,-11.7295,-24.7904,9.58663,1.63703,0),
(44,192242,30394,-11.9688,25.5424,9.58513,4.66945,0),
(45,192242,30352,-67.4841,3.50927,9.60209,5.83577,433),
(46,192242,30352,-67.1723,-3.73439,9.60211,0.318344,433),
(47,192242,30394,-48.1449,-3.10366,-5.21617,3.11436,0),
(48,192242,30345,-48.0654,-0.185737,-4.98898,3.11436,0),
(49,192242,30352,-60.5592,0.055898,-5.27774,0.004184,433),
(50,192242,30394,-14.1505,23.0373,-5.24869,0.027745,0),
(51,192242,30380,-8.79147,30.0334,-0.157799,0.471494,0),
(52,192242,30380,1.92073,28.7498,0.101361,0.232732,0),
(53,192242,30394,-14.3898,-23.2398,-5.25039,6.16013,0),
(54,192242,30380,-7.54172,-30.0747,0.101348,4.17752,0),
(55,192242,30380,3.45962,-28.1289,0.101388,4.29376,0),
(56,192242,30380,-24.7068,-29.9771,0.101334,3.66623,0),
(57,192242,30380,-39.6946,-26.8419,0.82802,2.93659,0),
(58,192242,30380,-41.0289,25.7685,1.20385,1.49696,0),
(59,192242,30380,-26.5726,29.6008,-0.15773,0.856857,0),
(60,192242,30352,43.7981,13.0009,-2.07474,4.61776,433),
(72,192241,30753,15.254,-0.009458,86.0904,3.14299,0),
(65,192242,32302,54.6648,-6.9431,40.0874,3.0302,0),
(63,192242,32193,-21.6978,0.127903,-18.1897,3.12341,0),
(1,175080,24935,9.42351,-11.8801,-23.5908,3.08558,0),
(2,175080,24934,9.56883,-3.62246,-23.5893,3.07458,0),
(3,175080,24924,-1.61694,-10.1641,-23.7649,0.008681,0),
(4,175080,24926,-5.41824,-2.06021,-17.7263,1.97218,0),
(5,175080,25080,-4.65078,-4.74596,-17.7144,1.65016,0),
(6,175080,25081,-5.03417,-10.8253,-17.689,4.69751,0),
(7,175080,24931,7.15704,-3.89011,-17.7735,5.15776,432),
(1,164871,25083,-5.86083,-5.09646,-17.6306,1.1754,0),
(2,164871,25071,6.71222,-4.1415,-17.794,4.99008,432),
(3,164871,25074,4.49415,-7.97789,-17.8975,0.065626,432),
(4,164871,25072,7.03763,-11.1073,-17.7946,1.2987,432),
(5,164871,25079,-5.00414,-10.5989,-17.6843,4.66884,0),
(6,164871,25070,-9.52824,-7.63628,-17.2095,3.16716,0),
(7,164871,25076,-1.27746,-7.88328,-23.7608,3.14124,432),
(8,164871,24934,-4.77478,-12.8175,-22.6773,4.60522,0),
(9,164871,24935,-6.29228,-12.7502,-22.6769,4.66805,0),
(1,190549,3084,-4.75387,-10.8675,-17.7074,4.59518,0),
(2,190549,3084,-5.13627,-4.61703,-17.6884,1.65007,0),
(3,190549,34715,-9.9527,-7.70295,-17.0973,3.12662,0),
(4,190549,34723,-17.7755,-5.62641,-14.9376,3.69996,0),
(5,190549,34717,-13.0353,-12.0914,-16.2584,4.22853,0),
(6,190549,34719,7.35889,-11.108,-17.7826,1.57997,28),
(7,190549,34721,-0.488628,-5.93246,-23.7484,3.81128,0),
(8,190549,34730,-0.979586,-7.9528,-23.7559,3.0456,0),
(9,190549,24934,9.49791,-3.56853,-23.5906,6.28222,0),
(10,190549,24935,9.32634,-12.0478,-23.5942,6.24295,0),
(11,190549,34718,13.5225,-5.26085,-24.1585,0.03595,207),
(1,186238,31725,11.1323,-7.8428,-16.6839,3.15041,0),
(2,186238,31724,5.72734,-3.28376,-17.8139,1.55213,0),
(3,186238,31727,-4.01569,-2.02455,-17.6298,1.16964,0),
(4,186238,31726,-3.59444,-13.8231,-17.678,5.47991,0),
(5,186238,31723,-11.0334,-12.5191,-16.8298,4.64346,0),
(6,186238,31720,-15.8872,-5.06557,-16.1287,2.13411,0),
(1,176495,25105,-9.54405,-7.94072,-17.2053,3.17242,0),
(2,176495,25106,-4.93938,-10.9634,-17.6988,4.76285,0),
(3,176495,25107,-4.98215,-4.67863,-17.696,1.59455,0),
(4,176495,25101,7.56919,-4.02088,-17.7543,4.77071,0),
(5,176495,25103,7.59398,-11.5166,-17.7745,1.62204,0),
(6,176495,25102,-11.0882,-3.47446,-16.7988,2.00924,0),
(7,186238,25075,9.86442,-7.77519,-16.6839,0.043302,0),
(8,176495,25104,-0.898213,-7.76559,-23.7548,3.11116,0),
(9,176495,25100,-0.411733,-5.7239,-23.7457,3.70414,0),
(10,176495,24934,9.63549,-3.67192,-23.588,6.25904,0),
(11,176495,24935,9.79838,-11.8681,-23.5848,6.25118,0),
(1,181689,31706,-16.8964,-10.8497,-15.9745,1.45699,0),
(2,181689,31708,-2.74581,-1.47146,-17.7765,4.67712,0),
(3,181689,31708,-3.54276,-13.8752,-17.684,1.53946,0),
(4,181689,31705,5.07824,-13.1188,-17.8135,5.24182,0),
(5,181689,31716,11.5731,-7.65137,-16.6839,3.20372,0),
(6,181689,31704,5.21605,-2.36685,-17.8223,1.04622,0),
(8,190536,31788,26.1618,-2.95068,19.2448,2.72126,0),
(1,176244,24996,-0.258897,-7.62734,4.80823,5.66423,0),
(2,176244,24997,-0.416482,4.39825,4.79739,5.10346,0),
(3,176244,24993,13.1874,7.71381,6.07001,3.09834,0),
(4,176244,24995,13.3456,-7.63689,6.09325,3.06064,0),
(5,176244,25007,21.2462,1.87803,11.7334,3.19572,0),
(6,176244,24456,29.5627,0.150031,16.6147,3.18002,0),
(1,181646,25052,13.5093,7.8287,6.11039,3.12838,0),
(3,181646,25051,13.4899,-7.71638,6.11067,3.11424,0),
(4,181646,25056,20.3045,1.2971,11.7088,3.06319,0),
(5,181646,25050,29.8662,-0.374622,16.6206,3.09382,0),
(6,181646,25054,-21.8863,-2.61623,4.33103,6.14509,0),
(7,181646,25055,-21.4646,2.87105,4.31055,6.26055,0),
(1,20808,25097,-11.4014,6.67999,6.09785,2.93715,0),
(2,20808,25082,15.6121,1.09944,6.09764,2.52482,0),
(5,20808,25089,17.8437,-7.84575,6.09877,1.64493,0),
(6,20808,25078,34.095,3.54049,17.8892,5.50987,0),
(11,20808,25094,34.0585,-0.04162,18.2865,3.17017,0),
(13,20808,25095,9.39981,9.17899,11.5941,1.52083,432),
(14,20808,25093,15.8067,-5.80051,11.9732,1.86484,0),
(15,20808,25111,6.20811,0.005208,14.0554,2.54813,0),
(73,192241,30755,8.83021,-4.6978,84.7137,2.34582,0),
(74,192241,30755,8.67689,4.88796,84.7137,3.90012,0),
(75,192241,30755,29.4588,29.8761,89.7684,3.15321,0),
(76,192241,30754,-19.0109,27.0177,89.9667,6.22411,0),
(12,164871,25075,10.6353,-12.1104,-23.5736,3.01351,0),
(13,164871,25075,10.6391,-3.68298,-23.5737,3.14703,0),
(14,164871,25075,4.53411,-2.57645,-23.6704,4.7411,0),
(18,164871,25075,-2.82445,-6.38118,-23.7807,4.71631,432),
(16,164871,25075,-3.59545,-7.90852,-23.7812,6.26982,0),
(17,164871,25075,-2.95326,-9.17582,-23.7804,1.60848,0),
(8,175080,25075,-3.59016,-7.79262,-23.7806,6.27391,0),
(12,176495,25075,-3.59133,-7.84061,-23.7802,6.1969,0),
(12,190549,25075,-3.59986,-8.08202,-23.7802,0.039869,0),
(2,195276,34935,-21.401,-31.343,34.173,4.62057,0),
(3,195276,34935,-12.1064,-31.9697,34.3807,4.62057,0),
(4,195276,34935,-2.4877,-31.9885,34.8384,4.62057,0),
(5,195276,34935,10.2664,-32.0713,35.7357,4.62057,0),
(6,195276,34935,19.4636,-30.794,36.2254,4.83106,0),
(1,195121,34929,-41.7122,23.1838,22.5605,1.60659,0),
(2,195121,34929,-31.0354,25.1286,21.6921,1.60659,0),
(3,195121,34929,-21.4492,25.8326,21.6309,1.60659,0),
(4,195121,34929,-12.4734,26.321,21.6237,1.60659,0),
(5,195121,34929,-2.81125,26.2077,21.6566,1.60659,0);

-- Set battleground-names
UPDATE `battleground_template` SET `Comment`= 'Alterac Valley' WHERE `battleground_template`.`id`=1;
UPDATE `battleground_template` SET `Comment`= 'Warsong Gulch' WHERE `battleground_template`.`id`=2;
UPDATE `battleground_template` SET `Comment`= 'Arathi Basin' WHERE `battleground_template`.`id`=3;
UPDATE `battleground_template` SET `Comment`= 'Nagrand Arena' WHERE `battleground_template`.`id`=4;
UPDATE `battleground_template` SET `Comment`= 'Blades''s Edge Arena' WHERE `battleground_template`.`id`=5;
UPDATE `battleground_template` SET `Comment`= 'All Arena' WHERE `battleground_template`.`id`=6;
UPDATE `battleground_template` SET `Comment`= 'Eye of The Storm' WHERE `battleground_template`.`id`=7;
UPDATE `battleground_template` SET `Comment`= 'Ruins of Lordaeron' WHERE `battleground_template`.`id`=8;
UPDATE `battleground_template` SET `Comment`= 'Strand of the Ancients' WHERE `battleground_template`.`id`=9;
UPDATE `battleground_template` SET `Comment`= 'Dalaran Sewers' WHERE `battleground_template`.`id`=10;
UPDATE `battleground_template` SET `Comment`= 'The Ring of Valor' WHERE `battleground_template`.`id`=11;
UPDATE `battleground_template` SET `Comment`= 'Isle of Conquest' WHERE `battleground_template`.`id`=30;
UPDATE `battleground_template` SET `Comment`= 'Random battleground' WHERE `battleground_template`.`id`=32;

-- Fun BuyPrice
UPDATE `item_template` SET `BuyPrice`=100000 WHERE `entry`=43102;

-- Fix crash
UPDATE `creature_template` SET `VehicleId`= 0 WHERE `entry` IN (37813,38402,38582,38583); 
UPDATE `creature_template` SET `VehicleId`=0 WHERE `entry` IN (36609);
UPDATE `creature_template` SET `VehicleId`=318 WHERE `entry` IN (36609);
UPDATE `creature_template` SET `VehicleId`=639 WHERE `entry` IN (37813,38402,38582,38583);

-- Core db relate content
-- Capture Worg Pup
DELETE FROM `spell_scripts` WHERE `id`=15998 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (15998,0,18,0,0,0);

-- Capture Female Kaliri Hatchling
DELETE FROM `spell_scripts` WHERE `id`=29435 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (29435,0,18,0,0,0);

-- Hourglass Sand
DELETE FROM `spell_scripts` WHERE `id`=23645 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (23645,0,14,23170,1,0);

-- Gift of Life
DELETE FROM `spell_scripts` WHERE `id`=23725 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (23725,0,15,23782,1,1);
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (23725,0,15,23783,1,1);

-- Knockdown Fel Cannon: The Bolt
DELETE FROM `spell_scripts` WHERE `id`=40109 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (40109,0,15,40075,2,1);

-- Magic Pull
DELETE FROM `spell_scripts` WHERE `id`=51336 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (51336,0,15,50770,0,1);

-- Pickup Primordial Hatchling
DELETE FROM `spell_scripts` WHERE `id`=51592 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (51592,0,18,0,0,0);

-- Warrior's Wrath
DELETE FROM `spell_scripts` WHERE `id`=21977 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (21977,0,15,21887,0,1);

-- Dispelling Analysis
DELETE FROM `spell_scripts` WHERE `id`=37028 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (37028,0,14,36904,0,0);

-- Despawn Horse
DELETE FROM `spell_scripts` WHERE `id`=52267 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (52267,0,18,0,0,0);

-- Translocate
DELETE FROM `spell_scripts` WHERE `id` IN (25140,25143,25650,25652,29128,29129,35376,35727) AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES
(25140,0,15,32571,2,0),
(25143,0,15,32572,2,0),
(25650,0,15,30140,2,0),
(25652,0,15,30141,2,0),
(29128,0,15,32568,2,0),
(29129,0,15,32569,2,0),
(35376,0,15,25649,2,0),
(35727,0,15,35730,2,0);

-- Tidal Surge
DELETE FROM `spell_scripts` WHERE `id`=38358 AND `effIndex`=1;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (38358,1,15,38353,0,1);

-- Draw Soul
DELETE FROM `spell_scripts` WHERE `id`=40904 AND `effIndex`=1;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (40904,1,15,40903,3,1);

-- Force Cast - Portal Effect: Sunwell Isle
DELETE FROM `spell_scripts` WHERE `id`=44876 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (44876,0,15,44870,2,1);

-- Stomp
DELETE FROM `spell_scripts` WHERE `id`=45185 AND `effIndex`=2;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (45185,2,14,46394,0,0);

-- Negative Energy
DELETE FROM `spell_scripts` WHERE `id`=46289 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (46289,0,15,46285,0,1);

-- Sky Darkener Assault
DELETE FROM `spell_scripts` WHERE `id`=52124 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (52124,0,15,52125,0,0);

-- Gigantic Feast
DELETE FROM `spell_scripts` WHERE `id`=58466 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (58466,0,15,58648,2,1);
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (58466,0,15,58467,2,1);

-- Small Feast
DELETE FROM `spell_scripts` WHERE `id`=58475 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (58475,0,15,58648,2,1);
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (58475,0,15,58477,2,1);

-- Great Feast
DELETE FROM `spell_scripts` WHERE `id`=57337 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (57337,0,15,58067,2,1);

-- Fish Fest
DELETE FROM `spell_scripts` WHERE `id`=57397 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (57397,0,15,58648,2,1);
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (57397,0,15,57398,2,1);

-- Ghoul Explode
DELETE FROM `spell_scripts` WHERE `id`=67751 AND `effIndex`=1;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (67751,1,15,67729,2,0);

-- Dreaming Glory
DELETE FROM `spell_scripts` WHERE `id`=28698 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (28698,0,15,28694,2,1);

-- ICC: Sindragosa
INSERT INTO `creature` VALUES ('@GUID+1', '36853', '631', '15', '128', '0', '0', '4452.97', '2484.53', '203.377', '3.14895', '300', '0', '0', '11156000', '0', '0', '0');
DELETE FROM `creature` WHERE `id`=36853;

DELETE FROM `spell_area` WHERE `spell`=58600;
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_start_active`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`) VALUES
(58600,4395,0,0,0,0,0,2,1), -- Dalaran
(58600,4560,0,0,0,0,0,2,1), -- The Underbelly
(58600,4567,0,0,0,0,0,2,1), -- The Violet Hold
(58600,4568,0,0,0,0,0,2,1), -- The Eventide
(58600,4570,0,0,0,0,0,2,1), -- Circle of Wills
(58600,4598,0,0,0,0,0,2,1), -- Krasus' Landing (not the one where you can fly, there are 2)
(58600,4613,0,0,0,0,0,2,1), -- Dalaran City
(58600,4614,0,0,0,0,0,2,1), -- The Violet Citadel Spire
(58600,4616,0,0,0,0,0,2,1), -- Sunreaver's Sanctuary
(58600,4618,0,0,0,0,0,2,1), -- Antonidas Memorial
(58600,4619,0,0,0,0,0,2,1), -- The Violet Citadel
(58600,4620,0,0,0,0,0,2,1), -- Magus Commerce Exchange
(58600,4637,0,0,0,0,0,2,1), -- Vargoth's Retreat
(58600,4739,0,0,0,0,0,2,1), -- Runeweaver Square
(58600,4740,0,0,0,0,0,2,1); -- The Silver Enclave

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (123,308,414,416,417,418,419,420,421,422,423,424,426,427,436,437,438,439,440,1801,1802,3353,3372,3693,5602,6641,6642,6643,6644,7769,11487,11488);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(123,0,0,0, ''),
(308,0,0,0, ''),
(414,0,0,0, ''),
(416,0,0,0, ''),
(417,0,0,0, ''),
(418,0,0,0, ''),
(419,0,0,0, ''),
(420,0,0,0, ''),
(421,0,0,0, ''),
(422,0,0,0, ''),
(423,0,0,0, ''),
(424,0,0,0, ''),
(426,0,0,0, ''),
(427,0,0,0, ''),
(436,0,0,0, ''),
(437,0,0,0, ''),
(438,0,0,0, ''),
(439,0,0,0, ''),
(440,0,0,0, ''),
(1801,0,0,0, ''),
(1802,0,0,0, ''),
(3353,0,0,0, ''),
(3372,0,0,0, ''),
(3693,11,0,0, 'achievement_storm_glory'),
(5602,0,0,0, ''),
(6641,16,201,0, ''),
(6641,11,0,0, 'achievement_school_of_hard_knocks'),
(6642,16,201,0, ''),
(6642,11,0,0, 'achievement_school_of_hard_knocks'),
(6643,16,201,0, ''),
(6643,11,0,0, 'achievement_school_of_hard_knocks'),
(6644,16,201,0, ''),
(6644,11,0,0, 'achievement_school_of_hard_knocks'),
(7769,0,0,0, ''),
(11487,0,0,0, ''),
(11488,0,0,0, '');

-- Capture Worg Pup
DELETE FROM `spell_scripts` WHERE `id`=15998 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (15998,0,18,0,0,0);
-- Capture Female Kaliri Hatchling
DELETE FROM `spell_scripts` WHERE `id`=29435 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (29435,0,18,0,0,0);
-- Hourglass Sand
DELETE FROM `spell_scripts` WHERE `id`=23645 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (23645,0,14,23170,1,0);
-- Gift of Life
DELETE FROM `spell_scripts` WHERE `id`=23725 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (23725,0,15,23782,1,1);
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (23725,0,15,23783,1,1);
-- Knockdown Fel Cannon: The Bolt
DELETE FROM `spell_scripts` WHERE `id`=40109 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (40109,0,15,40075,2,1);
-- Magic Pull
DELETE FROM `spell_scripts` WHERE `id`=51336 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (51336,0,15,50770,0,1);
-- Pickup Primordial Hatchling
DELETE FROM `spell_scripts` WHERE `id`=51592 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (51592,0,18,0,0,0);
-- Warrior's Wrath
DELETE FROM `spell_scripts` WHERE `id`=21977 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (21977,0,15,21887,0,1);
-- Dispelling Analysis
DELETE FROM `spell_scripts` WHERE `id`=37028 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (37028,0,14,36904,0,0);
-- Despawn Horse
DELETE FROM `spell_scripts` WHERE `id`=52267 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (52267,0,18,0,0,0);
-- Translocate
DELETE FROM `spell_scripts` WHERE `id` IN (25140,25143,25650,25652,29128,29129,35376,35727) AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES
(25140,0,15,32571,2,0),
(25143,0,15,32572,2,0),
(25650,0,15,30140,2,0),
(25652,0,15,30141,2,0),
(29128,0,15,32568,2,0),
(29129,0,15,32569,2,0),
(35376,0,15,25649,2,0),
(35727,0,15,35730,2,0);
-- Tidal Surge
DELETE FROM `spell_scripts` WHERE `id`=38358 AND `effIndex`=1;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (38358,1,15,38353,0,1);
-- Draw Soul
DELETE FROM `spell_scripts` WHERE `id`=40904 AND `effIndex`=1;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (40904,1,15,40903,3,1);
-- Force Cast - Portal Effect: Sunwell Isle
DELETE FROM `spell_scripts` WHERE `id`=44876 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (44876,0,15,44870,2,1);
-- Stomp
DELETE FROM `spell_scripts` WHERE `id`=45185 AND `effIndex`=2;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (45185,2,14,46394,0,0);
-- Negative Energy
DELETE FROM `spell_scripts` WHERE `id`=46289 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (46289,0,15,46285,0,1);
-- Sky Darkener Assault
DELETE FROM `spell_scripts` WHERE `id`=52124 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (52124,0,15,52125,0,0);
-- Gigantic Feast
DELETE FROM `spell_scripts` WHERE `id`=58466 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (58466,0,15,58648,2,1);
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (58466,0,15,58467,2,1);
-- Small Feast
DELETE FROM `spell_scripts` WHERE `id`=58475 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (58475,0,15,58648,2,1);
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (58475,0,15,58477,2,1);
-- Great Feast
DELETE FROM `spell_scripts` WHERE `id`=57337 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (57337,0,15,58067,2,1);
-- Fish Fest
DELETE FROM `spell_scripts` WHERE `id`=57397 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (57397,0,15,58648,2,1);
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (57397,0,15,57398,2,1);
-- Ghoul Explode
DELETE FROM `spell_scripts` WHERE `id`=67751 AND `effIndex`=1;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (67751,1,15,67729,2,0);
-- Dreaming Glory
DELETE FROM `spell_scripts` WHERE `id`=28698 AND `effIndex`=0;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`command`,`datalong`,`datalong2`,`dataint`) VALUES (28698,0,15,28694,2,1);

UPDATE `creature_template` SET `faction_A`=103,`faction_H`=103 WHERE `entry`=30616