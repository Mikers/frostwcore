-- Eliminata porta a Blood furnace
DELETE FROM gameobject WHERE id = 181819;
-- Alcuni mob senza lootid
UPDATE creature_template SET lootid = entry WHERE entry IN (26800, 26805, 27949, 26802, 26734, 26722, 26735, 26716, 26737, 26782, 26792, 28231, 26799, 26803, 27947, 26801, 26727, 26728, 26730 );
-- Fix Art of War
UPDATE spell_proc_event SET procFlags = 20, procEx = 2 WHERE entry = 53486;

