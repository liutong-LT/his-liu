/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.31 : Database - his
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`his` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `his`;

/*Table structure for table `check_apply` */

DROP TABLE IF EXISTS `check_apply`;

CREATE TABLE `check_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `register_id` int(11) DEFAULT NULL COMMENT '病历号',
  `item_id` int(11) DEFAULT NULL COMMENT '项目id',
  `item_name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `fee` decimal(8,2) DEFAULT NULL COMMENT '检查费用',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `active` int(11) DEFAULT '1' COMMENT '是否有效，1 有效，0 失效',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='检查申请';

/*Data for the table `check_apply` */

insert  into `check_apply`(`id`,`register_id`,`item_id`,`item_name`,`fee`,`status`,`active`,`createtime`) values (1,5,1,'CT胸部平扫','120.00',2,1,'2020-08-29 06:42:58'),(2,5,2,'小器官超声','100.00',2,1,'2020-08-29 06:42:58'),(3,5,3,'胸透','160.00',2,1,'2020-08-29 06:42:58'),(5,5,4,'腹部核磁','500.00',2,1,'2020-08-29 07:13:35'),(6,1,1,'CT胸部平扫','130.00',1,1,'2020-08-29 07:15:55'),(7,10,1,'CT胸部平扫','130.00',4,1,'2020-09-02 06:10:30'),(8,10,2,'小器官超声','100.00',4,1,'2020-09-02 06:10:30'),(9,10,3,'胸透','160.00',4,1,'2020-09-02 06:10:30'),(10,10,4,'腹部核磁','500.00',1,1,'2020-09-02 06:10:30');

/*Table structure for table `check_item` */

DROP TABLE IF EXISTS `check_item`;

CREATE TABLE `check_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '检查名称',
  `fee` decimal(8,2) DEFAULT NULL COMMENT '检查费用',
  `active` int(11) DEFAULT '1' COMMENT '是否有效，1 有效，0 失效',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='检查项目';

/*Data for the table `check_item` */

insert  into `check_item`(`id`,`name`,`fee`,`active`,`createtime`) values (1,'CT胸部平扫','130.00',1,'2020-08-29 01:55:32'),(2,'小器官超声','100.00',1,'2020-08-29 01:55:49'),(3,'胸透','160.00',1,'2020-08-29 01:56:08'),(4,'腹部核磁','500.00',1,'2020-08-29 02:03:20');

/*Table structure for table `constant_item` */

DROP TABLE IF EXISTS `constant_item`;

CREATE TABLE `constant_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_id` int(11) DEFAULT NULL COMMENT '类别id',
  `code` varchar(100) DEFAULT NULL COMMENT '常数项代码',
  `name` varchar(100) DEFAULT NULL COMMENT '常数项名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `active` int(11) DEFAULT '1' COMMENT '是否有效，1 有效，0 失效',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='常数项表';

/*Data for the table `constant_item` */

insert  into `constant_item`(`id`,`type_id`,`code`,`name`,`sort`,`active`,`createtime`) values (1,1,'1','男',1,1,'2020-08-25 07:18:25'),(2,1,'2','女',2,1,'2020-08-25 07:18:35'),(3,2,'1','已挂号',1,1,'2020-08-25 07:19:38'),(4,2,'2','已接诊',2,1,'2020-08-25 07:19:39'),(5,2,'3','已退号',3,1,'2020-08-25 07:19:39'),(7,4,'1','医疗科室',1,1,'2020-08-25 07:39:30'),(8,4,'0','非医疗科室',2,1,'2020-08-25 07:39:43'),(10,1,'3','未知',3,1,'2020-08-26 03:07:43'),(11,5,'1','待缴费',1,1,'2020-08-29 06:36:25'),(12,5,'2','待检查',2,1,'2020-08-29 06:36:34'),(13,5,'3','已检查',3,1,'2020-08-29 06:36:52'),(14,5,'4','已退费',4,1,'2020-08-29 06:37:03'),(15,6,'1','待缴费',1,1,'2020-09-01 02:24:51'),(16,6,'2','待检查',2,1,'2020-09-01 02:25:03'),(17,6,'3','已检查',3,1,'2020-09-01 02:25:13'),(18,6,'4','已退费',4,1,'2020-09-01 02:25:29'),(19,3,'1','门诊',1,1,'2020-09-02 06:33:43'),(20,3,'2','医技',2,1,'2020-09-02 06:34:00');

/*Table structure for table `constant_type` */

DROP TABLE IF EXISTS `constant_type`;

CREATE TABLE `constant_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(100) DEFAULT NULL COMMENT '代码',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `active` int(11) DEFAULT '1' COMMENT '是否有效，1 有效，0 失效',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='常数类别';

