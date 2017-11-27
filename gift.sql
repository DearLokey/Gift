/*
SQLyog v10.2 
MySQL - 5.5.25 : Database - gift
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gift` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gift`;

/*Table structure for table `bigwhatcategory` */

DROP TABLE IF EXISTS `bigwhatcategory`;

CREATE TABLE `bigwhatcategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `NAME` varchar(30) DEFAULT NULL COMMENT '送什么的大类别名字',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bigwhatcategory` */

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车的id',
  `USER_ACCOUNT` varchar(50) DEFAULT NULL COMMENT '用户帐号',
  `GIFT_ID` int(11) DEFAULT NULL COMMENT '商品id',
  `GIFT_NUM` int(11) DEFAULT NULL COMMENT '商品件数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cart` */

/*Table structure for table `g_address` */

DROP TABLE IF EXISTS `g_address`;

CREATE TABLE `g_address` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ACCOUNT` varchar(30) DEFAULT NULL COMMENT '地址的所属账户',
  `ADDRESS` varchar(100) DEFAULT NULL COMMENT '地址的具体信息',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `g_address` */

insert  into `g_address`(`ID`,`USER_ACCOUNT`,`ADDRESS`) values (1,'123@qq.com','江苏省南京市栖霞区仙林大学城羊山北路一号'),(4,'123@qq.com','江苏省南京市建邺区'),(5,'720@qq.com ','江苏省南京市'),(6,'720@qq.com ','浙江省宁波市'),(7,'926@qq.com ','江苏省南京市建邺区');

/*Table structure for table `g_bigwhocategory` */

DROP TABLE IF EXISTS `g_bigwhocategory`;

CREATE TABLE `g_bigwhocategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `NAME` varchar(30) DEFAULT NULL COMMENT '送给谁的大类别名字',
  `PICTURE` varchar(100) DEFAULT NULL COMMENT '大类别的png图片',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `g_bigwhocategory` */

insert  into `g_bigwhocategory`(`ID`,`NAME`,`PICTURE`) values (1,'婚恋礼物','kiss.png'),(2,'朋友礼物','friend.png'),(3,'家人礼物','family.png'),(4,'商务送礼','business.png');

/*Table structure for table `g_collection` */

DROP TABLE IF EXISTS `g_collection`;

CREATE TABLE `g_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `GIFT_ID` int(11) DEFAULT NULL COMMENT '收藏的礼品id',
  `USER_ACCOUNT` varchar(30) DEFAULT NULL COMMENT '收藏人的帐号',
  `COLLECT_TIME` datetime DEFAULT NULL COMMENT '加入收藏的时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `g_collection` */

insert  into `g_collection`(`ID`,`GIFT_ID`,`USER_ACCOUNT`,`COLLECT_TIME`) values (11,6,'111@qq.com','2016-05-09 22:14:37'),(12,6,'720@qq.com','2016-05-09 22:14:57'),(19,9,'720@qq.com ','2016-05-12 23:01:53'),(22,14,'720@qq.com ','2016-05-12 23:05:59'),(23,1,'123@qq.com ','2016-05-14 12:34:35'),(24,3,'926@qq.com ','2016-05-24 18:00:37'),(25,8,'720@qq.com ','2016-05-24 18:14:41'),(27,1,'720@qq.com ','2016-05-24 19:27:34'),(28,15,'720@qq.com ','2016-05-24 19:27:45'),(29,11,'720@qq.com ','2016-05-24 19:28:59');

/*Table structure for table `g_comment` */

DROP TABLE IF EXISTS `g_comment`;

CREATE TABLE `g_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `GIFT_ID` int(11) DEFAULT NULL COMMENT '评论所属礼品id',
  `USER_ACCOUNT` varchar(30) DEFAULT NULL COMMENT '评论人的帐号',
  `CONTENT` varchar(100) DEFAULT NULL COMMENT '评论内容',
  `COMMENT_TIME` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `g_comment` */

insert  into `g_comment`(`ID`,`GIFT_ID`,`USER_ACCOUNT`,`CONTENT`,`COMMENT_TIME`) values (1,1,'123@qq.com','非非常漂亮的礼物，女朋友超喜欢。','2016-05-02 18:46:59'),(4,6,'926@qq.com','送男朋友很合适，漂亮耐用。','2016-05-13 17:12:18'),(6,4,'123@qq.com','很棒的打火机，质感很棒','2016-05-13 17:14:30'),(7,6,'123@qq.com','棒棒的','2016-05-13 17:14:52'),(10,5,'123@qq.com','梳子手感很好，很值得购买。','2016-05-24 19:07:20'),(12,1,'720@qq.com','手链超级漂亮的，送给闺蜜大爱啊。','2016-05-24 19:10:39');

