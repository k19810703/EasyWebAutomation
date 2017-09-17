# ************************************************************
# Sequel Pro SQL dump
# バージョン 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# ホスト: blockchain-03.cn.ibm.com (MySQL 5.7.18)
# データベース: autotable
# 作成時刻: 2017-09-17 06:45:01 +0000
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
  `JIRAURL` char(100) NOT NULL DEFAULT '',
  `JIRAUSER` char(100) NOT NULL DEFAULT '',
  `JIRAPASSWORD` char(100) NOT NULL DEFAULT '',
  `JIRAPROJECTKEY` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`APPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_APPLICATION` WRITE;
/*!40000 ALTER TABLE `T_APPLICATION` DISABLE KEYS */;

INSERT INTO `T_APPLICATION` (`APPID`, `APPNAME`, `APPDETAIL`, `DBDRIVER`, `DBURL`, `DBUSER`, `DBPASSWORD`, `DBSCHEMA`, `JIRAURL`, `JIRAUSER`, `JIRAPASSWORD`, `JIRAPROJECTKEY`)
VALUES
	(682,'DevOpsDemoApp','App for Devops Demo','','','','','','http://jira:8080','demo','demo1234','FP');

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
  `EXECUTEFLAG` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_CASEDETAIL` WRITE;
/*!40000 ALTER TABLE `T_CASEDETAIL` DISABLE KEYS */;

INSERT INTO `T_CASEDETAIL` (`ID`, `CASEID`, `SCENARIONO`, `SCENARIOID`, `EXECUTEFLAG`)
VALUES
	(66,14,1,37,'1'),
	(67,14,2,38,'1'),
	(70,14,3,38,'1');

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
	(14,'DemoCase','Demo Case','');

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
	(14,66,38,91,2,'http://9.197.8.182:5001/main'),
	(14,67,39,93,1,'1'),
	(14,67,39,93,2,'No'),
	(14,67,39,94,1,'A0001'),
	(14,67,39,94,2,'ZhangSan'),
	(14,67,39,95,1,'A0001'),
	(14,67,39,95,2,'zhansan@cn.ibm.com'),
	(14,67,39,96,2,'3'),
	(14,70,39,93,1,'1'),
	(14,70,39,93,2,'No'),
	(14,70,39,94,1,'A0002'),
	(14,70,39,94,2,'LiSi'),
	(14,70,39,95,1,'A0002'),
	(14,70,39,95,2,'caiyn@cn.ibm.com'),
	(14,70,39,96,2,'3');

/*!40000 ALTER TABLE `T_CASEPARAMVALUE` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_CONFIG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_CONFIG`;

