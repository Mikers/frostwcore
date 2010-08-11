-- ----------------------------
-- Table structure for mmotop
-- ----------------------------
DROP TABLE `mmotop`;
CREATE TABLE `mmotop` (
  `vote_id` int(11) unsigned NOT NULL default '0',
  `vote_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `vote_ip` text NOT NULL,
  `vote_char_name` text character set utf8 NOT NULL,
  `vote_count` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ALTER
ALTER TABLE account
  ADD COLUMN `vote_count` int(11) unsigned NOT NULL default '0';
 
