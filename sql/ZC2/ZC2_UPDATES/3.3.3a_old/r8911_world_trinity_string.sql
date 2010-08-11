REPLACE INTO `trinity_string` VALUES ('756', 'Battle begins!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('757', '%s has successfully defended the fortress!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('758', '%s has taken over the fortress!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('759', 'The %s siege workshop has been damaged by the %s!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('760', 'The %s siege workshop has been destroyed by the %s!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('761', 'The %s tower has been damaged!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('762', 'The %s tower has been destroyed!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('763', 'Wintergrasp fortress is under attack!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('764', 'Wintergrasp is now under the control of the %s.', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('765', 'Wintergrasp timer set to %s.', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('766', 'Wintergrasp battle started.', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('767', 'Wintergrasp battle finished.', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('768', 'Wintergrasp info: %s controlled. Timer: %s. Wartime: %s. Number of Players: (Horde: %u, Alliance: %u)', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('769', 'Wintergrasp outdoorPvP is disabled.', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('770', 'Wintergrasp outdoorPvP is enabled.', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('771', 'You have reached Rank 1: Corporal', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('772', 'You have reached Rank 2: First Lieutenant', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('780', 'Before the Battle of  Wintergrasp left 30 minutes!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('781', 'Before the Battle of  Wintergrasp left 10 minutes!', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('782', 'The battle for Wintergrasp  has stopped! Not enough defenders. Wintergrasp Fortress remains  Attackers.', '', '', '', '', '', '', '', '');
REPLACE INTO `trinity_string` VALUES ('783', 'The battle for Wintergrasp  has stopped! Not enough attackers. Wintergrasp Fortress remains  Defenders.', '', '', '', '', '', '', '', '');

DELETE FROM `command` WHERE name IN ('wg','wg enable','wg start','wg status','wg stop','wg switch','wg timer');
INSERT INTO `command` VALUES ('wg', '3', 'Syntax: .wg $subcommand.');
INSERT INTO `command` VALUES ('wg enable', '3', 'Syntax: .wg enable [on/off] Enable/Disable Wintergrasp outdoorPvP.');
INSERT INTO `command` VALUES ('wg start', '3', 'Syntax: .wg start\r\nForce Wintergrasp battle start.');
INSERT INTO `command` VALUES ('wg status', '3', 'Syntax: .wg status\r\nWintergrasp info, defender, timer, wartime.');
INSERT INTO `command` VALUES ('wg stop', '3', 'Syntax: .wg stop\r\nForce Wintergrasp battle stop (No rewards).');
INSERT INTO `command` VALUES ('wg switch', '3', 'Syntax: .wg switch\r\nSwitchs Wintergrasp defender team.');
INSERT INTO `command` VALUES ('wg timer', '3', 'Syntax: .wg timer $minutes\r\nChange the current timer. Min value = 1, Max value 60 (Wartime), 1440 (Not Wartime)');

DELETE FROM gameobject WHERE id IN ('194323', '194162');

REPLACE INTO `spell_linked_spell` VALUES ('54640','54643','0','Defender\'s Portal Activate Proper Spell');

REPLACE INTO `spell_target_position` VALUES ('59096', '571', '4561.58', '2835.33', '389.79', '0.34');
REPLACE INTO `spell_target_position` VALUES ('60035', '571', '5325.06', '2843.36', '409.285', '3.20278');