/*Table structure for table `g_gift` */

DROP TABLE IF EXISTS `g_gift`;

CREATE TABLE `g_gift` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '礼品id',
  `WHAT_ID` int(11) DEFAULT NULL COMMENT '送什么类别id',
  `WHO_ID` int(11) DEFAULT NULL COMMENT '送给谁类别id',
  `NAME` varchar(30) DEFAULT NULL COMMENT '礼品名字',
  `PRICE` double DEFAULT NULL COMMENT '礼品价格',
  `PICTURE` varchar(50) DEFAULT NULL COMMENT '礼品展示图片',
  `STOCK_NUM` int(11) DEFAULT NULL COMMENT '库存量',
  `SALES_NUM` int(11) DEFAULT NULL COMMENT '销售量',
  `EVALUATION_NUM` int(11) DEFAULT NULL COMMENT '评价量',
  `SELLING_TIME` datetime DEFAULT NULL COMMENT '上架时间',
  `INTRODUCTION` text COMMENT '礼品简介',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `g_gift` */

insert  into `g_gift`(`ID`,`WHAT_ID`,`WHO_ID`,`NAME`,`PRICE`,`PICTURE`,`STOCK_NUM`,`SALES_NUM`,`EVALUATION_NUM`,`SELLING_TIME`,`INTRODUCTION`) values (1,1,1,'幸运四叶草璀璨水晶手链',201.4,'giftPictures/1.png',0,21,2,'2016-04-08 09:50:58','送女友的最佳选择幸运的四叶草搭配施华洛世奇的璀璨钻石，让她拥有女神的气质，支持免费刻字，高档礼盒包装，无可挑剔的精美饰品。'),(2,1,2,'创意水晶跑车车模',77,'giftPictures/2.png',69,31,0,'2016-04-28 12:04:59','高级K9水晶汽车模型，兰博基尼、保时捷、奥迪、路虎等名车可选，可定制车牌和车标，底座上可刻祝福语，送男性的最佳礼品。'),(3,1,3,'猫眼石泰银手镯',238,'giftPictures/3.png',48,52,0,'2016-04-28 12:21:00','猫眼石Cat\'s eye是珠宝中稀有而名贵的品种，它常被认为是好运气的象征，人们相信它会保护主人健康长寿，免于贫困。'),(4,1,4,'百家姓紫砂杯',198,'giftPictures/4.png',89,11,2,'2016-04-28 14:41:36','专属姓氏定制的紫砂杯，可根据您的要求定制百家姓，独一无二高大上的礼品，送爸爸长辈领导客户的满分礼物。'),(5,1,1,'谭木匠爱意雕刻木梳',99,'giftPictures/5.png',49,41,2,'2016-04-28 15:58:41','谭木匠正品，独特的“爱”字雕刻，尤其适合送给妈妈和老婆，高档礼盒包装，送去一份关心和爱护。'),(6,1,2,'ZIPPO定制照片打火机',158,'giftPictures/6.png',9,91,3,'2016-04-28 16:08:37','送男友打火机代表“非你不嫁”，送老公代表对他的理解和宽容，ZIPPO可定制款，照片文字皆可雕刻，打造独一无二的专属礼物。'),(7,1,3,'浪漫爱心纯银星座项链',169,'giftPictures/7.png',75,25,0,'2016-04-28 16:28:18','浪漫双心造型，代表心心相印，外面镶嵌11颗锆钻，代表一生一世的爱。十二星座尾坠可选，免费刻字，送给星座迷女生的首选浪漫礼物。'),(8,1,4,'浪漫星空投影机',58,'giftPictures/8.png',44,46,0,'2016-04-28 16:54:01','能在夜晚的房间里投影星空的创意灯，在家就能看满天繁星，享受浪漫满屋的感觉，送ta一个美丽的夜空。'),(9,1,1,'心心相印紫水晶星座手链',139,'giftPictures/9.png',44,56,0,'2016-04-28 17:09:03','心心相印浪漫设计，925银饰镶嵌天燃紫水晶，可免费刻字，十二星座尾坠可选，最浪漫个性手链之选。'),(10,1,1,'创意水晶沙漏',95,'giftPictures/10.png',98,2,0,'2016-05-09 19:23:45','沙漏象征着爱情、友谊和幸福，水晶象征纯洁。水晶沙漏代表纯洁的情谊，支持个性刻字、定制图案，多种颜色可选。'),(11,1,5,'925银镶钻十字架项坠',169,'giftPictures/11.png',60,40,0,'2016-05-09 19:25:12','八心八箭组合而成的十字架项坠，展现女性独特气质，送爱人、送闺蜜的个性之选。'),(12,1,5,'上海故事天然真丝围巾',189,'giftPictures/12.png',66,34,0,'2016-05-09 19:28:04','100%天然桑蚕丝，柔软顺滑，抗菌美肤，轻薄透气，送气质女士的时尚实用礼物之选。'),(13,1,2,'创意天气预报瓶 风暴预测瓶',89,'giftPictures/13.png',69,30,1,'2016-05-09 19:45:04','源于17世纪欧洲的天气预测器“Storm Glass”， 当瓶中液体清澈干净，代表天气晴朗； 当瓶中液体混浊朦胧，代表天空多云阴郁； 当瓶中出现大片结晶，代表将降温甚至下雪。'),(14,1,2,'初音未来无线蓝牙耳麦',109,'giftPictures/14.png',82,18,1,'2016-05-09 19:57:03','宅男专属，初音未来动漫主题，无线蓝牙功能十分强大，游戏、影音必备的数码礼物。'),(15,1,2,'创意魔方蓝牙动漫音响',129,'giftPictures/15.png',19,1,0,'2016-05-12 08:32:00','乍眼看去让你无法分辨是什么的创意音响，它是动漫主题的电子产品，更是高品质的智能音响，拥有语音通话、音乐、蓝牙等多种强大功能的新一代数码礼物。'),(16,1,17,'福寿双全寿桃摆件 祝寿礼物',120,'giftPictures/16.png',1,1,0,'2016-05-15 14:15:42','福寿桃寓意：福如东海，寿比南山，是祝寿时候送给老人的不二之选。');

