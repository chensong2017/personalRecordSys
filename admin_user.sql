/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : 127.0.0.1:3306
Source Database       : personalrecordsys

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-07-04 17:22:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码；md5加密',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像，相对于upload/avatar目录',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `email_code` varchar(60) DEFAULT NULL COMMENT '激活码',
  `phone` bigint(11) unsigned DEFAULT NULL COMMENT '手机号',
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `register_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `last_login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', '', null, null, '2', null, '', null);
INSERT INTO `admin_user` VALUES ('2', 'admin2', 'e10adc3949ba59abbe56e057f20f883e', '', '', null, null, '2', null, '', '2017-06-19 08:50:00');
INSERT INTO `admin_user` VALUES ('7', 'chensong', 'e10adc3949ba59abbe56e057f20f883e', '', '123', null, '123', '1', '0000-00-00 00:00:00', '', '2017-06-26 09:43:52');
INSERT INTO `admin_user` VALUES ('8', 'cs', '202cb962ac59075b964b07152d234b70', '', '123', null, '123', '1', '0000-00-00 00:00:00', '', '2017-07-04 17:13:16');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text COMMENT '规则id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '超级管理员', '1', '21,7,8,9,10,11,12,13,14,15,16,123,124,125,19,129,130,132,133,135,136,137,138,139,140,141,11,19');
INSERT INTO `auth_group` VALUES ('2', '普通管理员', '1', '6,96,1,2,3,4,56,57,60,61,63,71,72,65,67,74,75,66,68,69,70,73,77,78,82,83,88,89,90,99,91,92,97,98,104,105,106,107,108,118,109,110,111,112,117,113,114');

-- ----------------------------
-- Table structure for auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `group_id` int(11) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组明细表';

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES ('1', '1');
INSERT INTO `auth_group_access` VALUES ('2', '2');
INSERT INTO `auth_group_access` VALUES ('7', '1');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('21', '0', 'Admin/ShowNav/rule', '权限控制', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('7', '21', 'Admin/Rule/index', '权限管理', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('8', '7', 'Admin/Rule/add', '添加权限', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('9', '7', 'Admin/Rule/edit', '修改权限', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('10', '7', 'Admin/Rule/delete', '删除权限', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('11', '141', 'Admin/Rule/group', '用户组管理', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('12', '11', 'Admin/Rule/add_group', '添加用户组', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('13', '11', 'Admin/Rule/edit_group', '修改用户组', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('14', '11', 'Admin/Rule/delete_group', '删除用户组', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('15', '11', 'Admin/Rule/rule_group', '分配权限', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('16', '11', 'Admin/Rule/check_user', '添加成员', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('19', '141', 'Admin/Rule/admin_user_list', '管理员列表', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('132', '129', 'Admin/PersonalRecord/addBasic', '添加档案', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('141', '0', '', '用户管理', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('135', '130', 'Admin/PersonalRecord/delete', '删除档案', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('137', '130', 'Admin/PersonalRecord/addImg', '上传相册', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('138', '130', 'Admin/PersonalRecord/workExperience', '添加工作经验', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('139', '130', 'Admin/PersonalRecord/eduExperience', '添加教育经验', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('123', '11', 'Admin/Rule/add_user_to_group', '设置为管理员', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('124', '11', 'Admin/Rule/add_admin', '添加管理员', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('125', '11', 'Admin/Rule/edit_admin', '修改管理员', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('129', '0', 'Admin/PersonalRecord/', '人事信息管理', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('130', '129', 'Admin/PersonalRecord/index', '档案管理', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('136', '130', 'Admin/PersonalRecord/getList', '获取档案列表', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('140', '130', 'Admin/PersonalRecord/deleteImg', '删除图片', '1', '1', '');

-- ----------------------------
-- Table structure for edu_experience
-- ----------------------------
DROP TABLE IF EXISTS `edu_experience`;
CREATE TABLE `edu_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  `courses` varchar(255) DEFAULT NULL,
  `postion` varchar(50) DEFAULT NULL,
  `reterence` varchar(50) DEFAULT NULL,
  `reterence_phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edu_experience
-- ----------------------------
INSERT INTO `edu_experience` VALUES ('7', '133', '2017-07-12', '2017-07-14', 'sdsdc', 'cdsc', '本科', 'sdcs', 'sdsa', 'sdf', '');

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
  `live_address` varchar(255) NOT NULL DEFAULT '' COMMENT '居住地址',
  `qq` varchar(255) NOT NULL DEFAULT '' COMMENT 'qq号',
  `wechat` varchar(255) NOT NULL DEFAULT '' COMMENT '微信号',
  `native_place` varchar(255) NOT NULL DEFAULT '' COMMENT '籍贯',
  `birthday` date DEFAULT NULL COMMENT '出生年月日',
  `height` int(4) NOT NULL DEFAULT '0' COMMENT '身高',
  `major` varchar(255) NOT NULL DEFAULT '' COMMENT '学习专业',
  `hobby` varchar(255) NOT NULL DEFAULT '' COMMENT '爱好',
  `specialty` varchar(255) NOT NULL DEFAULT '' COMMENT '特长',
  `profile` varchar(1000) NOT NULL DEFAULT '' COMMENT '个人简介',
  `english_level` varchar(20) NOT NULL DEFAULT '' COMMENT '英语应用水平',
  `computer_level` varchar(20) NOT NULL DEFAULT '' COMMENT '计算机应用水平',
  `marital_status` varchar(20) NOT NULL DEFAULT '0' COMMENT '婚否,0否，1婚',
  `nation` varchar(50) NOT NULL DEFAULT '' COMMENT '名族',
  `graduate_institutions` varchar(255) NOT NULL DEFAULT '' COMMENT '毕业院校',
  `graduation_time` date DEFAULT NULL COMMENT '毕业时间',
  `registered_address` varchar(255) NOT NULL DEFAULT '' COMMENT '户口所在地',
  `id_number` varchar(20) NOT NULL DEFAULT '' COMMENT '身份证号',
  `political_status` varchar(20) NOT NULL DEFAULT '' COMMENT '政治面貌',
  `photo` varchar(2000) DEFAULT '',
  `degree` varchar(20) NOT NULL DEFAULT '' COMMENT '学历',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personal_record
-- ----------------------------
INSERT INTO `personal_record` VALUES ('133', '陈松', '1', '0', '', '', '', '北京市,市辖县,密云县', '', '', '天津市,市辖县,宁河县', '2017-07-04', '0', '', '', '', '', '', '', '', '', '', '2017-07-04', '江苏省,南京市,玄武区', '', '中共党员(含预备党员)', ',2017-07-04/595b5b8b1c30b.gif,2017-07-04/595b5b8b47e4d.jpg', '高中', '');

-- ----------------------------
-- Table structure for work_experience
-- ----------------------------
DROP TABLE IF EXISTS `work_experience`;
CREATE TABLE `work_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `postion` varchar(30) DEFAULT NULL,
  `reterence` varchar(30) DEFAULT NULL,
  `reterence_phone` varchar(255) DEFAULT NULL,
  `job_description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_experience
-- ----------------------------
INSERT INTO `work_experience` VALUES ('18', '133', '2017-07-04', '2017-07-05', 'cssds', 'csd', 'sd', 'ds', 'sdcsa');
