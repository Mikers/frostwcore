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