/*Table structure for table `g_giftpicture` */

DROP TABLE IF EXISTS `g_giftpicture`;

CREATE TABLE `g_giftpicture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `GIFT_ID` int(11) DEFAULT NULL COMMENT '礼品id',
  `PICTURE` varchar(100) DEFAULT NULL COMMENT '礼品详情图片',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

/*Data for the table `g_giftpicture` */

insert  into `g_giftpicture`(`ID`,`GIFT_ID`,`PICTURE`) values (1,1,'giftPictures/1.1.png'),(2,1,'giftPictures/1.2.png'),(3,1,'giftPictures/1.3.png'),(4,1,'giftPictures/1.4.png'),(5,1,'giftPictures/1.5.png'),(6,1,'giftPictures/1.6.png'),(7,1,'giftPictures/1.7.png'),(8,1,'giftPictures/1.8.png'),(9,2,'giftPictures/2.1.png'),(10,2,'giftPictures/2.2.png'),(11,2,'giftPictures/2.3.png'),(12,2,'giftPictures/2.4.png'),(13,2,'giftPictures/2.5.png'),(14,2,'giftPictures/2.6.png'),(15,2,'giftPictures/2.7.png'),(16,2,'giftPictures/2.8.png'),(17,3,'giftPictures/3.1.png'),(18,3,'giftPictures/3.2.png'),(19,3,'giftPictures/3.3.png'),(20,3,'giftPictures/3.4.png'),(21,3,'giftPictures/3.5.png'),(22,3,'giftPictures/3.6.png'),(23,3,'giftPictures/3.7.png'),(24,3,'giftPictures/3.8.png'),(25,4,'giftPictures/4.1.png'),(26,4,'giftPictures/4.2.png'),(27,4,'giftPictures/4.3.png'),(28,4,'giftPictures/4.4.png'),(29,4,'giftPictures/4.5.png'),(30,4,'giftPictures/4.6.png'),(31,4,'giftPictures/4.7.png'),(32,4,'giftPictures/4.8.png'),(33,5,'giftPictures/5.1.png'),(34,5,'giftPictures/5.2.png'),(35,5,'giftPictures/5.3.png'),(36,5,'giftPictures/5.4.png'),(37,5,'giftPictures/5.5.png'),(38,5,'giftPictures/5.6.png'),(39,5,'giftPictures/5.7.png'),(40,5,'giftPictures/5.8.png'),(41,6,'giftPictures/6.1.png'),(42,6,'giftPictures/6.2.png'),(43,6,'giftPictures/6.3.png'),(44,6,'giftPictures/6.4.png'),(45,6,'giftPictures/6.5.png'),(46,6,'giftPictures/6.6.png'),(47,6,'giftPictures/6.7.png'),(48,6,'giftPictures/6.8.png'),(49,7,'giftPictures/7.1.png'),(50,7,'giftPictures/7.2.png'),(51,7,'giftPictures/7.3.png'),(52,7,'giftPictures/7.4.png'),(53,7,'giftPictures/7.5.png'),(54,7,'giftPictures/7.6.png'),(55,7,'giftPictures/7.7.png'),(56,7,'giftPictures/7.8.png'),(57,8,'giftPictures/8.1.png'),(58,8,'giftPictures/8.2.png'),(59,8,'giftPictures/8.3.png'),(60,8,'giftPictures/8.4.png'),(61,8,'giftPictures/8.5.png'),(62,8,'giftPictures/8.6.png'),(63,8,'giftPictures/8.7.png'),(64,8,'giftPictures/8.8.png'),(65,9,'giftPictures/9.1.png'),(66,9,'giftPictures/9.2.png'),(67,9,'giftPictures/9.3.png'),(68,9,'giftPictures/9.4.png'),(69,9,'giftPictures/9.5.png'),(70,9,'giftPictures/9.6.png'),(71,9,'giftPictures/9.7.png'),(72,9,'giftPictures/9.8.png'),(73,10,'giftPictures/10.1.png'),(74,10,'giftPictures/10.2.png'),(75,10,'giftPictures/10.3.png'),(76,10,'giftPictures/10.4.png'),(77,10,'giftPictures/10.5.png'),(78,10,'giftPictures/10.6.png'),(79,10,'giftPictures/10.7.png'),(80,10,'giftPictures/10.8.png'),(81,11,'giftPictures/11.1.png'),(82,11,'giftPictures/11.2.png'),(83,11,'giftPictures/11.3.png'),(84,11,'giftPictures/11.4.png'),(85,11,'giftPictures/11.5.png'),(86,11,'giftPictures/11.6.png'),(87,11,'giftPictures/11.7.png'),(88,11,'giftPictures/11.8.png'),(89,12,'giftPictures/12.1.png'),(90,12,'giftPictures/12.2.png'),(91,12,'giftPictures/12.3.png'),(92,12,'giftPictures/12.4.png'),(93,12,'giftPictures/12.5.png'),(94,12,'giftPictures/12.6.png'),(95,12,'giftPictures/12.7.png'),(96,12,'giftPictures/12.8.png'),(97,13,'giftPictures/13.1.png'),(98,13,'giftPictures/13.2.png'),(99,13,'giftPictures/13.3.png'),(100,13,'giftPictures/13.4.png'),(101,13,'giftPictures/13.5.png'),(102,13,'giftPictures/13.6.png'),(103,13,'giftPictures/13.7.png'),(104,13,'giftPictures/13.8.png'),(105,14,'giftPictures/14.1.png'),(106,14,'giftPictures/14.2.png'),(107,14,'giftPictures/14.3.png'),(108,14,'giftPictures/14.4.png'),(109,14,'giftPictures/14.5.png'),(110,14,'giftPictures/14.6.png'),(111,14,'giftPictures/14.7.png'),(112,14,'giftPictures/14.8.png'),(113,15,'giftPictures/15.1.png'),(114,15,'giftPictures/15.2.png'),(115,15,'giftPictures/15.3.png'),(116,15,'giftPictures/15.4.png'),(117,15,'giftPictures/15.5.png'),(118,15,'giftPictures/15.6.png'),(119,15,'giftPictures/15.7.png'),(120,15,'giftPictures/15.8.png'),(121,16,'giftPictures/16.3.png'),(122,16,'giftPictures/16.4.png'),(123,16,'giftPictures/16.5.png'),(124,16,'giftPictures/16.6.png'),(125,16,'giftPictures/16.7.png'),(126,16,'giftPictures/16.8.png'),(127,16,'giftPictures/16.2.png'),(128,16,'giftPictures/16.1.png');

/*Table structure for table `g_order` */

DROP TABLE IF EXISTS `g_order`;

CREATE TABLE `g_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ORDER_STATE` varchar(20) DEFAULT NULL COMMENT '订单状态',
  `USER_ACCOUNT` varchar(30) DEFAULT NULL COMMENT '订单所属账户',
  `ADDRESS_ID` int(11) DEFAULT NULL COMMENT '订单所属地址id',
  `ORDER_TIME` datetime DEFAULT NULL COMMENT '订单生成时间',
  `GIFT_ID` int(11) DEFAULT NULL COMMENT '礼品id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `g_order` */

insert  into `g_order`(`ID`,`ORDER_STATE`,`USER_ACCOUNT`,`ADDRESS_ID`,`ORDER_TIME`,`GIFT_ID`) values (3,'已评价','123@qq.com',1,'2016-05-04 13:25:08',4),(13,'已评价','123@qq.com',3,'2016-05-11 14:44:33',6),(15,'已评价','123@qq.com',4,'2016-05-11 17:44:40',2),(16,'已评价','123@qq.com',4,'2016-05-11 17:47:15',5),(20,'已评价','720@qq.com',5,'2016-05-12 23:23:44',1),(21,'已评价','123@qq.com',1,'2016-05-13 16:08:32',10),(22,'已评价','926@qq.com',7,'2016-05-13 16:57:33',6),(23,'待收货','926@qq.com',7,'2016-05-13 16:57:58',15),(24,'待收货','123@qq.com',4,'2016-05-24 18:11:01',16),(25,'待评价','720@qq.com',6,'2016-05-24 18:15:11',8),(26,'待评价','720@qq.com',5,'2016-05-24 18:40:56',13);

/*Table structure for table `g_orderdetails` */

DROP TABLE IF EXISTS `g_orderdetails`;

CREATE TABLE `g_orderdetails` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ORDER_ID` int(11) DEFAULT NULL COMMENT '订单id',
  `GIFT_ID` int(11) DEFAULT NULL COMMENT '订单中礼品的id',
  `GIFT_NUM` int(11) DEFAULT NULL COMMENT '订单中礼品的数量',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `g_orderdetails` */