/*Data for the table `constant_type` */

insert  into `constant_type`(`id`,`code`,`name`,`active`,`createtime`) values (1,'GENDER','性别码',1,'2020-08-25 06:15:00'),(2,'REGISTER_STATUS','挂号状态',0,'2020-08-25 06:15:33'),(3,'DOCTOR_TYPE','医生类型',1,'2020-08-25 06:34:39'),(4,'DEPT_TYPE','科室类别',1,'2020-08-25 07:34:58'),(5,'CHECK_APPLY_STATUS','申请检查的状态',1,'2020-08-29 06:35:34'),(6,'INSPECT_APPLY_STATUS','申请检验的状态',1,'2020-09-01 02:24:18');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `address` varchar(200) DEFAULT NULL COMMENT '办公地址',
  `leader` varchar(100) DEFAULT NULL COMMENT '负责人',
  `type` int(11) NOT NULL COMMENT '科室类别',
  `active` int(11) DEFAULT '1' COMMENT '是否有效，1 有效，0 失效',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='科室';

/*Data for the table `department` */

insert  into `department`(`id`,`name`,`address`,`leader`,`type`,`active`,`createtime`) values (1,'影像科','3楼301','扁鹊医生',1,1,'2020-08-26 02:08:31'),(2,'心内科','4楼401','华医生',1,1,'2020-08-26 02:09:05'),(3,'保卫科','1楼102','张队长',0,1,'2020-08-26 02:09:32'),(4,'神经内科','内科楼302','张博士',1,1,'2020-08-26 02:19:12');

/*Table structure for table `inspect_apply` */

DROP TABLE IF EXISTS `inspect_apply`;

CREATE TABLE `inspect_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `register_id` int(11) DEFAULT NULL COMMENT '病历号',
  `item_id` int(11) DEFAULT NULL COMMENT '项目id',
  `item_name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `fee` decimal(8,2) DEFAULT NULL COMMENT '检查费用',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `active` int(11) DEFAULT '1' COMMENT '是否有效，1 有效，0 失效',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='检验申请';

/*Data for the table `inspect_apply` */

insert  into `inspect_apply`(`id`,`register_id`,`item_id`,`item_name`,`fee`,`status`,`active`,`createtime`) values (1,5,1,'尿蛋白','100.00',2,1,'2020-09-01 01:31:28'),(2,5,2,'肿瘤标记物','300.00',2,1,'2020-09-01 01:31:28'),(3,10,1,'尿蛋白','100.00',1,1,'2020-09-02 06:09:51'),(4,10,2,'肿瘤标记物','300.00',1,1,'2020-09-02 06:09:51'),(5,10,3,'心电图','100.00',4,1,'2020-09-02 06:09:51'),(6,10,4,'红细胞比例','50.00',4,1,'2020-09-02 06:09:51');

/*Table structure for table `inspect_item` */

DROP TABLE IF EXISTS `inspect_item`;

CREATE TABLE `inspect_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '检查名称',
  `fee` decimal(8,2) DEFAULT NULL COMMENT '检查费用',
  `active` int(11) DEFAULT '1' COMMENT '是否有效，1 有效，0 失效',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='检验项目';

/*Data for the table `inspect_item` */

insert  into `inspect_item`(`id`,`name`,`fee`,`active`,`createtime`) values (1,'尿蛋白','100.00',1,'2020-08-29 02:15:21'),(2,'肿瘤标记物','300.00',1,'2020-08-29 02:15:37'),(3,'心电图','100.00',1,'2020-08-29 02:15:53'),(4,'红细胞比例','50.00',1,'2020-08-29 02:26:26');

/*Table structure for table `regist_level` */

DROP TABLE IF EXISTS `regist_level`;

CREATE TABLE `regist_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `fee` decimal(8,2) DEFAULT NULL COMMENT '费用',
  `active` int(11) DEFAULT '1' COMMENT '是否有效，1 有效，0 失效',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='挂号级别';

