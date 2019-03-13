/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : cs

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-03-13 21:02:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_access_permission_test`
-- ----------------------------
DROP TABLE IF EXISTS `sys_access_permission_test`;
CREATE TABLE `sys_access_permission_test` (
  `ID` varchar(32) NOT NULL COMMENT '访问权限表',
  `URL` varchar(50) DEFAULT NULL COMMENT '访问链接',
  `ROLES` varchar(255) DEFAULT NULL COMMENT '角色列表用,分割',
  `SORT` int(11) DEFAULT NULL COMMENT '排序号',
  `IS_DELETED` int(2) DEFAULT NULL COMMENT '是否删除',
  `CREATE_USER` varchar(32) DEFAULT NULL COMMENT '创建用户',
  `CREATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_USER` varchar(50) DEFAULT NULL COMMENT '更新用户',
  `UPDATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `uidx_request_url` (`URL`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_access_permission_test
-- ----------------------------
INSERT INTO `sys_access_permission_test` VALUES ('06f21ae7d0f84ec3835c078a2274a30b', '/supplier/pagelist', 'authc,roleOr[test,admin]', '328', null, 'gameloft9', null, null, null);
INSERT INTO `sys_access_permission_test` VALUES ('123836f0333a4e79b35ea41190829d1b', '/material/pagelist', 'authc,roleOr[test,admin]', '797', null, 'gameloft9', null, null, null);
INSERT INTO `sys_access_permission_test` VALUES ('2', '/index', 'anon', '2', '0', 'admin', '2017-12-25 16:41:08', 'admin', '2017-12-25 16:41:08');
INSERT INTO `sys_access_permission_test` VALUES ('3', '/login', 'anon', '3', '0', 'admin', '2017-12-25 16:41:08', 'admin', '2017-12-25 16:41:08');
INSERT INTO `sys_access_permission_test` VALUES ('4', '/role/*', 'authc,roles[admin]', '5', '0', 'admin', '2017-12-25 16:41:08', 'admin', '2017-12-25 16:41:08');
INSERT INTO `sys_access_permission_test` VALUES ('5', '/getVCode', 'anon', '4', '0', 'admin', '2017-12-25 16:41:09', 'admin', '2017-12-25 16:41:09');
INSERT INTO `sys_access_permission_test` VALUES ('6', '/**/*.do', 'authc', '999', '0', 'admin', '2017-12-25 16:41:09', 'admin', '2017-12-25 16:41:09');
INSERT INTO `sys_access_permission_test` VALUES ('6319f8a7688343139ac4ba0d40877e2c', 'sys/*', 'authc,roles[test,admin]', '201', '0', 'gameloft9', '2017-12-28 11:04:58', null, '2017-12-28 11:04:58');
INSERT INTO `sys_access_permission_test` VALUES ('662bd5d69e9d4c79b8ea86341085497b', '#', 'authc,roleOr[test,admin]', '256', null, 'gameloft9', null, null, null);
INSERT INTO `sys_access_permission_test` VALUES ('69173688d0a24369a071202553976b26', '/materialgoods/pagelist', 'authc,roleOr[test,admin]', '394', null, 'gameloft9', null, null, null);
INSERT INTO `sys_access_permission_test` VALUES ('7042e4eeebf5433388ddfdfb09764369', 'log/*', 'authc,roles[test,admin]', '419', '0', 'gameloft9', '2017-12-27 17:04:10', null, '2017-12-27 17:04:10');
INSERT INTO `sys_access_permission_test` VALUES ('7c1f21aa63cf4fd6a5be43072e81ab99', 'test/*', 'authc,roles[test,admin]', '135', '0', 'gameloft9', '2017-12-28 11:05:10', null, '2017-12-28 11:05:10');
INSERT INTO `sys_access_permission_test` VALUES ('7ee176c20c904536862da37aacb0f7c8', 'org/*', 'authc,roles[test]', '123', '0', 'gameloft9', '2017-12-27 17:04:18', null, '2017-12-27 17:04:18');
INSERT INTO `sys_access_permission_test` VALUES ('8e68507e882c4165b06a4a9147d14a34', 'role/*', 'authc,roles[admin]', '669', '0', 'gameloft9', '2017-12-27 17:04:04', null, '2017-12-27 17:04:04');
INSERT INTO `sys_access_permission_test` VALUES ('90762decb8874ba0955eb8cef21b6682', 'menu/*', 'authc,roles[admin]', '197', '0', 'gameloft9', '2017-12-28 11:02:26', null, '2017-12-28 11:02:26');
INSERT INTO `sys_access_permission_test` VALUES ('9a0ad03eb2114587be4f393dc1453bbc', '/su', 'authc,roleOr[test,admin]', '976', null, 'gameloft9', null, null, null);
INSERT INTO `sys_access_permission_test` VALUES ('b5fec16f715f437d853ad40b6ba4fd10', '#1', 'authc,roleOr[采购员,test,采购主管,admin]', '390', null, 'gameloft9', null, null, null);
INSERT INTO `sys_access_permission_test` VALUES ('c00878399d714d9ca35817c42f1279a9', '/po/pagelist', 'authc,roleOr[采购员,test,采购主管,admin]', '173', null, 'gameloft9', null, null, null);
INSERT INTO `sys_access_permission_test` VALUES ('c8c4e92a1ece4da79ede1763faecdf77', 'sysUser/*', 'authc,roles[admin]', '170', '0', 'gameloft9', '2017-12-27 17:05:49', null, '2017-12-27 17:05:49');
INSERT INTO `sys_access_permission_test` VALUES ('cd68bd030c7b42bbb679c7783991bd0e', '/', 'authc,roleOr[test,admin]', '286', null, 'gameloft9', null, null, null);
INSERT INTO `sys_access_permission_test` VALUES ('ce8ce9dbc39b4256ad297311fbd633b8', '/supplier/1', 'authc,roles[admin]', '239', null, 'gameloft9', null, null, null);

-- ----------------------------
-- Table structure for `sys_menu_role_test`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_role_test`;
CREATE TABLE `sys_menu_role_test` (
  `ID` varchar(32) NOT NULL,
  `MENU_ID` varchar(32) DEFAULT NULL COMMENT '菜单id',
  `ROLE_ID` varchar(32) DEFAULT NULL COMMENT '角色id',
  `CREATE_USER` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_USER` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `uidx_menu_role` (`MENU_ID`,`ROLE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_menu_role_test
-- ----------------------------
INSERT INTO `sys_menu_role_test` VALUES ('0a6f268da5de4454aebb3ce432523823', 'd7b4e7a53cc548978184bab10df511e1', '343859934ece44c988f53700fb34c80a', null, null, null, null);
INSERT INTO `sys_menu_role_test` VALUES ('123456789ijhg', '244247008b53450fa16bc503bc861b7c', 'J/F9-+?', null, '2017-12-26 09:46:03', null, '2017-12-26 09:46:03');
INSERT INTO `sys_menu_role_test` VALUES ('3baeaa21bb2d40eb9908b047166f246b', 'da49ab730b91420c9c372bc6a7d8b4c0', 'J/F9-+?', null, null, null, null);
INSERT INTO `sys_menu_role_test` VALUES ('4523b393aae64771aac4f91c5623599b', '244247008b53450fa16bc503bc861b7c', '343859934ece44c988f53700fb34c80a', null, '2018-01-11 14:47:33', null, '2018-01-11 14:47:33');
INSERT INTO `sys_menu_role_test` VALUES ('5636b0e21310410fb5917d5f0c4a77bf', '1a2d2de64e5f4b6fb8393ebfbc484e35', 'J/F9-+?', null, null, null, null);
INSERT INTO `sys_menu_role_test` VALUES ('5905556900e741a89aafec25948b8fca', '89e9f1eb41a240fea361e0d188375884', 'J/F9-+?', null, '2017-12-27 17:04:18', null, '2017-12-27 17:04:18');
INSERT INTO `sys_menu_role_test` VALUES ('5b79d6e436154cfb9533a531fb7eb744', '882b26afbdbb4d63bcba0cd826a5b9c1', '343859934ece44c988f53700fb34c80a', null, '2018-01-11 14:47:16', null, '2018-01-11 14:47:16');
INSERT INTO `sys_menu_role_test` VALUES ('6302f705514e4c839400f804ec29ec5c', '89e9f1eb41a240fea361e0d188375884', '343859934ece44c988f53700fb34c80a', null, '2018-01-11 14:46:55', null, '2018-01-11 14:46:55');
INSERT INTO `sys_menu_role_test` VALUES ('71fa522e4da04ab9abd6008d2cb1c070', '26b3df2c6d464a0b89858eb896b849d2', 'J/F9-+?', null, '2017-12-27 17:05:49', null, '2017-12-27 17:05:49');
INSERT INTO `sys_menu_role_test` VALUES ('7bdc2cd73ca442858af0ae94c9802d23', 'b8fdf9ee69dc4462b4ae08f43acff096', '98f6401f1b0f4fc3a31ea3908c887d31', null, null, null, null);
INSERT INTO `sys_menu_role_test` VALUES ('874970f9c9b14021909485f201479373', '1688998d013c4ebf95be6fd7e1fecb20', 'J/F9-+?', null, '2017-12-28 11:05:10', null, '2017-12-28 11:05:10');
INSERT INTO `sys_menu_role_test` VALUES ('8d740fcc2ee34a14af43f41a763a3f6a', 'bf41be14e2854868993eb065d58976e1', 'J/F9-+?', null, null, null, null);
INSERT INTO `sys_menu_role_test` VALUES ('90c099271e37425b92914d0e64017c96', 'd7b4e7a53cc548978184bab10df511e1', '002550614a8340809da685f62bad2067', null, null, null, null);
INSERT INTO `sys_menu_role_test` VALUES ('9d2a7fa6eb884b0a916bfe02c793430b', 'b8fdf9ee69dc4462b4ae08f43acff096', 'J/F9-+?', null, null, null, null);
INSERT INTO `sys_menu_role_test` VALUES ('9e6a0c74d51441b090fb9de269e0d955', '1a2d2de64e5f4b6fb8393ebfbc484e35', '343859934ece44c988f53700fb34c80a', null, null, null, null);
INSERT INTO `sys_menu_role_test` VALUES ('asdfr456yhbv123', '4a7f3cae133e4a51b8f35769b55163dd', 'J/F9-+?', null, '2017-12-26 09:46:29', null, '2017-12-26 09:46:29');
INSERT INTO `sys_menu_role_test` VALUES ('b560816ecca6476a80be92c6b3727ddf', 'd7b4e7a53cc548978184bab10df511e1', '98f6401f1b0f4fc3a31ea3908c887d31', null, null, null, null);
INSERT INTO `sys_menu_role_test` VALUES ('bd3b96f8742940e8acc628ff5c940465', 'b53bfdfe33444703aa76c2c1a1b8d820', 'J/F9-+?', null, '2017-12-27 17:04:03', null, '2017-12-27 17:04:03');
INSERT INTO `sys_menu_role_test` VALUES ('c559332ed15d4141bb29fa6642934541', 'd7b4e7a53cc548978184bab10df511e1', 'J/F9-+?', null, null, null, null);
INSERT INTO `sys_menu_role_test` VALUES ('c89cc73ffa1b40da943cb542b9b9819f', '882b26afbdbb4d63bcba0cd826a5b9c1', 'J/F9-+?', null, '2017-12-27 17:04:10', null, '2017-12-27 17:04:10');
INSERT INTO `sys_menu_role_test` VALUES ('cffbc45adbcc40e38526f5cc8ca2887c', '2408603f86104412b014814cb4d66bbc', '343859934ece44c988f53700fb34c80a', null, null, null, null);
INSERT INTO `sys_menu_role_test` VALUES ('d94df00cc40b42508ae0793952966c13', 'b8fdf9ee69dc4462b4ae08f43acff096', '343859934ece44c988f53700fb34c80a', null, null, null, null);
INSERT INTO `sys_menu_role_test` VALUES ('de88617ca58040a08118202c7c00a0e8', '2408603f86104412b014814cb4d66bbc', 'J/F9-+?', null, null, null, null);
INSERT INTO `sys_menu_role_test` VALUES ('e92a68532e134b2e9b8af46a43ce61e0', '1688998d013c4ebf95be6fd7e1fecb20', '343859934ece44c988f53700fb34c80a', null, '2018-01-11 14:47:42', null, '2018-01-11 14:47:42');
INSERT INTO `sys_menu_role_test` VALUES ('ed7ee58eda144d40915e3a4de4ba2981', 'da49ab730b91420c9c372bc6a7d8b4c0', '343859934ece44c988f53700fb34c80a', null, null, null, null);
INSERT INTO `sys_menu_role_test` VALUES ('f0e4d52abe77413ca660fea23e340cc3', 'b8fdf9ee69dc4462b4ae08f43acff096', '002550614a8340809da685f62bad2067', null, null, null, null);

-- ----------------------------
-- Table structure for `sys_menu_test`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_test`;
CREATE TABLE `sys_menu_test` (
  `ID` varchar(32) NOT NULL COMMENT '菜单表',
  `TITLE` varchar(100) NOT NULL COMMENT '菜单名称',
  `HREF` varchar(200) NOT NULL COMMENT '访问链接',
  `REQUEST_URL` varchar(200) DEFAULT NULL COMMENT '后台请求url',
  `ICON` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `CODE` varchar(100) DEFAULT NULL COMMENT '菜单编码',
  `TARGET` varchar(50) DEFAULT NULL COMMENT '目标窗口,_blank则直接跳转，否则在子页面打开',
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '父菜单',
  `SORT` int(2) DEFAULT NULL COMMENT '排序号',
  `CREATE_USER` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `UPDATE_USER` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `uidx_title` (`TITLE`) USING BTREE,
  UNIQUE KEY `uidx_menu_req_url` (`REQUEST_URL`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_menu_test
-- ----------------------------
INSERT INTO `sys_menu_test` VALUES ('1688998d013c4ebf95be6fd7e1fecb20', '测试一级菜单', '/memCard/index.do', 'test/*', 'icon-text', '2', null, null, '2', 'gameloft9', '2017-12-27 17:09:17', null, '2017-12-27 17:09:17');
INSERT INTO `sys_menu_test` VALUES ('1a2d2de64e5f4b6fb8393ebfbc484e35', '原料管理', 'page/system/Material/allMaterial.html', '/material/pagelist', 'icon-text', '5-1', null, 'bf41be14e2854868993eb065d58976e1', '1', 'gameloft9', null, null, null);
INSERT INTO `sys_menu_test` VALUES ('2408603f86104412b014814cb4d66bbc', '原料供应单', 'page/system/MaterialGoods/allMaterialGoods.html', '#', 'icon-text', '5-3', null, 'bf41be14e2854868993eb065d58976e1', '3', 'gameloft9', '2019-03-09 11:18:36', null, '2019-03-09 11:18:36');
INSERT INTO `sys_menu_test` VALUES ('244247008b53450fa16bc503bc861b7c', '系统管理', '#', 'sys/*', 'icon-text', '1', null, null, '1', 'gameloft9', '2017-12-25 19:31:22', null, '2017-12-25 19:31:22');
INSERT INTO `sys_menu_test` VALUES ('26b3df2c6d464a0b89858eb896b849d2', '系统用户管理', 'page/system/sysUser/allUsers.html', 'sysUser/*', 'icon-text', '1-5', null, '244247008b53450fa16bc503bc861b7c', '4', 'gameloft9', '2017-12-27 17:05:40', null, '2017-12-27 17:05:40');
INSERT INTO `sys_menu_test` VALUES ('4a7f3cae133e4a51b8f35769b55163dd', '菜单管理', 'page/system/sysMenu/allMenus.html', 'menu/*', 'icon-text', '1-1', null, '244247008b53450fa16bc503bc861b7c', '1', 'gameloft9', '2017-12-25 19:32:25', null, '2017-12-25 19:32:25');
INSERT INTO `sys_menu_test` VALUES ('6062ef2004ef48c99adf174f5163f532', '11', '1', '1', 'icon-text', '4', null, null, '1', 'gameloft9', null, null, null);
INSERT INTO `sys_menu_test` VALUES ('882b26afbdbb4d63bcba0cd826a5b9c1', '系统日志管理', 'page/system/sysLog/allLogs.html', 'log/*', 'icon-text', '1-4', null, '244247008b53450fa16bc503bc861b7c', '5', 'gameloft9', '2017-12-27 17:03:41', null, '2017-12-27 17:03:41');
INSERT INTO `sys_menu_test` VALUES ('89e9f1eb41a240fea361e0d188375884', '机构管理', 'page/system/sysOrg/allOrgs.html', 'org/*', 'icon-text', '1-2', null, '244247008b53450fa16bc503bc861b7c', '3', 'gameloft9', '2017-12-27 17:01:58', null, '2017-12-27 17:01:58');
INSERT INTO `sys_menu_test` VALUES ('b53bfdfe33444703aa76c2c1a1b8d820', '角色管理', 'page/system/sysRole/allRoles.html', 'role/*', 'icon-text', '1-3', null, '244247008b53450fa16bc503bc861b7c', '2', 'gameloft9', '2017-12-27 17:02:42', null, '2017-12-27 17:02:42');
INSERT INTO `sys_menu_test` VALUES ('b8fdf9ee69dc4462b4ae08f43acff096', '采购订单', 'page/system/PurchaseOrder/allPurchaseOrder.html', '/po/pagelist', 'icon-text', '6-1', null, 'd7b4e7a53cc548978184bab10df511e1', '1', 'gameloft9', null, null, null);
INSERT INTO `sys_menu_test` VALUES ('bf41be14e2854868993eb065d58976e1', '供应商管理', 'page/system/Supplier/allSupplier1.html', '/supplier/1', 'icon-text', '5', null, null, '1', 'gameloft9', '2019-03-08 10:04:54', null, '2019-03-08 10:04:54');
INSERT INTO `sys_menu_test` VALUES ('d7b4e7a53cc548978184bab10df511e1', '采购管理', '#1', '#1', 'icon-text', '6', null, null, '1', 'gameloft9', '2019-03-12 16:30:18', null, '2019-03-12 16:30:18');
INSERT INTO `sys_menu_test` VALUES ('da49ab730b91420c9c372bc6a7d8b4c0', '供应商', 'page/system/Supplier/allSupplier.html', '/supplier/pagelist', 'icon-text', '5-2', null, 'bf41be14e2854868993eb065d58976e1', '2', 'gameloft9', null, null, null);

-- ----------------------------
-- Table structure for `sys_oper_log_test`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log_test`;
CREATE TABLE `sys_oper_log_test` (
  `ID` varchar(32) NOT NULL COMMENT '应用日志表',
  `USER_ID` varchar(32) DEFAULT NULL,
  `LOGIN_NAME` varchar(32) DEFAULT NULL,
  `IP_ADDR` varchar(64) DEFAULT NULL,
  `OPER_TYPE` varchar(200) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `MEMO` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log_test
-- ----------------------------
INSERT INTO `sys_oper_log_test` VALUES ('0083557060244f2a9d13c0ceccbe2560', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-08 10:05:47', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('041fedfcfa534f9499b9d8fd554c5521', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 09:27:02', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('05479663a5a944cca519a14c36283aeb', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-08 10:00:06', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('07c226ca60c743a0af394c510c42c739', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-12 16:30:19', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('0aa5d0cb29dd48d2ad36a26ce2719d9a', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-08 10:06:50', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('0b65457f577b4401937b557a8215a161', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-12 16:32:21', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('0e29265112224ae895fd363e77ab25a1', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-13 14:21:41', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('16e887f1c843486ba1a8c338c07f88b7', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-05 16:51:14', '删除用户');
INSERT INTO `sys_oper_log_test` VALUES ('1906ed0cf85d467792bb40c967fe3f13', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-12 18:12:27', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('238b81b31dbd4b0ab14f0a51e40d242f', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-05 16:53:23', '删除角色');
INSERT INTO `sys_oper_log_test` VALUES ('247c3c0b5d504ea5a1391f58d5d7b2ef', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 19:13:03', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('2fe534a716bf453db51b1225bc128f82', '85ac55af7d5743149eb385430de38ecd', 'lennon', '0:0:0:0:0:0:0:1', 'upd', '2019-03-04 22:06:42', '更新个人密码');
INSERT INTO `sys_oper_log_test` VALUES ('3207e571b3714e429f336210d151640d', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-08 10:32:32', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('3588637a6ccc414395c1b13da70eb817', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-12 16:29:27', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('35be249dad534ac6bd9686c6c201c186', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-07 20:20:51', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('37b96cd1d6ef41e7bd909c1a115f7615', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-05 16:46:31', '删除角色');
INSERT INTO `sys_oper_log_test` VALUES ('3b5a9e635228497989e7418c02205845', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-08 10:05:24', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('3bc7adffb17c4294b7f5235762ba9e5a', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-12 16:29:17', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('3c0a8670b2d9443095e385a8694a6c57', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-05 16:54:08', '删除角色');
INSERT INTO `sys_oper_log_test` VALUES ('3eb5945d681c4280bac01fcaa62a1468', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-07 20:21:03', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('427d764bd06e4612b506422588a8f29e', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-12 18:12:36', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('46233404aefb42a89fa76577212bf48c', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-08 10:06:23', '删除菜单');
INSERT INTO `sys_oper_log_test` VALUES ('506a1fc7904f4b9e9e9af434316d91c5', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-07 20:21:47', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('53647f34d8bb481897205390379f38ce', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-04 22:06:03', '初始化密码');
INSERT INTO `sys_oper_log_test` VALUES ('553571e55d5047329377114057a1e000', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-13 14:22:06', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('563e57bf9f594853888b138067be8563', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-07 11:39:16', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('59c4f7a5d8534ebe9cc7dd778e911b75', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-12 18:05:21', '删除角色');
INSERT INTO `sys_oper_log_test` VALUES ('59c8c017c133407288b66e2cfc6516d3', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-05 16:48:55', '删除用户');
INSERT INTO `sys_oper_log_test` VALUES ('5c9a3ee6cc214823a7293e25e344fb29', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-13 14:19:59', '更新角色');
INSERT INTO `sys_oper_log_test` VALUES ('63969157bfcc4169a05e3f7e97077f19', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-08 10:00:44', '删除菜单');
INSERT INTO `sys_oper_log_test` VALUES ('68e3bf22d1894f7a84b89e3ed0ec64d6', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-12 16:32:10', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('701a933aecb941aa8b478ec9724b5096', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-12 17:17:32', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('7dd499259d0d4ce1a311dc0c591015d1', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-08 10:37:06', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('7e7c672df65045118800a71dbc052e69', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-08 10:01:06', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('80a47e81c78744658e40aeeed1a5a3b5', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-08 10:38:34', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('823c21e7dfd04161bb4faf90189813a4', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-08 10:04:31', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('93973aa7f5404a2291415d90d06910ec', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-08 10:00:19', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('9d29f85b0ae248a5962cb70d9ac7513f', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-04 22:05:56', '添加用户');
INSERT INTO `sys_oper_log_test` VALUES ('a90453add3924940b533fcde5a51c305', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-05 16:50:02', '添加用户');
INSERT INTO `sys_oper_log_test` VALUES ('aa596f1f678b456d8565727e8f5b9816', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-05 18:59:23', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('b0e9d09c28594fa893d2f4f61164cbaa', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-08 10:34:09', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('b280c31a67c643a689278410fe18dc61', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-08 09:57:45', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('b354902a3b4d456ca7c3e3f405c8917d', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-13 14:19:46', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('bb045295c4694a1b839bc54a2c137a5e', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-06 09:27:24', '更新角色');
INSERT INTO `sys_oper_log_test` VALUES ('bdce97ee85844eb683b2a48eef0d59fe', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-12 17:02:44', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('c27109b10fcd4a9dbaf7d000931f7f83', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-12 08:49:52', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('c349502d2f334f0caba881470d5fc227', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-12 16:29:13', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('c3eba8dbb0fe41589f59db3c9b48d917', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 11:38:17', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('c4e089bee5f84639935b6ad38c1a957e', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-12 08:49:19', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('c8373932c3704ea68bc89ebdbe8ed707', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 11:57:53', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('c9825b4e09544516a94eedca5d391b9b', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-12 17:03:51', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('d279826d866241fbb397e84a6ab41512', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-05 16:48:31', '添加用户');
INSERT INTO `sys_oper_log_test` VALUES ('ddc46728a30040218e345d4e74846868', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-13 14:23:07', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('e0cb43b64c884ec8a1023e9d3e7a01e4', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-13 14:22:35', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('e1e7a86938d14ea290da3f40b44df14e', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-13 14:21:16', '更新用户');
INSERT INTO `sys_oper_log_test` VALUES ('e290b3322eea43f38b4a329989b1f520', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-08 10:02:21', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('e2f040e4a2de40ab8b5bd3930fb1042d', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-07 20:19:00', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('e5a29db79e3049d490338a897edc7f7e', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-08 10:07:01', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('e6f4344d416f463db7f47e2d1ef0d451', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-08 10:35:20', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('ec53c934038b4badbe5e3019e4fbd45b', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-08 10:36:53', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('ecc10efbf99d47a4bdf08f5df11e1a8b', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 11:18:36', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('ee9fa9be1ae04f639bbefd9086ea934a', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-05 18:59:55', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('f212de8d405c45cfbeb3755fb219f8cf', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-13 14:20:46', '更新用户');
INSERT INTO `sys_oper_log_test` VALUES ('f6231f6ec18f4069bf1eeafb27358d27', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-13 14:16:39', '更新用户');
INSERT INTO `sys_oper_log_test` VALUES ('fdd3ee45e93845a4a9906ad8bbcb9fe0', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-08 10:04:54', '更新菜单');

-- ----------------------------
-- Table structure for `sys_organize_test`
-- ----------------------------
DROP TABLE IF EXISTS `sys_organize_test`;
CREATE TABLE `sys_organize_test` (
  `ID` varchar(32) NOT NULL COMMENT '组织机构表',
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `ORGANIZE_NAME` varchar(255) NOT NULL COMMENT '机构名称',
  `ORGANIZE_CODE` varchar(8) NOT NULL COMMENT '机构编码',
  `TREE_LEVEL` int(11) NOT NULL COMMENT '机构级别',
  `TREE_PATH` varchar(200) DEFAULT NULL COMMENT '机构路径',
  `CREATE_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `uidx_org_name` (`ORGANIZE_NAME`) USING BTREE,
  UNIQUE KEY `uidx_org_code` (`ORGANIZE_CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_organize_test
-- ----------------------------
INSERT INTO `sys_organize_test` VALUES ('21a6ff8a6abf410eaf97981c1da039d8', null, '总公司', '010001', '1', '21a6ff8a6abf410eaf97981c1da039d8', '2017-12-27 17:06:04', '2017-12-27 17:06:04');
INSERT INTO `sys_organize_test` VALUES ('54fa67f3d443427c9f47432ead20f2f4', '21a6ff8a6abf410eaf97981c1da039d8', '湖北分公司', '010002', '2', '21a6ff8a6abf410eaf97981c1da039d8#54fa67f3d443427c9f47432ead20f2f4', '2017-12-27 17:06:22', '2017-12-27 17:06:22');

-- ----------------------------
-- Table structure for `sys_role_test`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_test`;
CREATE TABLE `sys_role_test` (
  `ID` varchar(32) NOT NULL COMMENT '角色表',
  `ROLE_NAME` varchar(50) NOT NULL COMMENT '角色名',
  `IS_SUPER` int(2) DEFAULT NULL COMMENT '是否是超级管理员',
  `IS_DELETED` int(2) DEFAULT NULL COMMENT '是否删除',
  `CREATE_USER` varchar(50) DEFAULT NULL COMMENT '创建用户',
  `CREATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_USER` varchar(50) DEFAULT NULL COMMENT '更新用户',
  `UPDATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_test
-- ----------------------------
INSERT INTO `sys_role_test` VALUES ('002550614a8340809da685f62bad2067', '采购员', '1', '0', 'gameloft9', '2019-03-12 18:12:56', null, '2019-03-12 18:12:56');
INSERT INTO `sys_role_test` VALUES ('055ae584d5484914a7c187d5b0acf914', '仓库管理员', '1', '0', 'gameloft9', '2019-03-12 18:09:27', null, '2019-03-12 18:09:27');
INSERT INTO `sys_role_test` VALUES ('343859934ece44c988f53700fb34c80a', 'test', '1', '0', 'gameloft9', '2019-03-06 09:27:23', 'gameloft9', '2019-03-06 09:27:24');
INSERT INTO `sys_role_test` VALUES ('98f6401f1b0f4fc3a31ea3908c887d31', '采购主管', '0', '0', 'gameloft9', '2019-03-13 14:19:59', 'gameloft9', '2019-03-13 14:19:59');
INSERT INTO `sys_role_test` VALUES ('J/F9-+?', 'admin', '1', '0', 'v[l_4zL8', '2008-03-01 04:17:00', ':9He2+GW', '2002-09-27 03:13:16');

-- ----------------------------
-- Table structure for `sys_user_role_test`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_test`;
CREATE TABLE `sys_user_role_test` (
  `ID` varchar(32) NOT NULL COMMENT '用户角色表',
  `USER_ID` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `ROLE_ID` varchar(32) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user_role_test
-- ----------------------------
INSERT INTO `sys_user_role_test` VALUES ('03f9afb1d42e49d6a026f537d9f033b6', '9dbdc3a6cc444190bb5ac4e15df6234b', '343859934ece44c988f53700fb34c80a');
INSERT INTO `sys_user_role_test` VALUES ('2fb2a9fb965e462eb72c14361a83f006', '123', 'J/F9-+?');
INSERT INTO `sys_user_role_test` VALUES ('725443ccd0274c92be6b0b45d196ceca', '85ac55af7d5743149eb385430de38ecd', '002550614a8340809da685f62bad2067');
INSERT INTO `sys_user_role_test` VALUES ('9ed803bff732402ba3173faeb1ab461d', '85ac55af7d5743149eb385430de38ecd', '98f6401f1b0f4fc3a31ea3908c887d31');

-- ----------------------------
-- Table structure for `t_depot_inventory`
-- ----------------------------
DROP TABLE IF EXISTS `t_depot_inventory`;
CREATE TABLE `t_depot_inventory` (
  `ID` varchar(255) NOT NULL COMMENT '仓库库存',
  `TYPE` int(11) NOT NULL COMMENT '货品(原料/成品)',
  `GOODS_ID` varchar(255) NOT NULL COMMENT '原料/成品 ID',
  `GOODS_NUMBER` varchar(255) NOT NULL COMMENT '货品数量',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_depot_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for `t_depot_inventory_check`
-- ----------------------------
DROP TABLE IF EXISTS `t_depot_inventory_check`;
CREATE TABLE `t_depot_inventory_check` (
  `ID` varchar(255) NOT NULL COMMENT '仓库库存盘点总表',
  `SOURCE_USER` varchar(255) NOT NULL COMMENT '发起人',
  `SOURCE_TIME` varchar(255) NOT NULL COMMENT '发起时间',
  `RECORD_NUMBER` varchar(255) NOT NULL COMMENT '记录数量',
  `STATE` int(11) NOT NULL COMMENT '状态盘点中/结束',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_depot_inventory_check
-- ----------------------------

-- ----------------------------
-- Table structure for `t_depot_inventory_check_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_depot_inventory_check_detail`;
CREATE TABLE `t_depot_inventory_check_detail` (
  `ID` varchar(255) NOT NULL COMMENT '仓库库存盘点明细记录',
  `CHECK_ID` varchar(255) NOT NULL COMMENT '盘点总表ID',
  `TYPE` int(11) NOT NULL COMMENT '货品(原料/成品)',
  `GOODS_ID` varchar(255) NOT NULL COMMENT '原料/成品 ID',
  `GOODS_NUMBER` varchar(255) NOT NULL COMMENT '货品数量',
  `AUDIT_USER` varchar(255) NOT NULL COMMENT '审核人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_depot_inventory_check_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `t_depot_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_depot_order`;
CREATE TABLE `t_depot_order` (
  `ID` varchar(255) NOT NULL COMMENT '仓库单',
  `ORDER_TYPE` int(11) NOT NULL COMMENT '仓库单类型',
  `GOODS_ID` varchar(255) NOT NULL COMMENT '原料/成品 ID',
  `GOODS_NUMBER` varchar(255) NOT NULL COMMENT '货品数量',
  `APPLY_USER` varchar(255) NOT NULL COMMENT '申请人',
  `APPLY_TIME` date NOT NULL COMMENT '申请时间',
  `STATE` varchar(255) NOT NULL COMMENT '订单状态',
  `ORDER_AUDIT_USER` varchar(255) NOT NULL COMMENT '审核人',
  `ORDER_AUDIT_TIME` date NOT NULL COMMENT '审核时间',
  `APPLY_DESCRIBE` varchar(255) DEFAULT NULL COMMENT '申请描述',
  `AUDIT_DESCRIBE` varchar(255) DEFAULT NULL COMMENT '审核描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_depot_order
-- ----------------------------

-- ----------------------------
-- Table structure for `t_material`
-- ----------------------------
DROP TABLE IF EXISTS `t_material`;
CREATE TABLE `t_material` (
  `ID` varchar(255) NOT NULL COMMENT '原料',
  `GOODS_NAME` varchar(255) NOT NULL COMMENT '货品名',
  `GOODS_TYPE` int(11) NOT NULL COMMENT '货品类型',
  `GOODS_DESCRIBE` varchar(255) NOT NULL COMMENT '货品描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_material
-- ----------------------------
INSERT INTO `t_material` VALUES ('1', '大理石', '0', '无');
INSERT INTO `t_material` VALUES ('10', '辉绿岩', '1', '花岗岩');
INSERT INTO `t_material` VALUES ('11', '绿长岩', '1', '花岗岩');
INSERT INTO `t_material` VALUES ('3', '石灰', '0', '666');
INSERT INTO `t_material` VALUES ('4', '石膏', '1', '大于 107 ℃时分解');
INSERT INTO `t_material` VALUES ('5', '砂岩', '1', '由松散的石英砂颗粒组成');
INSERT INTO `t_material` VALUES ('6', '板岩', '1', '变质岩');
INSERT INTO `t_material` VALUES ('7', '文化石', '1', '自然界的石材矿订');
INSERT INTO `t_material` VALUES ('8', '人造大理石', '1', '无');
INSERT INTO `t_material` VALUES ('9', '安山岩', '1', '花岗岩');

-- ----------------------------
-- Table structure for `t_material_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_material_goods`;
CREATE TABLE `t_material_goods` (
  `ID` varchar(255) NOT NULL COMMENT '原料商品',
  `SUPPLIER_ID` varchar(255) NOT NULL COMMENT '供应商 ID',
  `MATERIAL_ID` varchar(255) NOT NULL COMMENT '原料 ID',
  `GOODS_PRICE` varchar(255) NOT NULL COMMENT '货品价格',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_material_goods
-- ----------------------------
INSERT INTO `t_material_goods` VALUES ('0bf8c04635734fba8650bfb374861c5f', '1', '1', '2000');
INSERT INTO `t_material_goods` VALUES ('1', '1', '1', '100');
INSERT INTO `t_material_goods` VALUES ('2', '2', '10', '200');
INSERT INTO `t_material_goods` VALUES ('3', '1', '10', '300');
INSERT INTO `t_material_goods` VALUES ('53941e0fd0bd43ad8ec73666bff78a83', '2d01a5b57ec5497ab52d505d678a44c7', '6', '111111');
INSERT INTO `t_material_goods` VALUES ('565b65f526af477baa0091b3ce7fc5f9', '1', '1', '200');
INSERT INTO `t_material_goods` VALUES ('8558c50b28cd482598bace72e8a4427e', '1', '9', '200');
INSERT INTO `t_material_goods` VALUES ('b9e44a044aa0407c8c8ac63ab20226c6', '1', '3', '1001');
INSERT INTO `t_material_goods` VALUES ('d329cbf183af441e9256c739aa2312cb', '2', '5', '30000');

-- ----------------------------
-- Table structure for `t_produce_formula`
-- ----------------------------
DROP TABLE IF EXISTS `t_produce_formula`;
CREATE TABLE `t_produce_formula` (
  `ID` varchar(255) NOT NULL COMMENT '生产配方',
  `PRODUCT_NAME` varchar(255) NOT NULL COMMENT '产品ID',
  `TYPE` int(11) NOT NULL COMMENT '产品ID',
  `CREATE_USER` varchar(255) NOT NULL COMMENT '创建人',
  `CREATE_TIME` date NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_produce_formula
-- ----------------------------

-- ----------------------------
-- Table structure for `t_produce_formula_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_produce_formula_detail`;
CREATE TABLE `t_produce_formula_detail` (
  `ID` varchar(255) NOT NULL COMMENT '生产配方明细',
  `PRODUCT_FORMULA_ID` varchar(255) NOT NULL COMMENT '配方ID',
  `MATERIAL_ID` varchar(255) NOT NULL COMMENT '原料ID',
  `MATERIAL_NUMBER` date NOT NULL COMMENT '原料数量',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_produce_formula_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `ID` varchar(255) NOT NULL COMMENT '产品表',
  `PRODUCT_NAME` varchar(255) NOT NULL COMMENT '产品名称',
  `PRODUCT_TYPE` int(11) NOT NULL COMMENT '产品类型',
  `PRODUCT_DESCRIBE` varchar(255) NOT NULL COMMENT '产品描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------

-- ----------------------------
-- Table structure for `t_purchase_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_order`;
CREATE TABLE `t_purchase_order` (
  `ID` varchar(255) NOT NULL COMMENT '采购订单',
  `ORDER_NUMBER` varchar(255) NOT NULL COMMENT '订单编号',
  `GOODS_ID` varchar(255) NOT NULL COMMENT '原料商品 ID',
  `GOODS_NUMBER` varchar(255) NOT NULL COMMENT '货品数量',
  `APPLY_USER` varchar(255) NOT NULL COMMENT '申请人',
  `APPLY_TIME` datetime NOT NULL,
  `STATE` varchar(255) NOT NULL COMMENT '订单状态',
  `ORDER_AUDIT_USER` varchar(255) DEFAULT NULL COMMENT '订单审核人',
  `ORDER_AUDIT_TIME` datetime DEFAULT NULL COMMENT '订单审核时间',
  `PAY_AUDIT_USER` varchar(255) DEFAULT NULL COMMENT '支付审核人',
  `PAY_AUDIT_TIME` date DEFAULT NULL COMMENT '支付审核时间',
  `APPLY_DESCRIBE` varchar(255) DEFAULT NULL COMMENT '申请描述',
  `AUDIT_DESCRIBE` varchar(255) DEFAULT NULL COMMENT '审核描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_purchase_order
-- ----------------------------
INSERT INTO `t_purchase_order` VALUES ('1', '10', '11', '12', 'lennon', '2019-03-12 00:00:00', '4', 'lennon', '2019-03-12 00:00:00', 'lennon', '2019-03-12', '无', '无');
INSERT INTO `t_purchase_order` VALUES ('2', '12', '143', '14', 'oppo', '2019-02-12 09:59:12', '5', 'oppo', '2019-03-13 09:59:30', 'lennon', '2019-03-13', '无', '无');
INSERT INTO `t_purchase_order` VALUES ('3', '14', '5', '34', 'mike', '2019-03-13 10:16:35', '0', 'mike', '2019-03-13 10:16:48', 'mike', '2019-03-13', '无', '无');
INSERT INTO `t_purchase_order` VALUES ('4', '19', '6', '33', 'jane', '2019-03-13 10:17:49', '2', 'aaa', '2019-03-13 10:17:55', 'aaa', '2019-03-13', '无', '无');
INSERT INTO `t_purchase_order` VALUES ('5', '15', '7', '66', 'ss', '2019-03-13 10:18:44', '5', 'sss', '2019-03-13 10:19:05', 'sss', '2019-03-13', '无', '无');
INSERT INTO `t_purchase_order` VALUES ('6', '343', '8', '22', 'dd', '2019-03-13 10:19:46', '5', 'dd', '2019-03-13 10:20:05', 'dd', '2019-03-13', '无', '无');

-- ----------------------------
-- Table structure for `t_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier` (
  `ID` varchar(255) NOT NULL COMMENT '供应商',
  `SUPPLIER_NAME` varchar(255) NOT NULL COMMENT '供应商名称',
  `SUPPLIER_DESCRIBE` varchar(255) DEFAULT NULL COMMENT '供应商描述',
  `PHONE` varchar(255) NOT NULL COMMENT '电话',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------
INSERT INTO `t_supplier` VALUES ('1', 'Apple', 'IPHOE', '122344');
INSERT INTO `t_supplier` VALUES ('2', 'oppo', 'phone', '32112341234');
INSERT INTO `t_supplier` VALUES ('2d01a5b57ec5497ab52d505d678a44c7', 'HUAWEI', 'HONOR1', '12344556565');

-- ----------------------------
-- Table structure for `user_test`
-- ----------------------------
DROP TABLE IF EXISTS `user_test`;
CREATE TABLE `user_test` (
  `ID` varchar(32) NOT NULL COMMENT '用户测试表',
  `LOGIN_NAME` varchar(10) DEFAULT NULL,
  `PASSWORD` varchar(128) DEFAULT NULL,
  `REAL_NAME` varchar(50) DEFAULT NULL,
  `IS_FORBIDDEN` varchar(2) DEFAULT NULL,
  `MOBILE` varchar(11) DEFAULT NULL,
  `ICON` varchar(200) DEFAULT NULL,
  `ORG_ID` varchar(32) DEFAULT NULL,
  `ORG_NAME` varchar(50) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `uidx_login_name` (`LOGIN_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_test
-- ----------------------------
INSERT INTO `user_test` VALUES ('123', 'gameloft9', '7C4A8D09CA3762AF61E59520943DC26494F8941B', 'leiyao', '0', '13618629441', null, 'gameloft9', '总公司', '2017-12-28 16:24:32', '2017-12-28 16:32:57');
INSERT INTO `user_test` VALUES ('85ac55af7d5743149eb385430de38ecd', 'lennon', '7C4A8D09CA3762AF61E59520943DC26494F8941B', 'lin', '0', '12312341234', null, '54fa67f3d443427c9f47432ead20f2f4', '湖北分公司', '2019-03-04 22:06:42', null);

-- ----------------------------
-- Procedure structure for `prc_init_db`
-- ----------------------------
DROP PROCEDURE IF EXISTS `prc_init_db`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_init_db`()
begin
   /*
   清空表
   */
   delete from   `sys_access_permission_test`;
   delete from   `sys_menu_role_test`;
   delete from   `sys_menu_test`;
   delete from   `sys_oper_log_test`;
   delete from   `sys_organize_test`;
   delete from   `sys_role_test`;
   delete from   `sys_user_role_test`;


   /*初始化数据-user_test*/
   insert into `user_test`(`ID`,`LOGIN_NAME`,`PASSWORD`,`REAL_NAME`,`IS_FORBIDDEN`,`MOBILE`,`ICON`,`ORG_ID`,`ORG_NAME`,`CREATE_DATE`,`UPDATE_DATE`)
values('123','gameloft9','7C4A8D09CA3762AF61E59520943DC26494F8941B','leiyao','0','13618629441',null,'gameloft9','总公司','2017-12-28 16:24:32','2017-12-28 16:32:57');

/*初始化数据-sys_access_permission_test*/
insert into `sys_access_permission_test`(`ID`,`URL`,`ROLES`,`SORT`,`IS_DELETED`,`CREATE_USER`,`CREATE_TIME`,`UPDATE_USER`,`UPDATE_TIME`) values
('c8c4e92a1ece4da79ede1763faecdf77','/sysUser/**','authc,roles[admin]','170','0','gameloft9','2017-12-27 17:05:49',null,'2017-12-27 17:05:49'),
('90762decb8874ba0955eb8cef21b6682','/menu/**','authc,roles[admin]','197','0','gameloft9','2017-12-28 11:02:26',null,'2017-12-28 11:02:26'),
('7ee176c20c904536862da37aacb0f7c8','/org/**','authc,roles[test]','123','0','gameloft9','2017-12-27 17:04:18',null,'2017-12-27 17:04:18'),
('7c1f21aa63cf4fd6a5be43072e81ab99','/test/**','authc,roleOr[test,admin]','135','0','gameloft9','2017-12-28 11:05:10',null,'2017-12-28 11:05:10'),
('7042e4eeebf5433388ddfdfb09764369','/log/**','authc,roleOr[test,admin]','419','0','gameloft9','2017-12-27 17:04:10',null,'2017-12-27 17:04:10'),
('6319f8a7688343139ac4ba0d40877e2c','/sys/**','authc,roleOr[test,admin]','201','0','gameloft9','2017-12-28 11:04:58',null,'2017-12-28 11:04:58'),
('6','/**/*.do','authc','999','0','admin','2017-12-25 16:41:09','admin','2017-12-25 16:41:09'),
('5','/getVCode','anon','4','0','admin','2017-12-25 16:41:09','admin','2017-12-25 16:41:09'),
('4','/role/**','authc,roles[admin]','5','0','admin','2017-12-25 16:41:08','admin','2017-12-25 16:41:08'),
('3','/login','anon','3','0','admin','2017-12-25 16:41:08','admin','2017-12-25 16:41:08'),
('2','/index','anon','2','0','admin','2017-12-25 16:41:08','admin','2017-12-25 16:41:08'),
('1','/','anon','1','0','admin','2017-12-25 16:41:02','admin','2017-12-25 16:41:02');

/*初始化数据-sys_menu_role_test*/
insert into `sys_menu_role_test`(`ID`,`MENU_ID`,`ROLE_ID`,`CREATE_USER`,`CREATE_TIME`,`UPDATE_USER`,`UPDATE_TIME`) values
('e92a68532e134b2e9b8af46a43ce61e0','1688998d013c4ebf95be6fd7e1fecb20','343859934ece44c988f53700fb34c80a',null,'2018-01-11 14:47:42',null,'2018-01-11 14:47:42'),
('c89cc73ffa1b40da943cb542b9b9819f','882b26afbdbb4d63bcba0cd826a5b9c1','J/F9-+?',null,'2017-12-27 17:04:10',null,'2017-12-27 17:04:10'),
('bd3b96f8742940e8acc628ff5c940465','b53bfdfe33444703aa76c2c1a1b8d820','J/F9-+?',null,'2017-12-27 17:04:03',null,'2017-12-27 17:04:03'),
('asdfr456yhbv123','4a7f3cae133e4a51b8f35769b55163dd','J/F9-+?',null,'2017-12-26 09:46:29',null,'2017-12-26 09:46:29'),
('874970f9c9b14021909485f201479373','1688998d013c4ebf95be6fd7e1fecb20','J/F9-+?',null,'2017-12-28 11:05:10',null,'2017-12-28 11:05:10'),
('71fa522e4da04ab9abd6008d2cb1c070','26b3df2c6d464a0b89858eb896b849d2','J/F9-+?',null,'2017-12-27 17:05:49',null,'2017-12-27 17:05:49'),
('6302f705514e4c839400f804ec29ec5c','89e9f1eb41a240fea361e0d188375884','343859934ece44c988f53700fb34c80a',null,'2018-01-11 14:46:55',null,'2018-01-11 14:46:55'),
('5b79d6e436154cfb9533a531fb7eb744','882b26afbdbb4d63bcba0cd826a5b9c1','343859934ece44c988f53700fb34c80a',null,'2018-01-11 14:47:16',null,'2018-01-11 14:47:16'),
('5905556900e741a89aafec25948b8fca','89e9f1eb41a240fea361e0d188375884','J/F9-+?',null,'2017-12-27 17:04:18',null,'2017-12-27 17:04:18'),
('4523b393aae64771aac4f91c5623599b','244247008b53450fa16bc503bc861b7c','343859934ece44c988f53700fb34c80a',null,'2018-01-11 14:47:33',null,'2018-01-11 14:47:33'),
('123456789ijhg','244247008b53450fa16bc503bc861b7c','J/F9-+?',null,'2017-12-26 09:46:03',null,'2017-12-26 09:46:03');

/*初始化数据-sys_menu_test*/
insert into `sys_menu_test`(`ID`,`TITLE`,`HREF`,`REQUEST_URL`,`ICON`,`CODE`,`TARGET`,`PARENT_ID`,`SORT`,`CREATE_USER`,`CREATE_TIME`,`UPDATE_USER`,`UPDATE_TIME`) values
('b53bfdfe33444703aa76c2c1a1b8d820','角色管理','page/system/sysRole/allRoles.html','/role/**','icon-text','1-3',null,'244247008b53450fa16bc503bc861b7c','2','gameloft9','2017-12-27 17:02:42',null,'2017-12-27 17:02:42'),
('89e9f1eb41a240fea361e0d188375884','机构管理','page/system/sysOrg/allOrgs.html','/org/**','icon-text','1-2',null,'244247008b53450fa16bc503bc861b7c','3','gameloft9','2017-12-27 17:01:58',null,'2017-12-27 17:01:58'),
('882b26afbdbb4d63bcba0cd826a5b9c1','系统日志管理','page/system/sysLog/allLogs.html','/log/**','icon-text','1-4',null,'244247008b53450fa16bc503bc861b7c','5','gameloft9','2017-12-27 17:03:41',null,'2017-12-27 17:03:41'),
('4a7f3cae133e4a51b8f35769b55163dd','菜单管理','page/system/sysMenu/allMenus.html','/menu/**','icon-text','1-1',null,'244247008b53450fa16bc503bc861b7c','1','gameloft9','2017-12-25 19:32:25',null,'2017-12-25 19:32:25'),
('26b3df2c6d464a0b89858eb896b849d2','系统用户管理','page/system/sysUser/allUsers.html','/sysUser/**','icon-text','1-5',null,'244247008b53450fa16bc503bc861b7c','4','gameloft9','2017-12-27 17:05:40',null,'2017-12-27 17:05:40'),
('244247008b53450fa16bc503bc861b7c','系统管理','#','/sys/**','icon-text','1',null,null,'1','gameloft9','2017-12-25 19:31:22',null,'2017-12-25 19:31:22'),
('1688998d013c4ebf95be6fd7e1fecb20','测试一级菜单','/memCard/index.do','test/**','icon-text','2',null,null,'2','gameloft9','2017-12-27 17:09:17',null,'2017-12-27 17:09:17');

/*初始化数据-sys_organize_test*/
insert into `sys_organize_test`(`ID`,`PARENT_ID`,`ORGANIZE_NAME`,`ORGANIZE_CODE`,`TREE_LEVEL`,`TREE_PATH`,`CREATE_DATE`,`UPDATE_DATE`) values
('54fa67f3d443427c9f47432ead20f2f4','21a6ff8a6abf410eaf97981c1da039d8','湖北分公司','010002','2','21a6ff8a6abf410eaf97981c1da039d8#54fa67f3d443427c9f47432ead20f2f4','2017-12-27 17:06:22','2017-12-27 17:06:22'),
('21a6ff8a6abf410eaf97981c1da039d8',null,'总公司','010001','1','21a6ff8a6abf410eaf97981c1da039d8','2017-12-27 17:06:04','2017-12-27 17:06:04');

/*初始化数据-sys_role_test*/
insert into `sys_role_test`(`ID`,`ROLE_NAME`,`IS_SUPER`,`IS_DELETED`,`CREATE_USER`,`CREATE_TIME`,`UPDATE_USER`,`UPDATE_TIME`) values
('J/F9-+?','admin','1','0','v[l_4zL8','2008-03-01 04:17:00',':9He2+GW','2002-09-27 03:13:16'),
('343859934ece44c988f53700fb34c80a','test','0','0','gameloft9','2018-01-11 14:46:22',null,'2018-01-11 14:46:22');

/*初始化数据-sys_user_role_test*/
insert into `sys_user_role_test`(`ID`,`USER_ID`,`ROLE_ID`) values
('2fb2a9fb965e462eb72c14361a83f006','123','J/F9-+?'),
('03f9afb1d42e49d6a026f537d9f033b6','9dbdc3a6cc444190bb5ac4e15df6234b','343859934ece44c988f53700fb34c80a');
   
end
;;
DELIMITER ;
