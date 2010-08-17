REPLACE INTO creature_ai_scripts VALUES
( 4041901, 40419, 0, 0, 100, 31, 2000, 2000, 5000, 5000, 11, 15284, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Assaulter Cleave'),
( 4041902, 40419, 0, 0, 100, 11, 5000, 5000, 10000, 10000, 11, 75417, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Assaulter Shockwave 1'),
( 4041903, 40419, 0, 0, 100, 21, 5000, 5000, 10000, 10000, 11, 75418, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Assaulter Shockwave 2'),
( 4042301, 40423, 0, 0, 100, 31, 1000, 1000, 7000, 7000, 11, 13737, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Commander Mortal Strike'),
( 4042302, 40423, 4, 0, 100, 31, 0, 0, 0, 0, 11, 75414, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Commander Rallying Shout'),
( 4041701, 40417, 0, 0, 100, 31, 3000, 3000, 15000, 15000, 11, 75413, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Invoker Flame Wave'),
( 4041702, 40417, 0, 0, 100, 11, 1000, 1000, 5000, 5000, 11, 75412, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Invoker Scorch'),
( 4041703, 40417, 0, 0, 100, 21, 1000, 1000, 5000, 5000, 11, 75419, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Invoker Scorch'),
( 4042101, 40421, 0, 0, 100, 31, 1000, 1000, 3000, 3000, 11, 15621, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Elite Skull Crack');

REPLACE INTO instance_template VALUES (724, 0, 3273, 534, 89, NULL, 'instance_ruby_sanctum', 1);

REPLACE INTO script_texts (`entry`, `content_default`, `npc_entry`, `content_loc3`, `sound`, `type`, `language`) VALUES
('-1752008', '', '0', 'Help I\'m caught in that tree! Help me!', '17490', '1', '7'),
('-1752009', '', '0', 'Thank you', '17491', '1', '7'),
('-1752010', '', '0', 'We believed the Sanctum is well appreciated but this type of attack we were not prepared ...', '17492', '0', '7'),
('-1752011', '', '0', 'The Black Dragonkin appeared from nowhere and attacked us to respond before we could ...', '17493', '0', '7'),
('-1752012', '', '0', 'We had no chance ... While my brothers died, I could retire here and the entrance block.', '17494', '0', '7'),
('-1752013', '', '0', 'They slaughtered us with cold efficiency ... But their wares goal seemed to be the eggs which are located in the Sanctum.', '17495', '0', '7'),
('-1752014', '', '0', 'The commander of ground troops is a cruel beast called Zarithrian. But I fear greater powers are at work ...', '17496', '0', '7'),
('-1752015', '', '0', 'I saw in their attack shortly their true leader ... a terrible twilight adult dragon.', '17497', '0', '7'),
('-1752016', '', '0', 'I know their exact plans but I know one thing: They may not be successful!', '17498', '0', '7'),
('-1752001', 'Ah, the entertainment has arrived.', '0', 'Ahh ... The entertainment has arrived!', '17520', '1', '7'),
('-1752002', 'Baltharus leaves nobody alive!', '0', 'Baltharus leaves no one alive!', '17521', '1', '7'),
('-1752003', 'This world has enough heroes. ', '0', 'This world has enough heroes!', '17522', '1', '7'),
('-1752004', 'I.. ... Do not saw that coming ...', '0', ' ... I ... .. do not see ...', '17523', '1', '7'),
('-1752005', 'Twice the pain and half the fun.', '0', 'Double pain, half as much fun!', '17524', '1', '7'),
('-1752006', '', '0', 'your power disappears and the Ancient! Balt follows her to your friends!', '17525', '1', '7'),
('-1752017', 'Has chosen Alexstrasza capable allies ... A pity that I must END YOU!', '0', 'Alextrasza has enabled allies ... Too bad that here with you ENDS!', '17512', '1', '7'),
('-1752018', 'You thought you stood a chance?', '0', 'you thought there could you? ', '17513', '1', '7'),
('-1752019', 'It\'s for the best.', '0', 'It is for your benefit.', '17514', '1', '7'),
('-1752020', 'HALION! I. ..', '0', 'HALION I ...', '17515', '1', '7'),
('-1752021', 'Turn them to ashes, minions!', '0', 'incinerate them, lackeys!', '17516', '1', '7'),
('-1752022', 'You will sssuffer for this intrusion! ', '0', ' for this intrusion you will suffer! ', '17528', '1', '7'),
('-1752023', 'As it should be ...', '0', ' How to ...', '17529', '1', '7'),
('-1752024', 'Halion will be pleased', '0', 'Halion pleased to be ...', '17530', '1', '7'),
('-1752025', 'HHrr ... Grr ..', '0', 'HHrr ... Grr ..', '17531', '1', '7'),
('-1752026', 'Burn in the master\'s flame!', '0', 'fire in the flame of the master!', '17532', '1', '7'),
('-1752027', '', '0', 'annoying insects! You\'re too late! The Ruby Sanctum is lost ...', '17499', '1', '7'),
('-1752028', '', '0', 'Your world is in the balance. You all will be witnesses of the beginning of a new age of destruction', '17500', '1', '7'),
('-1752029', '', '0', 'Another hero is gone!', '17501', '1', '7'),
('-1752030', '', '0', 'Hrrhahaha!', '17502', '1', '7'),
('-1752031', '', '0', 'Enjoy your victory, mortals for it was your Last! On the return of the master will burn this world ...', '17499', '1', '7'),
('-1752032', '', '0', 'Not good enough.', '17504', '1', '7'),
('-1752033', '', '0', 'Burn The Sky!', '17505', '1', '7'),
('-1752033', '', '0', 'Beware the shadows!', '17506', '1', '7'),
('-1752033', '', '0', 'You will find only in the realm of twilight suffering. Come in if you dare!', '17507', '1', '7'),
('-1752033', '', '0', 'I am the light and darkness. Tremble mortals before the herald Deathwing!', '17508', '1', '7');

UPDATE `creature_template` SET `ScriptName` = 'boss_baltharus' WHERE `entry` = '39751';
UPDATE `creature_template` SET `ScriptName` = 'boss_baltharus_clone' WHERE `entry` = '39899';
UPDATE `creature_template` SET `ScriptName` = 'npc_xerestrasza' WHERE `entry` = '40429';
UPDATE `creature_template` SET `ScriptName` = 'boss_zarithrian' WHERE `entry` = '39746';
UPDATE `creature_template` SET `ScriptName` = 'boss_ragefire' WHERE `entry` = '39747';
UPDATE `creature_template` SET `ScriptName` = 'boss_halion' WHERE `entry`= '39863';
UPDATE `creature_template` SET `ScriptName` = 'boss_twilight_halion' WHERE `entry` = '40142';
UPDATE `creature_template` SET `ScriptName` = 'npc_onyx_flamecaller' WHERE `entry` = '39814';
UPDATE `gameobject_template` SET `ScriptName` = 'go_firefield' WHERE `entry` = '203005';

DELETE FROM creature WHERE `id`=39863 and `map`=724;
INSERT INTO creature VALUES (null,39863,724,15,1,0,0,3144.93,527.233,72.8887,0.110395,300,0,0,11156000,0,0,0);