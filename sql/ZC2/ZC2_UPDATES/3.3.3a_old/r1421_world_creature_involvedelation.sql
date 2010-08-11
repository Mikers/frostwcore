-- Fix quest Additional Runecloth per i troll
DELETE FROM creature_involvedrelation WHERE id = 14727 AND quest = 7832;
DELETE FROM creature_questrelation WHERE id = 14727 AND quest = 7832;
INSERT INTO creature_involvedrelation VALUES
(14727, 7837);
INSERT INTO creature_questrelation VALUES
(14727, 7837);

