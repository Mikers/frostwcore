SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for pet_spell_bonus_data
-- ----------------------------
DROP TABLE IF EXISTS `pet_spell_bonus_data`;
CREATE TABLE `pet_spell_bonus_data` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `master_direct_damage` float NOT NULL DEFAULT '0',
  `pet_direct_damage` float NOT NULL DEFAULT '0',
  `master_dot_damage` float NOT NULL DEFAULT '0',
  `pet_dot_damage` float NOT NULL DEFAULT '0',
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53532','0.07','0','0','0','Swipe - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('50256','0.07','0','0','0','Swipe - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('52474','0.07','0','0','0','Bite - Rank 11');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('17253','0.07','0','0','0','Bite - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('52473','0.07','0','0','0','Bite - Rank 10');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('27050','0.07','0','0','0','Bite - Rank 9');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('17261','0.07','0','0','0','Bite - Rank 8');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('17260','0.07','0','0','0','Bite - Rank 7');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('17259','0.07','0','0','0','Bite - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('17258','0.07','0','0','0','Bite - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('17257','0.07','0','0','0','Bite - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('17256','0.07','0','0','0','Bite - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('17255','0.07','0','0','0','Bite - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('52472','0.07','0','0','0','Claw - Rank 11');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('52471','0.07','0','0','0','Claw - Rank 10');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('27049','0.07','0','0','0','Claw - Rank 9');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('3009','0.07','0','0','0','Claw - Rank 8');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('3010','0.07','0','0','0','Claw - Rank 7');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('16832','0.07','0','0','0','Claw - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('16831','0.07','0','0','0','Claw - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('16830','0.07','0','0','0','Claw - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('16829','0.07','0','0','0','Claw - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('16828','0.07','0','0','0','Claw - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('16827','0.07','0','0','0','Claw - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53582','0.07','0','0','0','Savage Rend - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53581','0.07','0','0','0','Savage Rend - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53580','0.07','0','0','0','Savage Rend - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53579','0.07','0','0','0','Savage Rend - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53578','0.07','0','0','0','Savage Rend - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('50498','0.07','0','0','0','Savage Rend - Trigger');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('50871','0.07','0','0','0','Savage Rend - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55499','0.07','0','0','0','Monstrous Bite - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55498','0.07','0','0','0','Monstrous Bite - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55497','0.07','0','0','0','Monstrous Bite - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55496','0.07','0','0','0','Monstrous Bite - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55495','0.07','0','0','0','Monstrous Bite - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('54680','0.07','0','0','0','Monstrous Bite - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53533','0.07','0','0','0','Swipe - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53529','0.07','0','0','0','Swipe - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53528','0.07','0','0','0','Swipe - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53526','0.07','0','0','0','Swipe - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('50519','0.07','0','0','0','Sonic Blast - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53564','0.07','0','0','0','Sonic Blast - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53565','0.07','0','0','0','Sonic Blast - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53566','0.07','0','0','0','Sonic Blast - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53567','0.07','0','0','0','Sonic Blast - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('50541','0.07','0','0','0','Snatch - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53537','0.07','0','0','0','Snatch - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53538','0.07','0','0','0','Snatch - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53540','0.07','0','0','0','Snatch - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53542','0.07','0','0','0','Snatch - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53543','0.07','0','0','0','Snatch - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('35290','0.07','0','0','0','Gore - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('35291','0.07','0','0','0','Gore - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('35292','0.07','0','0','0','Gore - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('35293','0.07','0','0','0','Gore - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('35294','0.07','0','0','0','Gore - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('35295','0.07','0','0','0','Gore - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('24423','0.07','0','0','0','Demoralizing Screech - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('24577','0.07','0','0','0','Demoralizing Screech - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('24578','0.07','0','0','0','Demoralizing Screech - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('24579','0.07','0','0','0','Demoralizing Screech - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('27051','0.07','0','0','0','Demoralizing Screech - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55487','0.07','0','0','0','Demoralizing Screech - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('59881','0','0','0.07','0','Rake - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('59882','0','0','0.07','0','Rake - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('59883','0','0','0.07','0','Rake - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('59884','0','0','0.07','0','Rake - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('59885','0','0','0.07','0','Rake - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('59886','0','0','0.07','0','Rake - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('54644','0.07','0','0','0','Froststorm Breath - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55488','0.07','0','0','0','Froststorm Breath - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55489','0.07','0','0','0','Froststorm Breath - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55490','0.07','0','0','0','Froststorm Breath - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55491','0.07','0','0','0','Froststorm Breath - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55492','0.07','0','0','0','Froststorm Breath - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('58604','0.07','0','0','0','Lava Breath - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('58607','0.07','0','0','0','Lava Breath - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('58608','0.07','0','0','0','Lava Breath - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('58609','0.07','0','0','0','Lava Breath - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('58610','0.07','0','0','0','Lava Breath - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('58611','0.07','0','0','0','Lava Breath - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('50245','0','0','0.07','0','Pin - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53544','0','0','0.07','0','Pin - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53545','0','0','0.07','0','Pin - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53546','0','0','0.07','0','Pin - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53547','0','0','0.07','0','Pin - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53548','0','0','0.07','0','Pin - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('50433','0.07','0','0','0','Bad Attitude - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('52395','0.07','0','0','0','Bad Attitude - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('52396','0.07','0','0','0','Bad Attitude - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('52397','0.07','0','0','0','Bad Attitude - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('52398','0.07','0','0','0','Bad Attitude - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('52399','0.07','0','0','0','Bad Attitude - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('34889','0.07','0','0.03','0','Fire Breath - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('35323','0.07','0','0.03','0','Fire Breath - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55482','0.07','0','0.03','0','Fire Breath - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55483','0.07','0','0.03','0','Fire Breath - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55484','0.07','0','0.03','0','Fire Breath - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55485','0.07','0','0.03','0','Fire Breath - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('49966','0.07','0','0','0','Smack - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('49967','0.07','0','0','0','Smack - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('49968','0.07','0','0','0','Smack - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('49969','0.07','0','0','0','Smack - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('49970','0.07','0','0','0','Smack - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('49971','0.07','0','0','0','Smack - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('49972','0.07','0','0','0','Smack - Rank 7');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('49973','0.07','0','0','0','Smack - Rank 8');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('49974','0.07','0','0','0','Smack - Rank 9');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('52475','0.07','0','0','0','Smack - Rank 10');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('52476','0.07','0','0','0','Smack - Rank 11');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('50271','0.07','0','0','0','Tendon Rip - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53571','0.07','0','0','0','Tendon Rip - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53572','0.07','0','0','0','Tendon Rip - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53573','0.07','0','0','0','Tendon Rip - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53574','0.07','0','0','0','Tendon Rip - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53575','0.07','0','0','0','Tendon Rip - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('50518','0.07','0','0','0','Ravage - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53558','0.07','0','0','0','Ravage - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53559','0.07','0','0','0','Ravage - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53560','0.07','0','0','0','Ravage - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53561','0.07','0','0','0','Ravage - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53562','0.07','0','0','0','Ravage - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('57386','0.07','0','0','0','Stampede - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('57389','0.07','0','0','0','Stampede - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('57390','0.07','0','0','0','Stampede - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('57391','0.07','0','0','0','Stampede - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('57392','0.07','0','0','0','Stampede - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('57393','0.07','0','0','0','Stampede - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('24640','0','0','0.07','0','Scorpid Poison - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('24583','0','0','0.07','0','Scorpid Poison - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('24586','0','0','0.07','0','Scorpid Poison - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('24587','0','0','0.07','0','Scorpid Poison - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('27060','0','0','0.07','0','Scorpid Poison - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55728','0','0','0.07','0','Scorpid Poison - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('35387','0','0','0.07','0','Poison Spit - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('35389','0','0','0.07','0','Poison Spit - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('35392','0','0','0.07','0','Poison Spit - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55555','0','0','0.07','0','Poison Spit - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55556','0','0','0.07','0','Poison Spit - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55557','0','0','0.07','0','Poison Spit - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('61193','0.07','0','0','0','Spirit Strike - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('61194','0.07','0','0','0','Spirit Strike - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('61195','0.07','0','0','0','Spirit Strike - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('61196','0.07','0','0','0','Spirit Strike - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('61197','0.07','0','0','0','Spirit Strike - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('61198','0.07','0','0','0','Spirit Strike - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('50274','0.07','0','0','0','Spore Cloud - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53593','0.07','0','0','0','Spore Cloud - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53594','0.07','0','0','0','Spore Cloud - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53596','0.07','0','0','0','Spore Cloud - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53597','0.07','0','0','0','Spore Cloud - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('53598','0.07','0','0','0','Spore Cloud - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('56626','0.07','0','0','0','Sting - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('56627','0.07','0','0','0','Sting - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('56628','0.07','0','0','0','Sting - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('56629','0.07','0','0','0','Sting - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('56630','0.07','0','0','0','Sting - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('56631','0.07','0','0','0','Sting - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('24844','0.07','0','0','0','Lightning Breath - Rank 1');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('25008','0.07','0','0','0','Lightning Breath - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('25009','0.07','0','0','0','Lightning Breath - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('25010','0.07','0','0','0','Lightning Breath - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('25011','0.07','0','0','0','Lightning Breath - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('25012','0.07','0','0','0','Lightning Breath - Rank 6');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55749','0.07','0','0','0','Acid Spit - Rank 1 ');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55750','0.07','0','0','0','Acid Spit - Rank 2');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55751','0.07','0','0','0','Acid Spit - Rank 3');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55752','0.07','0','0','0','Acid Spit - Rank 4');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55753','0.07','0','0','0','Acid Spit - Rank 5');
insert into `pet_spell_bonus_data` (`entry`, `master_direct_damage`, `pet_direct_damage`, `master_dot_damage`, `pet_dot_damage`, `comments`) values('55754','0.07','0','0','0','Acid Spit - Rank 6');
