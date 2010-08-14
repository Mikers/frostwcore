#Cleanup
UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (38548,37955,36626,37813,36855,36678,37970,37972,37973,36853,36789,36597,36627,36612,38955,38163,36508,36672,38711,37697,36633,36609,37695,38757,36701,36897,36899,36725,37011,36724,37012,37007,36811,36807,36829,36844,36808,38135,37949,38222,37868,36791,37863,38568,37886,37934,37985,37945,37033,37030,37027,37004,37021,37144,36998,37035,37017,37026,37016,37148,37003,37544,37546,37545,37032,37230,37031,37028);

# GameObject
UPDATE `gameobject_template` SET `ScriptName` = 'icecrown_teleporter' WHERE `entry` IN (202223,202235,202242,202243,202244,202245,202246);
UPDATE `gameobject_template` SET `flags` = 32 WHERE `entry` = 202223;
UPDATE `gameobject_template` SET `flags` = 32 WHERE `entry` = 202242;

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
UPDATE `creature_template` SET `ScriptName`='npc_tirion_icc' WHERE `entry`='38995';
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
UPDATE `creature_template` SET `ScriptName`='npc_icecrown_trash' WHERE `entry` IN (37949,38135,36808,36844,36829,36807,36811,37007,37012,36724,37011,36725,37033,37030,37027,37004,37021,37144,36998,37035,37017,37026,37016,37148,37003,37544,37546,37545,37032,37230,37031,37028);
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = '14', `ScriptName`='npc_sticky_ooze' WHERE `entry`= 37006;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = '14', `ScriptName`='npc_ooze_stalker' WHERE `entry` IN (37986,37013);
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = '14', `ScriptName`='npc_ooze_explode_stalker' WHERE `entry` = 38107;
UPDATE `creature_template` SET `ScriptName`='npc_vile_gas_stalker' WHERE `entry`= 38548;

# Other
UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35', `unit_flags` = '8', `type_flags` = '67113038' WHERE `entry` IN(36789,10067,10068,10069);
UPDATE `creature_template` set `minlevel` = 82,`maxlevel` = 82,`faction_A` = 14,`Faction_H` = 14,`unit_flags` = 2 WHERE `entry` = 36672;
UPDATE `creature_template` SET `VehicleId` = 639 WHERE `entry` IN (37813,13106,13107,13108);
UPDATE `creature_template` SET `vehicleId` = 318 WHERE `entry` = 36609;

# Instance
UPDATE `instance_template` SET `script`='instance_icecrown_citadel' WHERE `map` = 631;

# Phase Mask

UPDATE `gameobject` SET `phaseMask` = '1' WHERE `gameobject`.`id` IN (202242,202243,202244,202245,202235,202223,202246);

# Extra Flag

UPDATE `creature_template` SET  `flags_extra` = 2 WHERE `entry` = 36672;

# Mechanic Immune Mask

UPDATE `creature_template` SET `mechanic_immune_mask` = 634339327 WHERE `entry` = 36855;

# Creature loot template

DELETE FROM creature_loot_template WHERE item = 49426 AND entry IN
(SELECT id FROM creature WHERE map = 631);

# Creature addon template

DELETE FROM `creature_template_addon` WHERE `entry` = 37813;

INSERT INTO creature_template_addon
   (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`)
VALUES
   (37813, 0, 0, 0, 1, 0, '72242 0');

# Conditions

DELETE FROM `conditions` WHERE `SourceEntry` IN (69508,69783,69248,69240);

INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`) VALUES ('13','0','69783','0','18','1','37013','0');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`) VALUES ('13','0','69508','0','18','1','37986','0');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`) VALUES ('13','0','69248','0','18','1','38548','0');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`) VALUES ('13','0','69240','0','18','1','38548','0');