﻿

insert into `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) values('11002','|cff00ff00Лотерея состоялась. Выигрышный номер:|r|cffff00ff %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert into `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) values('11003','|cff00ff00Победителей:|r|cffff00ff %u|cff00ff00. Выигрыш:|r|cffff00ff %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert into `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) values('11004','|cff00ff00Джекпот следующего розыгрыша:|r|cffff00ff %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

insert into `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `world_event`) values('150','2010-08-05 21:00:00','2020-08-05 12:00:00','1440','1','0','Lottery Event','0');

insert into `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) values('0','-1999991','Your application for the Lottery is accepted. Good Luck!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','lottery');
insert into `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) values('0','-1999990','Number must be between 1 and 100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','lottery');
