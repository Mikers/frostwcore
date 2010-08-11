-- Delete Lich King achievements from characters
DELETE FROM `character_achievement` WHERE `achievement` IN (4583,4601,4621,4581,4622,4576,4530,4597,4584);
DELETE FROM `character_achievement_progress` WHERE `criteria` IN (4583,4601,4621,4581,4622,4576,4530,4597,4584);