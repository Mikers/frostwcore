REPLACE INTO `trinity_string` VALUES ('3', '[SERVER] %s', null, null, null, null, null, null, null, '[СЕРВЕР] %s');
REPLACE INTO `trinity_string` VALUES ('4', '|cffff0000[Event Message]: %s|r', null, null, null, null, null, null, null, '|cffff0000[Сообщение события]: %s|r');
REPLACE INTO `trinity_string` VALUES ('6', 'There is no such command', null, null, null, null, null, null, null, 'Нет такой комманды');
REPLACE INTO `trinity_string` VALUES ('717', '|cffff0000[BG Queue Announcer]:|r %s -- [%u-%u] Started!|r', null, null, null, null, null, null, null, '|cffff0000[Анонс поля боя]:|r %s -- [%u-%u] Started!|r');
REPLACE INTO `trinity_string` VALUES ('719', '|cffff0000[Arena Queue Announcer]:|r All Arenas -- Left : %ux%u : %u|r', null, null, null, null, null, null, null, '|cffff0000[Арена]:|r All Arenas -- Left : %ux%u : %u|r');
REPLACE INTO `trinity_string` VALUES ('718', '|cffff0000[Arena Queue Announcer]:|r All Arenas -- Joined : %ux%u : %u|r', null, null, null, null, null, null, null, '|cffff0000[Арена]:|r All Arenas -- Joined : %ux%u : %u|r');
REPLACE INTO `trinity_string` VALUES ('787', '|cffffff00[|c1f40af20Announce by|r |cffff0000%s|cffffff00]:|r %s|r', null, null, null, null, null, null, null, '|cffffff00[|c1f40af20Сообщение от|r |cffff0000%s|cffffff00]:|r %s|r');
REPLACE INTO `trinity_string` VALUES ('810', '|Hplayer:$N|h[$N]|h has earned the achievement $a!', null, null, null, null, null, null, null, '|Hplayer:$N|h[$N]|h заработал достижение $a!');
REPLACE INTO `trinity_string` VALUES ('6615', '|cffffff00[|c1f40af20GM Announce by|r |cffff0000%s|cffffff00]:|r %s|r', null, null, null, null, null, null, null, '|cffffff00[|c1f40af20GM Сообщение от|r |cffff0000%s|cffffff00]:|r %s|r');
REPLACE INTO `trinity_string` VALUES ('11000', '|cffffff00[|c00077766Autobroadcast|cffffff00]: |cFFF222FF%s|r', null, null, null, null, null, null, null, '|cffff0000[Авто-новость]: %s|r');
-- Localizations
UPDATE trinity_string SET content_default = 'Online players: %u (max: %u)', content_loc8 = 'Игроков онлайн: %u (макс.: %u)' WHERE entry = 60;
UPDATE trinity_string SET content_default = 'Server uptime: %s', content_loc8 = 'Сервер включен: %s' WHERE entry = 13;