CREATE TABLE `T_CONFIG` (
  `id` int(10) NOT NULL,
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
	(19,'ActionList',8,'SwitchWindowByURL'),
	(20,'OS',3,'Linux'),
	(21,'ObjectType',6,'Frame'),
	(22,'OS',4,'iOS'),
	(23,'Browser',4,'Safari'),
	(24,'Browser',5,'Browser'),
	(25,'OS',5,'Android'),
	(26,'ActionList',9,'ContinueForIE'),
	(27,'ActionList',10,'InputWhenExist'),
	(28,'ActionList',12,'ClickWhenExist'),
	(29,'ActionList',11,'MouseMoveTo'),
	(30,'ActionList',13,'SPClick1'),
	(32,'ObjectType',7,'CheckBox'),
	(33,'ActionList',14,'FocusObject'),
	(34,'ActionList',15,'AlertBox'),
	(35,'ObjectType',8,'Radio'),
	(36,'ObjectType',9,'Select'),
	(37,'ActionList',16,'SwitchWindowByTitle'),
	(38,'ActionList',17,'VerifyPageid'),
	(39,'ActionList',18,'VerifyPageidWhenExist'),
	(40,'ActionList',19,'AlertBoxWhenExist'),
	(41,'ActionList',20,'SelectByText'),
	(42,'ActionList',21,'SelectByIndex'),
	(43,'ActionList',23,'SelectByTextWhenExist'),
	(44,'ActionList',24,'SelectByIndexWhenExist'),
	(45,'ActionList',25,'WaitBySec'),
	(46,'ActionList',26,'Scroll4Snapshot');

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



# テーブルのダンプ T_EXECUTIONENV
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_EXECUTIONENV`;

CREATE TABLE `T_EXECUTIONENV` (
  `PLANID` int(4) NOT NULL,
  `OS` char(20) NOT NULL DEFAULT '',
  `BROWSER` char(20) NOT NULL DEFAULT '',
  `AGENTNAME` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`PLANID`,`OS`,`BROWSER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_EXECUTIONENV` WRITE;
/*!40000 ALTER TABLE `T_EXECUTIONENV` DISABLE KEYS */;

INSERT INTO `T_EXECUTIONENV` (`PLANID`, `OS`, `BROWSER`, `AGENTNAME`)
VALUES
	(10,'Linux','Firefox','testagent'),
	(10,'MAC','Firefox','whd');

/*!40000 ALTER TABLE `T_EXECUTIONENV` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_EXECUTIONPLANDETAIL
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_EXECUTIONPLANDETAIL`;

CREATE TABLE `T_EXECUTIONPLANDETAIL` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `PLANID` int(4) NOT NULL,
  `EXECUTENO` int(4) NOT NULL,
  `CASEID` int(4) DEFAULT NULL,
  `EXECUTEFLG` int(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_EXECUTIONPLANDETAIL` WRITE;
/*!40000 ALTER TABLE `T_EXECUTIONPLANDETAIL` DISABLE KEYS */;

INSERT INTO `T_EXECUTIONPLANDETAIL` (`ID`, `PLANID`, `EXECUTENO`, `CASEID`, `EXECUTEFLG`)
VALUES
	(1,10,1,14,1);

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
  `HIGHLIGHTOBJECT` int(1) DEFAULT NULL,
  `EXECUTEFLAG` int(1) DEFAULT NULL,
  PRIMARY KEY (`PLANID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_EXECUTIONPLANMAIN` WRITE;
/*!40000 ALTER TABLE `T_EXECUTIONPLANMAIN` DISABLE KEYS */;

INSERT INTO `T_EXECUTIONPLANMAIN` (`PLANID`, `APPID`, `PLANMEMO`, `NEXTPLANDATE`, `NEXTPLANTIME`, `LASTEXECUTEDATE`, `LASTEXECUTETIME`, `NOTIFYEMAILADDRESS`, `HIGHLIGHTOBJECT`, `EXECUTEFLAG`)
VALUES
	(10,682,'Demo','','','','','',1,1);

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
	(155,682,'Namelist','TableColumnName','Text',0,'Xpath','html/body/table/tbody[1]/tr/th[%param1%]','ColumnNo'),
	(156,682,'Namelist','OnbardNamebySN','Text',0,'Xpath','html/body/table/tbody[2]/tr/td[2 and text()=\'%param1%\']/following-sibling::td[1]','SN'),
	(157,682,'Namelist','EmailBySN','Text',0,'Xpath','html/body/table/tbody[2]/tr/td[2 and text()=\'%param1%\']/following-sibling::td[2]','SN');

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
	('dummy',682,'dummypage','for non-page action'),
	('Namelist',682,'Onboardlist','list all onboard member');

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
	(91,113,1,'OpenURL','OpenURL',0,'URL'),
	(92,114,1,'SQL2CSV','DumpTable',0,'SQLFile'),
	(93,115,1,'Verify','VerifyTitle',155,'ExpectValue'),
	(94,115,3,'Verify','VerifyName',156,'ExpectValue'),
	(95,115,4,'Verify','VerifyEmail',157,'ExpectValue'),
	(96,115,2,'WaitBySec','Wait',0,'WaitTime');

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
	(113,682,'dummy','OpenAppURL'),
	(114,682,'dummy','DUMPTable'),
	(115,682,'Namelist','VerifyPageContent');

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
	(37,'OpenURL','OpenURL','0'),
	(38,'Verify','','0'),
	(39,'DumpTable','','0');

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
	(38,37,1,113,''),
	(39,38,1,115,''),
	(40,39,1,114,'');

/*!40000 ALTER TABLE `T_SCENARIOPROCESS` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_TEST_RESULT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_TEST_RESULT`;

CREATE TABLE `T_TEST_RESULT` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `EXECUTETIMESTAMP` char(50) NOT NULL DEFAULT '',
  `COMPLETETIMESTAMP` char(50) NOT NULL DEFAULT '',
  `PLANID` int(4) NOT NULL,
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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `T_TEST_RESULT` WRITE;
/*!40000 ALTER TABLE `T_TEST_RESULT` DISABLE KEYS */;

INSERT INTO `T_TEST_RESULT` (`ID`, `EXECUTETIMESTAMP`, `COMPLETETIMESTAMP`, `PLANID`, `OS`, `BROWSER`, `USERID`, `APPNAME`, `PLANMEMO`, `EXECUTENO`, `CASENAME`, `SCENARIONO`, `SCENARIONAME`, `PAGEORDER`, `PAGENAME`, `ACTIONNO`, `ACTITONNAME`, `ACTITONDETAIL`, `OBJECTNAME`, `PARAM`, `STATUS`, `DETAIL`, `FILENAME`)
VALUES
	(1,'20170914001513','20170914001523',10,'Linux','Firefox','testagent','DevOpsDemoApp','Demo',1,'DemoCase',1,'OpenURL',1,'dummypage',1,'OpenURL','OpenURL',' ','URL=http://9.197.8.182:5001/main','Done','','20170914001513_Linux_Firefox/20170914001513-10-1-1-1-1.jpg'),
	(2,'20170914001513','20170914001524',10,'Linux','Firefox','testagent','DevOpsDemoApp','Demo',1,'DemoCase',2,'Verify',1,'Onboardlist',1,'Verify','VerifyTitle','TableColumnName','ColumnNo=1;ExpectValue=No','Fail','EXPECTED VALUE=No; ACTUAL VALUE=No4','20170914001513_Linux_Firefox/20170914001513-10-1-2-1-1.jpg'),
	(3,'20170914001513','20170914001527',10,'Linux','Firefox','testagent','DevOpsDemoApp','Demo',1,'DemoCase',2,'Verify',1,'Onboardlist',2,'WaitBySec','Wait',' ','WaitTime=3','Done','','20170914001513_Linux_Firefox/20170914001513-10-1-2-1-2.jpg'),
	(4,'20170914001513','20170914001527',10,'Linux','Firefox','testagent','DevOpsDemoApp','Demo',1,'DemoCase',2,'Verify',1,'Onboardlist',3,'Verify','VerifyName','OnbardNamebySN','SN=A0001;ExpectValue=ZhangSan','Pass','','20170914001513_Linux_Firefox/20170914001513-10-1-2-1-3.jpg'),
	(5,'20170914001513','20170914001527',10,'Linux','Firefox','testagent','DevOpsDemoApp','Demo',1,'DemoCase',2,'Verify',1,'Onboardlist',4,'Verify','VerifyEmail','EmailBySN','SN=A0001;ExpectValue=zhansan@cn.ibm.com','Pass','','20170914001513_Linux_Firefox/20170914001513-10-1-2-1-4.jpg'),
	(6,'20170914001513','20170914001527',10,'Linux','Firefox','testagent','DevOpsDemoApp','Demo',1,'DemoCase',3,'Verify',1,'Onboardlist',1,'Verify','VerifyTitle','TableColumnName','ColumnNo=1;ExpectValue=No','Fail','EXPECTED VALUE=No; ACTUAL VALUE=No4','20170914001513_Linux_Firefox/20170914001513-10-1-3-1-1.jpg'),
	(7,'20170914001513','20170914001530',10,'Linux','Firefox','testagent','DevOpsDemoApp','Demo',1,'DemoCase',3,'Verify',1,'Onboardlist',2,'WaitBySec','Wait',' ','WaitTime=3','Done','','20170914001513_Linux_Firefox/20170914001513-10-1-3-1-2.jpg'),
	(8,'20170914001513','20170914001531',10,'Linux','Firefox','testagent','DevOpsDemoApp','Demo',1,'DemoCase',3,'Verify',1,'Onboardlist',3,'Verify','VerifyName','OnbardNamebySN','SN=A0002;ExpectValue=LiSi','Pass','','20170914001513_Linux_Firefox/20170914001513-10-1-3-1-3.jpg'),
	(9,'20170914001513','20170914001531',10,'Linux','Firefox','testagent','DevOpsDemoApp','Demo',1,'DemoCase',3,'Verify',1,'Onboardlist',4,'Verify','VerifyEmail','EmailBySN','SN=A0002;ExpectValue=caiyn@cn.ibm.com','Pass','','20170914001513_Linux_Firefox/20170914001513-10-1-3-1-4.jpg');

/*!40000 ALTER TABLE `T_TEST_RESULT` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ T_USER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_USER`;

CREATE TABLE `T_USER` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `USERID` char(200) DEFAULT NULL,
  `PASSWORD` char(20) DEFAULT NULL,
  `USERNAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_USER` WRITE;
/*!40000 ALTER TABLE `T_USER` DISABLE KEYS */;

INSERT INTO `T_USER` (`id`, `USERID`, `PASSWORD`, `USERNAME`)
VALUES
	(1,'wuhd','whd12345','WuHuiDong');

/*!40000 ALTER TABLE `T_USER` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