/*Data for the table `regist_level` */

insert  into `regist_level`(`id`,`name`,`fee`,`active`,`createtime`) values (1,'专家诊','200.00',1,'2020-08-25 07:59:01'),(2,'教授','100.00',1,'2020-08-25 07:59:17'),(3,'主治','50.00',1,'2020-08-25 07:59:31'),(4,'普通诊','10.00',1,'2020-08-25 07:59:43'),(5,'副教授','30.00',0,'2020-08-25 08:04:47');

/*Table structure for table `register` */

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id病历号',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `gender` int(11) DEFAULT NULL COMMENT '性别',
  `idno` varchar(100) DEFAULT NULL COMMENT '身份证号',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `address` varchar(200) DEFAULT NULL COMMENT '家庭住址',
  `regsit_level_id` int(11) DEFAULT NULL COMMENT '挂号级别',
  `dept_id` int(11) DEFAULT NULL COMMENT '挂号科室',
  `doctor_id` int(11) DEFAULT NULL COMMENT '看诊医生',
  `readme` varchar(500) DEFAULT NULL COMMENT '主诉',
  `visittime` date DEFAULT NULL COMMENT '看诊时间',
  `present` varchar(500) DEFAULT NULL COMMENT '现病史',
  `present_treat` varchar(500) DEFAULT NULL COMMENT '现病史治疗情况',
  `history` varchar(500) DEFAULT NULL COMMENT '既往史',
  `allergy` varchar(500) DEFAULT NULL COMMENT '过敏史',
  `book` int(11) DEFAULT NULL COMMENT '是否要病历本',
  `fee` decimal(8,2) DEFAULT NULL COMMENT '挂号费用',
  `disease` varchar(500) DEFAULT NULL COMMENT '确诊疾病',
  `suit` varchar(500) DEFAULT NULL COMMENT '处置方案',
  `drug` varchar(500) DEFAULT NULL COMMENT '药品清单',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `active` int(11) DEFAULT '1' COMMENT '是否有效，1 有效，0 失效',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='诊疗信息';

/*Data for the table `register` */

insert  into `register`(`id`,`name`,`gender`,`idno`,`birthday`,`age`,`address`,`regsit_level_id`,`dept_id`,`doctor_id`,`readme`,`visittime`,`present`,`present_treat`,`history`,`allergy`,`book`,`fee`,`disease`,`suit`,`drug`,`status`,`active`,`createtime`) values (1,'张飞',1,'23230219888080','2020-08-03',50,'天津空港',1,2,1,'主诉\n',NULL,'现病史\n','现病史治疗情况','既往史\n','过敏史\n',0,'200.00',NULL,NULL,NULL,2,1,'2020-08-26 08:22:36'),(2,'诸葛亮',1,'2313213646546','2020-08-04',50,'南京长江边',2,4,8,NULL,NULL,NULL,NULL,NULL,NULL,1,'101.00',NULL,NULL,NULL,1,1,'2020-08-27 01:45:12'),(3,'关羽',2,'5464654656654654','2020-08-04',45,'北京西四环',1,2,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'200.00',NULL,NULL,NULL,2,1,'2020-08-27 01:47:20'),(4,'许诸',1,'1212121212121212121','2020-08-03',52,'黑龙江',1,2,3,NULL,NULL,NULL,NULL,NULL,NULL,0,'200.00',NULL,NULL,NULL,2,1,'2020-08-27 01:54:56'),(5,'张辽',1,'56465464564645','2020-08-06',44,'河南',2,2,2,'主诉',NULL,'现病史','现病史治疗情况','既往史\n','过敏史',0,'100.00',NULL,NULL,NULL,2,1,'2020-08-27 01:58:06'),(6,'孙权',1,'897987945654656','2020-08-04',66,'东吴',1,2,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'200.00',NULL,NULL,NULL,2,1,'2020-08-27 02:00:35'),(7,'黄月英',2,'54646546546','2020-08-03',18,'三国',1,2,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'200.00',NULL,NULL,NULL,1,1,'2020-08-27 02:01:32'),(8,'苏妲己',2,'514654654654645','2020-08-04',45,'封神演义',1,4,7,NULL,NULL,NULL,NULL,NULL,NULL,0,'200.00',NULL,NULL,NULL,3,1,'2020-08-27 02:02:26'),(9,'张三',1,'1212121121212','2020-08-04',44,'辽宁',1,2,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'200.00',NULL,NULL,NULL,2,1,'2020-08-27 02:23:14'),(10,'周瑜',1,'2212548651516546','2020-09-24',50,'东吴',1,2,1,'主诉\n','2020-09-02','现病史\n','现病史治疗情况','既往史','过敏史',0,'200.00','确认疾病','处置方案\n','1药品清单\n2药品清单',2,1,'2020-09-02 01:44:05');