/*Table structure for table `g_user` */

DROP TABLE IF EXISTS `g_user`;

CREATE TABLE `g_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ACCOUNT` varchar(30) DEFAULT NULL COMMENT '帐号',
  `PASSWORD` varchar(30) DEFAULT NULL COMMENT '密码',
  `ISADMIN` varchar(10) DEFAULT NULL COMMENT '是否为管理员身份',
  `HEAD` varchar(100) DEFAULT NULL COMMENT '头像',
  `BALANCE` double DEFAULT NULL COMMENT '账户余额',
  `NAME` varchar(255) DEFAULT NULL COMMENT '昵称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `g_user` */

insert  into `g_user`(`ID`,`ACCOUNT`,`PASSWORD`,`ISADMIN`,`HEAD`,`BALANCE`,`NAME`) values (1,'814@qq.com','111','yes','head2.png',1000,'后台管理员--Sunny'),(2,'123@qq.com','111','no','head4.png',0,'lokey'),(6,'720@qq.com','111','no','head7.png',100,'亲亲...亲爱的'),(7,'926@qq.com','111','no','head8.png',0,'新用户');

/*Table structure for table `g_whocategory` */

DROP TABLE IF EXISTS `g_whocategory`;

CREATE TABLE `g_whocategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `NAME` varchar(30) DEFAULT NULL COMMENT '送给谁类别的名字',
  `BIGWHO_ID` int(11) DEFAULT NULL COMMENT '送给谁的总类别id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `g_whocategory` */

insert  into `g_whocategory`(`ID`,`NAME`,`BIGWHO_ID`) values (1,'女友礼物',1),(2,'男友礼物',1),(3,'闺蜜',2),(4,'毕业礼物',2),(5,'妈妈',3),(6,'爸爸',3),(7,'领导',4),(8,'客户',4),(10,'结婚礼物',1),(11,'约会',1),(12,'结婚纪念',1),(13,'同事礼物',4),(14,'拜访送礼',4),(15,'商务送礼',4),(16,'浪漫',1),(17,'老人',3);

/*Table structure for table `whatcategory` */

DROP TABLE IF EXISTS `whatcategory`;

CREATE TABLE `whatcategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `NAME` varchar(30) DEFAULT NULL COMMENT '送什么类别名字',
  `BIGWHAT_ID` int(11) DEFAULT NULL COMMENT '送什么的总类别id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `whatcategory` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
