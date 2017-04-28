# ************************************************************
# Sequel Pro SQL dump
# バージョン 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# ホスト: 127.0.0.1 (MySQL 5.7.17)
# データベース: autotable
# 作成時刻: 2017-04-19 06:24:42 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# テーブルのダンプ T_APPLICATION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_APPLICATION`;

CREATE TABLE `T_APPLICATION` (
  `APPID` int(4) NOT NULL AUTO_INCREMENT,
  `APPNAME` varchar(100) NOT NULL,
  `APPDETAIL` varchar(250) NOT NULL,
  `DBDRIVER` varchar(250) NOT NULL,
  `DBURL` varchar(250) NOT NULL,
  `DBUSER` varchar(10) NOT NULL,
  `DBPASSWORD` varchar(10) NOT NULL,
  `DBSCHEMA` varchar(10) DEFAULT ' ',
  PRIMARY KEY (`APPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_APPLICATION` WRITE;
/*!40000 ALTER TABLE `T_APPLICATION` DISABLE KEYS */;

INSERT INTO `T_APPLICATION` (`APPID`, `APPNAME`, `APPDETAIL`, `DBDRIVER`, `DBURL`, `DBUSER`, `DBPASSWORD`, `DBSCHEMA`)
VALUES
	(676,'Yahoo路線','デモアプリ','com.mysql.jdbc.Driver','jdbc:mysql://mysqldocker:3306/appdb?useUnicode=true&characterEncoding=UTF-8','root','123456',''),
	(678,'当当网','DEMO用','com.mysql.jdbc.Driver','jdbc:mysql://mysqldocker:3306/appdb?useUnicode=true&characterEncoding=UTF-8','root','123456','');

/*!40000 ALTER TABLE `T_APPLICATION` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_CASEDETAIL
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_CASEDETAIL`;

CREATE TABLE `T_CASEDETAIL` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CASEID` int(4) NOT NULL,
  `SCENARIONO` int(4) NOT NULL,
  `SCENARIOID` int(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_CASEDETAIL` WRITE;
/*!40000 ALTER TABLE `T_CASEDETAIL` DISABLE KEYS */;

INSERT INTO `T_CASEDETAIL` (`ID`, `CASEID`, `SCENARIONO`, `SCENARIOID`)
VALUES
	(52,8,1,23),
	(53,8,2,24),
	(54,8,3,25),
	(55,8,4,26),
	(58,10,1,30),
	(59,10,2,31),
	(60,10,3,32),
	(61,10,4,32);

/*!40000 ALTER TABLE `T_CASEDETAIL` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_CASEMAIN
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_CASEMAIN`;

CREATE TABLE `T_CASEMAIN` (
  `CASEID` int(4) NOT NULL AUTO_INCREMENT,
  `CASENAME` varchar(100) DEFAULT NULL,
  `CASEDETAIL` varchar(250) DEFAULT NULL,
  `REVIEWKBN` char(1) NOT NULL,
  PRIMARY KEY (`CASEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_CASEMAIN` WRITE;
/*!40000 ALTER TABLE `T_CASEMAIN` DISABLE KEYS */;

INSERT INTO `T_CASEMAIN` (`CASEID`, `CASENAME`, `CASEDETAIL`, `REVIEWKBN`)
VALUES
	(8,'路線情報確認（東陽町から品川）','2016年10月21 10時05到着の東陽町から品川の路線情報を確認します。',''),
	(10,'确认特定书籍的价格','确认以下书籍的价格\n软件自动化测试开发\n测之重器——自动化测试框架搭建指南','');

/*!40000 ALTER TABLE `T_CASEMAIN` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_CASEPARAMVALUE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_CASEPARAMVALUE`;

CREATE TABLE `T_CASEPARAMVALUE` (
  `CASEID` int(4) NOT NULL,
  `CASEDETAILID` int(11) NOT NULL,
  `SCENARIOUK` int(4) NOT NULL,
  `ACTIONUK` int(10) NOT NULL,
  `PARAMTYPE` int(4) NOT NULL,
  `PARAMVALUE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CASEID`,`CASEDETAILID`,`SCENARIOUK`,`ACTIONUK`,`PARAMTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_CASEPARAMVALUE` WRITE;
/*!40000 ALTER TABLE `T_CASEPARAMVALUE` DISABLE KEYS */;

INSERT INTO `T_CASEPARAMVALUE` (`CASEID`, `CASEDETAILID`, `SCENARIOUK`, `ACTIONUK`, `PARAMTYPE`, `PARAMVALUE`)
VALUES
	(8,52,14,42,2,'cleartable.sql'),
	(8,52,15,42,2,'insert.sql'),
	(8,53,16,43,2,'http://transit.yahoo.co.jp/?c=0'),
	(8,54,17,44,2,'東陽町'),
	(8,54,17,45,2,'品川'),
	(8,54,17,46,2,'P_年'),
	(8,54,17,47,2,'12月'),
	(8,54,17,48,2,'22日'),
	(8,54,17,49,2,'10時'),
	(8,54,17,50,2,'05分'),
	(8,54,17,51,1,'到着'),
	(8,54,17,52,1,'現金（きっぷ）優先'),
	(8,54,18,54,2,'東陽町→品川'),
	(8,54,18,55,1,'乗換回数順'),
	(8,54,18,56,1,'ルート2'),
	(8,54,18,56,2,'（32分）'),
	(8,54,21,54,2,'東陽町→品川'),
	(8,54,21,55,1,'料金の安い順'),
	(8,54,21,56,1,'ルート3'),
	(8,54,21,56,2,'（32分）'),
	(8,55,19,57,2,'select * from APP_TABLE where id=5'),
	(8,55,20,57,2,'select * from APP_TABLE where id=1'),
	(10,58,27,64,2,'http://www.dangdang.com/'),
	(10,59,28,65,2,'自动化测试'),
	(10,59,29,67,1,'当当自营'),
	(10,60,30,68,1,'软件自动化测试开发'),
	(10,60,30,68,2,'¥46.60'),
	(10,61,30,68,1,'测之重器——自动化测试框架搭建指南'),
	(10,61,30,68,2,'¥42.60');

/*!40000 ALTER TABLE `T_CASEPARAMVALUE` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_CONFIG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_CONFIG`;

CREATE TABLE `T_CONFIG` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CONFIGTYPE` char(14) NOT NULL DEFAULT '',
  `CONFIGORDER` int(10) NOT NULL,
  `CONFIGNAME` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_CONFIG` WRITE;
/*!40000 ALTER TABLE `T_CONFIG` DISABLE KEYS */;

INSERT INTO `T_CONFIG` (`id`, `CONFIGTYPE`, `CONFIGORDER`, `CONFIGNAME`)
VALUES
	(1,'ActionList',1,'OpenURL'),
	(2,'ActionList',2,'Input'),
	(3,'ActionList',3,'Click'),
	(4,'ActionList',4,'Select'),
	(5,'ActionList',5,'Verify'),
	(6,'ActionList',6,'ExecSqlFile'),
	(7,'ActionList',7,'SQL2CSV'),
	(8,'ObjectType',1,'Inputbox'),
	(9,'ObjectType',2,'Dropdown'),
	(10,'ObjectType',3,'OptionButton'),
	(11,'ObjectType',4,'Button'),
	(12,'ObjectType',5,'Text'),
	(13,'Identifier',1,'Xpath'),
	(14,'OS',1,'Windows'),
	(15,'OS',2,'MAC'),
	(16,'Browser',1,'IE'),
	(17,'Browser',2,'Firefox'),
	(18,'Browser',3,'Chrome'),
	(19,'ActionList',8,'SwitchWindow'),
	(20,'OS',3,'Linux');

/*!40000 ALTER TABLE `T_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_EXECUTEFLAG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_EXECUTEFLAG`;

CREATE TABLE `T_EXECUTEFLAG` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) DEFAULT NULL,
  `FLAG` int(1) DEFAULT NULL,
  `ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_EXECUTEFLAG` WRITE;
/*!40000 ALTER TABLE `T_EXECUTEFLAG` DISABLE KEYS */;

INSERT INTO `T_EXECUTEFLAG` (`id`, `USERNAME`, `FLAG`, `ACTIVE`)
VALUES
	(1,'cloud_agent1',0,1),
	(2,'cloud_agent2',0,1),
	(3,'cloud',0,0);

/*!40000 ALTER TABLE `T_EXECUTEFLAG` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_EXECUTIONENV
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_EXECUTIONENV`;

CREATE TABLE `T_EXECUTIONENV` (
  `PLANID` int(4) NOT NULL,
  `OS` char(20) NOT NULL DEFAULT '',
  `BROWSER` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`PLANID`,`OS`,`BROWSER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_EXECUTIONENV` WRITE;
/*!40000 ALTER TABLE `T_EXECUTIONENV` DISABLE KEYS */;

INSERT INTO `T_EXECUTIONENV` (`PLANID`, `OS`, `BROWSER`)
VALUES
	(1,'Linux','Chrome'),
	(1,'Linux','Firefox'),
	(6,'Linux','Firefox');

/*!40000 ALTER TABLE `T_EXECUTIONENV` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_EXECUTIONPLANDETAIL
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_EXECUTIONPLANDETAIL`;

CREATE TABLE `T_EXECUTIONPLANDETAIL` (
  `PLANID` int(4) NOT NULL,
  `EXECUTENO` int(4) NOT NULL,
  `CASEID` int(4) DEFAULT NULL,
  PRIMARY KEY (`PLANID`,`EXECUTENO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_EXECUTIONPLANDETAIL` WRITE;
/*!40000 ALTER TABLE `T_EXECUTIONPLANDETAIL` DISABLE KEYS */;

INSERT INTO `T_EXECUTIONPLANDETAIL` (`PLANID`, `EXECUTENO`, `CASEID`)
VALUES
	(1,1,8),
	(6,1,10);

/*!40000 ALTER TABLE `T_EXECUTIONPLANDETAIL` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_EXECUTIONPLANMAIN
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_EXECUTIONPLANMAIN`;

CREATE TABLE `T_EXECUTIONPLANMAIN` (
  `PLANID` int(4) NOT NULL AUTO_INCREMENT,
  `APPID` int(4) DEFAULT NULL,
  `PLANMEMO` varchar(250) DEFAULT NULL,
  `NEXTPLANDATE` varchar(8) DEFAULT NULL,
  `NEXTPLANTIME` varchar(9) DEFAULT NULL,
  `LASTEXECUTEDATE` varchar(8) DEFAULT NULL,
  `LASTEXECUTETIME` varchar(9) DEFAULT NULL,
  `NOTIFYEMAILADDRESS` varchar(200) DEFAULT NULL,
  `EXECUTEFLAG` int(1) DEFAULT NULL,
  PRIMARY KEY (`PLANID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_EXECUTIONPLANMAIN` WRITE;
/*!40000 ALTER TABLE `T_EXECUTIONPLANMAIN` DISABLE KEYS */;

INSERT INTO `T_EXECUTIONPLANMAIN` (`PLANID`, `APPID`, `PLANMEMO`, `NEXTPLANDATE`, `NEXTPLANTIME`, `LASTEXECUTEDATE`, `LASTEXECUTETIME`, `NOTIFYEMAILADDRESS`, `EXECUTEFLAG`)
VALUES
	(1,676,'日本語デモ実行','','','','','',1),
	(6,678,'中文demo','','','','','',0);

/*!40000 ALTER TABLE `T_EXECUTIONPLANMAIN` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_OBJECT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_OBJECT`;

CREATE TABLE `T_OBJECT` (
  `OBJECTID` int(4) NOT NULL AUTO_INCREMENT,
  `APPID` int(11) NOT NULL,
  `PAGEID` varchar(100) NOT NULL DEFAULT '',
  `OBJECTNAME` varchar(100) DEFAULT NULL,
  `OBJECTTYPE` varchar(100) DEFAULT NULL,
  `INFRAME` int(4) DEFAULT NULL,
  `IDENTIFIER` char(10) DEFAULT NULL,
  `IDENTIFYKEY` char(200) DEFAULT NULL,
  `PARAMNAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`OBJECTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_OBJECT` WRITE;
/*!40000 ALTER TABLE `T_OBJECT` DISABLE KEYS */;

INSERT INTO `T_OBJECT` (`OBJECTID`, `APPID`, `PAGEID`, `OBJECTNAME`, `OBJECTTYPE`, `INFRAME`, `IDENTIFIER`, `IDENTIFYKEY`, `PARAMNAME`)
VALUES
	(2,676,'Page001','到着','Inputbox',0,'Xpath','.//*[@id=\'sto\']',''),
	(103,676,'Page001','日時指定・年','Dropdown',0,'Xpath','.//*[@id=\'y\']',''),
	(104,676,'Page001','日時指定・月','Dropdown',0,'Xpath','.//*[@id=\'m\']',''),
	(105,676,'Page001','日時指定・日','Dropdown',0,'Xpath','.//*[@id=\'d\']',''),
	(106,676,'Page001','日時指定・時間','Dropdown',0,'Xpath','.//*[@id=\'hh\']',''),
	(107,676,'Page001','日時指定・分','Dropdown',0,'Xpath','.//*[@id=\'mm\']',''),
	(109,676,'Page001','運賃種別','OptionButton',0,'Xpath','.//*[@id=\'mdRouteSearch\']/div[2]/form/div/dl[2]/dd/ul/li/label[text()=\"%param1%\"]','運賃種別(ICカード優先/現金（きっぷ）優先)'),
	(110,676,'Page001','検索','Button',0,'Xpath','.//*[@id=\'searchModuleSubmit\']',''),
	(111,676,'Page002','タイトル(検索対象ルート)','Text',0,'Xpath','.//*[@class=\'labelSearchResult\']/h1',''),
	(113,676,'Page002','所用時間(ルート名指定)','Text',0,'Xpath','.//*[@id=\'rsltlst\']/li/dl/dt/a[text()=\'%param1%\']/ancestor::dl//dd/ul/li[1]/span[@class=\'small\']','ルート名(ルート1/ルート2/ルート3)'),
	(114,676,'Page002','ソート順','OptionButton',0,'Xpath','.//*[@id=\'tabflt\']/li/a/span[text()=\'%param1%\']','ソート順(到着時刻順/乗換回数順/料金の安い順)'),
	(115,676,'Page002','乗換回数(ルート名指定)','Text',9,'Xpath','.//*[@id=\'rsltlst\']/li/dl/dt/a[text()=\'%param1%\']/ancestor::dl/dd/ul/li[3]/span[@class=\'mark\']','ルート名(ルート1/ルート2/ルート3)'),
	(117,676,'Page001','出発','Inputbox',0,'Xpath','.//*[@id=\'sfrom\']',''),
	(118,676,'Page001','日時指定種類','OptionButton',0,'Xpath','.//*[@id=\'default\']/dd/ul/li/label[text()=\"%param1%\"]','日時指定種類(出発/到着/始発/終電/指定なし)'),
	(123,678,'Page01','搜索关键字栏','Inputbox',0,'Xpath','.//*[@id=\'key_S\']',''),
	(125,678,'Page02','价格(by书名)','Text',0,'Xpath','.//*/p[1]/a[contains(@title,\'%param1%\')]/ancestor::li/p[@class=\'price\']/span[1]','书名'),
	(126,678,'Page02','商品类型','OptionButton',0,'Xpath','.//*[@id=\'J_tab\']/a/li[text()=\'%param1%\']','类型(全部商品/当当自营)'),
	(127,678,'Page01','搜索按钮','Button',0,'Xpath','.//*[@id=\'form_search_new\']/input[9]','');

/*!40000 ALTER TABLE `T_OBJECT` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_PAGE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_PAGE`;

CREATE TABLE `T_PAGE` (
  `PAGEID` varchar(100) NOT NULL DEFAULT '',
  `APPID` int(11) NOT NULL,
  `PAGENAME` varchar(100) DEFAULT NULL,
  `PAGEDETAIL` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`PAGEID`,`APPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_PAGE` WRITE;
/*!40000 ALTER TABLE `T_PAGE` DISABLE KEYS */;

INSERT INTO `T_PAGE` (`PAGEID`, `APPID`, `PAGENAME`, `PAGEDETAIL`)
VALUES
	('Page001',676,'検索ページ','検索情報入力ページ'),
	('Page002',676,'結果ページ','検索情報結果ページ'),
	('Page01',678,'当当网首页','当当网首页'),
	('Page02',678,'书类一览页','搜索结果的书类一览'),
	('Pagedummy',676,'dummy','dummy');

/*!40000 ALTER TABLE `T_PAGE` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_PAGEACTION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_PAGEACTION`;

CREATE TABLE `T_PAGEACTION` (
  `ACTIONUK` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PAGEACTIONID` int(4) NOT NULL,
  `ACTIONNO` int(4) NOT NULL,
  `ACTIONNAME` char(100) DEFAULT NULL,
  `ACTIONDETAIL` varchar(200) DEFAULT NULL,
  `OBJECTID` int(4) DEFAULT NULL,
  `PARAMNAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ACTIONUK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_PAGEACTION` WRITE;
/*!40000 ALTER TABLE `T_PAGEACTION` DISABLE KEYS */;

INSERT INTO `T_PAGEACTION` (`ACTIONUK`, `PAGEACTIONID`, `ACTIONNO`, `ACTIONNAME`, `ACTIONDETAIL`, `OBJECTID`, `PARAMNAME`)
VALUES
	(42,95,1,'ExecSqlFile','SQLファイル実行',0,'sqlファイル'),
	(43,96,1,'OpenURL','アプリurlを開く',0,'url'),
	(44,97,1,'Input','出発地入力',117,'出発地'),
	(45,97,2,'Input','到着地入力',2,'到着地'),
	(46,97,3,'Select','日時指定・年選択',103,'日時指定・年'),
	(47,97,4,'Select','日時指定・月選択',104,'日時指定・月'),
	(48,97,5,'Select','日時指定・日選択',105,'日時指定・日'),
	(49,97,6,'Select','日時指定・時間選択',106,'日時指定・時間'),
	(50,97,7,'Select','日時指定・分選択',107,'日時指定・分'),
	(51,97,8,'Click','日時指定種類指定',118,''),
	(52,97,9,'Click','運賃種別指定',109,''),
	(53,97,10,'Click','検索ボタン押す',110,''),
	(54,98,1,'Verify','タイトル確認',111,'想定主発地→到着地'),
	(55,98,2,'Click','ソート順指定',114,''),
	(56,98,3,'Verify','ルートxの所用時間の検証',113,'想定所要時間'),
	(57,99,1,'SQL2CSV','テーブルAダンプ',0,'ダンプsql'),
	(64,104,1,'OpenURL','打开当当网',0,'url'),
	(65,105,1,'Input','搜索指定书名',123,'搜索关键字'),
	(66,105,2,'Click','按搜索按钮',127,''),
	(67,106,1,'Click','指定搜索结果类别',126,''),
	(68,107,1,'Verify','验证书的价格',125,'价格(期待值)');

/*!40000 ALTER TABLE `T_PAGEACTION` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_PAGEACTIONMAIN
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_PAGEACTIONMAIN`;

CREATE TABLE `T_PAGEACTIONMAIN` (
  `PAGEACTIONID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `APPID` int(11) NOT NULL,
  `PAGEID` varchar(100) NOT NULL DEFAULT '',
  `PAGEACTIONDETAIL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PAGEACTIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_PAGEACTIONMAIN` WRITE;
/*!40000 ALTER TABLE `T_PAGEACTIONMAIN` DISABLE KEYS */;

INSERT INTO `T_PAGEACTIONMAIN` (`PAGEACTIONID`, `APPID`, `PAGEID`, `PAGEACTIONDETAIL`)
VALUES
	(95,676,'Pagedummy','SQLファイル実行'),
	(96,676,'Pagedummy','アプリ開く'),
	(97,676,'Page001','情報入力してから検索する'),
	(98,676,'Page002','路線情報確認'),
	(99,676,'Pagedummy','テーブルダンプ'),
	(104,678,'Page01','打开当当网'),
	(105,678,'Page01','搜索书名'),
	(106,678,'Page02','指定搜索结果类型'),
	(107,678,'Page02','验证指定书名的价格');

/*!40000 ALTER TABLE `T_PAGEACTIONMAIN` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_PARAM
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_PARAM`;

CREATE TABLE `T_PARAM` (
  `PARAMNAME` varchar(100) NOT NULL,
  `PARAMVALUE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`PARAMNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_PARAM` WRITE;
/*!40000 ALTER TABLE `T_PARAM` DISABLE KEYS */;

INSERT INTO `T_PARAM` (`PARAMNAME`, `PARAMVALUE`)
VALUES
	('P_年','2016年');

/*!40000 ALTER TABLE `T_PARAM` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_SCENARIOMAIN
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_SCENARIOMAIN`;

CREATE TABLE `T_SCENARIOMAIN` (
  `SCENARIOID` int(4) NOT NULL AUTO_INCREMENT,
  `SCENARIONAME` varchar(100) NOT NULL,
  `SCENARIODETAIL` varchar(150) NOT NULL,
  `REVIEW` char(1) NOT NULL,
  PRIMARY KEY (`SCENARIOID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_SCENARIOMAIN` WRITE;
/*!40000 ALTER TABLE `T_SCENARIOMAIN` DISABLE KEYS */;

INSERT INTO `T_SCENARIOMAIN` (`SCENARIOID`, `SCENARIONAME`, `SCENARIODETAIL`, `REVIEW`)
VALUES
	(23,'初期処理','関連テーブルの初期化','0'),
	(24,'アプリ開く','アプリ開く','0'),
	(25,'路線情報確認','','0'),
	(26,'後処理','テスト実施後の処理','0'),
	(30,'打开当当网','打开当当网url','0'),
	(31,'搜索指定书名','搜索指定书名，并限定为当当自营','0'),
	(32,'确认价格','确认指定书名的价格','0');

/*!40000 ALTER TABLE `T_SCENARIOMAIN` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_SCENARIOPROCESS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_SCENARIOPROCESS`;

CREATE TABLE `T_SCENARIOPROCESS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `SCENARIOID` int(4) NOT NULL,
  `PAGEORDER` int(4) NOT NULL,
  `PAGEACTIONID` int(4) DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_SCENARIOPROCESS` WRITE;
/*!40000 ALTER TABLE `T_SCENARIOPROCESS` DISABLE KEYS */;

INSERT INTO `T_SCENARIOPROCESS` (`ID`, `SCENARIOID`, `PAGEORDER`, `PAGEACTIONID`, `COMMENT`)
VALUES
	(14,23,1,95,'対象テーブルデータ削除'),
	(15,23,2,95,'対象テーブルデータインサート'),
	(16,24,1,96,''),
	(17,25,1,97,''),
	(18,25,2,98,'乗換回数順確認'),
	(19,26,1,99,'テーブルAのダンプ'),
	(20,26,2,99,'テーブルBのダンプ'),
	(21,25,3,98,'料金の安い順確認'),
	(27,30,1,104,''),
	(28,31,1,105,''),
	(29,31,2,106,''),
	(30,32,1,107,'');

/*!40000 ALTER TABLE `T_SCENARIOPROCESS` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_TEST_RESULT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_TEST_RESULT`;

CREATE TABLE `T_TEST_RESULT` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `EXECUTETIMESTAMP` char(50) NOT NULL DEFAULT '',
  `OS` varchar(20) NOT NULL DEFAULT '',
  `BROWSER` varchar(20) NOT NULL DEFAULT '',
  `USERID` varchar(50) NOT NULL,
  `APPNAME` varchar(50) NOT NULL,
  `PLANMEMO` varchar(250) NOT NULL,
  `EXECUTENO` int(4) NOT NULL,
  `CASENAME` varchar(100) NOT NULL,
  `SCENARIONO` int(4) NOT NULL,
  `SCENARIONAME` varchar(100) NOT NULL,
  `PAGEORDER` int(4) NOT NULL,
  `PAGENAME` varchar(100) NOT NULL,
  `ACTIONNO` int(4) NOT NULL,
  `ACTITONNAME` varchar(100) NOT NULL,
  `ACTITONDETAIL` varchar(250) NOT NULL,
  `OBJECTNAME` varchar(100) NOT NULL,
  `PARAM` varchar(250) NOT NULL,
  `STATUS` varchar(10) NOT NULL,
  `DETAIL` varchar(250) NOT NULL,
  `FILENAME` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_TEST_RESULT` WRITE;
/*!40000 ALTER TABLE `T_TEST_RESULT` DISABLE KEYS */;

INSERT INTO `T_TEST_RESULT` (`id`, `EXECUTETIMESTAMP`, `OS`, `BROWSER`, `USERID`, `APPNAME`, `PLANMEMO`, `EXECUTENO`, `CASENAME`, `SCENARIONO`, `SCENARIONAME`, `PAGEORDER`, `PAGENAME`, `ACTIONNO`, `ACTITONNAME`, `ACTITONDETAIL`, `OBJECTNAME`, `PARAM`, `STATUS`, `DETAIL`, `FILENAME`)
VALUES
	(1,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',1,'初期処理',1,'dummy',1,'ExecSqlFile','SQLファイル実行',' ','sqlファイル=cleartable.sql','Done','','cleartable.sql'),
	(2,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',1,'初期処理',2,'dummy',1,'ExecSqlFile','SQLファイル実行',' ','sqlファイル=insert.sql','Done','','insert.sql'),
	(3,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',2,'アプリ開く',1,'dummy',1,'OpenURL','アプリurlを開く',' ','url=http://transit.yahoo.co.jp/?c=0','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-2-1-1.jpg'),
	(4,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',1,'初期処理',1,'dummy',1,'ExecSqlFile','SQLファイル実行',' ','sqlファイル=cleartable.sql','Done','','cleartable.sql'),
	(5,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',1,'初期処理',2,'dummy',1,'ExecSqlFile','SQLファイル実行',' ','sqlファイル=insert.sql','Done','','insert.sql'),
	(6,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',1,'Input','出発地入力','出発','出発地=東陽町','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-3-1-1.jpg'),
	(7,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',2,'Input','到着地入力','到着','到着地=品川','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-3-1-2.jpg'),
	(8,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',2,'アプリ開く',1,'dummy',1,'OpenURL','アプリurlを開く',' ','url=http://transit.yahoo.co.jp/?c=0','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-2-1-1.jpg'),
	(9,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',1,'Input','出発地入力','出発','出発地=東陽町','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-3-1-1.jpg'),
	(10,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',3,'Select','日時指定・年選択','日時指定・年','日時指定・年=2016年','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-3-1-3.jpg'),
	(11,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',2,'Input','到着地入力','到着','到着地=品川','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-3-1-2.jpg'),
	(12,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',3,'Select','日時指定・年選択','日時指定・年','日時指定・年=2016年','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-3-1-3.jpg'),
	(13,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',4,'Select','日時指定・月選択','日時指定・月','日時指定・月=12月','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-3-1-4.jpg'),
	(14,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',5,'Select','日時指定・日選択','日時指定・日','日時指定・日=22日','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-3-1-5.jpg'),
	(15,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',4,'Select','日時指定・月選択','日時指定・月','日時指定・月=12月','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-3-1-4.jpg'),
	(16,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',6,'Select','日時指定・時間選択','日時指定・時間','日時指定・時間=10時','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-3-1-6.jpg'),
	(17,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',7,'Select','日時指定・分選択','日時指定・分','日時指定・分=05分','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-3-1-7.jpg'),
	(18,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',8,'Click','日時指定種類指定','日時指定種類','日時指定種類(出発/到着/始発/終電/指定なし)=到着','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-3-1-8.jpg'),
	(19,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',9,'Click','運賃種別指定','運賃種別','運賃種別(ICカード優先/現金（きっぷ）優先)=現金（きっぷ）優先','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-3-1-9.jpg'),
	(20,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',5,'Select','日時指定・日選択','日時指定・日','日時指定・日=22日','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-3-1-5.jpg'),
	(21,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',6,'Select','日時指定・時間選択','日時指定・時間','日時指定・時間=10時','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-3-1-6.jpg'),
	(22,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',10,'Click','検索ボタン押す','検索','','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-3-1-10.jpg'),
	(23,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',7,'Select','日時指定・分選択','日時指定・分','日時指定・分=05分','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-3-1-7.jpg'),
	(24,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',2,'結果ページ',1,'Verify','タイトル確認','タイトル(検索対象ルート)','想定主発地→到着地=東陽町→品川','Pass','','20170409165926_Linux_Chrome/20170409165926-1-1-3-2-1.jpg'),
	(25,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',8,'Click','日時指定種類指定','日時指定種類','日時指定種類(出発/到着/始発/終電/指定なし)=到着','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-3-1-8.jpg'),
	(26,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',2,'結果ページ',2,'Click','ソート順指定','ソート順','ソート順(到着時刻順/乗換回数順/料金の安い順)=乗換回数順','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-3-2-2.jpg'),
	(27,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',9,'Click','運賃種別指定','運賃種別','運賃種別(ICカード優先/現金（きっぷ）優先)=現金（きっぷ）優先','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-3-1-9.jpg'),
	(28,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',2,'結果ページ',3,'Verify','ルートxの所用時間の検証','所用時間(ルート名指定)','ルート名(ルート1/ルート2/ルート3)=ルート2;想定所要時間=（32分）','Pass','','20170409165926_Linux_Chrome/20170409165926-1-1-3-2-3.jpg'),
	(29,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',3,'結果ページ',1,'Verify','タイトル確認','タイトル(検索対象ルート)','想定主発地→到着地=東陽町→品川','Pass','','20170409165926_Linux_Chrome/20170409165926-1-1-3-3-1.jpg'),
	(30,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',3,'結果ページ',2,'Click','ソート順指定','ソート順','ソート順(到着時刻順/乗換回数順/料金の安い順)=料金の安い順','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-3-3-2.jpg'),
	(31,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',3,'結果ページ',3,'Verify','ルートxの所用時間の検証','所用時間(ルート名指定)','ルート名(ルート1/ルート2/ルート3)=ルート3;想定所要時間=（32分）','Fail','EXPECTED VALUE=（32分）; ACTUAL VALUE=（37分）','20170409165926_Linux_Chrome/20170409165926-1-1-3-3-3.jpg'),
	(32,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',4,'後処理',1,'dummy',1,'SQL2CSV','テーブルAダンプ',' ','ダンプsql=select * from APP_TABLE where id=5','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-4-1-1.csv'),
	(33,'20170409165926','Linux','Chrome','cloud_agent2','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',4,'後処理',2,'dummy',1,'SQL2CSV','テーブルAダンプ',' ','ダンプsql=select * from APP_TABLE where id=1','Done','','20170409165926_Linux_Chrome/20170409165926-1-1-4-2-1.csv'),
	(34,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',10,'Click','検索ボタン押す','検索','','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-3-1-10.jpg'),
	(35,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',2,'結果ページ',1,'Verify','タイトル確認','タイトル(検索対象ルート)','想定主発地→到着地=東陽町→品川','Pass','','20170409165916_Linux_Firefox/20170409165916-1-1-3-2-1.jpg'),
	(36,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',2,'結果ページ',2,'Click','ソート順指定','ソート順','ソート順(到着時刻順/乗換回数順/料金の安い順)=乗換回数順','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-3-2-2.jpg'),
	(37,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',2,'結果ページ',3,'Verify','ルートxの所用時間の検証','所用時間(ルート名指定)','ルート名(ルート1/ルート2/ルート3)=ルート2;想定所要時間=（32分）','Pass','','20170409165916_Linux_Firefox/20170409165916-1-1-3-2-3.jpg'),
	(38,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',3,'結果ページ',1,'Verify','タイトル確認','タイトル(検索対象ルート)','想定主発地→到着地=東陽町→品川','Pass','','20170409165916_Linux_Firefox/20170409165916-1-1-3-3-1.jpg'),
	(39,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',3,'結果ページ',2,'Click','ソート順指定','ソート順','ソート順(到着時刻順/乗換回数順/料金の安い順)=料金の安い順','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-3-3-2.jpg'),
	(40,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',3,'結果ページ',3,'Verify','ルートxの所用時間の検証','所用時間(ルート名指定)','ルート名(ルート1/ルート2/ルート3)=ルート3;想定所要時間=（32分）','Fail','EXPECTED VALUE=（32分）; ACTUAL VALUE=（37分）','20170409165916_Linux_Firefox/20170409165916-1-1-3-3-3.jpg'),
	(41,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',4,'後処理',1,'dummy',1,'SQL2CSV','テーブルAダンプ',' ','ダンプsql=select * from APP_TABLE where id=5','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-4-1-1.csv'),
	(42,'20170409165916','Linux','Firefox','cloud_agent1','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',4,'後処理',2,'dummy',1,'SQL2CSV','テーブルAダンプ',' ','ダンプsql=select * from APP_TABLE where id=1','Done','','20170409165916_Linux_Firefox/20170409165916-1-1-4-2-1.csv'),
	(43,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',1,'初期処理',1,'dummy',1,'ExecSqlFile','SQLファイル実行',' ','sqlファイル=cleartable.sql','Done','','cleartable.sql'),
	(44,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',1,'初期処理',2,'dummy',1,'ExecSqlFile','SQLファイル実行',' ','sqlファイル=insert.sql','Done','','insert.sql'),
	(45,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',2,'アプリ開く',1,'dummy',1,'OpenURL','アプリurlを開く',' ','url=http://transit.yahoo.co.jp/?c=0','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-2-1-1.jpg'),
	(46,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',1,'Input','出発地入力','出発','出発地=東陽町','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-3-1-1.jpg'),
	(47,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',2,'Input','到着地入力','到着','到着地=品川','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-3-1-2.jpg'),
	(48,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',3,'Select','日時指定・年選択','日時指定・年','日時指定・年=2016年','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-3-1-3.jpg'),
	(49,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',4,'Select','日時指定・月選択','日時指定・月','日時指定・月=12月','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-3-1-4.jpg'),
	(50,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',5,'Select','日時指定・日選択','日時指定・日','日時指定・日=22日','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-3-1-5.jpg'),
	(51,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',6,'Select','日時指定・時間選択','日時指定・時間','日時指定・時間=10時','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-3-1-6.jpg'),
	(52,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',7,'Select','日時指定・分選択','日時指定・分','日時指定・分=05分','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-3-1-7.jpg'),
	(53,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',8,'Click','日時指定種類指定','日時指定種類','日時指定種類(出発/到着/始発/終電/指定なし)=到着','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-3-1-8.jpg'),
	(54,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',9,'Click','運賃種別指定','運賃種別','運賃種別(ICカード優先/現金（きっぷ）優先)=現金（きっぷ）優先','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-3-1-9.jpg'),
	(55,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',1,'検索ページ',10,'Click','検索ボタン押す','検索','','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-3-1-10.jpg'),
	(56,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',2,'結果ページ',1,'Verify','タイトル確認','タイトル(検索対象ルート)','想定主発地→到着地=東陽町→品川','Pass','','20170409170849_Linux_Firefox/20170409170849-1-1-3-2-1.jpg'),
	(57,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',2,'結果ページ',2,'Click','ソート順指定','ソート順','ソート順(到着時刻順/乗換回数順/料金の安い順)=乗換回数順','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-3-2-2.jpg'),
	(58,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',2,'結果ページ',3,'Verify','ルートxの所用時間の検証','所用時間(ルート名指定)','ルート名(ルート1/ルート2/ルート3)=ルート2;想定所要時間=（32分）','Pass','','20170409170849_Linux_Firefox/20170409170849-1-1-3-2-3.jpg'),
	(59,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',3,'結果ページ',1,'Verify','タイトル確認','タイトル(検索対象ルート)','想定主発地→到着地=東陽町→品川','Pass','','20170409170849_Linux_Firefox/20170409170849-1-1-3-3-1.jpg'),
	(60,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',3,'結果ページ',2,'Click','ソート順指定','ソート順','ソート順(到着時刻順/乗換回数順/料金の安い順)=料金の安い順','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-3-3-2.jpg'),
	(61,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',3,'路線情報確認',3,'結果ページ',3,'Verify','ルートxの所用時間の検証','所用時間(ルート名指定)','ルート名(ルート1/ルート2/ルート3)=ルート3;想定所要時間=（32分）','Fail','EXPECTED VALUE=（32分）; ACTUAL VALUE=（37分）','20170409170849_Linux_Firefox/20170409170849-1-1-3-3-3.jpg'),
	(62,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',4,'後処理',1,'dummy',1,'SQL2CSV','テーブルAダンプ',' ','ダンプsql=select * from APP_TABLE where id=5','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-4-1-1.csv'),
	(63,'20170409170849','Linux','Firefox','agent3','Yahoo路線','日本語デモ実行',1,'路線情報確認（東陽町から品川）',4,'後処理',2,'dummy',1,'SQL2CSV','テーブルAダンプ',' ','ダンプsql=select * from APP_TABLE where id=1','Done','','20170409170849_Linux_Firefox/20170409170849-1-1-4-2-1.csv');

/*!40000 ALTER TABLE `T_TEST_RESULT` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