/*Table structure for table `ums_permission` */

DROP TABLE IF EXISTS `ums_permission`;

CREATE TABLE `ums_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(100) DEFAULT NULL COMMENT '权限名称',
  `url` varchar(100) DEFAULT NULL COMMENT '资源路径',
  `type` int(11) DEFAULT NULL COMMENT '0 资源 1 导航',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级id',
  `active` int(11) DEFAULT '1' COMMENT '是否有效，1 有效，0 失效',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='权限';

/*Data for the table `ums_permission` */

insert  into `ums_permission`(`id`,`name`,`url`,`type`,`parent_id`,`active`,`createtime`) values (1,'挂号收费','',1,0,1,'2020-09-02 07:08:05'),(2,'现场挂号','/regist',0,1,1,'2020-09-02 07:08:25'),(3,'收费','/fee',0,1,1,'2020-09-02 07:08:38'),(4,'退号','/return_num',0,1,1,'2020-09-02 07:08:50'),(5,'退费','/refund',0,1,1,'2020-09-02 07:09:05'),(6,'医生工作站','',1,0,1,'2020-09-02 07:09:19'),(7,'病历首页','/doctor-home',0,6,1,'2020-09-02 07:09:31'),(8,'用户和权限','',1,0,1,'2020-09-02 07:09:38'),(9,'用户管理','/user',0,8,1,'2020-09-02 07:09:52'),(10,'角色管理','/role',0,8,1,'2020-09-02 07:10:01'),(11,'权限管理','/permission',0,8,1,'2020-09-02 07:10:12'),(12,'基本信息管理','',1,0,1,'2020-09-02 07:10:27'),(13,'常数类别管理','/constant-type',0,12,1,'2020-09-02 07:10:41'),(14,'常数项目管理','/constant-item',0,12,1,'2020-09-02 07:10:50'),(15,'挂号级别','/registlevel',0,12,1,'2020-09-02 07:10:59'),(16,'科室管理','/dept',0,12,1,'2020-09-02 07:11:24'),(17,'检查项目管理','/check-item',0,12,1,'2020-09-02 07:11:35'),(18,'检验项目管理','/inspect-item',0,12,1,'2020-09-02 07:11:56'),(19,'查询用户','/ums-user/list',2,2,1,'2020-09-03 02:17:18'),(20,'挂号保存','/register/regist',2,2,1,'2020-09-03 02:25:50'),(21,'获取最大的病历号','/register/maxNum',2,2,1,'2020-09-03 02:26:10'),(22,'挂号级别列表','/regist-level/list',2,2,1,'2020-09-03 02:27:25'),(23,'科室的列表','/department/list',2,2,1,'2020-09-03 02:27:39');

/*Table structure for table `ums_role` */

DROP TABLE IF EXISTS `ums_role`;

CREATE TABLE `ums_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` char(10) DEFAULT NULL COMMENT '角色名称',
  `active` int(11) DEFAULT '1' COMMENT '是否有效，1 有效，0 失效',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色';

/*Data for the table `ums_role` */

insert  into `ums_role`(`id`,`name`,`active`,`createtime`) values (1,'管理员',1,'2020-08-25 03:16:13'),(2,'医生',1,'2020-08-25 03:16:19'),(3,'挂号收费员',1,'2020-08-25 03:16:30');

/*Table structure for table `ums_role_permission` */

DROP TABLE IF EXISTS `ums_role_permission`;

CREATE TABLE `ums_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `permission_id` varchar(1000) DEFAULT NULL COMMENT '权限ids',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色权限';

/*Data for the table `ums_role_permission` */

