DROP TABLE IF EXISTS `arena_team_history`;
CREATE TABLE `arena_team_history` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identifier',
  `winner_team` int(10) unsigned NOT NULL default '0',
  `winner_rating` int(10) unsigned NOT NULL default '0',
  `loser_team` int(10) unsigned NOT NULL default '0',
  `loser_rating` int(10) unsigned NOT NULL default '0',
  `change` int(10) unsigned NOT NULL default '0',
  `type` int(2) unsigned NOT NULL default '0',
  `map` int(10) unsigned NOT NULL default '0',
  `play_time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1669 DEFAULT CHARSET=utf8;