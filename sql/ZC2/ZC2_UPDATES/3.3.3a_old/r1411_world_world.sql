-- Summon Novos
UPDATE creature_template SET mindmg = 400, maxdmg = 600, attackpower = 400, dmg_multiplier = 2 WHERE entry = 27598;
UPDATE gameobject_template set data17 = 0 where entry = 193908; -- Exit portal