insert  into `ums_role_permission`(`id`,`role_id`,`permission_id`) values (1,1,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18'),(2,2,'6,7'),(3,3,'1,2,19,20,21,22,23,3,4,5');

/*Table structure for table `ums_user` */

DROP TABLE IF EXISTS `ums_user`;

CREATE TABLE `ums_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `user_type` int(11) DEFAULT NULL COMMENT '医生类型',
  `lastlogin` datetime DEFAULT NULL COMMENT '最后登录时间',
  `registlevel` int(11) DEFAULT NULL COMMENT '医生级别',
  `dept_id` int(11) DEFAULT NULL COMMENT '归属科室',
  `active` int(11) DEFAULT '1' COMMENT '是否有效，1 有效，0 失效',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `ums_user` */

insert  into `ums_user`(`id`,`username`,`password`,`realname`,`telephone`,`user_type`,`lastlogin`,`registlevel`,`dept_id`,`active`,`createtime`) values (1,'bianque','$2a$10$o7hd75PcUd.1rJ70bfbGEu5aBdB0O5zJsMBZo71pmvn1uj6cYeO3W','扁鹊','13888888888',1,'2020-09-03 10:35:14',1,2,1,'2020-08-25 02:45:38'),(2,'user1','$2a$10$o7hd75PcUd.1rJ70bfbGEu5aBdB0O5zJsMBZo71pmvn1uj6cYeO3W','华佗','13888888888',1,'2020-09-04 15:14:21',2,2,1,'2020-08-25 02:47:17'),(3,'user2','$2a$10$5XT0.OL7SiJsTxi9L65uReAWmxZ17Wf4nX4R02jI9WAzRHhgWAynq','李时珍','13888888888',1,NULL,1,2,1,'2020-08-25 02:48:32'),(4,'admin','$2a$10$5qMq6zLtywWcDAVQOQ4h8e34/zo4NJL/fistUGX5wmmsLDyEelguO','管理员','13888888888',1,'2020-09-03 15:18:17',2,2,1,'2020-08-25 02:48:32'),(5,'ghy','$2a$10$iTyG4/ArrUOMnVdG84XzL.8or2Mqppnikwfl8BU/dwAUHq8mKPEW.','挂号收费员','13888888888',1,'2020-09-03 11:21:07',1,2,1,'2020-08-25 02:48:33'),(6,'user5','$2a$10$kvSFjdV7YN7iZIcGTMAu1.YgQ9hj50xJjmvMbXxQCotTxXMfosWP.','李逵','13888888888',1,NULL,2,2,1,'2020-08-25 02:48:33'),(7,'user6','$2a$10$FAjz5BZIJ6PTmijUetIhu.9tpu3lBh8BsD9gxqoZsTa2hSk7/XopG','刘备','13888888888',1,NULL,1,4,1,'2020-08-25 02:48:33'),(8,'user7','$2a$10$WzAohvZ1HSd4InWre48qRuwv7yDiEqPOso8bgtZviwvegT6sgoB46','刘备1','13888888888',1,NULL,2,4,1,'2020-08-25 02:48:33'),(9,'user8','$2a$10$U1vPSGG9jmm7yGLM92XP4..na1wFzW0dr.bGSBnn4Rk2LkMo6XQDm','刘备2','13888888888',1,NULL,1,4,1,'2020-08-25 02:48:33'),(10,'user9','$2a$10$RhyWrjWAZu.ZQ.NIYPBZ2OGtwbenbJMozffv5t/Kj0TPUsa0573Ty','刘备3','13888888888',1,NULL,2,4,1,'2020-08-25 02:48:33'),(27,'lishizhen','$2a$10$YiJm7MSCjMiuVzmunlsxi.qhQLISJ6VpEgUUImNxXvgp0ApLMm6zC','李时珍','13888888888',1,NULL,1,4,1,'2020-09-02 07:00:19');

/*Table structure for table `ums_user_role` */

DROP TABLE IF EXISTS `ums_user_role`;

CREATE TABLE `ums_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(1000) DEFAULT NULL COMMENT '角色ids',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户角色';

/*Data for the table `ums_user_role` */

insert  into `ums_user_role`(`id`,`user_id`,`role_id`) values (1,2,'2,3'),(2,1,'2'),(3,4,'1'),(4,5,'3');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
