/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : personalrecordsys

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-06-20 23:06:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for personal_record
-- ----------------------------
DROP TABLE IF EXISTS `personal_record`;
CREATE TABLE `personal_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` tinyint(2) DEFAULT NULL,
  `age` tinyint(3) DEFAULT NULL,
  `cellphone` varchar(30) NOT NULL DEFAULT '' COMMENT '手机号',
  `telphone` varchar(30) NOT NULL DEFAULT '' COMMENT '座机号',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '居住地址',
  `qq` varchar(255) NOT NULL DEFAULT '' COMMENT 'qq号',
  `wechat` varchar(255) NOT NULL DEFAULT '' COMMENT '微信号',
  `native_place` varchar(255) NOT NULL DEFAULT '' COMMENT '籍贯',
  `birthday` date NOT NULL DEFAULT '2017-06-17' COMMENT '出生年月日',
  `height` int(3) NOT NULL DEFAULT '0' COMMENT '身高',
  `major` varchar(255) NOT NULL DEFAULT '' COMMENT '学习专业',
  `hobby` varchar(255) NOT NULL DEFAULT '' COMMENT '爱好',
  `specialty` varchar(255) NOT NULL DEFAULT '' COMMENT '特长',
  `profile` varchar(1000) NOT NULL DEFAULT '' COMMENT '个人简介',
  `English_level` varchar(255) NOT NULL DEFAULT '' COMMENT '英语应用水平',
  `computer_Level` varchar(255) NOT NULL DEFAULT '' COMMENT '计算机应用水平',
  `marital_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '婚否,0否，1婚',
  `nation` varchar(255) NOT NULL DEFAULT '' COMMENT '名族',
  `graduate_institutions` varchar(255) NOT NULL DEFAULT '' COMMENT '毕业院校',
  `graduation_time` date NOT NULL DEFAULT '2017-06-17' COMMENT '毕业时间',
  `registered_address` varchar(255) NOT NULL DEFAULT '' COMMENT '户口所在地',
  `ID_number` varchar(20) NOT NULL DEFAULT '' COMMENT '身份证号',
  `political_status` varchar(255) NOT NULL DEFAULT '' COMMENT '政治面貌',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `photo` varchar(2000) DEFAULT '',
  `educational_background` varchar(255) NOT NULL DEFAULT '' COMMENT '学历',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personal_record
-- ----------------------------
INSERT INTO `personal_record` VALUES ('1', 'sds', null, null, 'sd', 'sd', 's', 'sdd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '1', '', '0', '', '', '2017-06-17', '', 'sd', '', '', '', '');
INSERT INTO `personal_record` VALUES ('2', 'sd', null, null, 'sd', 'sd', 'sd', 'sd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', 'sd', '', '', '', '');
INSERT INTO `personal_record` VALUES ('3', 'sd', null, null, 'sd', 'sd', 'fd', 'df', 'gf', 'gf', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('4', 'sds', null, null, 'sd', 'sd', 's', 'sdd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', 'sd', '', '', '', '');
INSERT INTO `personal_record` VALUES ('5', 'sd', null, null, 'sd', 'sd', 'sd', 'sd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('6', 'sd', null, null, 'sd', 'sd', 'fd', 'df', 'gf', 'gf', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', 'sd', '', '', '', '');
INSERT INTO `personal_record` VALUES ('7', 'sds', null, null, 'sd', 'sd', 's', 'sdd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '1', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('8', 'sd', null, null, 'sd', 'sd', 'sd', 'sd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('9', 'sds', null, null, 'sd', 'sd', 's', 'sdd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('10', 'sd', null, null, 'sd', 'sd', 'sd', 'sd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('11', 'sd', null, null, 'sd', 'sd', 'fd', 'df', 'gf', 'gf', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('12', 'sds', null, null, 'sd', 'sd', 's', 'sdd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('13', 'sd', null, null, 'sd', 'sd', 'sd', 'sd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('14', 'sd', null, null, 'sd', 'sd', 'fd', 'df', 'gf', 'gf', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('15', 'sds', null, null, 'sd', 'sd', 's', 'sdd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('16', 'sd', null, null, 'sd', 'sd', 'sd', 'sd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('17', 'sds', null, null, 'sd', 'sd', 's', 'sdd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('18', 'sd', null, null, 'sd', 'sd', 'sd', 'sd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('19', 'sd', null, null, 'sd', 'sd', 'fd', 'df', 'gf', 'gf', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('20', 'sds', null, null, 'sd', 'sd', 's', 'sdd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('21', 'sd', null, null, 'sd', 'sd', 'sd', 'sd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('22', 'sd', null, null, 'sd', 'sd', 'fd', 'df', 'gf', 'gf', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('23', 'sds', null, null, 'sd', 'sd', 's', 'sdd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('24', 'sd', null, null, 'sd', 'sd', 'sd', 'sd', 'sd', 'sd', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
INSERT INTO `personal_record` VALUES ('25', 'sd', null, null, 'sd', 'sd', 'fd', 'df', 'gf', 'gf', '', '2017-06-17', '0', '', '', '', '', '', '', '0', '', '', '2017-06-17', '', '', '', '', '', '');
