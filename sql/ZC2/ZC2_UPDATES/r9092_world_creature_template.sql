/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `custom_npc_tele_category`;
-- ----------------------------
-- Table structure for custom_npc_tele_category
-- ----------------------------
CREATE TABLE `custom_npc_tele_category` (
  `id` int(6) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `flag` tinyint(3) unsigned NOT NULL default '0',
  `data0` bigint(20) unsigned NOT NULL default '0',
  `data1` int(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `custom_npc_tele_category` VALUES ('1', '1. Города', '0', '1', '0');
INSERT INTO `custom_npc_tele_category` VALUES ('2', '1. Города', '0', '2', '0');
INSERT INTO `custom_npc_tele_category` VALUES ('3', '2. Подземелья уровня 10-40', '0', '0', '0');
INSERT INTO `custom_npc_tele_category` VALUES ('4', '3. Подземелья уровня 41-69', '0', '0', '0');
INSERT INTO `custom_npc_tele_category` VALUES ('5', '4. Подземелья уровня 70-80', '0', '0', '0');
INSERT INTO `custom_npc_tele_category` VALUES ('6', '5. Рейдовые подземелья', '0', '0', '0');
INSERT INTO `custom_npc_tele_category` VALUES ('7', '6. Арены', '0', '0', '0');

DROP TABLE IF EXISTS `custom_npc_tele_destination`;
-- ----------------------------
-- Table structure for custom_npc_tele_destination
-- ----------------------------
CREATE TABLE `custom_npc_tele_destination` (
  `id` int(6) unsigned NOT NULL auto_increment,
  `name` char(100) NOT NULL default '',
  `pos_X` float NOT NULL default '0',
  `pos_Y` float NOT NULL default '0',
  `pos_Z` float NOT NULL default '0',
  `map` smallint(5) unsigned NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `level` tinyint(3) unsigned NOT NULL default '0',
  `cost` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `custom_npc_tele_destination` VALUES ('1', '01. Огненная пропасть (13-20)', '1810.38', '-4408.05', '-18.8377', '1', '5.18594', '8', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('2', '02. Пещеры стенаний (17-23)', '-722.53', '-2226.3', '16.94', '1', '2.71', '12', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('3', '03. Мертвые копи (17-23)', '-11212', '1658.58', '25.67', '0', '1.45', '12', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('4', '04. Крепость Темного Клыка (18-23)', '-240.11', '1548.83', '76.89', '0', '1.13981', '13', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('5', '05. Непроглядная Пучина (22-27)', '4249.99', '740.1', '-25.67', '1', '1.34062', '17', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('6', '06. Тюрьма Штормграда (23-27)', '-8774.25', '838.965', '91.9284', '0', '0.689341', '18', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('7', '07. Лабиринты Иглошкурых (21-31)', '-4484.04', '-1739.4', '86.47', '1', '1.23', '16', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('8', '08. Гномреган (25-32)', '-5163.54', '925.42', '257.17', '0', '1.57423', '20', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('9', '09. Монастырь Алого Ордена: Кладбище  (29-35)', '2913.01', '-802.75', '160.33', '0', '0.339072', '25', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('10', '10. Монастырь Алого Ордена: Библиотека (31-35)', '2872.08', '-820.06', '160.33', '0', '3.46299', '26', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('11', '11. Курганы Иглошкурых (33-37)', '-4645.08', '-2470.85', '85.53', '1', '4.39', '28', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('12', '12. Монастырь Алого Ордена: Оружейная (33-37)', '2885.54', '-825.1', '160.33', '0', '5.12803', '28', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('13', '13. Монастырь Алого Ордена: Собор (37-44)', '2907.48', '-816.101', '160.33', '0', '5.0652', '32', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('14', '14. Ульдаман (37-44)', '-6119.7', '-2957.3', '204.11', '0', '0.03', '32', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('15', '01. Зул\'Фаррак (42-46)', '-6839.39', '-2911.03', '8.87', '1', '0.41', '37', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('16', '02. Мародон (42-52)', '-1433.33', '2955.34', '96.21', '1', '4.82', '37', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('17', '03. Храм Атал\'Хаккара  (47-52)', '-10346.9', '-3851.9', '-43.41', '0', '6.09', '42', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('18', '04. Глубины Черной Горы (48-60)', '-7179.33', '-918.7', '165.49', '0', '4.73078', '43', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('19', '05. Забытй город: Восток  (55-60)', '-3981.41', '781.85', '161.004', '1', '4.6741', '50', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('20', '06. Забытй город: Запад  (57-60)', '-3829.17', '1250.51', '160.22', '1', '3.09938', '52', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('21', '07. Забытй город: Север  (57-60)', '-3520.64', '1077.71', '161.13', '1', '4.68176', '52', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('22', '08. Стратхольм  (56-61)', '3263.54', '-3379.46', '143.59', '0', '0', '51', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('23', '09. Некроситет (56-61)', '1219.01', '-2604.66', '85.61', '0', '0.5', '51', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('24', '10. Бастионы Адского Пламени (60-62)', '-359.69', '3069.36', '-15.1135', '530', '1.8637', '55', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('25', '11. Кузня Крови (61-63)', '-300.137', '3160.08', '31.6914', '530', '2.25967', '56', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('26', '12. Узилище (62-64)', '721.256', '7008.33', '-73.4791', '530', '0.450804', '57', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('27', '13. Нижетопь (63-65)', '779.66', '6767.33', '-71.77', '530', '4.7', '58', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('28', '14. Гробницы Маны (64-66)', '-3104.17', '4945.52', '-101.507', '530', '0.054137', '59', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('29', '15. Аукенайские гробницы (65-67)', '-3362.04', '5209.85', '-101.05', '530', '1.52677', '60', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('30', '16. Старые предгорья Хилсбрада (66-68)', '-8367.11', '-4059.21', '-208.31', '1', '0.108172', '61', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('31', '17. Сетеккские залы (67-69)', '-3361.91', '4678.85', '-101.048', '530', '4.68897', '62', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('32', '18. Паровое подземелье (68-70)', '815.701', '6928.7', '-80.0444', '530', '1.46476', '63', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('33', '19. Темный лабиринт (69-70)', '-3627.03', '4942.75', '-101.049', '530', '3.12505', '64', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('34', '20. Разрушенные залы (69-70)', '-308.4', '3072.7', '-3.65004', '530', '1.75536', '64', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('35', '01. Черны топи (70)', '-8752.98', '-4205.76', '-209.5', '1', '2.23792', '65', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('36', '02. Механар (70)', '2880.38', '1562.57', '248.88', '530', '3.84869', '65', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('37', '03. Ботаника (70)', '3396.79', '1495.11', '179.56', '530', '5.68591', '65', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('38', '04. Аркатрац (70)', '3304.99', '1349.93', '502.29', '530', '4.99889', '65', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('39', '05. Терасса Магистров (70)', '12889', '-7320.27', '65.5023', '530', '4.43379', '65', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('40', '06. Крепость утгард (70-72)', '1224.31', '-4862.99', '41.2493', '571', '0.265729', '65', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('41', '07. Нексус (71-73)', '3880.71', '6984.41', '73.761', '571', '0.093386', '66', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('42', '08. Азжол-неруб (72-74)', '3692.49', '2157.36', '34.9193', '571', '2.54456', '67', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('43', '09. Ан\'кахет: Старое Королевство(73-75)', '3647.05', '2045.8', '1.78771', '571', '4.33625', '68', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('44', '10. Крепость Драк\'Тарон (74-76)', '4774.2', '-2032.44', '229.37', '571', '1.56251', '69', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('45', '11. Аметистовая Крепость (75-77)', '5695.6', '505.81', '652.68', '571', '4.11793', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('46', '12. Гундрак (76-78)', '6929.22', '-4443.09', '450.52', '571', '0.748567', '71', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('47', '13. Чертоги Камня (77-79)', '8923.25', '-1014.92', '1039.61', '571', '1.53846', '72', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('48', '14. Чертоги Молний (80)', '9128.79', '-1338.15', '1061.4', '571', '5.43122', '75', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('49', '15. Окулус (80)', '3879.32', '6984.34', '106.32', '571', '3.06023', '75', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('50', '16. Очищение Стратхольма (Culling/COS) (80)', '-8752.93', '-4444.03', '-199.009', '1', '4.34869', '75', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('51', '17. Вершина Утгард (80)', '1253.46', '-4853.82', '215.73', '571', '3.4309', '75', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('52', '18. Испытание Чемпиона (80)', '8575.03', '792.278', '558.514', '571', '3.16778', '75', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('53', '20. Кузни душ (80+)', '5672.19', '2002.17', '798.182', '571', '5.47579', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('54', '19. Яма Сарона (80+)', '5591.99', '2010.32', '798.182', '571', '3.92227', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('55', '21. Залы Отражений (80+)', '5629.33', '1986.66', '800.027', '571', '4.72024', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('56', '01. Пик Черной Горы (54-60) (10 man)', '-7535.43', '-1212.04', '285.45', '0', '5.29', '49', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('58', '03. Зул\'Гуруб (56-60+) (20 man)', '-11916.7', '-1212.82', '92.2868', '0', '4.6095', '50', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('59', '04. Огненные Недра (60+) (40 man)', '1121.45', '-454.317', '-101.33', '230', '3.5', '55', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('60', '05. Логово Крыла Тьмы (60+) (40 man)', '-7665.55', '-1102.49', '400.679', '469', '0', '60', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('61', '06. Руины Ан\'Киража (60+) (20 man)', '-8409.03', '1498.83', '27.3615', '1', '2.49757', '60', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('62', '07. Ан\'Кираж (60+) (40 man)', '-8245.84', '1983.74', '129.072', '1', '0.936195', '60', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('63', '08. Каражан (70+) (10 man)', '-11118.8', '-2010.84', '47.0807', '0', '0', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('64', '09. Логово Груула (70+) (25 man)', '3539.01', '5082.36', '1.69107', '530', '0', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('65', '10. Логово Магтеридона (70+) (25 man)', '-317.43', '3095.03', '-116.42', '530', '5.1927', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('66', '11. Зул\'Аман (70+) (10 man)', '6846.95', '-7954.5', '170.028', '530', '4.61501', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('67', '12. Змеиное святилище (70+) (25 man)', '795.188', '6865.64', '-64.8004', '530', '6.2096', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('68', '13. Око (70+) (25 man)', '3090.03', '1402.73', '188.81', '530', '4.60991', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('69', '14. Битва за гору Хиджал (70+) (25 man)', '-8184.08', '-4196.08', '-171.38', '1', '1.24845', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('70', '15. Черный храм (70+) (25 man)', '-3610.72', '324.988', '37.4', '530', '3.28298', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('71', '16. Плато солнечного колодца (70+) (25 man)', '12574.1', '-6774.81', '15.09', '530', '3.13788', '70', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('72', '17. Наксрамас (10 man & 25 man) (80+)', '3668.71', '-1262.45', '243.62', '571', '4.785', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('73', '18. Обсидиановое святилище (10 man & 25 man) (80+)', '3516.29', '269.49', '-114.15', '571', '3.19766', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('74', '19. Склеп Аркавона (10 man & 25 man) (80+)', '5478.16', '2840.41', '418.67', '571', '6.26748', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('75', '20. Око вечности(10 man & 25 man) (80+)', '3878.58', '6979.56', '152.04', '571', '2.70778', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('76', '21. Ульдуар (10 man & 25 man) (80+)', '9329.55', '-1114.16', '1245.14', '571', '6.24202', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('77', '22. Испытание крестоносца/чемпиона (10 man, 25 man & Heroic) (80+)', '8515.45', '728.919', '558.247', '571', '1.59726', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('78', '23. Логово Ониксии (10 man, 25 man & Heroic) (80+)', '-4707.44', '-3726.82', '54.6723', '1', '3.8', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('79', '24. Цитадель Ледяной Короны (10 man, 25 man & Heroic) 80 (80+)', '5790', '2071.47', '636.065', '571', '3.62348', '80', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('80', '1. Штормграде', '-8960.14', '516.266', '96.3568', '0', '0', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('81', '2. Стальгорн', '-4991.78', '-870.59', '496.98', '0', '5.30771', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('82', '3. Дарнас', '8781.82', '965.93', '30.23', '1', '0.240982', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('83', '4. Екзодар', '-4073.03', '-12020.4', '-1.47', '530', '0', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('84', '1. Оргриммар', '1377.78', '-4369.87', '26.0264', '1', '0.15315', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('85', '2. Громовой утёс', '-1290', '147.034', '129.682', '1', '4.919', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('86', '3. Подгород', '1642.13', '239.71', '62.5916', '0', '3.15534', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('87', '4. Луносвет', '9338.74', '-7277.27', '13.7895', '530', '0', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('88', '5. Шаттрат', '-1850.21', '5435.82', '-10.9614', '530', '3.40391', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('89', '6. Остров Кель\'Данас', '12947.4', '-6893.31', '5.68398', '530', '3.09154', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('90', '7. Даларан', '5807.67', '588.207', '660.93', '571', '1.70185', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('91', '5. Шаттрат', '-1850.21', '5435.82', '-10.9614', '530', '3.40391', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('92', '6. Остров Кель\'Данас', '12947.4', '-6893.31', '5.68398', '530', '3.09154', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('93', '7. Даларан', '5807.67', '588.207', '660.93', '571', '1.70185', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('94', '1. Арена гурубаши', '-13261.3', '168.294', '35.0792', '0', '1.00688', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('95', '2. Круг крови', '2839.44', '5930.17', '11.1002', '530', '3.16284', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('96', '3. Кольцо испытаний', '-1999.94', '6581.71', '11.32', '530', '2.3', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('97', '4. The Maul', '-3739.86', '1093.8', '131.968', '1', '0.155619', '0', '0');
INSERT INTO `custom_npc_tele_destination` VALUES ('98', '25. Рубиновое святилище (10 man/heroic & 25 man/heroic) (80+)', '3516.29', '269.49', '-114.15', '571', '3.19766', '80', '0');

DROP TABLE IF EXISTS `custom_npc_tele_association`;
-- ----------------------------
-- Table structure for custom_npc_tele_association
-- ----------------------------
CREATE TABLE `custom_npc_tele_association` (
  `cat_id` int(6) unsigned NOT NULL default '0',
  `dest_id` int(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`,`dest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `custom_npc_tele_association` VALUES ('1', '80');
INSERT INTO `custom_npc_tele_association` VALUES ('1', '81');
INSERT INTO `custom_npc_tele_association` VALUES ('1', '82');
INSERT INTO `custom_npc_tele_association` VALUES ('1', '83');
INSERT INTO `custom_npc_tele_association` VALUES ('1', '88');
INSERT INTO `custom_npc_tele_association` VALUES ('1', '89');
INSERT INTO `custom_npc_tele_association` VALUES ('1', '90');
INSERT INTO `custom_npc_tele_association` VALUES ('2', '84');
INSERT INTO `custom_npc_tele_association` VALUES ('2', '85');
INSERT INTO `custom_npc_tele_association` VALUES ('2', '86');
INSERT INTO `custom_npc_tele_association` VALUES ('2', '87');
INSERT INTO `custom_npc_tele_association` VALUES ('2', '91');
INSERT INTO `custom_npc_tele_association` VALUES ('2', '92');
INSERT INTO `custom_npc_tele_association` VALUES ('2', '93');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '1');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '2');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '3');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '4');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '5');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '6');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '7');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '8');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '9');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '10');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '11');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '12');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '13');
INSERT INTO `custom_npc_tele_association` VALUES ('3', '14');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '15');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '16');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '17');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '18');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '19');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '20');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '21');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '22');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '23');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '24');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '25');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '26');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '27');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '28');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '29');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '30');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '31');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '32');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '33');
INSERT INTO `custom_npc_tele_association` VALUES ('4', '34');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '35');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '36');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '37');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '38');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '39');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '40');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '41');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '42');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '43');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '44');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '45');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '46');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '47');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '48');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '49');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '50');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '51');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '52');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '53');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '54');
INSERT INTO `custom_npc_tele_association` VALUES ('5', '55');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '56');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '58');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '59');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '60');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '61');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '62');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '63');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '64');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '65');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '66');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '67');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '68');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '69');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '70');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '71');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '72');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '73');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '98');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '74');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '75');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '76');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '77');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '78');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '79');
INSERT INTO `custom_npc_tele_association` VALUES ('7', '94');
INSERT INTO `custom_npc_tele_association` VALUES ('7', '95');
INSERT INTO `custom_npc_tele_association` VALUES ('7', '96');
INSERT INTO `custom_npc_tele_association` VALUES ('7', '97');
INSERT INTO `custom_npc_tele_association` VALUES ('6', '98');

DELETE FROM creature_template WHERE `entry`=100000;
INSERT INTO `creature_template` VALUES ('100000', '0', '0', '0', '0', '0', '26789', '0', '0', '0', 'Lafain', 'Teleport Service', '', '0', '80', '80', '0', '35', '35', '1', '1', '1.14286', '0.75', '1', '1755', '1755', '0', '1504', '1', '1500', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_teleport', '0');

DELETE FROM npc_text WHERE `ID`=100000;
INSERT INTO `npc_text` VALUES ('100000', 'Choose your Category.', null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0');

DELETE FROM npc_text WHERE `ID`=100001;
INSERT INTO `npc_text` VALUES ('100001', 'Choose your Destination.', null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0');
