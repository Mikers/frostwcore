DELETE FROM creature_loot_template WHERE item = 49426 AND entry IN
(SELECT id FROM creature WHERE map = 631);