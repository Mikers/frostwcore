/*Spirit healer FIX */
UPDATE creature_template SET npcflag=npcflag|32768 WHERE entry   IN (31841,31842);
