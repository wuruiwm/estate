/*
 Navicat Premium Data Transfer

 Source Server         : 172.0.01
 Source Server Type    : MySQL
 Source Server Version : 100137
 Source Host           : localhost:3306
 Source Schema         : estate

 Target Server Type    : MySQL
 Target Server Version : 100137
 File Encoding         : 65001

 Date: 22/12/2018 16:13:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tplay_admin
-- ----------------------------
DROP TABLE IF EXISTS `tplay_admin`;
CREATE TABLE `tplay_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thumb` int(11) NOT NULL DEFAULT 1 COMMENT '管理员头像',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `login_time` int(11) NULL DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后登录ip',
  `admin_cate_id` int(2) NOT NULL DEFAULT 1 COMMENT '管理员分组',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `admin_cate_id`(`admin_cate_id`) USING BTREE,
  INDEX `nickname`(`nickname`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_admin
-- ----------------------------
INSERT INTO `tplay_admin` VALUES (1, 'admin', 'admin', '972262e4efe2e00f364d979a7c6ae7ee', 1, 1510885948, 1545461617, 1545461670, '127.0.0.1', 1);
INSERT INTO `tplay_admin` VALUES (16, '管理员', 'boss', '49096548e1619314a3e598141fe83965', 2, 1544683694, 1545461655, 1545461646, '127.0.0.1', 20);

-- ----------------------------
-- Table structure for tplay_admin_cate
-- ----------------------------
DROP TABLE IF EXISTS `tplay_admin_cate`;
CREATE TABLE `tplay_admin_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permissions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限菜单',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_admin_cate
-- ----------------------------
INSERT INTO `tplay_admin_cate` VALUES (1, '超级管理员', '1,4,5,11,13,14,16,17,19,20,21,6,7,8,22,25,26,28,29,31,34,35,37,38,39,40,42,43,44,45,47,48,52,53,54,55,56,57,58,59,66,60,61,62,63,64,65,67,68,69,70', 0, 1545458715, '超级管理员，拥有最高权限！');
INSERT INTO `tplay_admin_cate` VALUES (20, '系统管理员', '6,7,8,34,35,37,38,39,40,42,43,44,45,47,48,52,53,54,55,56,57,58,59,60,61,62,63,64,65,67', 1544683164, 1545374118, '系统管理，副官');

-- ----------------------------
-- Table structure for tplay_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `tplay_admin_log`;
CREATE TABLE `tplay_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_menu_id` int(11) NOT NULL COMMENT '操作菜单id',
  `admin_id` int(11) NOT NULL COMMENT '操作者id',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作ip',
  `operation_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作关联id',
  `create_time` int(11) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 338 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_admin_log
-- ----------------------------
INSERT INTO `tplay_admin_log` VALUES (1, 50, 1, '127.0.0.1', '', 1544085543);
INSERT INTO `tplay_admin_log` VALUES (2, 8, 1, '127.0.0.1', '', 1544085581);
INSERT INTO `tplay_admin_log` VALUES (3, 45, 1, '127.0.0.1', '1', 1544087303);
INSERT INTO `tplay_admin_log` VALUES (4, 49, 1, '127.0.0.1', '2', 1544087337);
INSERT INTO `tplay_admin_log` VALUES (5, 25, 1, '127.0.0.1', '1', 1544087338);
INSERT INTO `tplay_admin_log` VALUES (6, 50, 1, '127.0.0.1', '', 1544089487);
INSERT INTO `tplay_admin_log` VALUES (7, 50, 1, '127.0.0.1', '', 1544090339);
INSERT INTO `tplay_admin_log` VALUES (8, 11, 1, '127.0.0.1', '', 1544090377);
INSERT INTO `tplay_admin_log` VALUES (9, 50, 1, '127.0.0.1', '', 1544144692);
INSERT INTO `tplay_admin_log` VALUES (10, 4, 1, '127.0.0.1', '52', 1544145441);
INSERT INTO `tplay_admin_log` VALUES (11, 28, 1, '127.0.0.1', '1', 1544145468);
INSERT INTO `tplay_admin_log` VALUES (12, 4, 1, '127.0.0.1', '52', 1544145526);
INSERT INTO `tplay_admin_log` VALUES (13, 4, 1, '127.0.0.1', '52', 1544145558);
INSERT INTO `tplay_admin_log` VALUES (14, 4, 1, '127.0.0.1', '52', 1544145593);
INSERT INTO `tplay_admin_log` VALUES (15, 4, 1, '127.0.0.1', '52', 1544145637);
INSERT INTO `tplay_admin_log` VALUES (16, 4, 1, '127.0.0.1', '53', 1544145709);
INSERT INTO `tplay_admin_log` VALUES (17, 28, 1, '127.0.0.1', '1', 1544145728);
INSERT INTO `tplay_admin_log` VALUES (18, 49, 1, '127.0.0.1', '3', 1544145868);
INSERT INTO `tplay_admin_log` VALUES (19, 50, 1, '127.0.0.1', '', 1544145920);
INSERT INTO `tplay_admin_log` VALUES (20, 49, 1, '127.0.0.1', '4', 1544145993);
INSERT INTO `tplay_admin_log` VALUES (21, 49, 1, '127.0.0.1', '5', 1544146005);
INSERT INTO `tplay_admin_log` VALUES (22, 49, 1, '127.0.0.1', '6', 1544146099);
INSERT INTO `tplay_admin_log` VALUES (23, 50, 1, '127.0.0.1', '', 1544146142);
INSERT INTO `tplay_admin_log` VALUES (24, 49, 1, '127.0.0.1', '7', 1544146168);
INSERT INTO `tplay_admin_log` VALUES (25, 49, 1, '127.0.0.1', '8', 1544146228);
INSERT INTO `tplay_admin_log` VALUES (26, 50, 1, '127.0.0.1', '', 1544146873);
INSERT INTO `tplay_admin_log` VALUES (27, 49, 1, '127.0.0.1', '9', 1544146913);
INSERT INTO `tplay_admin_log` VALUES (28, 49, 1, '127.0.0.1', '10', 1544148362);
INSERT INTO `tplay_admin_log` VALUES (29, 11, 1, '127.0.0.1', '', 1544148481);
INSERT INTO `tplay_admin_log` VALUES (30, 11, 1, '127.0.0.1', '', 1544148519);
INSERT INTO `tplay_admin_log` VALUES (31, 49, 1, '127.0.0.1', '11', 1544148730);
INSERT INTO `tplay_admin_log` VALUES (32, 49, 1, '127.0.0.1', '12', 1544148734);
INSERT INTO `tplay_admin_log` VALUES (33, 44, 1, '127.0.0.1', '12', 1544149054);
INSERT INTO `tplay_admin_log` VALUES (34, 49, 1, '127.0.0.1', '13', 1544149225);
INSERT INTO `tplay_admin_log` VALUES (35, 49, 1, '127.0.0.1', '14', 1544149770);
INSERT INTO `tplay_admin_log` VALUES (36, 49, 1, '127.0.0.1', '15', 1544150152);
INSERT INTO `tplay_admin_log` VALUES (37, 49, 1, '127.0.0.1', '16', 1544150156);
INSERT INTO `tplay_admin_log` VALUES (38, 49, 1, '127.0.0.1', '17', 1544150407);
INSERT INTO `tplay_admin_log` VALUES (39, 49, 1, '127.0.0.1', '18', 1544174347);
INSERT INTO `tplay_admin_log` VALUES (40, 49, 1, '127.0.0.1', '19', 1544174407);
INSERT INTO `tplay_admin_log` VALUES (41, 49, 1, '127.0.0.1', '20', 1544174572);
INSERT INTO `tplay_admin_log` VALUES (42, 49, 1, '127.0.0.1', '21', 1544174750);
INSERT INTO `tplay_admin_log` VALUES (43, 49, 1, '127.0.0.1', '22', 1544174994);
INSERT INTO `tplay_admin_log` VALUES (44, 49, 1, '127.0.0.1', '23', 1544175122);
INSERT INTO `tplay_admin_log` VALUES (45, 49, 1, '127.0.0.1', '24', 1544175220);
INSERT INTO `tplay_admin_log` VALUES (46, 49, 1, '127.0.0.1', '25', 1544175277);
INSERT INTO `tplay_admin_log` VALUES (47, 49, 1, '127.0.0.1', '26', 1544175605);
INSERT INTO `tplay_admin_log` VALUES (48, 49, 1, '127.0.0.1', '27', 1544176099);
INSERT INTO `tplay_admin_log` VALUES (49, 49, 1, '127.0.0.1', '28', 1544176113);
INSERT INTO `tplay_admin_log` VALUES (50, 49, 1, '127.0.0.1', '29', 1544176129);
INSERT INTO `tplay_admin_log` VALUES (51, 50, 1, '127.0.0.1', '', 1544231051);
INSERT INTO `tplay_admin_log` VALUES (52, 50, 1, '127.0.0.1', '', 1544231154);
INSERT INTO `tplay_admin_log` VALUES (53, 50, 1, '127.0.0.1', '', 1544236574);
INSERT INTO `tplay_admin_log` VALUES (54, 50, 1, '127.0.0.1', '', 1544236878);
INSERT INTO `tplay_admin_log` VALUES (55, 50, 1, '127.0.0.1', '', 1544239858);
INSERT INTO `tplay_admin_log` VALUES (56, 50, 1, '127.0.0.1', '', 1544240308);
INSERT INTO `tplay_admin_log` VALUES (57, 50, 1, '127.0.0.1', '', 1544241280);
INSERT INTO `tplay_admin_log` VALUES (58, 4, 1, '127.0.0.1', '54', 1544253869);
INSERT INTO `tplay_admin_log` VALUES (59, 28, 1, '127.0.0.1', '1', 1544253887);
INSERT INTO `tplay_admin_log` VALUES (60, 4, 1, '127.0.0.1', '55', 1544254556);
INSERT INTO `tplay_admin_log` VALUES (61, 28, 1, '127.0.0.1', '1', 1544254571);
INSERT INTO `tplay_admin_log` VALUES (62, 4, 1, '127.0.0.1', '56', 1544515442);
INSERT INTO `tplay_admin_log` VALUES (63, 4, 1, '127.0.0.1', '57', 1544515486);
INSERT INTO `tplay_admin_log` VALUES (64, 28, 1, '127.0.0.1', '1', 1544515500);
INSERT INTO `tplay_admin_log` VALUES (65, 49, 1, '127.0.0.1', '30', 1544518445);
INSERT INTO `tplay_admin_log` VALUES (66, 49, 1, '127.0.0.1', '31', 1544518494);
INSERT INTO `tplay_admin_log` VALUES (67, 49, 1, '127.0.0.1', '32', 1544518963);
INSERT INTO `tplay_admin_log` VALUES (68, 49, 1, '127.0.0.1', '33', 1544519008);
INSERT INTO `tplay_admin_log` VALUES (69, 49, 1, '127.0.0.1', '34', 1544519059);
INSERT INTO `tplay_admin_log` VALUES (70, 49, 1, '127.0.0.1', '35', 1544519155);
INSERT INTO `tplay_admin_log` VALUES (71, 49, 1, '127.0.0.1', '36', 1544519276);
INSERT INTO `tplay_admin_log` VALUES (72, 49, 1, '127.0.0.1', '37', 1544519342);
INSERT INTO `tplay_admin_log` VALUES (73, 49, 1, '127.0.0.1', '38', 1544519391);
INSERT INTO `tplay_admin_log` VALUES (74, 49, 1, '127.0.0.1', '39', 1544519424);
INSERT INTO `tplay_admin_log` VALUES (75, 49, 1, '127.0.0.1', '40', 1544521585);
INSERT INTO `tplay_admin_log` VALUES (76, 49, 1, '127.0.0.1', '41', 1544521831);
INSERT INTO `tplay_admin_log` VALUES (77, 49, 1, '127.0.0.1', '42', 1544521863);
INSERT INTO `tplay_admin_log` VALUES (78, 49, 1, '127.0.0.1', '43', 1544521902);
INSERT INTO `tplay_admin_log` VALUES (79, 49, 1, '127.0.0.1', '44', 1544522002);
INSERT INTO `tplay_admin_log` VALUES (80, 50, 1, '127.0.0.1', '', 1544576823);
INSERT INTO `tplay_admin_log` VALUES (81, 49, 1, '127.0.0.1', '45', 1544577888);
INSERT INTO `tplay_admin_log` VALUES (82, 49, 1, '127.0.0.1', '46', 1544577893);
INSERT INTO `tplay_admin_log` VALUES (83, 49, 1, '127.0.0.1', '47', 1544577908);
INSERT INTO `tplay_admin_log` VALUES (84, 4, 1, '127.0.0.1', '58', 1544579993);
INSERT INTO `tplay_admin_log` VALUES (85, 4, 1, '127.0.0.1', '59', 1544580098);
INSERT INTO `tplay_admin_log` VALUES (86, 4, 1, '127.0.0.1', '59', 1544580145);
INSERT INTO `tplay_admin_log` VALUES (87, 28, 1, '127.0.0.1', '1', 1544580166);
INSERT INTO `tplay_admin_log` VALUES (88, 49, 1, '127.0.0.1', '48', 1544583467);
INSERT INTO `tplay_admin_log` VALUES (89, 49, 1, '127.0.0.1', '49', 1544583524);
INSERT INTO `tplay_admin_log` VALUES (90, 49, 1, '127.0.0.1', '50', 1544587905);
INSERT INTO `tplay_admin_log` VALUES (91, 49, 1, '127.0.0.1', '51', 1544587913);
INSERT INTO `tplay_admin_log` VALUES (92, 49, 1, '127.0.0.1', '52', 1544587919);
INSERT INTO `tplay_admin_log` VALUES (93, 49, 1, '127.0.0.1', '53', 1544587923);
INSERT INTO `tplay_admin_log` VALUES (94, 49, 1, '127.0.0.1', '54', 1544587935);
INSERT INTO `tplay_admin_log` VALUES (95, 49, 1, '127.0.0.1', '55', 1544588026);
INSERT INTO `tplay_admin_log` VALUES (96, 49, 1, '127.0.0.1', '56', 1544588030);
INSERT INTO `tplay_admin_log` VALUES (97, 49, 1, '127.0.0.1', '57', 1544588107);
INSERT INTO `tplay_admin_log` VALUES (98, 49, 1, '127.0.0.1', '58', 1544588109);
INSERT INTO `tplay_admin_log` VALUES (99, 49, 1, '127.0.0.1', '59', 1544588586);
INSERT INTO `tplay_admin_log` VALUES (100, 49, 1, '127.0.0.1', '60', 1544588589);
INSERT INTO `tplay_admin_log` VALUES (101, 49, 1, '127.0.0.1', '61', 1544588593);
INSERT INTO `tplay_admin_log` VALUES (102, 49, 1, '127.0.0.1', '62', 1544588596);
INSERT INTO `tplay_admin_log` VALUES (103, 45, 1, '127.0.0.1', '62', 1544588901);
INSERT INTO `tplay_admin_log` VALUES (104, 45, 1, '127.0.0.1', '61', 1544588905);
INSERT INTO `tplay_admin_log` VALUES (105, 45, 1, '127.0.0.1', '60', 1544588909);
INSERT INTO `tplay_admin_log` VALUES (106, 45, 1, '127.0.0.1', '59', 1544588913);
INSERT INTO `tplay_admin_log` VALUES (107, 45, 1, '127.0.0.1', '58', 1544588917);
INSERT INTO `tplay_admin_log` VALUES (108, 45, 1, '127.0.0.1', '57', 1544588921);
INSERT INTO `tplay_admin_log` VALUES (109, 45, 1, '127.0.0.1', '56', 1544588924);
INSERT INTO `tplay_admin_log` VALUES (110, 45, 1, '127.0.0.1', '55', 1544588927);
INSERT INTO `tplay_admin_log` VALUES (111, 45, 1, '127.0.0.1', '54', 1544588931);
INSERT INTO `tplay_admin_log` VALUES (112, 45, 1, '127.0.0.1', '53', 1544588934);
INSERT INTO `tplay_admin_log` VALUES (113, 45, 1, '127.0.0.1', '52', 1544588938);
INSERT INTO `tplay_admin_log` VALUES (114, 45, 1, '127.0.0.1', '51', 1544588941);
INSERT INTO `tplay_admin_log` VALUES (115, 45, 1, '127.0.0.1', '50', 1544588946);
INSERT INTO `tplay_admin_log` VALUES (116, 45, 1, '127.0.0.1', '49', 1544588950);
INSERT INTO `tplay_admin_log` VALUES (117, 45, 1, '127.0.0.1', '48', 1544588954);
INSERT INTO `tplay_admin_log` VALUES (118, 45, 1, '127.0.0.1', '47', 1544588958);
INSERT INTO `tplay_admin_log` VALUES (119, 45, 1, '127.0.0.1', '46', 1544588962);
INSERT INTO `tplay_admin_log` VALUES (120, 45, 1, '127.0.0.1', '45', 1544588966);
INSERT INTO `tplay_admin_log` VALUES (121, 49, 1, '127.0.0.1', '63', 1544588988);
INSERT INTO `tplay_admin_log` VALUES (122, 49, 1, '127.0.0.1', '64', 1544588994);
INSERT INTO `tplay_admin_log` VALUES (123, 49, 1, '127.0.0.1', '65', 1544588997);
INSERT INTO `tplay_admin_log` VALUES (124, 49, 1, '127.0.0.1', '66', 1544589044);
INSERT INTO `tplay_admin_log` VALUES (125, 49, 1, '127.0.0.1', '67', 1544589047);
INSERT INTO `tplay_admin_log` VALUES (126, 49, 1, '127.0.0.1', '68', 1544589233);
INSERT INTO `tplay_admin_log` VALUES (127, 49, 1, '127.0.0.1', '69', 1544589237);
INSERT INTO `tplay_admin_log` VALUES (128, 49, 1, '127.0.0.1', '70', 1544589241);
INSERT INTO `tplay_admin_log` VALUES (129, 49, 1, '127.0.0.1', '71', 1544589289);
INSERT INTO `tplay_admin_log` VALUES (130, 49, 1, '127.0.0.1', '72', 1544589291);
INSERT INTO `tplay_admin_log` VALUES (131, 49, 1, '127.0.0.1', '73', 1544592142);
INSERT INTO `tplay_admin_log` VALUES (132, 49, 1, '127.0.0.1', '74', 1544592146);
INSERT INTO `tplay_admin_log` VALUES (133, 49, 1, '127.0.0.1', '75', 1544592150);
INSERT INTO `tplay_admin_log` VALUES (134, 49, 1, '127.0.0.1', '76', 1544592192);
INSERT INTO `tplay_admin_log` VALUES (135, 49, 1, '127.0.0.1', '77', 1544592198);
INSERT INTO `tplay_admin_log` VALUES (136, 49, 1, '127.0.0.1', '78', 1544592694);
INSERT INTO `tplay_admin_log` VALUES (137, 49, 1, '127.0.0.1', '79', 1544592703);
INSERT INTO `tplay_admin_log` VALUES (138, 49, 1, '127.0.0.1', '80', 1544592707);
INSERT INTO `tplay_admin_log` VALUES (139, 49, 1, '127.0.0.1', '81', 1544592734);
INSERT INTO `tplay_admin_log` VALUES (140, 49, 1, '127.0.0.1', '82', 1544592739);
INSERT INTO `tplay_admin_log` VALUES (141, 49, 1, '127.0.0.1', '83', 1544593223);
INSERT INTO `tplay_admin_log` VALUES (142, 49, 1, '127.0.0.1', '84', 1544593229);
INSERT INTO `tplay_admin_log` VALUES (143, 49, 1, '127.0.0.1', '85', 1544593234);
INSERT INTO `tplay_admin_log` VALUES (144, 49, 1, '127.0.0.1', '86', 1544593271);
INSERT INTO `tplay_admin_log` VALUES (145, 49, 1, '127.0.0.1', '87', 1544593275);
INSERT INTO `tplay_admin_log` VALUES (146, 49, 1, '127.0.0.1', '88', 1544593740);
INSERT INTO `tplay_admin_log` VALUES (147, 49, 1, '127.0.0.1', '89', 1544593748);
INSERT INTO `tplay_admin_log` VALUES (148, 49, 1, '127.0.0.1', '90', 1544593753);
INSERT INTO `tplay_admin_log` VALUES (149, 49, 1, '127.0.0.1', '91', 1544593782);
INSERT INTO `tplay_admin_log` VALUES (150, 49, 1, '127.0.0.1', '92', 1544593788);
INSERT INTO `tplay_admin_log` VALUES (151, 49, 1, '127.0.0.1', '93', 1544594192);
INSERT INTO `tplay_admin_log` VALUES (152, 49, 1, '127.0.0.1', '94', 1544594281);
INSERT INTO `tplay_admin_log` VALUES (153, 49, 1, '127.0.0.1', '95', 1544594328);
INSERT INTO `tplay_admin_log` VALUES (154, 49, 1, '127.0.0.1', '96', 1544594560);
INSERT INTO `tplay_admin_log` VALUES (155, 49, 1, '127.0.0.1', '97', 1544594620);
INSERT INTO `tplay_admin_log` VALUES (156, 49, 1, '127.0.0.1', '98', 1544594627);
INSERT INTO `tplay_admin_log` VALUES (157, 49, 1, '127.0.0.1', '99', 1544594630);
INSERT INTO `tplay_admin_log` VALUES (158, 49, 1, '127.0.0.1', '100', 1544595272);
INSERT INTO `tplay_admin_log` VALUES (159, 49, 1, '127.0.0.1', '101', 1544595275);
INSERT INTO `tplay_admin_log` VALUES (160, 49, 1, '127.0.0.1', '102', 1544595277);
INSERT INTO `tplay_admin_log` VALUES (161, 49, 1, '127.0.0.1', '103', 1544595309);
INSERT INTO `tplay_admin_log` VALUES (162, 49, 1, '127.0.0.1', '104', 1544595501);
INSERT INTO `tplay_admin_log` VALUES (163, 49, 1, '127.0.0.1', '105', 1544595505);
INSERT INTO `tplay_admin_log` VALUES (164, 49, 1, '127.0.0.1', '106', 1544595510);
INSERT INTO `tplay_admin_log` VALUES (165, 49, 1, '127.0.0.1', '107', 1544595543);
INSERT INTO `tplay_admin_log` VALUES (166, 49, 1, '127.0.0.1', '108', 1544595545);
INSERT INTO `tplay_admin_log` VALUES (167, 49, 1, '127.0.0.1', '109', 1544601659);
INSERT INTO `tplay_admin_log` VALUES (168, 49, 1, '127.0.0.1', '110', 1544601663);
INSERT INTO `tplay_admin_log` VALUES (169, 49, 1, '127.0.0.1', '111', 1544601666);
INSERT INTO `tplay_admin_log` VALUES (170, 49, 1, '127.0.0.1', '112', 1544601669);
INSERT INTO `tplay_admin_log` VALUES (171, 49, 1, '127.0.0.1', '113', 1544601951);
INSERT INTO `tplay_admin_log` VALUES (172, 49, 1, '127.0.0.1', '114', 1544602015);
INSERT INTO `tplay_admin_log` VALUES (173, 49, 1, '127.0.0.1', '115', 1544602018);
INSERT INTO `tplay_admin_log` VALUES (174, 49, 1, '127.0.0.1', '116', 1544602039);
INSERT INTO `tplay_admin_log` VALUES (175, 49, 1, '127.0.0.1', '117', 1544602041);
INSERT INTO `tplay_admin_log` VALUES (176, 49, 1, '127.0.0.1', '118', 1544602167);
INSERT INTO `tplay_admin_log` VALUES (177, 49, 1, '127.0.0.1', '119', 1544602170);
INSERT INTO `tplay_admin_log` VALUES (178, 49, 1, '127.0.0.1', '120', 1544602771);
INSERT INTO `tplay_admin_log` VALUES (179, 49, 1, '127.0.0.1', '121', 1544602774);
INSERT INTO `tplay_admin_log` VALUES (180, 49, 1, '127.0.0.1', '122', 1544602776);
INSERT INTO `tplay_admin_log` VALUES (181, 49, 1, '127.0.0.1', '123', 1544602804);
INSERT INTO `tplay_admin_log` VALUES (182, 49, 1, '127.0.0.1', '124', 1544602806);
INSERT INTO `tplay_admin_log` VALUES (183, 49, 1, '127.0.0.1', '125', 1544603027);
INSERT INTO `tplay_admin_log` VALUES (184, 49, 1, '127.0.0.1', '126', 1544603030);
INSERT INTO `tplay_admin_log` VALUES (185, 49, 1, '127.0.0.1', '127', 1544603067);
INSERT INTO `tplay_admin_log` VALUES (186, 49, 1, '127.0.0.1', '128', 1544603118);
INSERT INTO `tplay_admin_log` VALUES (187, 49, 1, '127.0.0.1', '129', 1544603130);
INSERT INTO `tplay_admin_log` VALUES (188, 49, 1, '127.0.0.1', '130', 1544603171);
INSERT INTO `tplay_admin_log` VALUES (189, 49, 1, '127.0.0.1', '131', 1544603174);
INSERT INTO `tplay_admin_log` VALUES (190, 49, 1, '127.0.0.1', '132', 1544603316);
INSERT INTO `tplay_admin_log` VALUES (191, 49, 1, '127.0.0.1', '133', 1544603319);
INSERT INTO `tplay_admin_log` VALUES (192, 49, 1, '127.0.0.1', '134', 1544603348);
INSERT INTO `tplay_admin_log` VALUES (193, 49, 1, '127.0.0.1', '135', 1544603372);
INSERT INTO `tplay_admin_log` VALUES (194, 49, 1, '127.0.0.1', '136', 1544603378);
INSERT INTO `tplay_admin_log` VALUES (195, 49, 1, '127.0.0.1', '137', 1544603424);
INSERT INTO `tplay_admin_log` VALUES (196, 49, 1, '127.0.0.1', '138', 1544603438);
INSERT INTO `tplay_admin_log` VALUES (197, 49, 1, '127.0.0.1', '139', 1544604032);
INSERT INTO `tplay_admin_log` VALUES (198, 49, 1, '127.0.0.1', '140', 1544604038);
INSERT INTO `tplay_admin_log` VALUES (199, 49, 1, '127.0.0.1', '141', 1544604364);
INSERT INTO `tplay_admin_log` VALUES (200, 50, 1, '127.0.0.1', '', 1544607886);
INSERT INTO `tplay_admin_log` VALUES (201, 50, 1, '127.0.0.1', '', 1544663794);
INSERT INTO `tplay_admin_log` VALUES (202, 28, 1, '127.0.0.1', '1', 1544663839);
INSERT INTO `tplay_admin_log` VALUES (203, 49, 1, '127.0.0.1', '142', 1544672236);
INSERT INTO `tplay_admin_log` VALUES (204, 49, 1, '127.0.0.1', '143', 1544672240);
INSERT INTO `tplay_admin_log` VALUES (205, 49, 1, '127.0.0.1', '144', 1544672302);
INSERT INTO `tplay_admin_log` VALUES (206, 49, 1, '127.0.0.1', '145', 1544672308);
INSERT INTO `tplay_admin_log` VALUES (207, 49, 1, '127.0.0.1', '146', 1544673629);
INSERT INTO `tplay_admin_log` VALUES (208, 49, 1, '127.0.0.1', '147', 1544673633);
INSERT INTO `tplay_admin_log` VALUES (209, 49, 1, '127.0.0.1', '148', 1544679246);
INSERT INTO `tplay_admin_log` VALUES (210, 50, 1, '127.0.0.1', '', 1544679297);
INSERT INTO `tplay_admin_log` VALUES (211, 49, 1, '127.0.0.1', '149', 1544679323);
INSERT INTO `tplay_admin_log` VALUES (212, 49, 1, '127.0.0.1', '150', 1544679327);
INSERT INTO `tplay_admin_log` VALUES (213, 49, 1, '127.0.0.1', '151', 1544679362);
INSERT INTO `tplay_admin_log` VALUES (214, 49, 1, '127.0.0.1', '152', 1544679664);
INSERT INTO `tplay_admin_log` VALUES (215, 49, 1, '127.0.0.1', '153', 1544679667);
INSERT INTO `tplay_admin_log` VALUES (216, 49, 1, '127.0.0.1', '154', 1544679693);
INSERT INTO `tplay_admin_log` VALUES (217, 49, 1, '127.0.0.1', '155', 1544679733);
INSERT INTO `tplay_admin_log` VALUES (218, 49, 1, '127.0.0.1', '156', 1544679736);
INSERT INTO `tplay_admin_log` VALUES (219, 49, 1, '127.0.0.1', '157', 1544679756);
INSERT INTO `tplay_admin_log` VALUES (220, 49, 1, '127.0.0.1', '158', 1544680213);
INSERT INTO `tplay_admin_log` VALUES (221, 49, 1, '127.0.0.1', '159', 1544680216);
INSERT INTO `tplay_admin_log` VALUES (222, 49, 1, '127.0.0.1', '160', 1544680239);
INSERT INTO `tplay_admin_log` VALUES (223, 49, 1, '127.0.0.1', '161', 1544680279);
INSERT INTO `tplay_admin_log` VALUES (224, 49, 1, '127.0.0.1', '162', 1544680282);
INSERT INTO `tplay_admin_log` VALUES (225, 49, 1, '127.0.0.1', '163', 1544680306);
INSERT INTO `tplay_admin_log` VALUES (226, 49, 1, '127.0.0.1', '164', 1544680994);
INSERT INTO `tplay_admin_log` VALUES (227, 49, 1, '127.0.0.1', '165', 1544680997);
INSERT INTO `tplay_admin_log` VALUES (228, 49, 1, '127.0.0.1', '166', 1544681019);
INSERT INTO `tplay_admin_log` VALUES (229, 28, 1, '127.0.0.1', '20', 1544683164);
INSERT INTO `tplay_admin_log` VALUES (230, 28, 1, '127.0.0.1', '20', 1544683192);
INSERT INTO `tplay_admin_log` VALUES (231, 49, 1, '127.0.0.1', '167', 1544683229);
INSERT INTO `tplay_admin_log` VALUES (232, 25, 1, '127.0.0.1', '16', 1544683694);
INSERT INTO `tplay_admin_log` VALUES (233, 50, 16, '127.0.0.1', '', 1544683717);
INSERT INTO `tplay_admin_log` VALUES (234, 50, 1, '127.0.0.1', '', 1544683738);
INSERT INTO `tplay_admin_log` VALUES (235, 50, 16, '127.0.0.1', '', 1544683818);
INSERT INTO `tplay_admin_log` VALUES (236, 4, 1, '127.0.0.1', '1', 1544684291);
INSERT INTO `tplay_admin_log` VALUES (237, 28, 1, '127.0.0.1', '20', 1544684332);
INSERT INTO `tplay_admin_log` VALUES (238, 28, 1, '127.0.0.1', '20', 1544684361);
INSERT INTO `tplay_admin_log` VALUES (239, 28, 1, '127.0.0.1', '1', 1544684369);
INSERT INTO `tplay_admin_log` VALUES (240, 4, 1, '127.0.0.1', '6', 1544684423);
INSERT INTO `tplay_admin_log` VALUES (241, 4, 1, '127.0.0.1', '22', 1544684457);
INSERT INTO `tplay_admin_log` VALUES (242, 28, 1, '127.0.0.1', '20', 1544684503);
INSERT INTO `tplay_admin_log` VALUES (243, 4, 1, '127.0.0.1', '22', 1544684545);
INSERT INTO `tplay_admin_log` VALUES (244, 4, 1, '127.0.0.1', '22', 1544684598);
INSERT INTO `tplay_admin_log` VALUES (245, 28, 1, '127.0.0.1', '1', 1544684618);
INSERT INTO `tplay_admin_log` VALUES (246, 50, 16, '114.102.185.200', '', 1544685047);
INSERT INTO `tplay_admin_log` VALUES (247, 50, 16, '114.102.185.200', '', 1544685316);
INSERT INTO `tplay_admin_log` VALUES (248, 50, 1, '127.0.0.1', '', 1544749720);
INSERT INTO `tplay_admin_log` VALUES (249, 50, 1, '127.0.0.1', '', 1544755355);
INSERT INTO `tplay_admin_log` VALUES (250, 50, 1, '127.0.0.1', '', 1544770461);
INSERT INTO `tplay_admin_log` VALUES (251, 50, 1, '127.0.0.1', '', 1544839349);
INSERT INTO `tplay_admin_log` VALUES (252, 50, 1, '127.0.0.1', '', 1544841078);
INSERT INTO `tplay_admin_log` VALUES (253, 50, 1, '127.0.0.1', '', 1544859510);
INSERT INTO `tplay_admin_log` VALUES (254, 50, 1, '127.0.0.1', '', 1545010158);
INSERT INTO `tplay_admin_log` VALUES (255, 50, 1, '127.0.0.1', '', 1545018224);
INSERT INTO `tplay_admin_log` VALUES (256, 50, 1, '127.0.0.1', '', 1545095836);
INSERT INTO `tplay_admin_log` VALUES (257, 50, 1, '127.0.0.1', '', 1545100179);
INSERT INTO `tplay_admin_log` VALUES (258, 50, 1, '127.0.0.1', '', 1545182707);
INSERT INTO `tplay_admin_log` VALUES (259, 50, 1, '127.0.0.1', '', 1545202167);
INSERT INTO `tplay_admin_log` VALUES (260, 28, 1, '127.0.0.1', '20', 1545206096);
INSERT INTO `tplay_admin_log` VALUES (261, 28, 1, '127.0.0.1', '20', 1545206112);
INSERT INTO `tplay_admin_log` VALUES (262, 28, 1, '127.0.0.1', '1', 1545206123);
INSERT INTO `tplay_admin_log` VALUES (263, 50, 1, '127.0.0.1', '', 1545207288);
INSERT INTO `tplay_admin_log` VALUES (264, 4, 1, '127.0.0.1', '66', 1545208012);
INSERT INTO `tplay_admin_log` VALUES (265, 28, 1, '127.0.0.1', '1', 1545208031);
INSERT INTO `tplay_admin_log` VALUES (266, 50, 1, '127.0.0.1', '', 1545267438);
INSERT INTO `tplay_admin_log` VALUES (267, 50, 1, '127.0.0.1', '', 1545278712);
INSERT INTO `tplay_admin_log` VALUES (268, 50, 1, '127.0.0.1', '', 1545356153);
INSERT INTO `tplay_admin_log` VALUES (269, 4, 1, '127.0.0.1', '67', 1545374105);
INSERT INTO `tplay_admin_log` VALUES (270, 28, 1, '127.0.0.1', '20', 1545374118);
INSERT INTO `tplay_admin_log` VALUES (271, 28, 1, '127.0.0.1', '1', 1545374126);
INSERT INTO `tplay_admin_log` VALUES (272, 11, 1, '127.0.0.1', '', 1545385096);
INSERT INTO `tplay_admin_log` VALUES (273, 50, 1, '127.0.0.1', '', 1545441467);
INSERT INTO `tplay_admin_log` VALUES (274, 50, 1, '127.0.0.1', '', 1545445391);
INSERT INTO `tplay_admin_log` VALUES (275, 49, 1, '127.0.0.1', '168', 1545446742);
INSERT INTO `tplay_admin_log` VALUES (276, 49, 1, '127.0.0.1', '169', 1545447196);
INSERT INTO `tplay_admin_log` VALUES (277, 49, 1, '127.0.0.1', '170', 1545447387);
INSERT INTO `tplay_admin_log` VALUES (278, 49, 1, '127.0.0.1', '171', 1545447417);
INSERT INTO `tplay_admin_log` VALUES (279, 49, 1, '127.0.0.1', '172', 1545448227);
INSERT INTO `tplay_admin_log` VALUES (280, 4, 1, '127.0.0.1', '68', 1545448605);
INSERT INTO `tplay_admin_log` VALUES (281, 28, 1, '127.0.0.1', '1', 1545448619);
INSERT INTO `tplay_admin_log` VALUES (282, 4, 1, '127.0.0.1', '69', 1545448698);
INSERT INTO `tplay_admin_log` VALUES (283, 4, 1, '127.0.0.1', '69', 1545448713);
INSERT INTO `tplay_admin_log` VALUES (284, 4, 1, '127.0.0.1', '70', 1545448788);
INSERT INTO `tplay_admin_log` VALUES (285, 28, 1, '127.0.0.1', '1', 1545448801);
INSERT INTO `tplay_admin_log` VALUES (286, 28, 1, '127.0.0.1', '1', 1545458715);
INSERT INTO `tplay_admin_log` VALUES (287, 4, 1, '127.0.0.1', '69', 1545459675);
INSERT INTO `tplay_admin_log` VALUES (288, 4, 1, '127.0.0.1', '68', 1545459698);
INSERT INTO `tplay_admin_log` VALUES (289, 49, 1, '127.0.0.1', '1', 1545459810);
INSERT INTO `tplay_admin_log` VALUES (290, 49, 1, '127.0.0.1', '2', 1545459825);
INSERT INTO `tplay_admin_log` VALUES (291, 49, 1, '127.0.0.1', '3', 1545459837);
INSERT INTO `tplay_admin_log` VALUES (292, 49, 1, '127.0.0.1', '4', 1545459852);
INSERT INTO `tplay_admin_log` VALUES (293, 49, 1, '127.0.0.1', '5', 1545460077);
INSERT INTO `tplay_admin_log` VALUES (294, 49, 1, '127.0.0.1', '6', 1545460213);
INSERT INTO `tplay_admin_log` VALUES (295, 49, 1, '127.0.0.1', '7', 1545460217);
INSERT INTO `tplay_admin_log` VALUES (296, 49, 1, '127.0.0.1', '8', 1545460220);
INSERT INTO `tplay_admin_log` VALUES (297, 49, 1, '127.0.0.1', '9', 1545460224);
INSERT INTO `tplay_admin_log` VALUES (298, 49, 1, '127.0.0.1', '10', 1545460230);
INSERT INTO `tplay_admin_log` VALUES (299, 7, 1, '127.0.0.1', '1', 1545461599);
INSERT INTO `tplay_admin_log` VALUES (300, 49, 1, '127.0.0.1', '1', 1545461615);
INSERT INTO `tplay_admin_log` VALUES (301, 7, 1, '127.0.0.1', '1', 1545461617);
INSERT INTO `tplay_admin_log` VALUES (302, 50, 16, '127.0.0.1', '', 1545461646);
INSERT INTO `tplay_admin_log` VALUES (303, 49, 16, '127.0.0.1', '2', 1545461654);
INSERT INTO `tplay_admin_log` VALUES (304, 7, 16, '127.0.0.1', '16', 1545461655);
INSERT INTO `tplay_admin_log` VALUES (305, 50, 1, '127.0.0.1', '', 1545461670);
INSERT INTO `tplay_admin_log` VALUES (306, 49, 1, '127.0.0.1', '3', 1545461727);
INSERT INTO `tplay_admin_log` VALUES (307, 49, 1, '127.0.0.1', '4', 1545461742);
INSERT INTO `tplay_admin_log` VALUES (308, 49, 1, '127.0.0.1', '5', 1545461758);
INSERT INTO `tplay_admin_log` VALUES (309, 49, 1, '127.0.0.1', '6', 1545461878);
INSERT INTO `tplay_admin_log` VALUES (310, 49, 1, '127.0.0.1', '7', 1545462035);
INSERT INTO `tplay_admin_log` VALUES (311, 49, 1, '127.0.0.1', '8', 1545462121);
INSERT INTO `tplay_admin_log` VALUES (312, 49, 1, '127.0.0.1', '9', 1545462127);
INSERT INTO `tplay_admin_log` VALUES (313, 49, 1, '127.0.0.1', '10', 1545462131);
INSERT INTO `tplay_admin_log` VALUES (314, 49, 1, '127.0.0.1', '11', 1545462133);
INSERT INTO `tplay_admin_log` VALUES (315, 49, 1, '127.0.0.1', '12', 1545462139);
INSERT INTO `tplay_admin_log` VALUES (316, 49, 1, '127.0.0.1', '13', 1545462144);
INSERT INTO `tplay_admin_log` VALUES (317, 49, 1, '127.0.0.1', '14', 1545462149);
INSERT INTO `tplay_admin_log` VALUES (318, 49, 1, '127.0.0.1', '15', 1545462217);
INSERT INTO `tplay_admin_log` VALUES (319, 49, 1, '127.0.0.1', '16', 1545462220);
INSERT INTO `tplay_admin_log` VALUES (320, 49, 1, '127.0.0.1', '17', 1545462223);
INSERT INTO `tplay_admin_log` VALUES (321, 49, 1, '127.0.0.1', '18', 1545462227);
INSERT INTO `tplay_admin_log` VALUES (322, 49, 1, '127.0.0.1', '19', 1545463225);
INSERT INTO `tplay_admin_log` VALUES (323, 49, 1, '127.0.0.1', '20', 1545463229);
INSERT INTO `tplay_admin_log` VALUES (324, 49, 1, '127.0.0.1', '21', 1545463233);
INSERT INTO `tplay_admin_log` VALUES (325, 49, 1, '127.0.0.1', '22', 1545463236);
INSERT INTO `tplay_admin_log` VALUES (326, 49, 1, '127.0.0.1', '23', 1545463239);
INSERT INTO `tplay_admin_log` VALUES (327, 49, 1, '127.0.0.1', '24', 1545463361);
INSERT INTO `tplay_admin_log` VALUES (328, 49, 1, '127.0.0.1', '25', 1545463364);
INSERT INTO `tplay_admin_log` VALUES (329, 49, 1, '127.0.0.1', '26', 1545463439);
INSERT INTO `tplay_admin_log` VALUES (330, 49, 1, '127.0.0.1', '27', 1545463514);
INSERT INTO `tplay_admin_log` VALUES (331, 49, 1, '127.0.0.1', '28', 1545463517);
INSERT INTO `tplay_admin_log` VALUES (332, 49, 1, '127.0.0.1', '29', 1545463519);
INSERT INTO `tplay_admin_log` VALUES (333, 49, 1, '127.0.0.1', '30', 1545463522);
INSERT INTO `tplay_admin_log` VALUES (334, 49, 1, '127.0.0.1', '31', 1545463632);
INSERT INTO `tplay_admin_log` VALUES (335, 49, 1, '127.0.0.1', '32', 1545465620);
INSERT INTO `tplay_admin_log` VALUES (336, 49, 1, '127.0.0.1', '33', 1545465906);
INSERT INTO `tplay_admin_log` VALUES (337, 49, 1, '127.0.0.1', '34', 1545466164);

-- ----------------------------
-- Table structure for tplay_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `tplay_admin_menu`;
CREATE TABLE `tplay_admin_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块',
  `controller` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '控制器',
  `function` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法',
  `parameter` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_display` int(1) NOT NULL DEFAULT 1 COMMENT '1显示在左侧菜单2只作为节点',
  `type` int(1) NOT NULL DEFAULT 1 COMMENT '1权限节点2普通节点',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级菜单0为顶级菜单',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `is_open` int(1) NOT NULL DEFAULT 0 COMMENT '0默认闭合1默认展开',
  `orders` int(11) NOT NULL DEFAULT 0 COMMENT '排序值，越小越靠前',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `module`(`module`) USING BTREE,
  INDEX `controller`(`controller`) USING BTREE,
  INDEX `function`(`function`) USING BTREE,
  INDEX `is_display`(`is_display`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_admin_menu
-- ----------------------------
INSERT INTO `tplay_admin_menu` VALUES (1, '系统', '', '', '', '', '系统设置。', 1, 1, 0, 0, 1544684291, 'fa-cog', 1, 0);
INSERT INTO `tplay_admin_menu` VALUES (2, '菜单', '', '', '', '', '菜单管理。', 1, 2, 1, 0, 1517015764, 'fa-paw', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (51, '系统菜单排序', 'admin', 'menu', 'orders', '', '系统菜单排序。', 2, 1, 3, 1517562047, 1517562047, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (3, '系统菜单', 'admin', 'menu', 'index', '', '系统菜单管理', 1, 2, 2, 0, 0, 'fa-share-alt', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (4, '新增/修改系统菜单', 'admin', 'menu', 'publish', '', '新增/修改系统菜单.', 2, 1, 3, 1516948769, 1516948769, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (5, '删除系统菜单', 'admin', 'menu', 'delete', '', '删除系统菜单。', 2, 1, 3, 1516948857, 1516948857, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (6, '个人设置', '', '', '', '', '个人信息管理。', 1, 1, 0, 1516949308, 1544684423, 'fa-user', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (7, '个人信息', 'admin', 'admin', 'personal', '', '个人信息修改。', 1, 1, 6, 1516949435, 1516949435, 'fa-user', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (8, '修改密码', 'admin', 'admin', 'editpassword', '', '管理员修改个人密码。', 1, 1, 6, 1516949702, 1517619887, 'fa-unlock-alt', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (9, '设置', '', '', '', '', '系统相关设置。', 1, 2, 1, 1516949853, 1517015878, 'fa-cog', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (10, '网站设置', 'admin', 'webconfig', 'index', '', '网站相关设置首页。', 1, 2, 9, 1516949994, 1516949994, 'fa-bullseye', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (11, '修改网站设置', 'admin', 'webconfig', 'publish', '', '修改网站设置。', 2, 1, 10, 1516950047, 1516950047, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (12, '邮件设置', 'admin', 'emailconfig', 'index', '', '邮件配置首页。', 1, 2, 9, 1516950129, 1516950129, 'fa-envelope', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (13, '修改邮件设置', 'admin', 'emailconfig', 'publish', '', '修改邮件设置。', 2, 1, 12, 1516950215, 1516950215, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (14, '发送测试邮件', 'admin', 'emailconfig', 'mailto', '', '发送测试邮件。', 2, 1, 12, 1516950295, 1516950295, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (15, '短信设置', 'admin', 'smsconfig', 'index', '', '短信设置首页。', 1, 2, 9, 1516950394, 1516950394, 'fa-comments', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (16, '修改短信设置', 'admin', 'smsconfig', 'publish', '', '修改短信设置。', 2, 1, 15, 1516950447, 1516950447, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (17, '发送测试短信', 'admin', 'smsconfig', 'smsto', '', '发送测试短信。', 2, 1, 15, 1516950483, 1516950483, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (18, 'URL 设置', 'admin', 'urlsconfig', 'index', '', 'url 设置。', 1, 2, 9, 1516950738, 1516950804, 'fa-code-fork', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (19, '新增/修改url设置', 'admin', 'urlsconfig', 'publish', '', '新增/修改url设置。', 2, 1, 18, 1516950850, 1516950850, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (20, '启用/禁用url美化', 'admin', 'urlsconfig', 'status', '', '启用/禁用url美化。', 2, 1, 18, 1516950909, 1516950909, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (21, ' 删除url美化规则', 'admin', 'urlsconfig', 'delete', '', ' 删除url美化规则。', 2, 1, 18, 1516950941, 1516950941, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (22, '会员', '', '', '', '', '会员管理。', 1, 1, 0, 1516950991, 1544684598, 'fa-users', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (23, '管理员', '', '', '', '', '系统管理员管理。', 1, 2, 22, 1516951071, 1517015819, 'fa-user', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (24, '管理员', 'admin', 'admin', 'index', '', '系统管理员列表。', 1, 2, 23, 1516951163, 1516951163, 'fa-user', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (25, '新增/修改管理员', 'admin', 'admin', 'publish', '', '新增/修改系统管理员。', 2, 1, 24, 1516951224, 1516951224, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (26, '删除管理员', 'admin', 'admin', 'delete', '', '删除管理员。', 2, 1, 24, 1516951253, 1516951253, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (27, '权限组', 'admin', 'admin', 'admincate', '', '权限分组。', 1, 2, 23, 1516951353, 1517018168, 'fa-dot-circle-o', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (28, '新增/修改权限组', 'admin', 'admin', 'admincatepublish', '', '新增/修改权限组。', 2, 1, 27, 1516951483, 1516951483, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (29, '删除权限组', 'admin', 'admin', 'admincatedelete', '', '删除权限组。', 2, 1, 27, 1516951515, 1516951515, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (30, '操作日志', 'admin', 'admin', 'log', '', '系统管理员操作日志。', 1, 2, 23, 1516951754, 1517018196, 'fa-pencil', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (31, '内容', '', '', '', '', '内容管理。', 1, 1, 0, 1516952262, 1544951848, 'fa-th-large', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (32, '文章', '', '', '', '', '文章相关管理。', 1, 2, 31, 1516952698, 1517015846, 'fa-bookmark', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (33, '分类', 'admin', 'articlecate', 'index', '', '文章分类管理。', 1, 2, 32, 1516952856, 1516952856, 'fa-tag', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (34, '新增/修改文章分类', 'admin', 'articlecate', 'publish', '', '新增/修改文章分类。', 2, 1, 33, 1516952896, 1516952896, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (35, '删除文章分类', 'admin', 'articlecate', 'delete', '', '删除文章分类。', 2, 1, 33, 1516952942, 1516952942, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (36, '文章', 'admin', 'article', 'index', '', '文章管理。', 1, 2, 32, 1516953011, 1516953028, 'fa-bookmark', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (37, '新增/修改文章', 'admin', 'article', 'publish', '', '新增/修改文章。', 2, 1, 36, 1516953056, 1516953056, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (38, '审核/拒绝文章', 'admin', 'article', 'status', '', '审核/拒绝文章。', 2, 1, 36, 1516953113, 1516953113, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (39, '置顶/取消置顶文章', 'admin', 'article', 'is_top', '', '置顶/取消置顶文章。', 2, 1, 36, 1516953162, 1516953162, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (40, '删除文章', 'admin', 'article', 'delete', '', '删除文章。', 2, 1, 36, 1516953183, 1516953183, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (41, '附件', 'admin', 'attachment', 'index', '', '附件管理。', 1, 2, 31, 1516953306, 1516953306, 'fa-cube', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (42, '附件审核', 'admin', 'attachment', 'audit', '', '附件审核。', 2, 1, 41, 1516953359, 1516953440, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (43, '附件上传', 'admin', 'attachment', 'upload', '', '附件上传。', 2, 1, 41, 1516953392, 1516953392, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (44, '附件下载', 'admin', 'attachment', 'download', '', '附件下载。', 2, 1, 41, 1516953430, 1516953430, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (45, '附件删除', 'admin', 'attachment', 'delete', '', '附件删除。', 2, 1, 41, 1516953477, 1516953477, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (46, '留言', 'admin', 'tomessages', 'index', '', '留言管理。', 1, 2, 31, 1516953526, 1516953526, 'fa-comments', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (47, '留言处理', 'admin', 'tomessages', 'mark', '', '留言处理。', 2, 1, 46, 1516953605, 1516953605, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (48, '留言删除', 'admin', 'tomessages', 'delete', '', '留言删除。', 2, 1, 46, 1516953648, 1516953648, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (49, '图片上传', 'admin', 'common', 'upload', '', '图片上传。', 2, 2, 0, 1516954491, 1516954491, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (50, '管理员登录', 'admin', 'common', 'login', '', '管理员登录。', 2, 2, 0, 1516954517, 1516954517, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (52, '首页轮播图', '', '', '', '', '首页轮播图广告管理', 1, 1, 0, 1544145441, 1544145637, 'fa fa-area-chart', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (53, '轮播图管理', 'admin', 'banner', 'index', '', '', 1, 1, 52, 1544145709, 1544145709, 'fa fa-picture-o', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (54, '房源管理', '', '', '', '', '房源管理: 新房，二手房', 1, 1, 0, 1544253869, 1544253869, 'fa fa-home', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (55, '房源信息', 'admin', 'House', 'index', '', '房源列表信息', 1, 1, 54, 1544254556, 1544254556, 'fa fa-list', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (56, '公告管理', '', '', '', '', '公告增删改查', 1, 1, 0, 1544515442, 1544602036, 'fa fa-desktop', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (57, '公告列表', 'admin', 'notice', 'noticelist', '', '公告列表', 1, 1, 56, 1544515486, 1544515486, 'fa fa-television', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (58, '佣金管理', '', '', '', '', '佣金管理', 1, 1, 0, 1544579993, 1544579993, 'fa fa-btc', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (59, '佣金方案', 'admin', 'brokerage', 'brokerage_plan', '', '佣金方案', 1, 1, 58, 1544580098, 1544580145, 'fa fa-money', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (60, '报备管理', '', '', '', '', '报备，到访，成交，提额管理', 1, 1, 0, 1544602013, 1544602310, 'fa fa-list', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (61, '报备列表', 'admin', 'Order', 'orderlist', '', '报备，到访，成交，管理', 1, 1, 60, 1544602111, 1544602343, 'fa fa-outdent', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (62, '门店管理', '', '', '', '', '', 1, 1, 0, 1544796196, 1544796387, 'fa fa-institution', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (63, '门店入驻', 'admin', 'store', 'index', '', '', 1, 1, 62, 1544796525, 1544796525, 'fa fa-linkedin-square', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (64, '用户管理', '', '', '', '', '注册用户管理', 1, 1, 0, 1544963080, 1544963080, 'fa fa-user-circle-o', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (65, '用户列表', 'admin', 'user', 'index', '', '用户列表', 1, 1, 64, 1544963132, 1544963132, 'fa fa-user-o', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (66, '佣金列表', 'admin', 'Brokeragelist', 'brokeragelist', '', '', 1, 1, 58, 1545208012, 1545208012, 'fa fa-paypal', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (67, '实名管理', 'admin', 'user', 'realname', '', '用户实名管理', 1, 1, 64, 1545374105, 1545374105, 'fa fa-odnoklassniki-square', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (68, '数据库', '', '', '', '', '', 1, 1, 0, 1545448605, 1545459698, 'fa fa-database', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (69, '备份管理', 'admin', 'Databackup', '', 'index', '', 1, 1, 68, 1545448698, 1545459675, 'fa fa-dashboard', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (70, '备份列表', 'admin', 'Databackup', 'importlist', '', '', 1, 1, 68, 1545448788, 1545448788, 'fa fa-server', 0, 0);

-- ----------------------------
-- Table structure for tplay_area
-- ----------------------------
DROP TABLE IF EXISTS `tplay_area`;
CREATE TABLE `tplay_area`  (
  `_id` int(11) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tplay_area
-- ----------------------------
INSERT INTO `tplay_area` VALUES (1, '东城区', '110101', '110100');
INSERT INTO `tplay_area` VALUES (2, '西城区', '110102', '110100');
INSERT INTO `tplay_area` VALUES (3, '朝阳区', '110105', '110100');
INSERT INTO `tplay_area` VALUES (4, '丰台区', '110106', '110100');
INSERT INTO `tplay_area` VALUES (5, '石景山区', '110107', '110100');
INSERT INTO `tplay_area` VALUES (6, '海淀区', '110108', '110100');
INSERT INTO `tplay_area` VALUES (7, '门头沟区', '110109', '110100');
INSERT INTO `tplay_area` VALUES (8, '房山区', '110111', '110100');
INSERT INTO `tplay_area` VALUES (9, '通州区', '110112', '110100');
INSERT INTO `tplay_area` VALUES (10, '顺义区', '110113', '110100');
INSERT INTO `tplay_area` VALUES (11, '昌平区', '110114', '110100');
INSERT INTO `tplay_area` VALUES (12, '大兴区', '110115', '110100');
INSERT INTO `tplay_area` VALUES (13, '怀柔区', '110116', '110100');
INSERT INTO `tplay_area` VALUES (14, '平谷区', '110117', '110100');
INSERT INTO `tplay_area` VALUES (15, '密云区', '110118', '110100');
INSERT INTO `tplay_area` VALUES (16, '延庆区', '110119', '110100');
INSERT INTO `tplay_area` VALUES (17, '和平区', '120101', '120100');
INSERT INTO `tplay_area` VALUES (18, '河东区', '120102', '120100');
INSERT INTO `tplay_area` VALUES (19, '河西区', '120103', '120100');
INSERT INTO `tplay_area` VALUES (20, '南开区', '120104', '120100');
INSERT INTO `tplay_area` VALUES (21, '河北区', '120105', '120100');
INSERT INTO `tplay_area` VALUES (22, '红桥区', '120106', '120100');
INSERT INTO `tplay_area` VALUES (23, '东丽区', '120110', '120100');
INSERT INTO `tplay_area` VALUES (24, '西青区', '120111', '120100');
INSERT INTO `tplay_area` VALUES (25, '津南区', '120112', '120100');
INSERT INTO `tplay_area` VALUES (26, '北辰区', '120113', '120100');
INSERT INTO `tplay_area` VALUES (27, '武清区', '120114', '120100');
INSERT INTO `tplay_area` VALUES (28, '宝坻区', '120115', '120100');
INSERT INTO `tplay_area` VALUES (29, '滨海新区', '120116', '120100');
INSERT INTO `tplay_area` VALUES (30, '宁河区', '120117', '120100');
INSERT INTO `tplay_area` VALUES (31, '静海区', '120118', '120100');
INSERT INTO `tplay_area` VALUES (32, '蓟州区', '120119', '120100');
INSERT INTO `tplay_area` VALUES (33, '市辖区', '130101', '130100');
INSERT INTO `tplay_area` VALUES (34, '长安区', '130102', '130100');
INSERT INTO `tplay_area` VALUES (35, '桥西区', '130104', '130100');
INSERT INTO `tplay_area` VALUES (36, '新华区', '130105', '130100');
INSERT INTO `tplay_area` VALUES (37, '井陉矿区', '130107', '130100');
INSERT INTO `tplay_area` VALUES (38, '裕华区', '130108', '130100');
INSERT INTO `tplay_area` VALUES (39, '藁城区', '130109', '130100');
INSERT INTO `tplay_area` VALUES (40, '鹿泉区', '130110', '130100');
INSERT INTO `tplay_area` VALUES (41, '栾城区', '130111', '130100');
INSERT INTO `tplay_area` VALUES (42, '井陉县', '130121', '130100');
INSERT INTO `tplay_area` VALUES (43, '正定县', '130123', '130100');
INSERT INTO `tplay_area` VALUES (44, '行唐县', '130125', '130100');
INSERT INTO `tplay_area` VALUES (45, '灵寿县', '130126', '130100');
INSERT INTO `tplay_area` VALUES (46, '高邑县', '130127', '130100');
INSERT INTO `tplay_area` VALUES (47, '深泽县', '130128', '130100');
INSERT INTO `tplay_area` VALUES (48, '赞皇县', '130129', '130100');
INSERT INTO `tplay_area` VALUES (49, '无极县', '130130', '130100');
INSERT INTO `tplay_area` VALUES (50, '平山县', '130131', '130100');
INSERT INTO `tplay_area` VALUES (51, '元氏县', '130132', '130100');
INSERT INTO `tplay_area` VALUES (52, '赵县', '130133', '130100');
INSERT INTO `tplay_area` VALUES (53, '晋州市', '130183', '130100');
INSERT INTO `tplay_area` VALUES (54, '新乐市', '130184', '130100');
INSERT INTO `tplay_area` VALUES (55, '市辖区', '130201', '130200');
INSERT INTO `tplay_area` VALUES (56, '路南区', '130202', '130200');
INSERT INTO `tplay_area` VALUES (57, '路北区', '130203', '130200');
INSERT INTO `tplay_area` VALUES (58, '古冶区', '130204', '130200');
INSERT INTO `tplay_area` VALUES (59, '开平区', '130205', '130200');
INSERT INTO `tplay_area` VALUES (60, '丰南区', '130207', '130200');
INSERT INTO `tplay_area` VALUES (61, '丰润区', '130208', '130200');
INSERT INTO `tplay_area` VALUES (62, '曹妃甸区', '130209', '130200');
INSERT INTO `tplay_area` VALUES (63, '滦县', '130223', '130200');
INSERT INTO `tplay_area` VALUES (64, '滦南县', '130224', '130200');
INSERT INTO `tplay_area` VALUES (65, '乐亭县', '130225', '130200');
INSERT INTO `tplay_area` VALUES (66, '迁西县', '130227', '130200');
INSERT INTO `tplay_area` VALUES (67, '玉田县', '130229', '130200');
INSERT INTO `tplay_area` VALUES (68, '遵化市', '130281', '130200');
INSERT INTO `tplay_area` VALUES (69, '迁安市', '130283', '130200');
INSERT INTO `tplay_area` VALUES (70, '市辖区', '130301', '130300');
INSERT INTO `tplay_area` VALUES (71, '海港区', '130302', '130300');
INSERT INTO `tplay_area` VALUES (72, '山海关区', '130303', '130300');
INSERT INTO `tplay_area` VALUES (73, '北戴河区', '130304', '130300');
INSERT INTO `tplay_area` VALUES (74, '抚宁区', '130306', '130300');
INSERT INTO `tplay_area` VALUES (75, '青龙满族自治县', '130321', '130300');
INSERT INTO `tplay_area` VALUES (76, '昌黎县', '130322', '130300');
INSERT INTO `tplay_area` VALUES (77, '卢龙县', '130324', '130300');
INSERT INTO `tplay_area` VALUES (78, '市辖区', '130401', '130400');
INSERT INTO `tplay_area` VALUES (79, '邯山区', '130402', '130400');
INSERT INTO `tplay_area` VALUES (80, '丛台区', '130403', '130400');
INSERT INTO `tplay_area` VALUES (81, '复兴区', '130404', '130400');
INSERT INTO `tplay_area` VALUES (82, '峰峰矿区', '130406', '130400');
INSERT INTO `tplay_area` VALUES (83, '邯郸县', '130421', '130400');
INSERT INTO `tplay_area` VALUES (84, '临漳县', '130423', '130400');
INSERT INTO `tplay_area` VALUES (85, '成安县', '130424', '130400');
INSERT INTO `tplay_area` VALUES (86, '大名县', '130425', '130400');
INSERT INTO `tplay_area` VALUES (87, '涉县', '130426', '130400');
INSERT INTO `tplay_area` VALUES (88, '磁县', '130427', '130400');
INSERT INTO `tplay_area` VALUES (89, '肥乡县', '130428', '130400');
INSERT INTO `tplay_area` VALUES (90, '永年县', '130429', '130400');
INSERT INTO `tplay_area` VALUES (91, '邱县', '130430', '130400');
INSERT INTO `tplay_area` VALUES (92, '鸡泽县', '130431', '130400');
INSERT INTO `tplay_area` VALUES (93, '广平县', '130432', '130400');
INSERT INTO `tplay_area` VALUES (94, '馆陶县', '130433', '130400');
INSERT INTO `tplay_area` VALUES (95, '魏县', '130434', '130400');
INSERT INTO `tplay_area` VALUES (96, '曲周县', '130435', '130400');
INSERT INTO `tplay_area` VALUES (97, '武安市', '130481', '130400');
INSERT INTO `tplay_area` VALUES (98, '市辖区', '130501', '130500');
INSERT INTO `tplay_area` VALUES (99, '桥东区', '130502', '130500');
INSERT INTO `tplay_area` VALUES (100, '桥西区', '130503', '130500');
INSERT INTO `tplay_area` VALUES (101, '邢台县', '130521', '130500');
INSERT INTO `tplay_area` VALUES (102, '临城县', '130522', '130500');
INSERT INTO `tplay_area` VALUES (103, '内丘县', '130523', '130500');
INSERT INTO `tplay_area` VALUES (104, '柏乡县', '130524', '130500');
INSERT INTO `tplay_area` VALUES (105, '隆尧县', '130525', '130500');
INSERT INTO `tplay_area` VALUES (106, '任县', '130526', '130500');
INSERT INTO `tplay_area` VALUES (107, '南和县', '130527', '130500');
INSERT INTO `tplay_area` VALUES (108, '宁晋县', '130528', '130500');
INSERT INTO `tplay_area` VALUES (109, '巨鹿县', '130529', '130500');
INSERT INTO `tplay_area` VALUES (110, '新河县', '130530', '130500');
INSERT INTO `tplay_area` VALUES (111, '广宗县', '130531', '130500');
INSERT INTO `tplay_area` VALUES (112, '平乡县', '130532', '130500');
INSERT INTO `tplay_area` VALUES (113, '威县', '130533', '130500');
INSERT INTO `tplay_area` VALUES (114, '清河县', '130534', '130500');
INSERT INTO `tplay_area` VALUES (115, '临西县', '130535', '130500');
INSERT INTO `tplay_area` VALUES (116, '南宫市', '130581', '130500');
INSERT INTO `tplay_area` VALUES (117, '沙河市', '130582', '130500');
INSERT INTO `tplay_area` VALUES (118, '市辖区', '130601', '130600');
INSERT INTO `tplay_area` VALUES (119, '竞秀区', '130602', '130600');
INSERT INTO `tplay_area` VALUES (120, '莲池区', '130606', '130600');
INSERT INTO `tplay_area` VALUES (121, '满城区', '130607', '130600');
INSERT INTO `tplay_area` VALUES (122, '清苑区', '130608', '130600');
INSERT INTO `tplay_area` VALUES (123, '徐水区', '130609', '130600');
INSERT INTO `tplay_area` VALUES (124, '涞水县', '130623', '130600');
INSERT INTO `tplay_area` VALUES (125, '阜平县', '130624', '130600');
INSERT INTO `tplay_area` VALUES (126, '定兴县', '130626', '130600');
INSERT INTO `tplay_area` VALUES (127, '唐县', '130627', '130600');
INSERT INTO `tplay_area` VALUES (128, '高阳县', '130628', '130600');
INSERT INTO `tplay_area` VALUES (129, '容城县', '130629', '130600');
INSERT INTO `tplay_area` VALUES (130, '涞源县', '130630', '130600');
INSERT INTO `tplay_area` VALUES (131, '望都县', '130631', '130600');
INSERT INTO `tplay_area` VALUES (132, '安新县', '130632', '130600');
INSERT INTO `tplay_area` VALUES (133, '易县', '130633', '130600');
INSERT INTO `tplay_area` VALUES (134, '曲阳县', '130634', '130600');
INSERT INTO `tplay_area` VALUES (135, '蠡县', '130635', '130600');
INSERT INTO `tplay_area` VALUES (136, '顺平县', '130636', '130600');
INSERT INTO `tplay_area` VALUES (137, '博野县', '130637', '130600');
INSERT INTO `tplay_area` VALUES (138, '雄县', '130638', '130600');
INSERT INTO `tplay_area` VALUES (139, '涿州市', '130681', '130600');
INSERT INTO `tplay_area` VALUES (140, '安国市', '130683', '130600');
INSERT INTO `tplay_area` VALUES (141, '高碑店市', '130684', '130600');
INSERT INTO `tplay_area` VALUES (142, '市辖区', '130701', '130700');
INSERT INTO `tplay_area` VALUES (143, '桥东区', '130702', '130700');
INSERT INTO `tplay_area` VALUES (144, '桥西区', '130703', '130700');
INSERT INTO `tplay_area` VALUES (145, '宣化区', '130705', '130700');
INSERT INTO `tplay_area` VALUES (146, '下花园区', '130706', '130700');
INSERT INTO `tplay_area` VALUES (147, '万全区', '130708', '130700');
INSERT INTO `tplay_area` VALUES (148, '崇礼区', '130709', '130700');
INSERT INTO `tplay_area` VALUES (149, '张北县', '130722', '130700');
INSERT INTO `tplay_area` VALUES (150, '康保县', '130723', '130700');
INSERT INTO `tplay_area` VALUES (151, '沽源县', '130724', '130700');
INSERT INTO `tplay_area` VALUES (152, '尚义县', '130725', '130700');
INSERT INTO `tplay_area` VALUES (153, '蔚县', '130726', '130700');
INSERT INTO `tplay_area` VALUES (154, '阳原县', '130727', '130700');
INSERT INTO `tplay_area` VALUES (155, '怀安县', '130728', '130700');
INSERT INTO `tplay_area` VALUES (156, '怀来县', '130730', '130700');
INSERT INTO `tplay_area` VALUES (157, '涿鹿县', '130731', '130700');
INSERT INTO `tplay_area` VALUES (158, '赤城县', '130732', '130700');
INSERT INTO `tplay_area` VALUES (159, '市辖区', '130801', '130800');
INSERT INTO `tplay_area` VALUES (160, '双桥区', '130802', '130800');
INSERT INTO `tplay_area` VALUES (161, '双滦区', '130803', '130800');
INSERT INTO `tplay_area` VALUES (162, '鹰手营子矿区', '130804', '130800');
INSERT INTO `tplay_area` VALUES (163, '承德县', '130821', '130800');
INSERT INTO `tplay_area` VALUES (164, '兴隆县', '130822', '130800');
INSERT INTO `tplay_area` VALUES (165, '平泉县', '130823', '130800');
INSERT INTO `tplay_area` VALUES (166, '滦平县', '130824', '130800');
INSERT INTO `tplay_area` VALUES (167, '隆化县', '130825', '130800');
INSERT INTO `tplay_area` VALUES (168, '丰宁满族自治县', '130826', '130800');
INSERT INTO `tplay_area` VALUES (169, '宽城满族自治县', '130827', '130800');
INSERT INTO `tplay_area` VALUES (170, '围场满族蒙古族自治县', '130828', '130800');
INSERT INTO `tplay_area` VALUES (171, '市辖区', '130901', '130900');
INSERT INTO `tplay_area` VALUES (172, '新华区', '130902', '130900');
INSERT INTO `tplay_area` VALUES (173, '运河区', '130903', '130900');
INSERT INTO `tplay_area` VALUES (174, '沧县', '130921', '130900');
INSERT INTO `tplay_area` VALUES (175, '青县', '130922', '130900');
INSERT INTO `tplay_area` VALUES (176, '东光县', '130923', '130900');
INSERT INTO `tplay_area` VALUES (177, '海兴县', '130924', '130900');
INSERT INTO `tplay_area` VALUES (178, '盐山县', '130925', '130900');
INSERT INTO `tplay_area` VALUES (179, '肃宁县', '130926', '130900');
INSERT INTO `tplay_area` VALUES (180, '南皮县', '130927', '130900');
INSERT INTO `tplay_area` VALUES (181, '吴桥县', '130928', '130900');
INSERT INTO `tplay_area` VALUES (182, '献县', '130929', '130900');
INSERT INTO `tplay_area` VALUES (183, '孟村回族自治县', '130930', '130900');
INSERT INTO `tplay_area` VALUES (184, '泊头市', '130981', '130900');
INSERT INTO `tplay_area` VALUES (185, '任丘市', '130982', '130900');
INSERT INTO `tplay_area` VALUES (186, '黄骅市', '130983', '130900');
INSERT INTO `tplay_area` VALUES (187, '河间市', '130984', '130900');
INSERT INTO `tplay_area` VALUES (188, '市辖区', '131001', '131000');
INSERT INTO `tplay_area` VALUES (189, '安次区', '131002', '131000');
INSERT INTO `tplay_area` VALUES (190, '广阳区', '131003', '131000');
INSERT INTO `tplay_area` VALUES (191, '固安县', '131022', '131000');
INSERT INTO `tplay_area` VALUES (192, '永清县', '131023', '131000');
INSERT INTO `tplay_area` VALUES (193, '香河县', '131024', '131000');
INSERT INTO `tplay_area` VALUES (194, '大城县', '131025', '131000');
INSERT INTO `tplay_area` VALUES (195, '文安县', '131026', '131000');
INSERT INTO `tplay_area` VALUES (196, '大厂回族自治县', '131028', '131000');
INSERT INTO `tplay_area` VALUES (197, '霸州市', '131081', '131000');
INSERT INTO `tplay_area` VALUES (198, '三河市', '131082', '131000');
INSERT INTO `tplay_area` VALUES (199, '市辖区', '131101', '131100');
INSERT INTO `tplay_area` VALUES (200, '桃城区', '131102', '131100');
INSERT INTO `tplay_area` VALUES (201, '冀州区', '131103', '131100');
INSERT INTO `tplay_area` VALUES (202, '枣强县', '131121', '131100');
INSERT INTO `tplay_area` VALUES (203, '武邑县', '131122', '131100');
INSERT INTO `tplay_area` VALUES (204, '武强县', '131123', '131100');
INSERT INTO `tplay_area` VALUES (205, '饶阳县', '131124', '131100');
INSERT INTO `tplay_area` VALUES (206, '安平县', '131125', '131100');
INSERT INTO `tplay_area` VALUES (207, '故城县', '131126', '131100');
INSERT INTO `tplay_area` VALUES (208, '景县', '131127', '131100');
INSERT INTO `tplay_area` VALUES (209, '阜城县', '131128', '131100');
INSERT INTO `tplay_area` VALUES (210, '深州市', '131182', '131100');
INSERT INTO `tplay_area` VALUES (211, '定州市', '139001', '139000');
INSERT INTO `tplay_area` VALUES (212, '辛集市', '139002', '139000');
INSERT INTO `tplay_area` VALUES (213, '市辖区', '140101', '140100');
INSERT INTO `tplay_area` VALUES (214, '小店区', '140105', '140100');
INSERT INTO `tplay_area` VALUES (215, '迎泽区', '140106', '140100');
INSERT INTO `tplay_area` VALUES (216, '杏花岭区', '140107', '140100');
INSERT INTO `tplay_area` VALUES (217, '尖草坪区', '140108', '140100');
INSERT INTO `tplay_area` VALUES (218, '万柏林区', '140109', '140100');
INSERT INTO `tplay_area` VALUES (219, '晋源区', '140110', '140100');
INSERT INTO `tplay_area` VALUES (220, '清徐县', '140121', '140100');
INSERT INTO `tplay_area` VALUES (221, '阳曲县', '140122', '140100');
INSERT INTO `tplay_area` VALUES (222, '娄烦县', '140123', '140100');
INSERT INTO `tplay_area` VALUES (223, '古交市', '140181', '140100');
INSERT INTO `tplay_area` VALUES (224, '市辖区', '140201', '140200');
INSERT INTO `tplay_area` VALUES (225, '城区', '140202', '140200');
INSERT INTO `tplay_area` VALUES (226, '矿区', '140203', '140200');
INSERT INTO `tplay_area` VALUES (227, '南郊区', '140211', '140200');
INSERT INTO `tplay_area` VALUES (228, '新荣区', '140212', '140200');
INSERT INTO `tplay_area` VALUES (229, '阳高县', '140221', '140200');
INSERT INTO `tplay_area` VALUES (230, '天镇县', '140222', '140200');
INSERT INTO `tplay_area` VALUES (231, '广灵县', '140223', '140200');
INSERT INTO `tplay_area` VALUES (232, '灵丘县', '140224', '140200');
INSERT INTO `tplay_area` VALUES (233, '浑源县', '140225', '140200');
INSERT INTO `tplay_area` VALUES (234, '左云县', '140226', '140200');
INSERT INTO `tplay_area` VALUES (235, '大同县', '140227', '140200');
INSERT INTO `tplay_area` VALUES (236, '市辖区', '140301', '140300');
INSERT INTO `tplay_area` VALUES (237, '城区', '140302', '140300');
INSERT INTO `tplay_area` VALUES (238, '矿区', '140303', '140300');
INSERT INTO `tplay_area` VALUES (239, '郊区', '140311', '140300');
INSERT INTO `tplay_area` VALUES (240, '平定县', '140321', '140300');
INSERT INTO `tplay_area` VALUES (241, '盂县', '140322', '140300');
INSERT INTO `tplay_area` VALUES (242, '市辖区', '140401', '140400');
INSERT INTO `tplay_area` VALUES (243, '城区', '140402', '140400');
INSERT INTO `tplay_area` VALUES (244, '郊区', '140411', '140400');
INSERT INTO `tplay_area` VALUES (245, '长治县', '140421', '140400');
INSERT INTO `tplay_area` VALUES (246, '襄垣县', '140423', '140400');
INSERT INTO `tplay_area` VALUES (247, '屯留县', '140424', '140400');
INSERT INTO `tplay_area` VALUES (248, '平顺县', '140425', '140400');
INSERT INTO `tplay_area` VALUES (249, '黎城县', '140426', '140400');
INSERT INTO `tplay_area` VALUES (250, '壶关县', '140427', '140400');
INSERT INTO `tplay_area` VALUES (251, '长子县', '140428', '140400');
INSERT INTO `tplay_area` VALUES (252, '武乡县', '140429', '140400');
INSERT INTO `tplay_area` VALUES (253, '沁县', '140430', '140400');
INSERT INTO `tplay_area` VALUES (254, '沁源县', '140431', '140400');
INSERT INTO `tplay_area` VALUES (255, '潞城市', '140481', '140400');
INSERT INTO `tplay_area` VALUES (256, '市辖区', '140501', '140500');
INSERT INTO `tplay_area` VALUES (257, '城区', '140502', '140500');
INSERT INTO `tplay_area` VALUES (258, '沁水县', '140521', '140500');
INSERT INTO `tplay_area` VALUES (259, '阳城县', '140522', '140500');
INSERT INTO `tplay_area` VALUES (260, '陵川县', '140524', '140500');
INSERT INTO `tplay_area` VALUES (261, '泽州县', '140525', '140500');
INSERT INTO `tplay_area` VALUES (262, '高平市', '140581', '140500');
INSERT INTO `tplay_area` VALUES (263, '市辖区', '140601', '140600');
INSERT INTO `tplay_area` VALUES (264, '朔城区', '140602', '140600');
INSERT INTO `tplay_area` VALUES (265, '平鲁区', '140603', '140600');
INSERT INTO `tplay_area` VALUES (266, '山阴县', '140621', '140600');
INSERT INTO `tplay_area` VALUES (267, '应县', '140622', '140600');
INSERT INTO `tplay_area` VALUES (268, '右玉县', '140623', '140600');
INSERT INTO `tplay_area` VALUES (269, '怀仁县', '140624', '140600');
INSERT INTO `tplay_area` VALUES (270, '市辖区', '140701', '140700');
INSERT INTO `tplay_area` VALUES (271, '榆次区', '140702', '140700');
INSERT INTO `tplay_area` VALUES (272, '榆社县', '140721', '140700');
INSERT INTO `tplay_area` VALUES (273, '左权县', '140722', '140700');
INSERT INTO `tplay_area` VALUES (274, '和顺县', '140723', '140700');
INSERT INTO `tplay_area` VALUES (275, '昔阳县', '140724', '140700');
INSERT INTO `tplay_area` VALUES (276, '寿阳县', '140725', '140700');
INSERT INTO `tplay_area` VALUES (277, '太谷县', '140726', '140700');
INSERT INTO `tplay_area` VALUES (278, '祁县', '140727', '140700');
INSERT INTO `tplay_area` VALUES (279, '平遥县', '140728', '140700');
INSERT INTO `tplay_area` VALUES (280, '灵石县', '140729', '140700');
INSERT INTO `tplay_area` VALUES (281, '介休市', '140781', '140700');
INSERT INTO `tplay_area` VALUES (282, '市辖区', '140801', '140800');
INSERT INTO `tplay_area` VALUES (283, '盐湖区', '140802', '140800');
INSERT INTO `tplay_area` VALUES (284, '临猗县', '140821', '140800');
INSERT INTO `tplay_area` VALUES (285, '万荣县', '140822', '140800');
INSERT INTO `tplay_area` VALUES (286, '闻喜县', '140823', '140800');
INSERT INTO `tplay_area` VALUES (287, '稷山县', '140824', '140800');
INSERT INTO `tplay_area` VALUES (288, '新绛县', '140825', '140800');
INSERT INTO `tplay_area` VALUES (289, '绛县', '140826', '140800');
INSERT INTO `tplay_area` VALUES (290, '垣曲县', '140827', '140800');
INSERT INTO `tplay_area` VALUES (291, '夏县', '140828', '140800');
INSERT INTO `tplay_area` VALUES (292, '平陆县', '140829', '140800');
INSERT INTO `tplay_area` VALUES (293, '芮城县', '140830', '140800');
INSERT INTO `tplay_area` VALUES (294, '永济市', '140881', '140800');
INSERT INTO `tplay_area` VALUES (295, '河津市', '140882', '140800');
INSERT INTO `tplay_area` VALUES (296, '市辖区', '140901', '140900');
INSERT INTO `tplay_area` VALUES (297, '忻府区', '140902', '140900');
INSERT INTO `tplay_area` VALUES (298, '定襄县', '140921', '140900');
INSERT INTO `tplay_area` VALUES (299, '五台县', '140922', '140900');
INSERT INTO `tplay_area` VALUES (300, '代县', '140923', '140900');
INSERT INTO `tplay_area` VALUES (301, '繁峙县', '140924', '140900');
INSERT INTO `tplay_area` VALUES (302, '宁武县', '140925', '140900');
INSERT INTO `tplay_area` VALUES (303, '静乐县', '140926', '140900');
INSERT INTO `tplay_area` VALUES (304, '神池县', '140927', '140900');
INSERT INTO `tplay_area` VALUES (305, '五寨县', '140928', '140900');
INSERT INTO `tplay_area` VALUES (306, '岢岚县', '140929', '140900');
INSERT INTO `tplay_area` VALUES (307, '河曲县', '140930', '140900');
INSERT INTO `tplay_area` VALUES (308, '保德县', '140931', '140900');
INSERT INTO `tplay_area` VALUES (309, '偏关县', '140932', '140900');
INSERT INTO `tplay_area` VALUES (310, '原平市', '140981', '140900');
INSERT INTO `tplay_area` VALUES (311, '市辖区', '141001', '141000');
INSERT INTO `tplay_area` VALUES (312, '尧都区', '141002', '141000');
INSERT INTO `tplay_area` VALUES (313, '曲沃县', '141021', '141000');
INSERT INTO `tplay_area` VALUES (314, '翼城县', '141022', '141000');
INSERT INTO `tplay_area` VALUES (315, '襄汾县', '141023', '141000');
INSERT INTO `tplay_area` VALUES (316, '洪洞县', '141024', '141000');
INSERT INTO `tplay_area` VALUES (317, '古县', '141025', '141000');
INSERT INTO `tplay_area` VALUES (318, '安泽县', '141026', '141000');
INSERT INTO `tplay_area` VALUES (319, '浮山县', '141027', '141000');
INSERT INTO `tplay_area` VALUES (320, '吉县', '141028', '141000');
INSERT INTO `tplay_area` VALUES (321, '乡宁县', '141029', '141000');
INSERT INTO `tplay_area` VALUES (322, '大宁县', '141030', '141000');
INSERT INTO `tplay_area` VALUES (323, '隰县', '141031', '141000');
INSERT INTO `tplay_area` VALUES (324, '永和县', '141032', '141000');
INSERT INTO `tplay_area` VALUES (325, '蒲县', '141033', '141000');
INSERT INTO `tplay_area` VALUES (326, '汾西县', '141034', '141000');
INSERT INTO `tplay_area` VALUES (327, '侯马市', '141081', '141000');
INSERT INTO `tplay_area` VALUES (328, '霍州市', '141082', '141000');
INSERT INTO `tplay_area` VALUES (329, '市辖区', '141101', '141100');
INSERT INTO `tplay_area` VALUES (330, '离石区', '141102', '141100');
INSERT INTO `tplay_area` VALUES (331, '文水县', '141121', '141100');
INSERT INTO `tplay_area` VALUES (332, '交城县', '141122', '141100');
INSERT INTO `tplay_area` VALUES (333, '兴县', '141123', '141100');
INSERT INTO `tplay_area` VALUES (334, '临县', '141124', '141100');
INSERT INTO `tplay_area` VALUES (335, '柳林县', '141125', '141100');
INSERT INTO `tplay_area` VALUES (336, '石楼县', '141126', '141100');
INSERT INTO `tplay_area` VALUES (337, '岚县', '141127', '141100');
INSERT INTO `tplay_area` VALUES (338, '方山县', '141128', '141100');
INSERT INTO `tplay_area` VALUES (339, '中阳县', '141129', '141100');
INSERT INTO `tplay_area` VALUES (340, '交口县', '141130', '141100');
INSERT INTO `tplay_area` VALUES (341, '孝义市', '141181', '141100');
INSERT INTO `tplay_area` VALUES (342, '汾阳市', '141182', '141100');
INSERT INTO `tplay_area` VALUES (343, '市辖区', '150101', '150100');
INSERT INTO `tplay_area` VALUES (344, '新城区', '150102', '150100');
INSERT INTO `tplay_area` VALUES (345, '回民区', '150103', '150100');
INSERT INTO `tplay_area` VALUES (346, '玉泉区', '150104', '150100');
INSERT INTO `tplay_area` VALUES (347, '赛罕区', '150105', '150100');
INSERT INTO `tplay_area` VALUES (348, '土默特左旗', '150121', '150100');
INSERT INTO `tplay_area` VALUES (349, '托克托县', '150122', '150100');
INSERT INTO `tplay_area` VALUES (350, '和林格尔县', '150123', '150100');
INSERT INTO `tplay_area` VALUES (351, '清水河县', '150124', '150100');
INSERT INTO `tplay_area` VALUES (352, '武川县', '150125', '150100');
INSERT INTO `tplay_area` VALUES (353, '市辖区', '150201', '150200');
INSERT INTO `tplay_area` VALUES (354, '东河区', '150202', '150200');
INSERT INTO `tplay_area` VALUES (355, '昆都仑区', '150203', '150200');
INSERT INTO `tplay_area` VALUES (356, '青山区', '150204', '150200');
INSERT INTO `tplay_area` VALUES (357, '石拐区', '150205', '150200');
INSERT INTO `tplay_area` VALUES (358, '白云鄂博矿区', '150206', '150200');
INSERT INTO `tplay_area` VALUES (359, '九原区', '150207', '150200');
INSERT INTO `tplay_area` VALUES (360, '土默特右旗', '150221', '150200');
INSERT INTO `tplay_area` VALUES (361, '固阳县', '150222', '150200');
INSERT INTO `tplay_area` VALUES (362, '达尔罕茂明安联合旗', '150223', '150200');
INSERT INTO `tplay_area` VALUES (363, '市辖区', '150301', '150300');
INSERT INTO `tplay_area` VALUES (364, '海勃湾区', '150302', '150300');
INSERT INTO `tplay_area` VALUES (365, '海南区', '150303', '150300');
INSERT INTO `tplay_area` VALUES (366, '乌达区', '150304', '150300');
INSERT INTO `tplay_area` VALUES (367, '市辖区', '150401', '150400');
INSERT INTO `tplay_area` VALUES (368, '红山区', '150402', '150400');
INSERT INTO `tplay_area` VALUES (369, '元宝山区', '150403', '150400');
INSERT INTO `tplay_area` VALUES (370, '松山区', '150404', '150400');
INSERT INTO `tplay_area` VALUES (371, '阿鲁科尔沁旗', '150421', '150400');
INSERT INTO `tplay_area` VALUES (372, '巴林左旗', '150422', '150400');
INSERT INTO `tplay_area` VALUES (373, '巴林右旗', '150423', '150400');
INSERT INTO `tplay_area` VALUES (374, '林西县', '150424', '150400');
INSERT INTO `tplay_area` VALUES (375, '克什克腾旗', '150425', '150400');
INSERT INTO `tplay_area` VALUES (376, '翁牛特旗', '150426', '150400');
INSERT INTO `tplay_area` VALUES (377, '喀喇沁旗', '150428', '150400');
INSERT INTO `tplay_area` VALUES (378, '宁城县', '150429', '150400');
INSERT INTO `tplay_area` VALUES (379, '敖汉旗', '150430', '150400');
INSERT INTO `tplay_area` VALUES (380, '市辖区', '150501', '150500');
INSERT INTO `tplay_area` VALUES (381, '科尔沁区', '150502', '150500');
INSERT INTO `tplay_area` VALUES (382, '科尔沁左翼中旗', '150521', '150500');
INSERT INTO `tplay_area` VALUES (383, '科尔沁左翼后旗', '150522', '150500');
INSERT INTO `tplay_area` VALUES (384, '开鲁县', '150523', '150500');
INSERT INTO `tplay_area` VALUES (385, '库伦旗', '150524', '150500');
INSERT INTO `tplay_area` VALUES (386, '奈曼旗', '150525', '150500');
INSERT INTO `tplay_area` VALUES (387, '扎鲁特旗', '150526', '150500');
INSERT INTO `tplay_area` VALUES (388, '霍林郭勒市', '150581', '150500');
INSERT INTO `tplay_area` VALUES (389, '市辖区', '150601', '150600');
INSERT INTO `tplay_area` VALUES (390, '东胜区', '150602', '150600');
INSERT INTO `tplay_area` VALUES (391, '康巴什区', '150603', '150600');
INSERT INTO `tplay_area` VALUES (392, '达拉特旗', '150621', '150600');
INSERT INTO `tplay_area` VALUES (393, '准格尔旗', '150622', '150600');
INSERT INTO `tplay_area` VALUES (394, '鄂托克前旗', '150623', '150600');
INSERT INTO `tplay_area` VALUES (395, '鄂托克旗', '150624', '150600');
INSERT INTO `tplay_area` VALUES (396, '杭锦旗', '150625', '150600');
INSERT INTO `tplay_area` VALUES (397, '乌审旗', '150626', '150600');
INSERT INTO `tplay_area` VALUES (398, '伊金霍洛旗', '150627', '150600');
INSERT INTO `tplay_area` VALUES (399, '市辖区', '150701', '150700');
INSERT INTO `tplay_area` VALUES (400, '海拉尔区', '150702', '150700');
INSERT INTO `tplay_area` VALUES (401, '扎赉诺尔区', '150703', '150700');
INSERT INTO `tplay_area` VALUES (402, '阿荣旗', '150721', '150700');
INSERT INTO `tplay_area` VALUES (403, '莫力达瓦达斡尔族自治旗', '150722', '150700');
INSERT INTO `tplay_area` VALUES (404, '鄂伦春自治旗', '150723', '150700');
INSERT INTO `tplay_area` VALUES (405, '鄂温克族自治旗', '150724', '150700');
INSERT INTO `tplay_area` VALUES (406, '陈巴尔虎旗', '150725', '150700');
INSERT INTO `tplay_area` VALUES (407, '新巴尔虎左旗', '150726', '150700');
INSERT INTO `tplay_area` VALUES (408, '新巴尔虎右旗', '150727', '150700');
INSERT INTO `tplay_area` VALUES (409, '满洲里市', '150781', '150700');
INSERT INTO `tplay_area` VALUES (410, '牙克石市', '150782', '150700');
INSERT INTO `tplay_area` VALUES (411, '扎兰屯市', '150783', '150700');
INSERT INTO `tplay_area` VALUES (412, '额尔古纳市', '150784', '150700');
INSERT INTO `tplay_area` VALUES (413, '根河市', '150785', '150700');
INSERT INTO `tplay_area` VALUES (414, '市辖区', '150801', '150800');
INSERT INTO `tplay_area` VALUES (415, '临河区', '150802', '150800');
INSERT INTO `tplay_area` VALUES (416, '五原县', '150821', '150800');
INSERT INTO `tplay_area` VALUES (417, '磴口县', '150822', '150800');
INSERT INTO `tplay_area` VALUES (418, '乌拉特前旗', '150823', '150800');
INSERT INTO `tplay_area` VALUES (419, '乌拉特中旗', '150824', '150800');
INSERT INTO `tplay_area` VALUES (420, '乌拉特后旗', '150825', '150800');
INSERT INTO `tplay_area` VALUES (421, '杭锦后旗', '150826', '150800');
INSERT INTO `tplay_area` VALUES (422, '市辖区', '150901', '150900');
INSERT INTO `tplay_area` VALUES (423, '集宁区', '150902', '150900');
INSERT INTO `tplay_area` VALUES (424, '卓资县', '150921', '150900');
INSERT INTO `tplay_area` VALUES (425, '化德县', '150922', '150900');
INSERT INTO `tplay_area` VALUES (426, '商都县', '150923', '150900');
INSERT INTO `tplay_area` VALUES (427, '兴和县', '150924', '150900');
INSERT INTO `tplay_area` VALUES (428, '凉城县', '150925', '150900');
INSERT INTO `tplay_area` VALUES (429, '察哈尔右翼前旗', '150926', '150900');
INSERT INTO `tplay_area` VALUES (430, '察哈尔右翼中旗', '150927', '150900');
INSERT INTO `tplay_area` VALUES (431, '察哈尔右翼后旗', '150928', '150900');
INSERT INTO `tplay_area` VALUES (432, '四子王旗', '150929', '150900');
INSERT INTO `tplay_area` VALUES (433, '丰镇市', '150981', '150900');
INSERT INTO `tplay_area` VALUES (434, '乌兰浩特市', '152201', '152200');
INSERT INTO `tplay_area` VALUES (435, '阿尔山市', '152202', '152200');
INSERT INTO `tplay_area` VALUES (436, '科尔沁右翼前旗', '152221', '152200');
INSERT INTO `tplay_area` VALUES (437, '科尔沁右翼中旗', '152222', '152200');
INSERT INTO `tplay_area` VALUES (438, '扎赉特旗', '152223', '152200');
INSERT INTO `tplay_area` VALUES (439, '突泉县', '152224', '152200');
INSERT INTO `tplay_area` VALUES (440, '二连浩特市', '152501', '152500');
INSERT INTO `tplay_area` VALUES (441, '锡林浩特市', '152502', '152500');
INSERT INTO `tplay_area` VALUES (442, '阿巴嘎旗', '152522', '152500');
INSERT INTO `tplay_area` VALUES (443, '苏尼特左旗', '152523', '152500');
INSERT INTO `tplay_area` VALUES (444, '苏尼特右旗', '152524', '152500');
INSERT INTO `tplay_area` VALUES (445, '东乌珠穆沁旗', '152525', '152500');
INSERT INTO `tplay_area` VALUES (446, '西乌珠穆沁旗', '152526', '152500');
INSERT INTO `tplay_area` VALUES (447, '太仆寺旗', '152527', '152500');
INSERT INTO `tplay_area` VALUES (448, '镶黄旗', '152528', '152500');
INSERT INTO `tplay_area` VALUES (449, '正镶白旗', '152529', '152500');
INSERT INTO `tplay_area` VALUES (450, '正蓝旗', '152530', '152500');
INSERT INTO `tplay_area` VALUES (451, '多伦县', '152531', '152500');
INSERT INTO `tplay_area` VALUES (452, '阿拉善左旗', '152921', '152900');
INSERT INTO `tplay_area` VALUES (453, '阿拉善右旗', '152922', '152900');
INSERT INTO `tplay_area` VALUES (454, '额济纳旗', '152923', '152900');
INSERT INTO `tplay_area` VALUES (455, '市辖区', '210101', '210100');
INSERT INTO `tplay_area` VALUES (456, '和平区', '210102', '210100');
INSERT INTO `tplay_area` VALUES (457, '沈河区', '210103', '210100');
INSERT INTO `tplay_area` VALUES (458, '大东区', '210104', '210100');
INSERT INTO `tplay_area` VALUES (459, '皇姑区', '210105', '210100');
INSERT INTO `tplay_area` VALUES (460, '铁西区', '210106', '210100');
INSERT INTO `tplay_area` VALUES (461, '苏家屯区', '210111', '210100');
INSERT INTO `tplay_area` VALUES (462, '浑南区', '210112', '210100');
INSERT INTO `tplay_area` VALUES (463, '沈北新区', '210113', '210100');
INSERT INTO `tplay_area` VALUES (464, '于洪区', '210114', '210100');
INSERT INTO `tplay_area` VALUES (465, '辽中区', '210115', '210100');
INSERT INTO `tplay_area` VALUES (466, '康平县', '210123', '210100');
INSERT INTO `tplay_area` VALUES (467, '法库县', '210124', '210100');
INSERT INTO `tplay_area` VALUES (468, '新民市', '210181', '210100');
INSERT INTO `tplay_area` VALUES (469, '市辖区', '210201', '210200');
INSERT INTO `tplay_area` VALUES (470, '中山区', '210202', '210200');
INSERT INTO `tplay_area` VALUES (471, '西岗区', '210203', '210200');
INSERT INTO `tplay_area` VALUES (472, '沙河口区', '210204', '210200');
INSERT INTO `tplay_area` VALUES (473, '甘井子区', '210211', '210200');
INSERT INTO `tplay_area` VALUES (474, '旅顺口区', '210212', '210200');
INSERT INTO `tplay_area` VALUES (475, '金州区', '210213', '210200');
INSERT INTO `tplay_area` VALUES (476, '普兰店区', '210214', '210200');
INSERT INTO `tplay_area` VALUES (477, '长海县', '210224', '210200');
INSERT INTO `tplay_area` VALUES (478, '瓦房店市', '210281', '210200');
INSERT INTO `tplay_area` VALUES (479, '庄河市', '210283', '210200');
INSERT INTO `tplay_area` VALUES (480, '市辖区', '210301', '210300');
INSERT INTO `tplay_area` VALUES (481, '铁东区', '210302', '210300');
INSERT INTO `tplay_area` VALUES (482, '铁西区', '210303', '210300');
INSERT INTO `tplay_area` VALUES (483, '立山区', '210304', '210300');
INSERT INTO `tplay_area` VALUES (484, '千山区', '210311', '210300');
INSERT INTO `tplay_area` VALUES (485, '台安县', '210321', '210300');
INSERT INTO `tplay_area` VALUES (486, '岫岩满族自治县', '210323', '210300');
INSERT INTO `tplay_area` VALUES (487, '海城市', '210381', '210300');
INSERT INTO `tplay_area` VALUES (488, '市辖区', '210401', '210400');
INSERT INTO `tplay_area` VALUES (489, '新抚区', '210402', '210400');
INSERT INTO `tplay_area` VALUES (490, '东洲区', '210403', '210400');
INSERT INTO `tplay_area` VALUES (491, '望花区', '210404', '210400');
INSERT INTO `tplay_area` VALUES (492, '顺城区', '210411', '210400');
INSERT INTO `tplay_area` VALUES (493, '抚顺县', '210421', '210400');
INSERT INTO `tplay_area` VALUES (494, '新宾满族自治县', '210422', '210400');
INSERT INTO `tplay_area` VALUES (495, '清原满族自治县', '210423', '210400');
INSERT INTO `tplay_area` VALUES (496, '市辖区', '210501', '210500');
INSERT INTO `tplay_area` VALUES (497, '平山区', '210502', '210500');
INSERT INTO `tplay_area` VALUES (498, '溪湖区', '210503', '210500');
INSERT INTO `tplay_area` VALUES (499, '明山区', '210504', '210500');
INSERT INTO `tplay_area` VALUES (500, '南芬区', '210505', '210500');
INSERT INTO `tplay_area` VALUES (501, '本溪满族自治县', '210521', '210500');
INSERT INTO `tplay_area` VALUES (502, '桓仁满族自治县', '210522', '210500');
INSERT INTO `tplay_area` VALUES (503, '市辖区', '210601', '210600');
INSERT INTO `tplay_area` VALUES (504, '元宝区', '210602', '210600');
INSERT INTO `tplay_area` VALUES (505, '振兴区', '210603', '210600');
INSERT INTO `tplay_area` VALUES (506, '振安区', '210604', '210600');
INSERT INTO `tplay_area` VALUES (507, '宽甸满族自治县', '210624', '210600');
INSERT INTO `tplay_area` VALUES (508, '东港市', '210681', '210600');
INSERT INTO `tplay_area` VALUES (509, '凤城市', '210682', '210600');
INSERT INTO `tplay_area` VALUES (510, '市辖区', '210701', '210700');
INSERT INTO `tplay_area` VALUES (511, '古塔区', '210702', '210700');
INSERT INTO `tplay_area` VALUES (512, '凌河区', '210703', '210700');
INSERT INTO `tplay_area` VALUES (513, '太和区', '210711', '210700');
INSERT INTO `tplay_area` VALUES (514, '黑山县', '210726', '210700');
INSERT INTO `tplay_area` VALUES (515, '义县', '210727', '210700');
INSERT INTO `tplay_area` VALUES (516, '凌海市', '210781', '210700');
INSERT INTO `tplay_area` VALUES (517, '北镇市', '210782', '210700');
INSERT INTO `tplay_area` VALUES (518, '市辖区', '210801', '210800');
INSERT INTO `tplay_area` VALUES (519, '站前区', '210802', '210800');
INSERT INTO `tplay_area` VALUES (520, '西市区', '210803', '210800');
INSERT INTO `tplay_area` VALUES (521, '鲅鱼圈区', '210804', '210800');
INSERT INTO `tplay_area` VALUES (522, '老边区', '210811', '210800');
INSERT INTO `tplay_area` VALUES (523, '盖州市', '210881', '210800');
INSERT INTO `tplay_area` VALUES (524, '大石桥市', '210882', '210800');
INSERT INTO `tplay_area` VALUES (525, '市辖区', '210901', '210900');
INSERT INTO `tplay_area` VALUES (526, '海州区', '210902', '210900');
INSERT INTO `tplay_area` VALUES (527, '新邱区', '210903', '210900');
INSERT INTO `tplay_area` VALUES (528, '太平区', '210904', '210900');
INSERT INTO `tplay_area` VALUES (529, '清河门区', '210905', '210900');
INSERT INTO `tplay_area` VALUES (530, '细河区', '210911', '210900');
INSERT INTO `tplay_area` VALUES (531, '阜新蒙古族自治县', '210921', '210900');
INSERT INTO `tplay_area` VALUES (532, '彰武县', '210922', '210900');
INSERT INTO `tplay_area` VALUES (533, '市辖区', '211001', '211000');
INSERT INTO `tplay_area` VALUES (534, '白塔区', '211002', '211000');
INSERT INTO `tplay_area` VALUES (535, '文圣区', '211003', '211000');
INSERT INTO `tplay_area` VALUES (536, '宏伟区', '211004', '211000');
INSERT INTO `tplay_area` VALUES (537, '弓长岭区', '211005', '211000');
INSERT INTO `tplay_area` VALUES (538, '太子河区', '211011', '211000');
INSERT INTO `tplay_area` VALUES (539, '辽阳县', '211021', '211000');
INSERT INTO `tplay_area` VALUES (540, '灯塔市', '211081', '211000');
INSERT INTO `tplay_area` VALUES (541, '市辖区', '211101', '211100');
INSERT INTO `tplay_area` VALUES (542, '双台子区', '211102', '211100');
INSERT INTO `tplay_area` VALUES (543, '兴隆台区', '211103', '211100');
INSERT INTO `tplay_area` VALUES (544, '大洼区', '211104', '211100');
INSERT INTO `tplay_area` VALUES (545, '盘山县', '211122', '211100');
INSERT INTO `tplay_area` VALUES (546, '市辖区', '211201', '211200');
INSERT INTO `tplay_area` VALUES (547, '银州区', '211202', '211200');
INSERT INTO `tplay_area` VALUES (548, '清河区', '211204', '211200');
INSERT INTO `tplay_area` VALUES (549, '铁岭县', '211221', '211200');
INSERT INTO `tplay_area` VALUES (550, '西丰县', '211223', '211200');
INSERT INTO `tplay_area` VALUES (551, '昌图县', '211224', '211200');
INSERT INTO `tplay_area` VALUES (552, '调兵山市', '211281', '211200');
INSERT INTO `tplay_area` VALUES (553, '开原市', '211282', '211200');
INSERT INTO `tplay_area` VALUES (554, '市辖区', '211301', '211300');
INSERT INTO `tplay_area` VALUES (555, '双塔区', '211302', '211300');
INSERT INTO `tplay_area` VALUES (556, '龙城区', '211303', '211300');
INSERT INTO `tplay_area` VALUES (557, '朝阳县', '211321', '211300');
INSERT INTO `tplay_area` VALUES (558, '建平县', '211322', '211300');
INSERT INTO `tplay_area` VALUES (559, '喀喇沁左翼蒙古族自治县', '211324', '211300');
INSERT INTO `tplay_area` VALUES (560, '北票市', '211381', '211300');
INSERT INTO `tplay_area` VALUES (561, '凌源市', '211382', '211300');
INSERT INTO `tplay_area` VALUES (562, '市辖区', '211401', '211400');
INSERT INTO `tplay_area` VALUES (563, '连山区', '211402', '211400');
INSERT INTO `tplay_area` VALUES (564, '龙港区', '211403', '211400');
INSERT INTO `tplay_area` VALUES (565, '南票区', '211404', '211400');
INSERT INTO `tplay_area` VALUES (566, '绥中县', '211421', '211400');
INSERT INTO `tplay_area` VALUES (567, '建昌县', '211422', '211400');
INSERT INTO `tplay_area` VALUES (568, '兴城市', '211481', '211400');
INSERT INTO `tplay_area` VALUES (569, '市辖区', '220101', '220100');
INSERT INTO `tplay_area` VALUES (570, '南关区', '220102', '220100');
INSERT INTO `tplay_area` VALUES (571, '宽城区', '220103', '220100');
INSERT INTO `tplay_area` VALUES (572, '朝阳区', '220104', '220100');
INSERT INTO `tplay_area` VALUES (573, '二道区', '220105', '220100');
INSERT INTO `tplay_area` VALUES (574, '绿园区', '220106', '220100');
INSERT INTO `tplay_area` VALUES (575, '双阳区', '220112', '220100');
INSERT INTO `tplay_area` VALUES (576, '九台区', '220113', '220100');
INSERT INTO `tplay_area` VALUES (577, '农安县', '220122', '220100');
INSERT INTO `tplay_area` VALUES (578, '榆树市', '220182', '220100');
INSERT INTO `tplay_area` VALUES (579, '德惠市', '220183', '220100');
INSERT INTO `tplay_area` VALUES (580, '市辖区', '220201', '220200');
INSERT INTO `tplay_area` VALUES (581, '昌邑区', '220202', '220200');
INSERT INTO `tplay_area` VALUES (582, '龙潭区', '220203', '220200');
INSERT INTO `tplay_area` VALUES (583, '船营区', '220204', '220200');
INSERT INTO `tplay_area` VALUES (584, '丰满区', '220211', '220200');
INSERT INTO `tplay_area` VALUES (585, '永吉县', '220221', '220200');
INSERT INTO `tplay_area` VALUES (586, '蛟河市', '220281', '220200');
INSERT INTO `tplay_area` VALUES (587, '桦甸市', '220282', '220200');
INSERT INTO `tplay_area` VALUES (588, '舒兰市', '220283', '220200');
INSERT INTO `tplay_area` VALUES (589, '磐石市', '220284', '220200');
INSERT INTO `tplay_area` VALUES (590, '市辖区', '220301', '220300');
INSERT INTO `tplay_area` VALUES (591, '铁西区', '220302', '220300');
INSERT INTO `tplay_area` VALUES (592, '铁东区', '220303', '220300');
INSERT INTO `tplay_area` VALUES (593, '梨树县', '220322', '220300');
INSERT INTO `tplay_area` VALUES (594, '伊通满族自治县', '220323', '220300');
INSERT INTO `tplay_area` VALUES (595, '公主岭市', '220381', '220300');
INSERT INTO `tplay_area` VALUES (596, '双辽市', '220382', '220300');
INSERT INTO `tplay_area` VALUES (597, '市辖区', '220401', '220400');
INSERT INTO `tplay_area` VALUES (598, '龙山区', '220402', '220400');
INSERT INTO `tplay_area` VALUES (599, '西安区', '220403', '220400');
INSERT INTO `tplay_area` VALUES (600, '东丰县', '220421', '220400');
INSERT INTO `tplay_area` VALUES (601, '东辽县', '220422', '220400');
INSERT INTO `tplay_area` VALUES (602, '市辖区', '220501', '220500');
INSERT INTO `tplay_area` VALUES (603, '东昌区', '220502', '220500');
INSERT INTO `tplay_area` VALUES (604, '二道江区', '220503', '220500');
INSERT INTO `tplay_area` VALUES (605, '通化县', '220521', '220500');
INSERT INTO `tplay_area` VALUES (606, '辉南县', '220523', '220500');
INSERT INTO `tplay_area` VALUES (607, '柳河县', '220524', '220500');
INSERT INTO `tplay_area` VALUES (608, '梅河口市', '220581', '220500');
INSERT INTO `tplay_area` VALUES (609, '集安市', '220582', '220500');
INSERT INTO `tplay_area` VALUES (610, '市辖区', '220601', '220600');
INSERT INTO `tplay_area` VALUES (611, '浑江区', '220602', '220600');
INSERT INTO `tplay_area` VALUES (612, '江源区', '220605', '220600');
INSERT INTO `tplay_area` VALUES (613, '抚松县', '220621', '220600');
INSERT INTO `tplay_area` VALUES (614, '靖宇县', '220622', '220600');
INSERT INTO `tplay_area` VALUES (615, '长白朝鲜族自治县', '220623', '220600');
INSERT INTO `tplay_area` VALUES (616, '临江市', '220681', '220600');
INSERT INTO `tplay_area` VALUES (617, '市辖区', '220701', '220700');
INSERT INTO `tplay_area` VALUES (618, '宁江区', '220702', '220700');
INSERT INTO `tplay_area` VALUES (619, '前郭尔罗斯蒙古族自治县', '220721', '220700');
INSERT INTO `tplay_area` VALUES (620, '长岭县', '220722', '220700');
INSERT INTO `tplay_area` VALUES (621, '乾安县', '220723', '220700');
INSERT INTO `tplay_area` VALUES (622, '扶余市', '220781', '220700');
INSERT INTO `tplay_area` VALUES (623, '市辖区', '220801', '220800');
INSERT INTO `tplay_area` VALUES (624, '洮北区', '220802', '220800');
INSERT INTO `tplay_area` VALUES (625, '镇赉县', '220821', '220800');
INSERT INTO `tplay_area` VALUES (626, '通榆县', '220822', '220800');
INSERT INTO `tplay_area` VALUES (627, '洮南市', '220881', '220800');
INSERT INTO `tplay_area` VALUES (628, '大安市', '220882', '220800');
INSERT INTO `tplay_area` VALUES (629, '延吉市', '222401', '222400');
INSERT INTO `tplay_area` VALUES (630, '图们市', '222402', '222400');
INSERT INTO `tplay_area` VALUES (631, '敦化市', '222403', '222400');
INSERT INTO `tplay_area` VALUES (632, '珲春市', '222404', '222400');
INSERT INTO `tplay_area` VALUES (633, '龙井市', '222405', '222400');
INSERT INTO `tplay_area` VALUES (634, '和龙市', '222406', '222400');
INSERT INTO `tplay_area` VALUES (635, '汪清县', '222424', '222400');
INSERT INTO `tplay_area` VALUES (636, '安图县', '222426', '222400');
INSERT INTO `tplay_area` VALUES (637, '市辖区', '230101', '230100');
INSERT INTO `tplay_area` VALUES (638, '道里区', '230102', '230100');
INSERT INTO `tplay_area` VALUES (639, '南岗区', '230103', '230100');
INSERT INTO `tplay_area` VALUES (640, '道外区', '230104', '230100');
INSERT INTO `tplay_area` VALUES (641, '平房区', '230108', '230100');
INSERT INTO `tplay_area` VALUES (642, '松北区', '230109', '230100');
INSERT INTO `tplay_area` VALUES (643, '香坊区', '230110', '230100');
INSERT INTO `tplay_area` VALUES (644, '呼兰区', '230111', '230100');
INSERT INTO `tplay_area` VALUES (645, '阿城区', '230112', '230100');
INSERT INTO `tplay_area` VALUES (646, '双城区', '230113', '230100');
INSERT INTO `tplay_area` VALUES (647, '依兰县', '230123', '230100');
INSERT INTO `tplay_area` VALUES (648, '方正县', '230124', '230100');
INSERT INTO `tplay_area` VALUES (649, '宾县', '230125', '230100');
INSERT INTO `tplay_area` VALUES (650, '巴彦县', '230126', '230100');
INSERT INTO `tplay_area` VALUES (651, '木兰县', '230127', '230100');
INSERT INTO `tplay_area` VALUES (652, '通河县', '230128', '230100');
INSERT INTO `tplay_area` VALUES (653, '延寿县', '230129', '230100');
INSERT INTO `tplay_area` VALUES (654, '尚志市', '230183', '230100');
INSERT INTO `tplay_area` VALUES (655, '五常市', '230184', '230100');
INSERT INTO `tplay_area` VALUES (656, '市辖区', '230201', '230200');
INSERT INTO `tplay_area` VALUES (657, '龙沙区', '230202', '230200');
INSERT INTO `tplay_area` VALUES (658, '建华区', '230203', '230200');
INSERT INTO `tplay_area` VALUES (659, '铁锋区', '230204', '230200');
INSERT INTO `tplay_area` VALUES (660, '昂昂溪区', '230205', '230200');
INSERT INTO `tplay_area` VALUES (661, '富拉尔基区', '230206', '230200');
INSERT INTO `tplay_area` VALUES (662, '碾子山区', '230207', '230200');
INSERT INTO `tplay_area` VALUES (663, '梅里斯达斡尔族区', '230208', '230200');
INSERT INTO `tplay_area` VALUES (664, '龙江县', '230221', '230200');
INSERT INTO `tplay_area` VALUES (665, '依安县', '230223', '230200');
INSERT INTO `tplay_area` VALUES (666, '泰来县', '230224', '230200');
INSERT INTO `tplay_area` VALUES (667, '甘南县', '230225', '230200');
INSERT INTO `tplay_area` VALUES (668, '富裕县', '230227', '230200');
INSERT INTO `tplay_area` VALUES (669, '克山县', '230229', '230200');
INSERT INTO `tplay_area` VALUES (670, '克东县', '230230', '230200');
INSERT INTO `tplay_area` VALUES (671, '拜泉县', '230231', '230200');
INSERT INTO `tplay_area` VALUES (672, '讷河市', '230281', '230200');
INSERT INTO `tplay_area` VALUES (673, '市辖区', '230301', '230300');
INSERT INTO `tplay_area` VALUES (674, '鸡冠区', '230302', '230300');
INSERT INTO `tplay_area` VALUES (675, '恒山区', '230303', '230300');
INSERT INTO `tplay_area` VALUES (676, '滴道区', '230304', '230300');
INSERT INTO `tplay_area` VALUES (677, '梨树区', '230305', '230300');
INSERT INTO `tplay_area` VALUES (678, '城子河区', '230306', '230300');
INSERT INTO `tplay_area` VALUES (679, '麻山区', '230307', '230300');
INSERT INTO `tplay_area` VALUES (680, '鸡东县', '230321', '230300');
INSERT INTO `tplay_area` VALUES (681, '虎林市', '230381', '230300');
INSERT INTO `tplay_area` VALUES (682, '密山市', '230382', '230300');
INSERT INTO `tplay_area` VALUES (683, '市辖区', '230401', '230400');
INSERT INTO `tplay_area` VALUES (684, '向阳区', '230402', '230400');
INSERT INTO `tplay_area` VALUES (685, '工农区', '230403', '230400');
INSERT INTO `tplay_area` VALUES (686, '南山区', '230404', '230400');
INSERT INTO `tplay_area` VALUES (687, '兴安区', '230405', '230400');
INSERT INTO `tplay_area` VALUES (688, '东山区', '230406', '230400');
INSERT INTO `tplay_area` VALUES (689, '兴山区', '230407', '230400');
INSERT INTO `tplay_area` VALUES (690, '萝北县', '230421', '230400');
INSERT INTO `tplay_area` VALUES (691, '绥滨县', '230422', '230400');
INSERT INTO `tplay_area` VALUES (692, '市辖区', '230501', '230500');
INSERT INTO `tplay_area` VALUES (693, '尖山区', '230502', '230500');
INSERT INTO `tplay_area` VALUES (694, '岭东区', '230503', '230500');
INSERT INTO `tplay_area` VALUES (695, '四方台区', '230505', '230500');
INSERT INTO `tplay_area` VALUES (696, '宝山区', '230506', '230500');
INSERT INTO `tplay_area` VALUES (697, '集贤县', '230521', '230500');
INSERT INTO `tplay_area` VALUES (698, '友谊县', '230522', '230500');
INSERT INTO `tplay_area` VALUES (699, '宝清县', '230523', '230500');
INSERT INTO `tplay_area` VALUES (700, '饶河县', '230524', '230500');
INSERT INTO `tplay_area` VALUES (701, '市辖区', '230601', '230600');
INSERT INTO `tplay_area` VALUES (702, '萨尔图区', '230602', '230600');
INSERT INTO `tplay_area` VALUES (703, '龙凤区', '230603', '230600');
INSERT INTO `tplay_area` VALUES (704, '让胡路区', '230604', '230600');
INSERT INTO `tplay_area` VALUES (705, '红岗区', '230605', '230600');
INSERT INTO `tplay_area` VALUES (706, '大同区', '230606', '230600');
INSERT INTO `tplay_area` VALUES (707, '肇州县', '230621', '230600');
INSERT INTO `tplay_area` VALUES (708, '肇源县', '230622', '230600');
INSERT INTO `tplay_area` VALUES (709, '林甸县', '230623', '230600');
INSERT INTO `tplay_area` VALUES (710, '杜尔伯特蒙古族自治县', '230624', '230600');
INSERT INTO `tplay_area` VALUES (711, '市辖区', '230701', '230700');
INSERT INTO `tplay_area` VALUES (712, '伊春区', '230702', '230700');
INSERT INTO `tplay_area` VALUES (713, '南岔区', '230703', '230700');
INSERT INTO `tplay_area` VALUES (714, '友好区', '230704', '230700');
INSERT INTO `tplay_area` VALUES (715, '西林区', '230705', '230700');
INSERT INTO `tplay_area` VALUES (716, '翠峦区', '230706', '230700');
INSERT INTO `tplay_area` VALUES (717, '新青区', '230707', '230700');
INSERT INTO `tplay_area` VALUES (718, '美溪区', '230708', '230700');
INSERT INTO `tplay_area` VALUES (719, '金山屯区', '230709', '230700');
INSERT INTO `tplay_area` VALUES (720, '五营区', '230710', '230700');
INSERT INTO `tplay_area` VALUES (721, '乌马河区', '230711', '230700');
INSERT INTO `tplay_area` VALUES (722, '汤旺河区', '230712', '230700');
INSERT INTO `tplay_area` VALUES (723, '带岭区', '230713', '230700');
INSERT INTO `tplay_area` VALUES (724, '乌伊岭区', '230714', '230700');
INSERT INTO `tplay_area` VALUES (725, '红星区', '230715', '230700');
INSERT INTO `tplay_area` VALUES (726, '上甘岭区', '230716', '230700');
INSERT INTO `tplay_area` VALUES (727, '嘉荫县', '230722', '230700');
INSERT INTO `tplay_area` VALUES (728, '铁力市', '230781', '230700');
INSERT INTO `tplay_area` VALUES (729, '市辖区', '230801', '230800');
INSERT INTO `tplay_area` VALUES (730, '向阳区', '230803', '230800');
INSERT INTO `tplay_area` VALUES (731, '前进区', '230804', '230800');
INSERT INTO `tplay_area` VALUES (732, '东风区', '230805', '230800');
INSERT INTO `tplay_area` VALUES (733, '郊区', '230811', '230800');
INSERT INTO `tplay_area` VALUES (734, '桦南县', '230822', '230800');
INSERT INTO `tplay_area` VALUES (735, '桦川县', '230826', '230800');
INSERT INTO `tplay_area` VALUES (736, '汤原县', '230828', '230800');
INSERT INTO `tplay_area` VALUES (737, '同江市', '230881', '230800');
INSERT INTO `tplay_area` VALUES (738, '富锦市', '230882', '230800');
INSERT INTO `tplay_area` VALUES (739, '抚远市', '230883', '230800');
INSERT INTO `tplay_area` VALUES (740, '市辖区', '230901', '230900');
INSERT INTO `tplay_area` VALUES (741, '新兴区', '230902', '230900');
INSERT INTO `tplay_area` VALUES (742, '桃山区', '230903', '230900');
INSERT INTO `tplay_area` VALUES (743, '茄子河区', '230904', '230900');
INSERT INTO `tplay_area` VALUES (744, '勃利县', '230921', '230900');
INSERT INTO `tplay_area` VALUES (745, '市辖区', '231001', '231000');
INSERT INTO `tplay_area` VALUES (746, '东安区', '231002', '231000');
INSERT INTO `tplay_area` VALUES (747, '阳明区', '231003', '231000');
INSERT INTO `tplay_area` VALUES (748, '爱民区', '231004', '231000');
INSERT INTO `tplay_area` VALUES (749, '西安区', '231005', '231000');
INSERT INTO `tplay_area` VALUES (750, '林口县', '231025', '231000');
INSERT INTO `tplay_area` VALUES (751, '绥芬河市', '231081', '231000');
INSERT INTO `tplay_area` VALUES (752, '海林市', '231083', '231000');
INSERT INTO `tplay_area` VALUES (753, '宁安市', '231084', '231000');
INSERT INTO `tplay_area` VALUES (754, '穆棱市', '231085', '231000');
INSERT INTO `tplay_area` VALUES (755, '东宁市', '231086', '231000');
INSERT INTO `tplay_area` VALUES (756, '市辖区', '231101', '231100');
INSERT INTO `tplay_area` VALUES (757, '爱辉区', '231102', '231100');
INSERT INTO `tplay_area` VALUES (758, '嫩江县', '231121', '231100');
INSERT INTO `tplay_area` VALUES (759, '逊克县', '231123', '231100');
INSERT INTO `tplay_area` VALUES (760, '孙吴县', '231124', '231100');
INSERT INTO `tplay_area` VALUES (761, '北安市', '231181', '231100');
INSERT INTO `tplay_area` VALUES (762, '五大连池市', '231182', '231100');
INSERT INTO `tplay_area` VALUES (763, '市辖区', '231201', '231200');
INSERT INTO `tplay_area` VALUES (764, '北林区', '231202', '231200');
INSERT INTO `tplay_area` VALUES (765, '望奎县', '231221', '231200');
INSERT INTO `tplay_area` VALUES (766, '兰西县', '231222', '231200');
INSERT INTO `tplay_area` VALUES (767, '青冈县', '231223', '231200');
INSERT INTO `tplay_area` VALUES (768, '庆安县', '231224', '231200');
INSERT INTO `tplay_area` VALUES (769, '明水县', '231225', '231200');
INSERT INTO `tplay_area` VALUES (770, '绥棱县', '231226', '231200');
INSERT INTO `tplay_area` VALUES (771, '安达市', '231281', '231200');
INSERT INTO `tplay_area` VALUES (772, '肇东市', '231282', '231200');
INSERT INTO `tplay_area` VALUES (773, '海伦市', '231283', '231200');
INSERT INTO `tplay_area` VALUES (774, '呼玛县', '232721', '232700');
INSERT INTO `tplay_area` VALUES (775, '塔河县', '232722', '232700');
INSERT INTO `tplay_area` VALUES (776, '漠河县', '232723', '232700');
INSERT INTO `tplay_area` VALUES (777, '黄浦区', '310101', '310100');
INSERT INTO `tplay_area` VALUES (778, '徐汇区', '310104', '310100');
INSERT INTO `tplay_area` VALUES (779, '长宁区', '310105', '310100');
INSERT INTO `tplay_area` VALUES (780, '静安区', '310106', '310100');
INSERT INTO `tplay_area` VALUES (781, '普陀区', '310107', '310100');
INSERT INTO `tplay_area` VALUES (782, '虹口区', '310109', '310100');
INSERT INTO `tplay_area` VALUES (783, '杨浦区', '310110', '310100');
INSERT INTO `tplay_area` VALUES (784, '闵行区', '310112', '310100');
INSERT INTO `tplay_area` VALUES (785, '宝山区', '310113', '310100');
INSERT INTO `tplay_area` VALUES (786, '嘉定区', '310114', '310100');
INSERT INTO `tplay_area` VALUES (787, '浦东新区', '310115', '310100');
INSERT INTO `tplay_area` VALUES (788, '金山区', '310116', '310100');
INSERT INTO `tplay_area` VALUES (789, '松江区', '310117', '310100');
INSERT INTO `tplay_area` VALUES (790, '青浦区', '310118', '310100');
INSERT INTO `tplay_area` VALUES (791, '奉贤区', '310120', '310100');
INSERT INTO `tplay_area` VALUES (792, '崇明区', '310151', '310100');
INSERT INTO `tplay_area` VALUES (793, '市辖区', '320101', '320100');
INSERT INTO `tplay_area` VALUES (794, '玄武区', '320102', '320100');
INSERT INTO `tplay_area` VALUES (795, '秦淮区', '320104', '320100');
INSERT INTO `tplay_area` VALUES (796, '建邺区', '320105', '320100');
INSERT INTO `tplay_area` VALUES (797, '鼓楼区', '320106', '320100');
INSERT INTO `tplay_area` VALUES (798, '浦口区', '320111', '320100');
INSERT INTO `tplay_area` VALUES (799, '栖霞区', '320113', '320100');
INSERT INTO `tplay_area` VALUES (800, '雨花台区', '320114', '320100');
INSERT INTO `tplay_area` VALUES (801, '江宁区', '320115', '320100');
INSERT INTO `tplay_area` VALUES (802, '六合区', '320116', '320100');
INSERT INTO `tplay_area` VALUES (803, '溧水区', '320117', '320100');
INSERT INTO `tplay_area` VALUES (804, '高淳区', '320118', '320100');
INSERT INTO `tplay_area` VALUES (805, '市辖区', '320201', '320200');
INSERT INTO `tplay_area` VALUES (806, '锡山区', '320205', '320200');
INSERT INTO `tplay_area` VALUES (807, '惠山区', '320206', '320200');
INSERT INTO `tplay_area` VALUES (808, '滨湖区', '320211', '320200');
INSERT INTO `tplay_area` VALUES (809, '梁溪区', '320213', '320200');
INSERT INTO `tplay_area` VALUES (810, '新吴区', '320214', '320200');
INSERT INTO `tplay_area` VALUES (811, '江阴市', '320281', '320200');
INSERT INTO `tplay_area` VALUES (812, '宜兴市', '320282', '320200');
INSERT INTO `tplay_area` VALUES (813, '市辖区', '320301', '320300');
INSERT INTO `tplay_area` VALUES (814, '鼓楼区', '320302', '320300');
INSERT INTO `tplay_area` VALUES (815, '云龙区', '320303', '320300');
INSERT INTO `tplay_area` VALUES (816, '贾汪区', '320305', '320300');
INSERT INTO `tplay_area` VALUES (817, '泉山区', '320311', '320300');
INSERT INTO `tplay_area` VALUES (818, '铜山区', '320312', '320300');
INSERT INTO `tplay_area` VALUES (819, '丰县', '320321', '320300');
INSERT INTO `tplay_area` VALUES (820, '沛县', '320322', '320300');
INSERT INTO `tplay_area` VALUES (821, '睢宁县', '320324', '320300');
INSERT INTO `tplay_area` VALUES (822, '新沂市', '320381', '320300');
INSERT INTO `tplay_area` VALUES (823, '邳州市', '320382', '320300');
INSERT INTO `tplay_area` VALUES (824, '市辖区', '320401', '320400');
INSERT INTO `tplay_area` VALUES (825, '天宁区', '320402', '320400');
INSERT INTO `tplay_area` VALUES (826, '钟楼区', '320404', '320400');
INSERT INTO `tplay_area` VALUES (827, '新北区', '320411', '320400');
INSERT INTO `tplay_area` VALUES (828, '武进区', '320412', '320400');
INSERT INTO `tplay_area` VALUES (829, '金坛区', '320413', '320400');
INSERT INTO `tplay_area` VALUES (830, '溧阳市', '320481', '320400');
INSERT INTO `tplay_area` VALUES (831, '市辖区', '320501', '320500');
INSERT INTO `tplay_area` VALUES (832, '虎丘区', '320505', '320500');
INSERT INTO `tplay_area` VALUES (833, '吴中区', '320506', '320500');
INSERT INTO `tplay_area` VALUES (834, '相城区', '320507', '320500');
INSERT INTO `tplay_area` VALUES (835, '姑苏区', '320508', '320500');
INSERT INTO `tplay_area` VALUES (836, '吴江区', '320509', '320500');
INSERT INTO `tplay_area` VALUES (837, '常熟市', '320581', '320500');
INSERT INTO `tplay_area` VALUES (838, '张家港市', '320582', '320500');
INSERT INTO `tplay_area` VALUES (839, '昆山市', '320583', '320500');
INSERT INTO `tplay_area` VALUES (840, '太仓市', '320585', '320500');
INSERT INTO `tplay_area` VALUES (841, '市辖区', '320601', '320600');
INSERT INTO `tplay_area` VALUES (842, '崇川区', '320602', '320600');
INSERT INTO `tplay_area` VALUES (843, '港闸区', '320611', '320600');
INSERT INTO `tplay_area` VALUES (844, '通州区', '320612', '320600');
INSERT INTO `tplay_area` VALUES (845, '海安县', '320621', '320600');
INSERT INTO `tplay_area` VALUES (846, '如东县', '320623', '320600');
INSERT INTO `tplay_area` VALUES (847, '启东市', '320681', '320600');
INSERT INTO `tplay_area` VALUES (848, '如皋市', '320682', '320600');
INSERT INTO `tplay_area` VALUES (849, '海门市', '320684', '320600');
INSERT INTO `tplay_area` VALUES (850, '市辖区', '320701', '320700');
INSERT INTO `tplay_area` VALUES (851, '连云区', '320703', '320700');
INSERT INTO `tplay_area` VALUES (852, '海州区', '320706', '320700');
INSERT INTO `tplay_area` VALUES (853, '赣榆区', '320707', '320700');
INSERT INTO `tplay_area` VALUES (854, '东海县', '320722', '320700');
INSERT INTO `tplay_area` VALUES (855, '灌云县', '320723', '320700');
INSERT INTO `tplay_area` VALUES (856, '灌南县', '320724', '320700');
INSERT INTO `tplay_area` VALUES (857, '市辖区', '320801', '320800');
INSERT INTO `tplay_area` VALUES (858, '淮安区', '320803', '320800');
INSERT INTO `tplay_area` VALUES (859, '淮阴区', '320804', '320800');
INSERT INTO `tplay_area` VALUES (860, '清江浦区', '320812', '320800');
INSERT INTO `tplay_area` VALUES (861, '洪泽区', '320813', '320800');
INSERT INTO `tplay_area` VALUES (862, '涟水县', '320826', '320800');
INSERT INTO `tplay_area` VALUES (863, '盱眙县', '320830', '320800');
INSERT INTO `tplay_area` VALUES (864, '金湖县', '320831', '320800');
INSERT INTO `tplay_area` VALUES (865, '市辖区', '320901', '320900');
INSERT INTO `tplay_area` VALUES (866, '亭湖区', '320902', '320900');
INSERT INTO `tplay_area` VALUES (867, '盐都区', '320903', '320900');
INSERT INTO `tplay_area` VALUES (868, '大丰区', '320904', '320900');
INSERT INTO `tplay_area` VALUES (869, '响水县', '320921', '320900');
INSERT INTO `tplay_area` VALUES (870, '滨海县', '320922', '320900');
INSERT INTO `tplay_area` VALUES (871, '阜宁县', '320923', '320900');
INSERT INTO `tplay_area` VALUES (872, '射阳县', '320924', '320900');
INSERT INTO `tplay_area` VALUES (873, '建湖县', '320925', '320900');
INSERT INTO `tplay_area` VALUES (874, '东台市', '320981', '320900');
INSERT INTO `tplay_area` VALUES (875, '市辖区', '321001', '321000');
INSERT INTO `tplay_area` VALUES (876, '广陵区', '321002', '321000');
INSERT INTO `tplay_area` VALUES (877, '邗江区', '321003', '321000');
INSERT INTO `tplay_area` VALUES (878, '江都区', '321012', '321000');
INSERT INTO `tplay_area` VALUES (879, '宝应县', '321023', '321000');
INSERT INTO `tplay_area` VALUES (880, '仪征市', '321081', '321000');
INSERT INTO `tplay_area` VALUES (881, '高邮市', '321084', '321000');
INSERT INTO `tplay_area` VALUES (882, '市辖区', '321101', '321100');
INSERT INTO `tplay_area` VALUES (883, '京口区', '321102', '321100');
INSERT INTO `tplay_area` VALUES (884, '润州区', '321111', '321100');
INSERT INTO `tplay_area` VALUES (885, '丹徒区', '321112', '321100');
INSERT INTO `tplay_area` VALUES (886, '丹阳市', '321181', '321100');
INSERT INTO `tplay_area` VALUES (887, '扬中市', '321182', '321100');
INSERT INTO `tplay_area` VALUES (888, '句容市', '321183', '321100');
INSERT INTO `tplay_area` VALUES (889, '市辖区', '321201', '321200');
INSERT INTO `tplay_area` VALUES (890, '海陵区', '321202', '321200');
INSERT INTO `tplay_area` VALUES (891, '高港区', '321203', '321200');
INSERT INTO `tplay_area` VALUES (892, '姜堰区', '321204', '321200');
INSERT INTO `tplay_area` VALUES (893, '兴化市', '321281', '321200');
INSERT INTO `tplay_area` VALUES (894, '靖江市', '321282', '321200');
INSERT INTO `tplay_area` VALUES (895, '泰兴市', '321283', '321200');
INSERT INTO `tplay_area` VALUES (896, '市辖区', '321301', '321300');
INSERT INTO `tplay_area` VALUES (897, '宿城区', '321302', '321300');
INSERT INTO `tplay_area` VALUES (898, '宿豫区', '321311', '321300');
INSERT INTO `tplay_area` VALUES (899, '沭阳县', '321322', '321300');
INSERT INTO `tplay_area` VALUES (900, '泗阳县', '321323', '321300');
INSERT INTO `tplay_area` VALUES (901, '泗洪县', '321324', '321300');
INSERT INTO `tplay_area` VALUES (902, '市辖区', '330101', '330100');
INSERT INTO `tplay_area` VALUES (903, '上城区', '330102', '330100');
INSERT INTO `tplay_area` VALUES (904, '下城区', '330103', '330100');
INSERT INTO `tplay_area` VALUES (905, '江干区', '330104', '330100');
INSERT INTO `tplay_area` VALUES (906, '拱墅区', '330105', '330100');
INSERT INTO `tplay_area` VALUES (907, '西湖区', '330106', '330100');
INSERT INTO `tplay_area` VALUES (908, '滨江区', '330108', '330100');
INSERT INTO `tplay_area` VALUES (909, '萧山区', '330109', '330100');
INSERT INTO `tplay_area` VALUES (910, '余杭区', '330110', '330100');
INSERT INTO `tplay_area` VALUES (911, '富阳区', '330111', '330100');
INSERT INTO `tplay_area` VALUES (912, '桐庐县', '330122', '330100');
INSERT INTO `tplay_area` VALUES (913, '淳安县', '330127', '330100');
INSERT INTO `tplay_area` VALUES (914, '建德市', '330182', '330100');
INSERT INTO `tplay_area` VALUES (915, '临安市', '330185', '330100');
INSERT INTO `tplay_area` VALUES (916, '市辖区', '330201', '330200');
INSERT INTO `tplay_area` VALUES (917, '海曙区', '330203', '330200');
INSERT INTO `tplay_area` VALUES (918, '江东区', '330204', '330200');
INSERT INTO `tplay_area` VALUES (919, '江北区', '330205', '330200');
INSERT INTO `tplay_area` VALUES (920, '北仑区', '330206', '330200');
INSERT INTO `tplay_area` VALUES (921, '镇海区', '330211', '330200');
INSERT INTO `tplay_area` VALUES (922, '鄞州区', '330212', '330200');
INSERT INTO `tplay_area` VALUES (923, '象山县', '330225', '330200');
INSERT INTO `tplay_area` VALUES (924, '宁海县', '330226', '330200');
INSERT INTO `tplay_area` VALUES (925, '余姚市', '330281', '330200');
INSERT INTO `tplay_area` VALUES (926, '慈溪市', '330282', '330200');
INSERT INTO `tplay_area` VALUES (927, '奉化市', '330283', '330200');
INSERT INTO `tplay_area` VALUES (928, '市辖区', '330301', '330300');
INSERT INTO `tplay_area` VALUES (929, '鹿城区', '330302', '330300');
INSERT INTO `tplay_area` VALUES (930, '龙湾区', '330303', '330300');
INSERT INTO `tplay_area` VALUES (931, '瓯海区', '330304', '330300');
INSERT INTO `tplay_area` VALUES (932, '洞头区', '330305', '330300');
INSERT INTO `tplay_area` VALUES (933, '永嘉县', '330324', '330300');
INSERT INTO `tplay_area` VALUES (934, '平阳县', '330326', '330300');
INSERT INTO `tplay_area` VALUES (935, '苍南县', '330327', '330300');
INSERT INTO `tplay_area` VALUES (936, '文成县', '330328', '330300');
INSERT INTO `tplay_area` VALUES (937, '泰顺县', '330329', '330300');
INSERT INTO `tplay_area` VALUES (938, '瑞安市', '330381', '330300');
INSERT INTO `tplay_area` VALUES (939, '乐清市', '330382', '330300');
INSERT INTO `tplay_area` VALUES (940, '市辖区', '330401', '330400');
INSERT INTO `tplay_area` VALUES (941, '南湖区', '330402', '330400');
INSERT INTO `tplay_area` VALUES (942, '秀洲区', '330411', '330400');
INSERT INTO `tplay_area` VALUES (943, '嘉善县', '330421', '330400');
INSERT INTO `tplay_area` VALUES (944, '海盐县', '330424', '330400');
INSERT INTO `tplay_area` VALUES (945, '海宁市', '330481', '330400');
INSERT INTO `tplay_area` VALUES (946, '平湖市', '330482', '330400');
INSERT INTO `tplay_area` VALUES (947, '桐乡市', '330483', '330400');
INSERT INTO `tplay_area` VALUES (948, '市辖区', '330501', '330500');
INSERT INTO `tplay_area` VALUES (949, '吴兴区', '330502', '330500');
INSERT INTO `tplay_area` VALUES (950, '南浔区', '330503', '330500');
INSERT INTO `tplay_area` VALUES (951, '德清县', '330521', '330500');
INSERT INTO `tplay_area` VALUES (952, '长兴县', '330522', '330500');
INSERT INTO `tplay_area` VALUES (953, '安吉县', '330523', '330500');
INSERT INTO `tplay_area` VALUES (954, '市辖区', '330601', '330600');
INSERT INTO `tplay_area` VALUES (955, '越城区', '330602', '330600');
INSERT INTO `tplay_area` VALUES (956, '柯桥区', '330603', '330600');
INSERT INTO `tplay_area` VALUES (957, '上虞区', '330604', '330600');
INSERT INTO `tplay_area` VALUES (958, '新昌县', '330624', '330600');
INSERT INTO `tplay_area` VALUES (959, '诸暨市', '330681', '330600');
INSERT INTO `tplay_area` VALUES (960, '嵊州市', '330683', '330600');
INSERT INTO `tplay_area` VALUES (961, '市辖区', '330701', '330700');
INSERT INTO `tplay_area` VALUES (962, '婺城区', '330702', '330700');
INSERT INTO `tplay_area` VALUES (963, '金东区', '330703', '330700');
INSERT INTO `tplay_area` VALUES (964, '武义县', '330723', '330700');
INSERT INTO `tplay_area` VALUES (965, '浦江县', '330726', '330700');
INSERT INTO `tplay_area` VALUES (966, '磐安县', '330727', '330700');
INSERT INTO `tplay_area` VALUES (967, '兰溪市', '330781', '330700');
INSERT INTO `tplay_area` VALUES (968, '义乌市', '330782', '330700');
INSERT INTO `tplay_area` VALUES (969, '东阳市', '330783', '330700');
INSERT INTO `tplay_area` VALUES (970, '永康市', '330784', '330700');
INSERT INTO `tplay_area` VALUES (971, '市辖区', '330801', '330800');
INSERT INTO `tplay_area` VALUES (972, '柯城区', '330802', '330800');
INSERT INTO `tplay_area` VALUES (973, '衢江区', '330803', '330800');
INSERT INTO `tplay_area` VALUES (974, '常山县', '330822', '330800');
INSERT INTO `tplay_area` VALUES (975, '开化县', '330824', '330800');
INSERT INTO `tplay_area` VALUES (976, '龙游县', '330825', '330800');
INSERT INTO `tplay_area` VALUES (977, '江山市', '330881', '330800');
INSERT INTO `tplay_area` VALUES (978, '市辖区', '330901', '330900');
INSERT INTO `tplay_area` VALUES (979, '定海区', '330902', '330900');
INSERT INTO `tplay_area` VALUES (980, '普陀区', '330903', '330900');
INSERT INTO `tplay_area` VALUES (981, '岱山县', '330921', '330900');
INSERT INTO `tplay_area` VALUES (982, '嵊泗县', '330922', '330900');
INSERT INTO `tplay_area` VALUES (983, '市辖区', '331001', '331000');
INSERT INTO `tplay_area` VALUES (984, '椒江区', '331002', '331000');
INSERT INTO `tplay_area` VALUES (985, '黄岩区', '331003', '331000');
INSERT INTO `tplay_area` VALUES (986, '路桥区', '331004', '331000');
INSERT INTO `tplay_area` VALUES (987, '玉环县', '331021', '331000');
INSERT INTO `tplay_area` VALUES (988, '三门县', '331022', '331000');
INSERT INTO `tplay_area` VALUES (989, '天台县', '331023', '331000');
INSERT INTO `tplay_area` VALUES (990, '仙居县', '331024', '331000');
INSERT INTO `tplay_area` VALUES (991, '温岭市', '331081', '331000');
INSERT INTO `tplay_area` VALUES (992, '临海市', '331082', '331000');
INSERT INTO `tplay_area` VALUES (993, '市辖区', '331101', '331100');
INSERT INTO `tplay_area` VALUES (994, '莲都区', '331102', '331100');
INSERT INTO `tplay_area` VALUES (995, '青田县', '331121', '331100');
INSERT INTO `tplay_area` VALUES (996, '缙云县', '331122', '331100');
INSERT INTO `tplay_area` VALUES (997, '遂昌县', '331123', '331100');
INSERT INTO `tplay_area` VALUES (998, '松阳县', '331124', '331100');
INSERT INTO `tplay_area` VALUES (999, '云和县', '331125', '331100');
INSERT INTO `tplay_area` VALUES (1000, '庆元县', '331126', '331100');
INSERT INTO `tplay_area` VALUES (1001, '景宁畲族自治县', '331127', '331100');
INSERT INTO `tplay_area` VALUES (1002, '龙泉市', '331181', '331100');
INSERT INTO `tplay_area` VALUES (1003, '市辖区', '340101', '340100');
INSERT INTO `tplay_area` VALUES (1004, '瑶海区', '340102', '340100');
INSERT INTO `tplay_area` VALUES (1005, '庐阳区', '340103', '340100');
INSERT INTO `tplay_area` VALUES (1006, '蜀山区', '340104', '340100');
INSERT INTO `tplay_area` VALUES (1007, '包河区', '340111', '340100');
INSERT INTO `tplay_area` VALUES (1008, '长丰县', '340121', '340100');
INSERT INTO `tplay_area` VALUES (1009, '肥东县', '340122', '340100');
INSERT INTO `tplay_area` VALUES (1010, '肥西县', '340123', '340100');
INSERT INTO `tplay_area` VALUES (1011, '庐江县', '340124', '340100');
INSERT INTO `tplay_area` VALUES (1012, '巢湖市', '340181', '340100');
INSERT INTO `tplay_area` VALUES (1013, '市辖区', '340201', '340200');
INSERT INTO `tplay_area` VALUES (1014, '镜湖区', '340202', '340200');
INSERT INTO `tplay_area` VALUES (1015, '弋江区', '340203', '340200');
INSERT INTO `tplay_area` VALUES (1016, '鸠江区', '340207', '340200');
INSERT INTO `tplay_area` VALUES (1017, '三山区', '340208', '340200');
INSERT INTO `tplay_area` VALUES (1018, '芜湖县', '340221', '340200');
INSERT INTO `tplay_area` VALUES (1019, '繁昌县', '340222', '340200');
INSERT INTO `tplay_area` VALUES (1020, '南陵县', '340223', '340200');
INSERT INTO `tplay_area` VALUES (1021, '无为县', '340225', '340200');
INSERT INTO `tplay_area` VALUES (1022, '市辖区', '340301', '340300');
INSERT INTO `tplay_area` VALUES (1023, '龙子湖区', '340302', '340300');
INSERT INTO `tplay_area` VALUES (1024, '蚌山区', '340303', '340300');
INSERT INTO `tplay_area` VALUES (1025, '禹会区', '340304', '340300');
INSERT INTO `tplay_area` VALUES (1026, '淮上区', '340311', '340300');
INSERT INTO `tplay_area` VALUES (1027, '怀远县', '340321', '340300');
INSERT INTO `tplay_area` VALUES (1028, '五河县', '340322', '340300');
INSERT INTO `tplay_area` VALUES (1029, '固镇县', '340323', '340300');
INSERT INTO `tplay_area` VALUES (1030, '市辖区', '340401', '340400');
INSERT INTO `tplay_area` VALUES (1031, '大通区', '340402', '340400');
INSERT INTO `tplay_area` VALUES (1032, '田家庵区', '340403', '340400');
INSERT INTO `tplay_area` VALUES (1033, '谢家集区', '340404', '340400');
INSERT INTO `tplay_area` VALUES (1034, '八公山区', '340405', '340400');
INSERT INTO `tplay_area` VALUES (1035, '潘集区', '340406', '340400');
INSERT INTO `tplay_area` VALUES (1036, '凤台县', '340421', '340400');
INSERT INTO `tplay_area` VALUES (1037, '寿县', '340422', '340400');
INSERT INTO `tplay_area` VALUES (1038, '市辖区', '340501', '340500');
INSERT INTO `tplay_area` VALUES (1039, '花山区', '340503', '340500');
INSERT INTO `tplay_area` VALUES (1040, '雨山区', '340504', '340500');
INSERT INTO `tplay_area` VALUES (1041, '博望区', '340506', '340500');
INSERT INTO `tplay_area` VALUES (1042, '当涂县', '340521', '340500');
INSERT INTO `tplay_area` VALUES (1043, '含山县', '340522', '340500');
INSERT INTO `tplay_area` VALUES (1044, '和县', '340523', '340500');
INSERT INTO `tplay_area` VALUES (1045, '市辖区', '340601', '340600');
INSERT INTO `tplay_area` VALUES (1046, '杜集区', '340602', '340600');
INSERT INTO `tplay_area` VALUES (1047, '相山区', '340603', '340600');
INSERT INTO `tplay_area` VALUES (1048, '烈山区', '340604', '340600');
INSERT INTO `tplay_area` VALUES (1049, '濉溪县', '340621', '340600');
INSERT INTO `tplay_area` VALUES (1050, '市辖区', '340701', '340700');
INSERT INTO `tplay_area` VALUES (1051, '铜官区', '340705', '340700');
INSERT INTO `tplay_area` VALUES (1052, '义安区', '340706', '340700');
INSERT INTO `tplay_area` VALUES (1053, '郊区', '340711', '340700');
INSERT INTO `tplay_area` VALUES (1054, '枞阳县', '340722', '340700');
INSERT INTO `tplay_area` VALUES (1055, '市辖区', '340801', '340800');
INSERT INTO `tplay_area` VALUES (1056, '迎江区', '340802', '340800');
INSERT INTO `tplay_area` VALUES (1057, '大观区', '340803', '340800');
INSERT INTO `tplay_area` VALUES (1058, '宜秀区', '340811', '340800');
INSERT INTO `tplay_area` VALUES (1059, '怀宁县', '340822', '340800');
INSERT INTO `tplay_area` VALUES (1060, '潜山县', '340824', '340800');
INSERT INTO `tplay_area` VALUES (1061, '太湖县', '340825', '340800');
INSERT INTO `tplay_area` VALUES (1062, '宿松县', '340826', '340800');
INSERT INTO `tplay_area` VALUES (1063, '望江县', '340827', '340800');
INSERT INTO `tplay_area` VALUES (1064, '岳西县', '340828', '340800');
INSERT INTO `tplay_area` VALUES (1065, '桐城市', '340881', '340800');
INSERT INTO `tplay_area` VALUES (1066, '市辖区', '341001', '341000');
INSERT INTO `tplay_area` VALUES (1067, '屯溪区', '341002', '341000');
INSERT INTO `tplay_area` VALUES (1068, '黄山区', '341003', '341000');
INSERT INTO `tplay_area` VALUES (1069, '徽州区', '341004', '341000');
INSERT INTO `tplay_area` VALUES (1070, '歙县', '341021', '341000');
INSERT INTO `tplay_area` VALUES (1071, '休宁县', '341022', '341000');
INSERT INTO `tplay_area` VALUES (1072, '黟县', '341023', '341000');
INSERT INTO `tplay_area` VALUES (1073, '祁门县', '341024', '341000');
INSERT INTO `tplay_area` VALUES (1074, '市辖区', '341101', '341100');
INSERT INTO `tplay_area` VALUES (1075, '琅琊区', '341102', '341100');
INSERT INTO `tplay_area` VALUES (1076, '南谯区', '341103', '341100');
INSERT INTO `tplay_area` VALUES (1077, '来安县', '341122', '341100');
INSERT INTO `tplay_area` VALUES (1078, '全椒县', '341124', '341100');
INSERT INTO `tplay_area` VALUES (1079, '定远县', '341125', '341100');
INSERT INTO `tplay_area` VALUES (1080, '凤阳县', '341126', '341100');
INSERT INTO `tplay_area` VALUES (1081, '天长市', '341181', '341100');
INSERT INTO `tplay_area` VALUES (1082, '明光市', '341182', '341100');
INSERT INTO `tplay_area` VALUES (1083, '市辖区', '341201', '341200');
INSERT INTO `tplay_area` VALUES (1084, '颍州区', '341202', '341200');
INSERT INTO `tplay_area` VALUES (1085, '颍东区', '341203', '341200');
INSERT INTO `tplay_area` VALUES (1086, '颍泉区', '341204', '341200');
INSERT INTO `tplay_area` VALUES (1087, '临泉县', '341221', '341200');
INSERT INTO `tplay_area` VALUES (1088, '太和县', '341222', '341200');
INSERT INTO `tplay_area` VALUES (1089, '阜南县', '341225', '341200');
INSERT INTO `tplay_area` VALUES (1090, '颍上县', '341226', '341200');
INSERT INTO `tplay_area` VALUES (1091, '界首市', '341282', '341200');
INSERT INTO `tplay_area` VALUES (1092, '市辖区', '341301', '341300');
INSERT INTO `tplay_area` VALUES (1093, '埇桥区', '341302', '341300');
INSERT INTO `tplay_area` VALUES (1094, '砀山县', '341321', '341300');
INSERT INTO `tplay_area` VALUES (1095, '萧县', '341322', '341300');
INSERT INTO `tplay_area` VALUES (1096, '灵璧县', '341323', '341300');
INSERT INTO `tplay_area` VALUES (1097, '泗县', '341324', '341300');
INSERT INTO `tplay_area` VALUES (1098, '市辖区', '341501', '341500');
INSERT INTO `tplay_area` VALUES (1099, '金安区', '341502', '341500');
INSERT INTO `tplay_area` VALUES (1100, '裕安区', '341503', '341500');
INSERT INTO `tplay_area` VALUES (1101, '叶集区', '341504', '341500');
INSERT INTO `tplay_area` VALUES (1102, '霍邱县', '341522', '341500');
INSERT INTO `tplay_area` VALUES (1103, '舒城县', '341523', '341500');
INSERT INTO `tplay_area` VALUES (1104, '金寨县', '341524', '341500');
INSERT INTO `tplay_area` VALUES (1105, '霍山县', '341525', '341500');
INSERT INTO `tplay_area` VALUES (1106, '市辖区', '341601', '341600');
INSERT INTO `tplay_area` VALUES (1107, '谯城区', '341602', '341600');
INSERT INTO `tplay_area` VALUES (1108, '涡阳县', '341621', '341600');
INSERT INTO `tplay_area` VALUES (1109, '蒙城县', '341622', '341600');
INSERT INTO `tplay_area` VALUES (1110, '利辛县', '341623', '341600');
INSERT INTO `tplay_area` VALUES (1111, '市辖区', '341701', '341700');
INSERT INTO `tplay_area` VALUES (1112, '贵池区', '341702', '341700');
INSERT INTO `tplay_area` VALUES (1113, '东至县', '341721', '341700');
INSERT INTO `tplay_area` VALUES (1114, '石台县', '341722', '341700');
INSERT INTO `tplay_area` VALUES (1115, '青阳县', '341723', '341700');
INSERT INTO `tplay_area` VALUES (1116, '市辖区', '341801', '341800');
INSERT INTO `tplay_area` VALUES (1117, '宣州区', '341802', '341800');
INSERT INTO `tplay_area` VALUES (1118, '郎溪县', '341821', '341800');
INSERT INTO `tplay_area` VALUES (1119, '广德县', '341822', '341800');
INSERT INTO `tplay_area` VALUES (1120, '泾县', '341823', '341800');
INSERT INTO `tplay_area` VALUES (1121, '绩溪县', '341824', '341800');
INSERT INTO `tplay_area` VALUES (1122, '旌德县', '341825', '341800');
INSERT INTO `tplay_area` VALUES (1123, '宁国市', '341881', '341800');
INSERT INTO `tplay_area` VALUES (1124, '市辖区', '350101', '350100');
INSERT INTO `tplay_area` VALUES (1125, '鼓楼区', '350102', '350100');
INSERT INTO `tplay_area` VALUES (1126, '台江区', '350103', '350100');
INSERT INTO `tplay_area` VALUES (1127, '仓山区', '350104', '350100');
INSERT INTO `tplay_area` VALUES (1128, '马尾区', '350105', '350100');
INSERT INTO `tplay_area` VALUES (1129, '晋安区', '350111', '350100');
INSERT INTO `tplay_area` VALUES (1130, '闽侯县', '350121', '350100');
INSERT INTO `tplay_area` VALUES (1131, '连江县', '350122', '350100');
INSERT INTO `tplay_area` VALUES (1132, '罗源县', '350123', '350100');
INSERT INTO `tplay_area` VALUES (1133, '闽清县', '350124', '350100');
INSERT INTO `tplay_area` VALUES (1134, '永泰县', '350125', '350100');
INSERT INTO `tplay_area` VALUES (1135, '平潭县', '350128', '350100');
INSERT INTO `tplay_area` VALUES (1136, '福清市', '350181', '350100');
INSERT INTO `tplay_area` VALUES (1137, '长乐市', '350182', '350100');
INSERT INTO `tplay_area` VALUES (1138, '市辖区', '350201', '350200');
INSERT INTO `tplay_area` VALUES (1139, '思明区', '350203', '350200');
INSERT INTO `tplay_area` VALUES (1140, '海沧区', '350205', '350200');
INSERT INTO `tplay_area` VALUES (1141, '湖里区', '350206', '350200');
INSERT INTO `tplay_area` VALUES (1142, '集美区', '350211', '350200');
INSERT INTO `tplay_area` VALUES (1143, '同安区', '350212', '350200');
INSERT INTO `tplay_area` VALUES (1144, '翔安区', '350213', '350200');
INSERT INTO `tplay_area` VALUES (1145, '市辖区', '350301', '350300');
INSERT INTO `tplay_area` VALUES (1146, '城厢区', '350302', '350300');
INSERT INTO `tplay_area` VALUES (1147, '涵江区', '350303', '350300');
INSERT INTO `tplay_area` VALUES (1148, '荔城区', '350304', '350300');
INSERT INTO `tplay_area` VALUES (1149, '秀屿区', '350305', '350300');
INSERT INTO `tplay_area` VALUES (1150, '仙游县', '350322', '350300');
INSERT INTO `tplay_area` VALUES (1151, '市辖区', '350401', '350400');
INSERT INTO `tplay_area` VALUES (1152, '梅列区', '350402', '350400');
INSERT INTO `tplay_area` VALUES (1153, '三元区', '350403', '350400');
INSERT INTO `tplay_area` VALUES (1154, '明溪县', '350421', '350400');
INSERT INTO `tplay_area` VALUES (1155, '清流县', '350423', '350400');
INSERT INTO `tplay_area` VALUES (1156, '宁化县', '350424', '350400');
INSERT INTO `tplay_area` VALUES (1157, '大田县', '350425', '350400');
INSERT INTO `tplay_area` VALUES (1158, '尤溪县', '350426', '350400');
INSERT INTO `tplay_area` VALUES (1159, '沙县', '350427', '350400');
INSERT INTO `tplay_area` VALUES (1160, '将乐县', '350428', '350400');
INSERT INTO `tplay_area` VALUES (1161, '泰宁县', '350429', '350400');
INSERT INTO `tplay_area` VALUES (1162, '建宁县', '350430', '350400');
INSERT INTO `tplay_area` VALUES (1163, '永安市', '350481', '350400');
INSERT INTO `tplay_area` VALUES (1164, '市辖区', '350501', '350500');
INSERT INTO `tplay_area` VALUES (1165, '鲤城区', '350502', '350500');
INSERT INTO `tplay_area` VALUES (1166, '丰泽区', '350503', '350500');
INSERT INTO `tplay_area` VALUES (1167, '洛江区', '350504', '350500');
INSERT INTO `tplay_area` VALUES (1168, '泉港区', '350505', '350500');
INSERT INTO `tplay_area` VALUES (1169, '惠安县', '350521', '350500');
INSERT INTO `tplay_area` VALUES (1170, '安溪县', '350524', '350500');
INSERT INTO `tplay_area` VALUES (1171, '永春县', '350525', '350500');
INSERT INTO `tplay_area` VALUES (1172, '德化县', '350526', '350500');
INSERT INTO `tplay_area` VALUES (1173, '金门县', '350527', '350500');
INSERT INTO `tplay_area` VALUES (1174, '石狮市', '350581', '350500');
INSERT INTO `tplay_area` VALUES (1175, '晋江市', '350582', '350500');
INSERT INTO `tplay_area` VALUES (1176, '南安市', '350583', '350500');
INSERT INTO `tplay_area` VALUES (1177, '市辖区', '350601', '350600');
INSERT INTO `tplay_area` VALUES (1178, '芗城区', '350602', '350600');
INSERT INTO `tplay_area` VALUES (1179, '龙文区', '350603', '350600');
INSERT INTO `tplay_area` VALUES (1180, '云霄县', '350622', '350600');
INSERT INTO `tplay_area` VALUES (1181, '漳浦县', '350623', '350600');
INSERT INTO `tplay_area` VALUES (1182, '诏安县', '350624', '350600');
INSERT INTO `tplay_area` VALUES (1183, '长泰县', '350625', '350600');
INSERT INTO `tplay_area` VALUES (1184, '东山县', '350626', '350600');
INSERT INTO `tplay_area` VALUES (1185, '南靖县', '350627', '350600');
INSERT INTO `tplay_area` VALUES (1186, '平和县', '350628', '350600');
INSERT INTO `tplay_area` VALUES (1187, '华安县', '350629', '350600');
INSERT INTO `tplay_area` VALUES (1188, '龙海市', '350681', '350600');
INSERT INTO `tplay_area` VALUES (1189, '市辖区', '350701', '350700');
INSERT INTO `tplay_area` VALUES (1190, '延平区', '350702', '350700');
INSERT INTO `tplay_area` VALUES (1191, '建阳区', '350703', '350700');
INSERT INTO `tplay_area` VALUES (1192, '顺昌县', '350721', '350700');
INSERT INTO `tplay_area` VALUES (1193, '浦城县', '350722', '350700');
INSERT INTO `tplay_area` VALUES (1194, '光泽县', '350723', '350700');
INSERT INTO `tplay_area` VALUES (1195, '松溪县', '350724', '350700');
INSERT INTO `tplay_area` VALUES (1196, '政和县', '350725', '350700');
INSERT INTO `tplay_area` VALUES (1197, '邵武市', '350781', '350700');
INSERT INTO `tplay_area` VALUES (1198, '武夷山市', '350782', '350700');
INSERT INTO `tplay_area` VALUES (1199, '建瓯市', '350783', '350700');
INSERT INTO `tplay_area` VALUES (1200, '市辖区', '350801', '350800');
INSERT INTO `tplay_area` VALUES (1201, '新罗区', '350802', '350800');
INSERT INTO `tplay_area` VALUES (1202, '永定区', '350803', '350800');
INSERT INTO `tplay_area` VALUES (1203, '长汀县', '350821', '350800');
INSERT INTO `tplay_area` VALUES (1204, '上杭县', '350823', '350800');
INSERT INTO `tplay_area` VALUES (1205, '武平县', '350824', '350800');
INSERT INTO `tplay_area` VALUES (1206, '连城县', '350825', '350800');
INSERT INTO `tplay_area` VALUES (1207, '漳平市', '350881', '350800');
INSERT INTO `tplay_area` VALUES (1208, '市辖区', '350901', '350900');
INSERT INTO `tplay_area` VALUES (1209, '蕉城区', '350902', '350900');
INSERT INTO `tplay_area` VALUES (1210, '霞浦县', '350921', '350900');
INSERT INTO `tplay_area` VALUES (1211, '古田县', '350922', '350900');
INSERT INTO `tplay_area` VALUES (1212, '屏南县', '350923', '350900');
INSERT INTO `tplay_area` VALUES (1213, '寿宁县', '350924', '350900');
INSERT INTO `tplay_area` VALUES (1214, '周宁县', '350925', '350900');
INSERT INTO `tplay_area` VALUES (1215, '柘荣县', '350926', '350900');
INSERT INTO `tplay_area` VALUES (1216, '福安市', '350981', '350900');
INSERT INTO `tplay_area` VALUES (1217, '福鼎市', '350982', '350900');
INSERT INTO `tplay_area` VALUES (1218, '市辖区', '360101', '360100');
INSERT INTO `tplay_area` VALUES (1219, '东湖区', '360102', '360100');
INSERT INTO `tplay_area` VALUES (1220, '西湖区', '360103', '360100');
INSERT INTO `tplay_area` VALUES (1221, '青云谱区', '360104', '360100');
INSERT INTO `tplay_area` VALUES (1222, '湾里区', '360105', '360100');
INSERT INTO `tplay_area` VALUES (1223, '青山湖区', '360111', '360100');
INSERT INTO `tplay_area` VALUES (1224, '新建区', '360112', '360100');
INSERT INTO `tplay_area` VALUES (1225, '南昌县', '360121', '360100');
INSERT INTO `tplay_area` VALUES (1226, '安义县', '360123', '360100');
INSERT INTO `tplay_area` VALUES (1227, '进贤县', '360124', '360100');
INSERT INTO `tplay_area` VALUES (1228, '市辖区', '360201', '360200');
INSERT INTO `tplay_area` VALUES (1229, '昌江区', '360202', '360200');
INSERT INTO `tplay_area` VALUES (1230, '珠山区', '360203', '360200');
INSERT INTO `tplay_area` VALUES (1231, '浮梁县', '360222', '360200');
INSERT INTO `tplay_area` VALUES (1232, '乐平市', '360281', '360200');
INSERT INTO `tplay_area` VALUES (1233, '市辖区', '360301', '360300');
INSERT INTO `tplay_area` VALUES (1234, '安源区', '360302', '360300');
INSERT INTO `tplay_area` VALUES (1235, '湘东区', '360313', '360300');
INSERT INTO `tplay_area` VALUES (1236, '莲花县', '360321', '360300');
INSERT INTO `tplay_area` VALUES (1237, '上栗县', '360322', '360300');
INSERT INTO `tplay_area` VALUES (1238, '芦溪县', '360323', '360300');
INSERT INTO `tplay_area` VALUES (1239, '市辖区', '360401', '360400');
INSERT INTO `tplay_area` VALUES (1240, '濂溪区', '360402', '360400');
INSERT INTO `tplay_area` VALUES (1241, '浔阳区', '360403', '360400');
INSERT INTO `tplay_area` VALUES (1242, '九江县', '360421', '360400');
INSERT INTO `tplay_area` VALUES (1243, '武宁县', '360423', '360400');
INSERT INTO `tplay_area` VALUES (1244, '修水县', '360424', '360400');
INSERT INTO `tplay_area` VALUES (1245, '永修县', '360425', '360400');
INSERT INTO `tplay_area` VALUES (1246, '德安县', '360426', '360400');
INSERT INTO `tplay_area` VALUES (1247, '都昌县', '360428', '360400');
INSERT INTO `tplay_area` VALUES (1248, '湖口县', '360429', '360400');
INSERT INTO `tplay_area` VALUES (1249, '彭泽县', '360430', '360400');
INSERT INTO `tplay_area` VALUES (1250, '瑞昌市', '360481', '360400');
INSERT INTO `tplay_area` VALUES (1251, '共青城市', '360482', '360400');
INSERT INTO `tplay_area` VALUES (1252, '庐山市', '360483', '360400');
INSERT INTO `tplay_area` VALUES (1253, '市辖区', '360501', '360500');
INSERT INTO `tplay_area` VALUES (1254, '渝水区', '360502', '360500');
INSERT INTO `tplay_area` VALUES (1255, '分宜县', '360521', '360500');
INSERT INTO `tplay_area` VALUES (1256, '市辖区', '360601', '360600');
INSERT INTO `tplay_area` VALUES (1257, '月湖区', '360602', '360600');
INSERT INTO `tplay_area` VALUES (1258, '余江县', '360622', '360600');
INSERT INTO `tplay_area` VALUES (1259, '贵溪市', '360681', '360600');
INSERT INTO `tplay_area` VALUES (1260, '市辖区', '360701', '360700');
INSERT INTO `tplay_area` VALUES (1261, '章贡区', '360702', '360700');
INSERT INTO `tplay_area` VALUES (1262, '南康区', '360703', '360700');
INSERT INTO `tplay_area` VALUES (1263, '赣县', '360721', '360700');
INSERT INTO `tplay_area` VALUES (1264, '信丰县', '360722', '360700');
INSERT INTO `tplay_area` VALUES (1265, '大余县', '360723', '360700');
INSERT INTO `tplay_area` VALUES (1266, '上犹县', '360724', '360700');
INSERT INTO `tplay_area` VALUES (1267, '崇义县', '360725', '360700');
INSERT INTO `tplay_area` VALUES (1268, '安远县', '360726', '360700');
INSERT INTO `tplay_area` VALUES (1269, '龙南县', '360727', '360700');
INSERT INTO `tplay_area` VALUES (1270, '定南县', '360728', '360700');
INSERT INTO `tplay_area` VALUES (1271, '全南县', '360729', '360700');
INSERT INTO `tplay_area` VALUES (1272, '宁都县', '360730', '360700');
INSERT INTO `tplay_area` VALUES (1273, '于都县', '360731', '360700');
INSERT INTO `tplay_area` VALUES (1274, '兴国县', '360732', '360700');
INSERT INTO `tplay_area` VALUES (1275, '会昌县', '360733', '360700');
INSERT INTO `tplay_area` VALUES (1276, '寻乌县', '360734', '360700');
INSERT INTO `tplay_area` VALUES (1277, '石城县', '360735', '360700');
INSERT INTO `tplay_area` VALUES (1278, '瑞金市', '360781', '360700');
INSERT INTO `tplay_area` VALUES (1279, '市辖区', '360801', '360800');
INSERT INTO `tplay_area` VALUES (1280, '吉州区', '360802', '360800');
INSERT INTO `tplay_area` VALUES (1281, '青原区', '360803', '360800');
INSERT INTO `tplay_area` VALUES (1282, '吉安县', '360821', '360800');
INSERT INTO `tplay_area` VALUES (1283, '吉水县', '360822', '360800');
INSERT INTO `tplay_area` VALUES (1284, '峡江县', '360823', '360800');
INSERT INTO `tplay_area` VALUES (1285, '新干县', '360824', '360800');
INSERT INTO `tplay_area` VALUES (1286, '永丰县', '360825', '360800');
INSERT INTO `tplay_area` VALUES (1287, '泰和县', '360826', '360800');
INSERT INTO `tplay_area` VALUES (1288, '遂川县', '360827', '360800');
INSERT INTO `tplay_area` VALUES (1289, '万安县', '360828', '360800');
INSERT INTO `tplay_area` VALUES (1290, '安福县', '360829', '360800');
INSERT INTO `tplay_area` VALUES (1291, '永新县', '360830', '360800');
INSERT INTO `tplay_area` VALUES (1292, '井冈山市', '360881', '360800');
INSERT INTO `tplay_area` VALUES (1293, '市辖区', '360901', '360900');
INSERT INTO `tplay_area` VALUES (1294, '袁州区', '360902', '360900');
INSERT INTO `tplay_area` VALUES (1295, '奉新县', '360921', '360900');
INSERT INTO `tplay_area` VALUES (1296, '万载县', '360922', '360900');
INSERT INTO `tplay_area` VALUES (1297, '上高县', '360923', '360900');
INSERT INTO `tplay_area` VALUES (1298, '宜丰县', '360924', '360900');
INSERT INTO `tplay_area` VALUES (1299, '靖安县', '360925', '360900');
INSERT INTO `tplay_area` VALUES (1300, '铜鼓县', '360926', '360900');
INSERT INTO `tplay_area` VALUES (1301, '丰城市', '360981', '360900');
INSERT INTO `tplay_area` VALUES (1302, '樟树市', '360982', '360900');
INSERT INTO `tplay_area` VALUES (1303, '高安市', '360983', '360900');
INSERT INTO `tplay_area` VALUES (1304, '市辖区', '361001', '361000');
INSERT INTO `tplay_area` VALUES (1305, '临川区', '361002', '361000');
INSERT INTO `tplay_area` VALUES (1306, '南城县', '361021', '361000');
INSERT INTO `tplay_area` VALUES (1307, '黎川县', '361022', '361000');
INSERT INTO `tplay_area` VALUES (1308, '南丰县', '361023', '361000');
INSERT INTO `tplay_area` VALUES (1309, '崇仁县', '361024', '361000');
INSERT INTO `tplay_area` VALUES (1310, '乐安县', '361025', '361000');
INSERT INTO `tplay_area` VALUES (1311, '宜黄县', '361026', '361000');
INSERT INTO `tplay_area` VALUES (1312, '金溪县', '361027', '361000');
INSERT INTO `tplay_area` VALUES (1313, '资溪县', '361028', '361000');
INSERT INTO `tplay_area` VALUES (1314, '东乡县', '361029', '361000');
INSERT INTO `tplay_area` VALUES (1315, '广昌县', '361030', '361000');
INSERT INTO `tplay_area` VALUES (1316, '市辖区', '361101', '361100');
INSERT INTO `tplay_area` VALUES (1317, '信州区', '361102', '361100');
INSERT INTO `tplay_area` VALUES (1318, '广丰区', '361103', '361100');
INSERT INTO `tplay_area` VALUES (1319, '上饶县', '361121', '361100');
INSERT INTO `tplay_area` VALUES (1320, '玉山县', '361123', '361100');
INSERT INTO `tplay_area` VALUES (1321, '铅山县', '361124', '361100');
INSERT INTO `tplay_area` VALUES (1322, '横峰县', '361125', '361100');
INSERT INTO `tplay_area` VALUES (1323, '弋阳县', '361126', '361100');
INSERT INTO `tplay_area` VALUES (1324, '余干县', '361127', '361100');
INSERT INTO `tplay_area` VALUES (1325, '鄱阳县', '361128', '361100');
INSERT INTO `tplay_area` VALUES (1326, '万年县', '361129', '361100');
INSERT INTO `tplay_area` VALUES (1327, '婺源县', '361130', '361100');
INSERT INTO `tplay_area` VALUES (1328, '德兴市', '361181', '361100');
INSERT INTO `tplay_area` VALUES (1329, '市辖区', '370101', '370100');
INSERT INTO `tplay_area` VALUES (1330, '历下区', '370102', '370100');
INSERT INTO `tplay_area` VALUES (1331, '市中区', '370103', '370100');
INSERT INTO `tplay_area` VALUES (1332, '槐荫区', '370104', '370100');
INSERT INTO `tplay_area` VALUES (1333, '天桥区', '370105', '370100');
INSERT INTO `tplay_area` VALUES (1334, '历城区', '370112', '370100');
INSERT INTO `tplay_area` VALUES (1335, '长清区', '370113', '370100');
INSERT INTO `tplay_area` VALUES (1336, '平阴县', '370124', '370100');
INSERT INTO `tplay_area` VALUES (1337, '济阳县', '370125', '370100');
INSERT INTO `tplay_area` VALUES (1338, '商河县', '370126', '370100');
INSERT INTO `tplay_area` VALUES (1339, '章丘市', '370181', '370100');
INSERT INTO `tplay_area` VALUES (1340, '市辖区', '370201', '370200');
INSERT INTO `tplay_area` VALUES (1341, '市南区', '370202', '370200');
INSERT INTO `tplay_area` VALUES (1342, '市北区', '370203', '370200');
INSERT INTO `tplay_area` VALUES (1343, '黄岛区', '370211', '370200');
INSERT INTO `tplay_area` VALUES (1344, '崂山区', '370212', '370200');
INSERT INTO `tplay_area` VALUES (1345, '李沧区', '370213', '370200');
INSERT INTO `tplay_area` VALUES (1346, '城阳区', '370214', '370200');
INSERT INTO `tplay_area` VALUES (1347, '胶州市', '370281', '370200');
INSERT INTO `tplay_area` VALUES (1348, '即墨市', '370282', '370200');
INSERT INTO `tplay_area` VALUES (1349, '平度市', '370283', '370200');
INSERT INTO `tplay_area` VALUES (1350, '莱西市', '370285', '370200');
INSERT INTO `tplay_area` VALUES (1351, '市辖区', '370301', '370300');
INSERT INTO `tplay_area` VALUES (1352, '淄川区', '370302', '370300');
INSERT INTO `tplay_area` VALUES (1353, '张店区', '370303', '370300');
INSERT INTO `tplay_area` VALUES (1354, '博山区', '370304', '370300');
INSERT INTO `tplay_area` VALUES (1355, '临淄区', '370305', '370300');
INSERT INTO `tplay_area` VALUES (1356, '周村区', '370306', '370300');
INSERT INTO `tplay_area` VALUES (1357, '桓台县', '370321', '370300');
INSERT INTO `tplay_area` VALUES (1358, '高青县', '370322', '370300');
INSERT INTO `tplay_area` VALUES (1359, '沂源县', '370323', '370300');
INSERT INTO `tplay_area` VALUES (1360, '市辖区', '370401', '370400');
INSERT INTO `tplay_area` VALUES (1361, '市中区', '370402', '370400');
INSERT INTO `tplay_area` VALUES (1362, '薛城区', '370403', '370400');
INSERT INTO `tplay_area` VALUES (1363, '峄城区', '370404', '370400');
INSERT INTO `tplay_area` VALUES (1364, '台儿庄区', '370405', '370400');
INSERT INTO `tplay_area` VALUES (1365, '山亭区', '370406', '370400');
INSERT INTO `tplay_area` VALUES (1366, '滕州市', '370481', '370400');
INSERT INTO `tplay_area` VALUES (1367, '市辖区', '370501', '370500');
INSERT INTO `tplay_area` VALUES (1368, '东营区', '370502', '370500');
INSERT INTO `tplay_area` VALUES (1369, '河口区', '370503', '370500');
INSERT INTO `tplay_area` VALUES (1370, '垦利区', '370505', '370500');
INSERT INTO `tplay_area` VALUES (1371, '利津县', '370522', '370500');
INSERT INTO `tplay_area` VALUES (1372, '广饶县', '370523', '370500');
INSERT INTO `tplay_area` VALUES (1373, '市辖区', '370601', '370600');
INSERT INTO `tplay_area` VALUES (1374, '芝罘区', '370602', '370600');
INSERT INTO `tplay_area` VALUES (1375, '福山区', '370611', '370600');
INSERT INTO `tplay_area` VALUES (1376, '牟平区', '370612', '370600');
INSERT INTO `tplay_area` VALUES (1377, '莱山区', '370613', '370600');
INSERT INTO `tplay_area` VALUES (1378, '长岛县', '370634', '370600');
INSERT INTO `tplay_area` VALUES (1379, '龙口市', '370681', '370600');
INSERT INTO `tplay_area` VALUES (1380, '莱阳市', '370682', '370600');
INSERT INTO `tplay_area` VALUES (1381, '莱州市', '370683', '370600');
INSERT INTO `tplay_area` VALUES (1382, '蓬莱市', '370684', '370600');
INSERT INTO `tplay_area` VALUES (1383, '招远市', '370685', '370600');
INSERT INTO `tplay_area` VALUES (1384, '栖霞市', '370686', '370600');
INSERT INTO `tplay_area` VALUES (1385, '海阳市', '370687', '370600');
INSERT INTO `tplay_area` VALUES (1386, '市辖区', '370701', '370700');
INSERT INTO `tplay_area` VALUES (1387, '潍城区', '370702', '370700');
INSERT INTO `tplay_area` VALUES (1388, '寒亭区', '370703', '370700');
INSERT INTO `tplay_area` VALUES (1389, '坊子区', '370704', '370700');
INSERT INTO `tplay_area` VALUES (1390, '奎文区', '370705', '370700');
INSERT INTO `tplay_area` VALUES (1391, '临朐县', '370724', '370700');
INSERT INTO `tplay_area` VALUES (1392, '昌乐县', '370725', '370700');
INSERT INTO `tplay_area` VALUES (1393, '青州市', '370781', '370700');
INSERT INTO `tplay_area` VALUES (1394, '诸城市', '370782', '370700');
INSERT INTO `tplay_area` VALUES (1395, '寿光市', '370783', '370700');
INSERT INTO `tplay_area` VALUES (1396, '安丘市', '370784', '370700');
INSERT INTO `tplay_area` VALUES (1397, '高密市', '370785', '370700');
INSERT INTO `tplay_area` VALUES (1398, '昌邑市', '370786', '370700');
INSERT INTO `tplay_area` VALUES (1399, '市辖区', '370801', '370800');
INSERT INTO `tplay_area` VALUES (1400, '任城区', '370811', '370800');
INSERT INTO `tplay_area` VALUES (1401, '兖州区', '370812', '370800');
INSERT INTO `tplay_area` VALUES (1402, '微山县', '370826', '370800');
INSERT INTO `tplay_area` VALUES (1403, '鱼台县', '370827', '370800');
INSERT INTO `tplay_area` VALUES (1404, '金乡县', '370828', '370800');
INSERT INTO `tplay_area` VALUES (1405, '嘉祥县', '370829', '370800');
INSERT INTO `tplay_area` VALUES (1406, '汶上县', '370830', '370800');
INSERT INTO `tplay_area` VALUES (1407, '泗水县', '370831', '370800');
INSERT INTO `tplay_area` VALUES (1408, '梁山县', '370832', '370800');
INSERT INTO `tplay_area` VALUES (1409, '曲阜市', '370881', '370800');
INSERT INTO `tplay_area` VALUES (1410, '邹城市', '370883', '370800');
INSERT INTO `tplay_area` VALUES (1411, '市辖区', '370901', '370900');
INSERT INTO `tplay_area` VALUES (1412, '泰山区', '370902', '370900');
INSERT INTO `tplay_area` VALUES (1413, '岱岳区', '370911', '370900');
INSERT INTO `tplay_area` VALUES (1414, '宁阳县', '370921', '370900');
INSERT INTO `tplay_area` VALUES (1415, '东平县', '370923', '370900');
INSERT INTO `tplay_area` VALUES (1416, '新泰市', '370982', '370900');
INSERT INTO `tplay_area` VALUES (1417, '肥城市', '370983', '370900');
INSERT INTO `tplay_area` VALUES (1418, '市辖区', '371001', '371000');
INSERT INTO `tplay_area` VALUES (1419, '环翠区', '371002', '371000');
INSERT INTO `tplay_area` VALUES (1420, '文登区', '371003', '371000');
INSERT INTO `tplay_area` VALUES (1421, '荣成市', '371082', '371000');
INSERT INTO `tplay_area` VALUES (1422, '乳山市', '371083', '371000');
INSERT INTO `tplay_area` VALUES (1423, '市辖区', '371101', '371100');
INSERT INTO `tplay_area` VALUES (1424, '东港区', '371102', '371100');
INSERT INTO `tplay_area` VALUES (1425, '岚山区', '371103', '371100');
INSERT INTO `tplay_area` VALUES (1426, '五莲县', '371121', '371100');
INSERT INTO `tplay_area` VALUES (1427, '莒县', '371122', '371100');
INSERT INTO `tplay_area` VALUES (1428, '市辖区', '371201', '371200');
INSERT INTO `tplay_area` VALUES (1429, '莱城区', '371202', '371200');
INSERT INTO `tplay_area` VALUES (1430, '钢城区', '371203', '371200');
INSERT INTO `tplay_area` VALUES (1431, '市辖区', '371301', '371300');
INSERT INTO `tplay_area` VALUES (1432, '兰山区', '371302', '371300');
INSERT INTO `tplay_area` VALUES (1433, '罗庄区', '371311', '371300');
INSERT INTO `tplay_area` VALUES (1434, '河东区', '371312', '371300');
INSERT INTO `tplay_area` VALUES (1435, '沂南县', '371321', '371300');
INSERT INTO `tplay_area` VALUES (1436, '郯城县', '371322', '371300');
INSERT INTO `tplay_area` VALUES (1437, '沂水县', '371323', '371300');
INSERT INTO `tplay_area` VALUES (1438, '兰陵县', '371324', '371300');
INSERT INTO `tplay_area` VALUES (1439, '费县', '371325', '371300');
INSERT INTO `tplay_area` VALUES (1440, '平邑县', '371326', '371300');
INSERT INTO `tplay_area` VALUES (1441, '莒南县', '371327', '371300');
INSERT INTO `tplay_area` VALUES (1442, '蒙阴县', '371328', '371300');
INSERT INTO `tplay_area` VALUES (1443, '临沭县', '371329', '371300');
INSERT INTO `tplay_area` VALUES (1444, '市辖区', '371401', '371400');
INSERT INTO `tplay_area` VALUES (1445, '德城区', '371402', '371400');
INSERT INTO `tplay_area` VALUES (1446, '陵城区', '371403', '371400');
INSERT INTO `tplay_area` VALUES (1447, '宁津县', '371422', '371400');
INSERT INTO `tplay_area` VALUES (1448, '庆云县', '371423', '371400');
INSERT INTO `tplay_area` VALUES (1449, '临邑县', '371424', '371400');
INSERT INTO `tplay_area` VALUES (1450, '齐河县', '371425', '371400');
INSERT INTO `tplay_area` VALUES (1451, '平原县', '371426', '371400');
INSERT INTO `tplay_area` VALUES (1452, '夏津县', '371427', '371400');
INSERT INTO `tplay_area` VALUES (1453, '武城县', '371428', '371400');
INSERT INTO `tplay_area` VALUES (1454, '乐陵市', '371481', '371400');
INSERT INTO `tplay_area` VALUES (1455, '禹城市', '371482', '371400');
INSERT INTO `tplay_area` VALUES (1456, '市辖区', '371501', '371500');
INSERT INTO `tplay_area` VALUES (1457, '东昌府区', '371502', '371500');
INSERT INTO `tplay_area` VALUES (1458, '阳谷县', '371521', '371500');
INSERT INTO `tplay_area` VALUES (1459, '莘县', '371522', '371500');
INSERT INTO `tplay_area` VALUES (1460, '茌平县', '371523', '371500');
INSERT INTO `tplay_area` VALUES (1461, '东阿县', '371524', '371500');
INSERT INTO `tplay_area` VALUES (1462, '冠县', '371525', '371500');
INSERT INTO `tplay_area` VALUES (1463, '高唐县', '371526', '371500');
INSERT INTO `tplay_area` VALUES (1464, '临清市', '371581', '371500');
INSERT INTO `tplay_area` VALUES (1465, '市辖区', '371601', '371600');
INSERT INTO `tplay_area` VALUES (1466, '滨城区', '371602', '371600');
INSERT INTO `tplay_area` VALUES (1467, '沾化区', '371603', '371600');
INSERT INTO `tplay_area` VALUES (1468, '惠民县', '371621', '371600');
INSERT INTO `tplay_area` VALUES (1469, '阳信县', '371622', '371600');
INSERT INTO `tplay_area` VALUES (1470, '无棣县', '371623', '371600');
INSERT INTO `tplay_area` VALUES (1471, '博兴县', '371625', '371600');
INSERT INTO `tplay_area` VALUES (1472, '邹平县', '371626', '371600');
INSERT INTO `tplay_area` VALUES (1473, '市辖区', '371701', '371700');
INSERT INTO `tplay_area` VALUES (1474, '牡丹区', '371702', '371700');
INSERT INTO `tplay_area` VALUES (1475, '定陶区', '371703', '371700');
INSERT INTO `tplay_area` VALUES (1476, '曹县', '371721', '371700');
INSERT INTO `tplay_area` VALUES (1477, '单县', '371722', '371700');
INSERT INTO `tplay_area` VALUES (1478, '成武县', '371723', '371700');
INSERT INTO `tplay_area` VALUES (1479, '巨野县', '371724', '371700');
INSERT INTO `tplay_area` VALUES (1480, '郓城县', '371725', '371700');
INSERT INTO `tplay_area` VALUES (1481, '鄄城县', '371726', '371700');
INSERT INTO `tplay_area` VALUES (1482, '东明县', '371728', '371700');
INSERT INTO `tplay_area` VALUES (1483, '市辖区', '410101', '410100');
INSERT INTO `tplay_area` VALUES (1484, '中原区', '410102', '410100');
INSERT INTO `tplay_area` VALUES (1485, '二七区', '410103', '410100');
INSERT INTO `tplay_area` VALUES (1486, '管城回族区', '410104', '410100');
INSERT INTO `tplay_area` VALUES (1487, '金水区', '410105', '410100');
INSERT INTO `tplay_area` VALUES (1488, '上街区', '410106', '410100');
INSERT INTO `tplay_area` VALUES (1489, '惠济区', '410108', '410100');
INSERT INTO `tplay_area` VALUES (1490, '中牟县', '410122', '410100');
INSERT INTO `tplay_area` VALUES (1491, '巩义市', '410181', '410100');
INSERT INTO `tplay_area` VALUES (1492, '荥阳市', '410182', '410100');
INSERT INTO `tplay_area` VALUES (1493, '新密市', '410183', '410100');
INSERT INTO `tplay_area` VALUES (1494, '新郑市', '410184', '410100');
INSERT INTO `tplay_area` VALUES (1495, '登封市', '410185', '410100');
INSERT INTO `tplay_area` VALUES (1496, '市辖区', '410201', '410200');
INSERT INTO `tplay_area` VALUES (1497, '龙亭区', '410202', '410200');
INSERT INTO `tplay_area` VALUES (1498, '顺河回族区', '410203', '410200');
INSERT INTO `tplay_area` VALUES (1499, '鼓楼区', '410204', '410200');
INSERT INTO `tplay_area` VALUES (1500, '禹王台区', '410205', '410200');
INSERT INTO `tplay_area` VALUES (1501, '金明区', '410211', '410200');
INSERT INTO `tplay_area` VALUES (1502, '祥符区', '410212', '410200');
INSERT INTO `tplay_area` VALUES (1503, '杞县', '410221', '410200');
INSERT INTO `tplay_area` VALUES (1504, '通许县', '410222', '410200');
INSERT INTO `tplay_area` VALUES (1505, '尉氏县', '410223', '410200');
INSERT INTO `tplay_area` VALUES (1506, '兰考县', '410225', '410200');
INSERT INTO `tplay_area` VALUES (1507, '市辖区', '410301', '410300');
INSERT INTO `tplay_area` VALUES (1508, '老城区', '410302', '410300');
INSERT INTO `tplay_area` VALUES (1509, '西工区', '410303', '410300');
INSERT INTO `tplay_area` VALUES (1510, '瀍河回族区', '410304', '410300');
INSERT INTO `tplay_area` VALUES (1511, '涧西区', '410305', '410300');
INSERT INTO `tplay_area` VALUES (1512, '吉利区', '410306', '410300');
INSERT INTO `tplay_area` VALUES (1513, '洛龙区', '410311', '410300');
INSERT INTO `tplay_area` VALUES (1514, '孟津县', '410322', '410300');
INSERT INTO `tplay_area` VALUES (1515, '新安县', '410323', '410300');
INSERT INTO `tplay_area` VALUES (1516, '栾川县', '410324', '410300');
INSERT INTO `tplay_area` VALUES (1517, '嵩县', '410325', '410300');
INSERT INTO `tplay_area` VALUES (1518, '汝阳县', '410326', '410300');
INSERT INTO `tplay_area` VALUES (1519, '宜阳县', '410327', '410300');
INSERT INTO `tplay_area` VALUES (1520, '洛宁县', '410328', '410300');
INSERT INTO `tplay_area` VALUES (1521, '伊川县', '410329', '410300');
INSERT INTO `tplay_area` VALUES (1522, '偃师市', '410381', '410300');
INSERT INTO `tplay_area` VALUES (1523, '市辖区', '410401', '410400');
INSERT INTO `tplay_area` VALUES (1524, '新华区', '410402', '410400');
INSERT INTO `tplay_area` VALUES (1525, '卫东区', '410403', '410400');
INSERT INTO `tplay_area` VALUES (1526, '石龙区', '410404', '410400');
INSERT INTO `tplay_area` VALUES (1527, '湛河区', '410411', '410400');
INSERT INTO `tplay_area` VALUES (1528, '宝丰县', '410421', '410400');
INSERT INTO `tplay_area` VALUES (1529, '叶县', '410422', '410400');
INSERT INTO `tplay_area` VALUES (1530, '鲁山县', '410423', '410400');
INSERT INTO `tplay_area` VALUES (1531, '郏县', '410425', '410400');
INSERT INTO `tplay_area` VALUES (1532, '舞钢市', '410481', '410400');
INSERT INTO `tplay_area` VALUES (1533, '汝州市', '410482', '410400');
INSERT INTO `tplay_area` VALUES (1534, '市辖区', '410501', '410500');
INSERT INTO `tplay_area` VALUES (1535, '文峰区', '410502', '410500');
INSERT INTO `tplay_area` VALUES (1536, '北关区', '410503', '410500');
INSERT INTO `tplay_area` VALUES (1537, '殷都区', '410505', '410500');
INSERT INTO `tplay_area` VALUES (1538, '龙安区', '410506', '410500');
INSERT INTO `tplay_area` VALUES (1539, '安阳县', '410522', '410500');
INSERT INTO `tplay_area` VALUES (1540, '汤阴县', '410523', '410500');
INSERT INTO `tplay_area` VALUES (1541, '滑县', '410526', '410500');
INSERT INTO `tplay_area` VALUES (1542, '内黄县', '410527', '410500');
INSERT INTO `tplay_area` VALUES (1543, '林州市', '410581', '410500');
INSERT INTO `tplay_area` VALUES (1544, '市辖区', '410601', '410600');
INSERT INTO `tplay_area` VALUES (1545, '鹤山区', '410602', '410600');
INSERT INTO `tplay_area` VALUES (1546, '山城区', '410603', '410600');
INSERT INTO `tplay_area` VALUES (1547, '淇滨区', '410611', '410600');
INSERT INTO `tplay_area` VALUES (1548, '浚县', '410621', '410600');
INSERT INTO `tplay_area` VALUES (1549, '淇县', '410622', '410600');
INSERT INTO `tplay_area` VALUES (1550, '市辖区', '410701', '410700');
INSERT INTO `tplay_area` VALUES (1551, '红旗区', '410702', '410700');
INSERT INTO `tplay_area` VALUES (1552, '卫滨区', '410703', '410700');
INSERT INTO `tplay_area` VALUES (1553, '凤泉区', '410704', '410700');
INSERT INTO `tplay_area` VALUES (1554, '牧野区', '410711', '410700');
INSERT INTO `tplay_area` VALUES (1555, '新乡县', '410721', '410700');
INSERT INTO `tplay_area` VALUES (1556, '获嘉县', '410724', '410700');
INSERT INTO `tplay_area` VALUES (1557, '原阳县', '410725', '410700');
INSERT INTO `tplay_area` VALUES (1558, '延津县', '410726', '410700');
INSERT INTO `tplay_area` VALUES (1559, '封丘县', '410727', '410700');
INSERT INTO `tplay_area` VALUES (1560, '长垣县', '410728', '410700');
INSERT INTO `tplay_area` VALUES (1561, '卫辉市', '410781', '410700');
INSERT INTO `tplay_area` VALUES (1562, '辉县市', '410782', '410700');
INSERT INTO `tplay_area` VALUES (1563, '市辖区', '410801', '410800');
INSERT INTO `tplay_area` VALUES (1564, '解放区', '410802', '410800');
INSERT INTO `tplay_area` VALUES (1565, '中站区', '410803', '410800');
INSERT INTO `tplay_area` VALUES (1566, '马村区', '410804', '410800');
INSERT INTO `tplay_area` VALUES (1567, '山阳区', '410811', '410800');
INSERT INTO `tplay_area` VALUES (1568, '修武县', '410821', '410800');
INSERT INTO `tplay_area` VALUES (1569, '博爱县', '410822', '410800');
INSERT INTO `tplay_area` VALUES (1570, '武陟县', '410823', '410800');
INSERT INTO `tplay_area` VALUES (1571, '温县', '410825', '410800');
INSERT INTO `tplay_area` VALUES (1572, '沁阳市', '410882', '410800');
INSERT INTO `tplay_area` VALUES (1573, '孟州市', '410883', '410800');
INSERT INTO `tplay_area` VALUES (1574, '市辖区', '410901', '410900');
INSERT INTO `tplay_area` VALUES (1575, '华龙区', '410902', '410900');
INSERT INTO `tplay_area` VALUES (1576, '清丰县', '410922', '410900');
INSERT INTO `tplay_area` VALUES (1577, '南乐县', '410923', '410900');
INSERT INTO `tplay_area` VALUES (1578, '范县', '410926', '410900');
INSERT INTO `tplay_area` VALUES (1579, '台前县', '410927', '410900');
INSERT INTO `tplay_area` VALUES (1580, '濮阳县', '410928', '410900');
INSERT INTO `tplay_area` VALUES (1581, '市辖区', '411001', '411000');
INSERT INTO `tplay_area` VALUES (1582, '魏都区', '411002', '411000');
INSERT INTO `tplay_area` VALUES (1583, '许昌县', '411023', '411000');
INSERT INTO `tplay_area` VALUES (1584, '鄢陵县', '411024', '411000');
INSERT INTO `tplay_area` VALUES (1585, '襄城县', '411025', '411000');
INSERT INTO `tplay_area` VALUES (1586, '禹州市', '411081', '411000');
INSERT INTO `tplay_area` VALUES (1587, '长葛市', '411082', '411000');
INSERT INTO `tplay_area` VALUES (1588, '市辖区', '411101', '411100');
INSERT INTO `tplay_area` VALUES (1589, '源汇区', '411102', '411100');
INSERT INTO `tplay_area` VALUES (1590, '郾城区', '411103', '411100');
INSERT INTO `tplay_area` VALUES (1591, '召陵区', '411104', '411100');
INSERT INTO `tplay_area` VALUES (1592, '舞阳县', '411121', '411100');
INSERT INTO `tplay_area` VALUES (1593, '临颍县', '411122', '411100');
INSERT INTO `tplay_area` VALUES (1594, '市辖区', '411201', '411200');
INSERT INTO `tplay_area` VALUES (1595, '湖滨区', '411202', '411200');
INSERT INTO `tplay_area` VALUES (1596, '陕州区', '411203', '411200');
INSERT INTO `tplay_area` VALUES (1597, '渑池县', '411221', '411200');
INSERT INTO `tplay_area` VALUES (1598, '卢氏县', '411224', '411200');
INSERT INTO `tplay_area` VALUES (1599, '义马市', '411281', '411200');
INSERT INTO `tplay_area` VALUES (1600, '灵宝市', '411282', '411200');
INSERT INTO `tplay_area` VALUES (1601, '市辖区', '411301', '411300');
INSERT INTO `tplay_area` VALUES (1602, '宛城区', '411302', '411300');
INSERT INTO `tplay_area` VALUES (1603, '卧龙区', '411303', '411300');
INSERT INTO `tplay_area` VALUES (1604, '南召县', '411321', '411300');
INSERT INTO `tplay_area` VALUES (1605, '方城县', '411322', '411300');
INSERT INTO `tplay_area` VALUES (1606, '西峡县', '411323', '411300');
INSERT INTO `tplay_area` VALUES (1607, '镇平县', '411324', '411300');
INSERT INTO `tplay_area` VALUES (1608, '内乡县', '411325', '411300');
INSERT INTO `tplay_area` VALUES (1609, '淅川县', '411326', '411300');
INSERT INTO `tplay_area` VALUES (1610, '社旗县', '411327', '411300');
INSERT INTO `tplay_area` VALUES (1611, '唐河县', '411328', '411300');
INSERT INTO `tplay_area` VALUES (1612, '新野县', '411329', '411300');
INSERT INTO `tplay_area` VALUES (1613, '桐柏县', '411330', '411300');
INSERT INTO `tplay_area` VALUES (1614, '邓州市', '411381', '411300');
INSERT INTO `tplay_area` VALUES (1615, '市辖区', '411401', '411400');
INSERT INTO `tplay_area` VALUES (1616, '梁园区', '411402', '411400');
INSERT INTO `tplay_area` VALUES (1617, '睢阳区', '411403', '411400');
INSERT INTO `tplay_area` VALUES (1618, '民权县', '411421', '411400');
INSERT INTO `tplay_area` VALUES (1619, '睢县', '411422', '411400');
INSERT INTO `tplay_area` VALUES (1620, '宁陵县', '411423', '411400');
INSERT INTO `tplay_area` VALUES (1621, '柘城县', '411424', '411400');
INSERT INTO `tplay_area` VALUES (1622, '虞城县', '411425', '411400');
INSERT INTO `tplay_area` VALUES (1623, '夏邑县', '411426', '411400');
INSERT INTO `tplay_area` VALUES (1624, '永城市', '411481', '411400');
INSERT INTO `tplay_area` VALUES (1625, '市辖区', '411501', '411500');
INSERT INTO `tplay_area` VALUES (1626, '浉河区', '411502', '411500');
INSERT INTO `tplay_area` VALUES (1627, '平桥区', '411503', '411500');
INSERT INTO `tplay_area` VALUES (1628, '罗山县', '411521', '411500');
INSERT INTO `tplay_area` VALUES (1629, '光山县', '411522', '411500');
INSERT INTO `tplay_area` VALUES (1630, '新县', '411523', '411500');
INSERT INTO `tplay_area` VALUES (1631, '商城县', '411524', '411500');
INSERT INTO `tplay_area` VALUES (1632, '固始县', '411525', '411500');
INSERT INTO `tplay_area` VALUES (1633, '潢川县', '411526', '411500');
INSERT INTO `tplay_area` VALUES (1634, '淮滨县', '411527', '411500');
INSERT INTO `tplay_area` VALUES (1635, '息县', '411528', '411500');
INSERT INTO `tplay_area` VALUES (1636, '市辖区', '411601', '411600');
INSERT INTO `tplay_area` VALUES (1637, '川汇区', '411602', '411600');
INSERT INTO `tplay_area` VALUES (1638, '扶沟县', '411621', '411600');
INSERT INTO `tplay_area` VALUES (1639, '西华县', '411622', '411600');
INSERT INTO `tplay_area` VALUES (1640, '商水县', '411623', '411600');
INSERT INTO `tplay_area` VALUES (1641, '沈丘县', '411624', '411600');
INSERT INTO `tplay_area` VALUES (1642, '郸城县', '411625', '411600');
INSERT INTO `tplay_area` VALUES (1643, '淮阳县', '411626', '411600');
INSERT INTO `tplay_area` VALUES (1644, '太康县', '411627', '411600');
INSERT INTO `tplay_area` VALUES (1645, '鹿邑县', '411628', '411600');
INSERT INTO `tplay_area` VALUES (1646, '项城市', '411681', '411600');
INSERT INTO `tplay_area` VALUES (1647, '市辖区', '411701', '411700');
INSERT INTO `tplay_area` VALUES (1648, '驿城区', '411702', '411700');
INSERT INTO `tplay_area` VALUES (1649, '西平县', '411721', '411700');
INSERT INTO `tplay_area` VALUES (1650, '上蔡县', '411722', '411700');
INSERT INTO `tplay_area` VALUES (1651, '平舆县', '411723', '411700');
INSERT INTO `tplay_area` VALUES (1652, '正阳县', '411724', '411700');
INSERT INTO `tplay_area` VALUES (1653, '确山县', '411725', '411700');
INSERT INTO `tplay_area` VALUES (1654, '泌阳县', '411726', '411700');
INSERT INTO `tplay_area` VALUES (1655, '汝南县', '411727', '411700');
INSERT INTO `tplay_area` VALUES (1656, '遂平县', '411728', '411700');
INSERT INTO `tplay_area` VALUES (1657, '新蔡县', '411729', '411700');
INSERT INTO `tplay_area` VALUES (1658, '济源市', '419001', '419000');
INSERT INTO `tplay_area` VALUES (1659, '市辖区', '420101', '420100');
INSERT INTO `tplay_area` VALUES (1660, '江岸区', '420102', '420100');
INSERT INTO `tplay_area` VALUES (1661, '江汉区', '420103', '420100');
INSERT INTO `tplay_area` VALUES (1662, '硚口区', '420104', '420100');
INSERT INTO `tplay_area` VALUES (1663, '汉阳区', '420105', '420100');
INSERT INTO `tplay_area` VALUES (1664, '武昌区', '420106', '420100');
INSERT INTO `tplay_area` VALUES (1665, '青山区', '420107', '420100');
INSERT INTO `tplay_area` VALUES (1666, '洪山区', '420111', '420100');
INSERT INTO `tplay_area` VALUES (1667, '东西湖区', '420112', '420100');
INSERT INTO `tplay_area` VALUES (1668, '汉南区', '420113', '420100');
INSERT INTO `tplay_area` VALUES (1669, '蔡甸区', '420114', '420100');
INSERT INTO `tplay_area` VALUES (1670, '江夏区', '420115', '420100');
INSERT INTO `tplay_area` VALUES (1671, '黄陂区', '420116', '420100');
INSERT INTO `tplay_area` VALUES (1672, '新洲区', '420117', '420100');
INSERT INTO `tplay_area` VALUES (1673, '市辖区', '420201', '420200');
INSERT INTO `tplay_area` VALUES (1674, '黄石港区', '420202', '420200');
INSERT INTO `tplay_area` VALUES (1675, '西塞山区', '420203', '420200');
INSERT INTO `tplay_area` VALUES (1676, '下陆区', '420204', '420200');
INSERT INTO `tplay_area` VALUES (1677, '铁山区', '420205', '420200');
INSERT INTO `tplay_area` VALUES (1678, '阳新县', '420222', '420200');
INSERT INTO `tplay_area` VALUES (1679, '大冶市', '420281', '420200');
INSERT INTO `tplay_area` VALUES (1680, '市辖区', '420301', '420300');
INSERT INTO `tplay_area` VALUES (1681, '茅箭区', '420302', '420300');
INSERT INTO `tplay_area` VALUES (1682, '张湾区', '420303', '420300');
INSERT INTO `tplay_area` VALUES (1683, '郧阳区', '420304', '420300');
INSERT INTO `tplay_area` VALUES (1684, '郧西县', '420322', '420300');
INSERT INTO `tplay_area` VALUES (1685, '竹山县', '420323', '420300');
INSERT INTO `tplay_area` VALUES (1686, '竹溪县', '420324', '420300');
INSERT INTO `tplay_area` VALUES (1687, '房县', '420325', '420300');
INSERT INTO `tplay_area` VALUES (1688, '丹江口市', '420381', '420300');
INSERT INTO `tplay_area` VALUES (1689, '市辖区', '420501', '420500');
INSERT INTO `tplay_area` VALUES (1690, '西陵区', '420502', '420500');
INSERT INTO `tplay_area` VALUES (1691, '伍家岗区', '420503', '420500');
INSERT INTO `tplay_area` VALUES (1692, '点军区', '420504', '420500');
INSERT INTO `tplay_area` VALUES (1693, '猇亭区', '420505', '420500');
INSERT INTO `tplay_area` VALUES (1694, '夷陵区', '420506', '420500');
INSERT INTO `tplay_area` VALUES (1695, '远安县', '420525', '420500');
INSERT INTO `tplay_area` VALUES (1696, '兴山县', '420526', '420500');
INSERT INTO `tplay_area` VALUES (1697, '秭归县', '420527', '420500');
INSERT INTO `tplay_area` VALUES (1698, '长阳土家族自治县', '420528', '420500');
INSERT INTO `tplay_area` VALUES (1699, '五峰土家族自治县', '420529', '420500');
INSERT INTO `tplay_area` VALUES (1700, '宜都市', '420581', '420500');
INSERT INTO `tplay_area` VALUES (1701, '当阳市', '420582', '420500');
INSERT INTO `tplay_area` VALUES (1702, '枝江市', '420583', '420500');
INSERT INTO `tplay_area` VALUES (1703, '市辖区', '420601', '420600');
INSERT INTO `tplay_area` VALUES (1704, '襄城区', '420602', '420600');
INSERT INTO `tplay_area` VALUES (1705, '樊城区', '420606', '420600');
INSERT INTO `tplay_area` VALUES (1706, '襄州区', '420607', '420600');
INSERT INTO `tplay_area` VALUES (1707, '南漳县', '420624', '420600');
INSERT INTO `tplay_area` VALUES (1708, '谷城县', '420625', '420600');
INSERT INTO `tplay_area` VALUES (1709, '保康县', '420626', '420600');
INSERT INTO `tplay_area` VALUES (1710, '老河口市', '420682', '420600');
INSERT INTO `tplay_area` VALUES (1711, '枣阳市', '420683', '420600');
INSERT INTO `tplay_area` VALUES (1712, '宜城市', '420684', '420600');
INSERT INTO `tplay_area` VALUES (1713, '市辖区', '420701', '420700');
INSERT INTO `tplay_area` VALUES (1714, '梁子湖区', '420702', '420700');
INSERT INTO `tplay_area` VALUES (1715, '华容区', '420703', '420700');
INSERT INTO `tplay_area` VALUES (1716, '鄂城区', '420704', '420700');
INSERT INTO `tplay_area` VALUES (1717, '市辖区', '420801', '420800');
INSERT INTO `tplay_area` VALUES (1718, '东宝区', '420802', '420800');
INSERT INTO `tplay_area` VALUES (1719, '掇刀区', '420804', '420800');
INSERT INTO `tplay_area` VALUES (1720, '京山县', '420821', '420800');
INSERT INTO `tplay_area` VALUES (1721, '沙洋县', '420822', '420800');
INSERT INTO `tplay_area` VALUES (1722, '钟祥市', '420881', '420800');
INSERT INTO `tplay_area` VALUES (1723, '市辖区', '420901', '420900');
INSERT INTO `tplay_area` VALUES (1724, '孝南区', '420902', '420900');
INSERT INTO `tplay_area` VALUES (1725, '孝昌县', '420921', '420900');
INSERT INTO `tplay_area` VALUES (1726, '大悟县', '420922', '420900');
INSERT INTO `tplay_area` VALUES (1727, '云梦县', '420923', '420900');
INSERT INTO `tplay_area` VALUES (1728, '应城市', '420981', '420900');
INSERT INTO `tplay_area` VALUES (1729, '安陆市', '420982', '420900');
INSERT INTO `tplay_area` VALUES (1730, '汉川市', '420984', '420900');
INSERT INTO `tplay_area` VALUES (1731, '市辖区', '421001', '421000');
INSERT INTO `tplay_area` VALUES (1732, '沙市区', '421002', '421000');
INSERT INTO `tplay_area` VALUES (1733, '荆州区', '421003', '421000');
INSERT INTO `tplay_area` VALUES (1734, '公安县', '421022', '421000');
INSERT INTO `tplay_area` VALUES (1735, '监利县', '421023', '421000');
INSERT INTO `tplay_area` VALUES (1736, '江陵县', '421024', '421000');
INSERT INTO `tplay_area` VALUES (1737, '石首市', '421081', '421000');
INSERT INTO `tplay_area` VALUES (1738, '洪湖市', '421083', '421000');
INSERT INTO `tplay_area` VALUES (1739, '松滋市', '421087', '421000');
INSERT INTO `tplay_area` VALUES (1740, '市辖区', '421101', '421100');
INSERT INTO `tplay_area` VALUES (1741, '黄州区', '421102', '421100');
INSERT INTO `tplay_area` VALUES (1742, '团风县', '421121', '421100');
INSERT INTO `tplay_area` VALUES (1743, '红安县', '421122', '421100');
INSERT INTO `tplay_area` VALUES (1744, '罗田县', '421123', '421100');
INSERT INTO `tplay_area` VALUES (1745, '英山县', '421124', '421100');
INSERT INTO `tplay_area` VALUES (1746, '浠水县', '421125', '421100');
INSERT INTO `tplay_area` VALUES (1747, '蕲春县', '421126', '421100');
INSERT INTO `tplay_area` VALUES (1748, '黄梅县', '421127', '421100');
INSERT INTO `tplay_area` VALUES (1749, '麻城市', '421181', '421100');
INSERT INTO `tplay_area` VALUES (1750, '武穴市', '421182', '421100');
INSERT INTO `tplay_area` VALUES (1751, '市辖区', '421201', '421200');
INSERT INTO `tplay_area` VALUES (1752, '咸安区', '421202', '421200');
INSERT INTO `tplay_area` VALUES (1753, '嘉鱼县', '421221', '421200');
INSERT INTO `tplay_area` VALUES (1754, '通城县', '421222', '421200');
INSERT INTO `tplay_area` VALUES (1755, '崇阳县', '421223', '421200');
INSERT INTO `tplay_area` VALUES (1756, '通山县', '421224', '421200');
INSERT INTO `tplay_area` VALUES (1757, '赤壁市', '421281', '421200');
INSERT INTO `tplay_area` VALUES (1758, '市辖区', '421301', '421300');
INSERT INTO `tplay_area` VALUES (1759, '曾都区', '421303', '421300');
INSERT INTO `tplay_area` VALUES (1760, '随县', '421321', '421300');
INSERT INTO `tplay_area` VALUES (1761, '广水市', '421381', '421300');
INSERT INTO `tplay_area` VALUES (1762, '恩施市', '422801', '422800');
INSERT INTO `tplay_area` VALUES (1763, '利川市', '422802', '422800');
INSERT INTO `tplay_area` VALUES (1764, '建始县', '422822', '422800');
INSERT INTO `tplay_area` VALUES (1765, '巴东县', '422823', '422800');
INSERT INTO `tplay_area` VALUES (1766, '宣恩县', '422825', '422800');
INSERT INTO `tplay_area` VALUES (1767, '咸丰县', '422826', '422800');
INSERT INTO `tplay_area` VALUES (1768, '来凤县', '422827', '422800');
INSERT INTO `tplay_area` VALUES (1769, '鹤峰县', '422828', '422800');
INSERT INTO `tplay_area` VALUES (1770, '仙桃市', '429004', '429000');
INSERT INTO `tplay_area` VALUES (1771, '潜江市', '429005', '429000');
INSERT INTO `tplay_area` VALUES (1772, '天门市', '429006', '429000');
INSERT INTO `tplay_area` VALUES (1773, '神农架林区', '429021', '429000');
INSERT INTO `tplay_area` VALUES (1774, '市辖区', '430101', '430100');
INSERT INTO `tplay_area` VALUES (1775, '芙蓉区', '430102', '430100');
INSERT INTO `tplay_area` VALUES (1776, '天心区', '430103', '430100');
INSERT INTO `tplay_area` VALUES (1777, '岳麓区', '430104', '430100');
INSERT INTO `tplay_area` VALUES (1778, '开福区', '430105', '430100');
INSERT INTO `tplay_area` VALUES (1779, '雨花区', '430111', '430100');
INSERT INTO `tplay_area` VALUES (1780, '望城区', '430112', '430100');
INSERT INTO `tplay_area` VALUES (1781, '长沙县', '430121', '430100');
INSERT INTO `tplay_area` VALUES (1782, '宁乡县', '430124', '430100');
INSERT INTO `tplay_area` VALUES (1783, '浏阳市', '430181', '430100');
INSERT INTO `tplay_area` VALUES (1784, '市辖区', '430201', '430200');
INSERT INTO `tplay_area` VALUES (1785, '荷塘区', '430202', '430200');
INSERT INTO `tplay_area` VALUES (1786, '芦淞区', '430203', '430200');
INSERT INTO `tplay_area` VALUES (1787, '石峰区', '430204', '430200');
INSERT INTO `tplay_area` VALUES (1788, '天元区', '430211', '430200');
INSERT INTO `tplay_area` VALUES (1789, '株洲县', '430221', '430200');
INSERT INTO `tplay_area` VALUES (1790, '攸县', '430223', '430200');
INSERT INTO `tplay_area` VALUES (1791, '茶陵县', '430224', '430200');
INSERT INTO `tplay_area` VALUES (1792, '炎陵县', '430225', '430200');
INSERT INTO `tplay_area` VALUES (1793, '醴陵市', '430281', '430200');
INSERT INTO `tplay_area` VALUES (1794, '市辖区', '430301', '430300');
INSERT INTO `tplay_area` VALUES (1795, '雨湖区', '430302', '430300');
INSERT INTO `tplay_area` VALUES (1796, '岳塘区', '430304', '430300');
INSERT INTO `tplay_area` VALUES (1797, '湘潭县', '430321', '430300');
INSERT INTO `tplay_area` VALUES (1798, '湘乡市', '430381', '430300');
INSERT INTO `tplay_area` VALUES (1799, '韶山市', '430382', '430300');
INSERT INTO `tplay_area` VALUES (1800, '市辖区', '430401', '430400');
INSERT INTO `tplay_area` VALUES (1801, '珠晖区', '430405', '430400');
INSERT INTO `tplay_area` VALUES (1802, '雁峰区', '430406', '430400');
INSERT INTO `tplay_area` VALUES (1803, '石鼓区', '430407', '430400');
INSERT INTO `tplay_area` VALUES (1804, '蒸湘区', '430408', '430400');
INSERT INTO `tplay_area` VALUES (1805, '南岳区', '430412', '430400');
INSERT INTO `tplay_area` VALUES (1806, '衡阳县', '430421', '430400');
INSERT INTO `tplay_area` VALUES (1807, '衡南县', '430422', '430400');
INSERT INTO `tplay_area` VALUES (1808, '衡山县', '430423', '430400');
INSERT INTO `tplay_area` VALUES (1809, '衡东县', '430424', '430400');
INSERT INTO `tplay_area` VALUES (1810, '祁东县', '430426', '430400');
INSERT INTO `tplay_area` VALUES (1811, '耒阳市', '430481', '430400');
INSERT INTO `tplay_area` VALUES (1812, '常宁市', '430482', '430400');
INSERT INTO `tplay_area` VALUES (1813, '市辖区', '430501', '430500');
INSERT INTO `tplay_area` VALUES (1814, '双清区', '430502', '430500');
INSERT INTO `tplay_area` VALUES (1815, '大祥区', '430503', '430500');
INSERT INTO `tplay_area` VALUES (1816, '北塔区', '430511', '430500');
INSERT INTO `tplay_area` VALUES (1817, '邵东县', '430521', '430500');
INSERT INTO `tplay_area` VALUES (1818, '新邵县', '430522', '430500');
INSERT INTO `tplay_area` VALUES (1819, '邵阳县', '430523', '430500');
INSERT INTO `tplay_area` VALUES (1820, '隆回县', '430524', '430500');
INSERT INTO `tplay_area` VALUES (1821, '洞口县', '430525', '430500');
INSERT INTO `tplay_area` VALUES (1822, '绥宁县', '430527', '430500');
INSERT INTO `tplay_area` VALUES (1823, '新宁县', '430528', '430500');
INSERT INTO `tplay_area` VALUES (1824, '城步苗族自治县', '430529', '430500');
INSERT INTO `tplay_area` VALUES (1825, '武冈市', '430581', '430500');
INSERT INTO `tplay_area` VALUES (1826, '市辖区', '430601', '430600');
INSERT INTO `tplay_area` VALUES (1827, '岳阳楼区', '430602', '430600');
INSERT INTO `tplay_area` VALUES (1828, '云溪区', '430603', '430600');
INSERT INTO `tplay_area` VALUES (1829, '君山区', '430611', '430600');
INSERT INTO `tplay_area` VALUES (1830, '岳阳县', '430621', '430600');
INSERT INTO `tplay_area` VALUES (1831, '华容县', '430623', '430600');
INSERT INTO `tplay_area` VALUES (1832, '湘阴县', '430624', '430600');
INSERT INTO `tplay_area` VALUES (1833, '平江县', '430626', '430600');
INSERT INTO `tplay_area` VALUES (1834, '汨罗市', '430681', '430600');
INSERT INTO `tplay_area` VALUES (1835, '临湘市', '430682', '430600');
INSERT INTO `tplay_area` VALUES (1836, '市辖区', '430701', '430700');
INSERT INTO `tplay_area` VALUES (1837, '武陵区', '430702', '430700');
INSERT INTO `tplay_area` VALUES (1838, '鼎城区', '430703', '430700');
INSERT INTO `tplay_area` VALUES (1839, '安乡县', '430721', '430700');
INSERT INTO `tplay_area` VALUES (1840, '汉寿县', '430722', '430700');
INSERT INTO `tplay_area` VALUES (1841, '澧县', '430723', '430700');
INSERT INTO `tplay_area` VALUES (1842, '临澧县', '430724', '430700');
INSERT INTO `tplay_area` VALUES (1843, '桃源县', '430725', '430700');
INSERT INTO `tplay_area` VALUES (1844, '石门县', '430726', '430700');
INSERT INTO `tplay_area` VALUES (1845, '津市市', '430781', '430700');
INSERT INTO `tplay_area` VALUES (1846, '市辖区', '430801', '430800');
INSERT INTO `tplay_area` VALUES (1847, '永定区', '430802', '430800');
INSERT INTO `tplay_area` VALUES (1848, '武陵源区', '430811', '430800');
INSERT INTO `tplay_area` VALUES (1849, '慈利县', '430821', '430800');
INSERT INTO `tplay_area` VALUES (1850, '桑植县', '430822', '430800');
INSERT INTO `tplay_area` VALUES (1851, '市辖区', '430901', '430900');
INSERT INTO `tplay_area` VALUES (1852, '资阳区', '430902', '430900');
INSERT INTO `tplay_area` VALUES (1853, '赫山区', '430903', '430900');
INSERT INTO `tplay_area` VALUES (1854, '南县', '430921', '430900');
INSERT INTO `tplay_area` VALUES (1855, '桃江县', '430922', '430900');
INSERT INTO `tplay_area` VALUES (1856, '安化县', '430923', '430900');
INSERT INTO `tplay_area` VALUES (1857, '沅江市', '430981', '430900');
INSERT INTO `tplay_area` VALUES (1858, '市辖区', '431001', '431000');
INSERT INTO `tplay_area` VALUES (1859, '北湖区', '431002', '431000');
INSERT INTO `tplay_area` VALUES (1860, '苏仙区', '431003', '431000');
INSERT INTO `tplay_area` VALUES (1861, '桂阳县', '431021', '431000');
INSERT INTO `tplay_area` VALUES (1862, '宜章县', '431022', '431000');
INSERT INTO `tplay_area` VALUES (1863, '永兴县', '431023', '431000');
INSERT INTO `tplay_area` VALUES (1864, '嘉禾县', '431024', '431000');
INSERT INTO `tplay_area` VALUES (1865, '临武县', '431025', '431000');
INSERT INTO `tplay_area` VALUES (1866, '汝城县', '431026', '431000');
INSERT INTO `tplay_area` VALUES (1867, '桂东县', '431027', '431000');
INSERT INTO `tplay_area` VALUES (1868, '安仁县', '431028', '431000');
INSERT INTO `tplay_area` VALUES (1869, '资兴市', '431081', '431000');
INSERT INTO `tplay_area` VALUES (1870, '市辖区', '431101', '431100');
INSERT INTO `tplay_area` VALUES (1871, '零陵区', '431102', '431100');
INSERT INTO `tplay_area` VALUES (1872, '冷水滩区', '431103', '431100');
INSERT INTO `tplay_area` VALUES (1873, '祁阳县', '431121', '431100');
INSERT INTO `tplay_area` VALUES (1874, '东安县', '431122', '431100');
INSERT INTO `tplay_area` VALUES (1875, '双牌县', '431123', '431100');
INSERT INTO `tplay_area` VALUES (1876, '道县', '431124', '431100');
INSERT INTO `tplay_area` VALUES (1877, '江永县', '431125', '431100');
INSERT INTO `tplay_area` VALUES (1878, '宁远县', '431126', '431100');
INSERT INTO `tplay_area` VALUES (1879, '蓝山县', '431127', '431100');
INSERT INTO `tplay_area` VALUES (1880, '新田县', '431128', '431100');
INSERT INTO `tplay_area` VALUES (1881, '江华瑶族自治县', '431129', '431100');
INSERT INTO `tplay_area` VALUES (1882, '市辖区', '431201', '431200');
INSERT INTO `tplay_area` VALUES (1883, '鹤城区', '431202', '431200');
INSERT INTO `tplay_area` VALUES (1884, '中方县', '431221', '431200');
INSERT INTO `tplay_area` VALUES (1885, '沅陵县', '431222', '431200');
INSERT INTO `tplay_area` VALUES (1886, '辰溪县', '431223', '431200');
INSERT INTO `tplay_area` VALUES (1887, '溆浦县', '431224', '431200');
INSERT INTO `tplay_area` VALUES (1888, '会同县', '431225', '431200');
INSERT INTO `tplay_area` VALUES (1889, '麻阳苗族自治县', '431226', '431200');
INSERT INTO `tplay_area` VALUES (1890, '新晃侗族自治县', '431227', '431200');
INSERT INTO `tplay_area` VALUES (1891, '芷江侗族自治县', '431228', '431200');
INSERT INTO `tplay_area` VALUES (1892, '靖州苗族侗族自治县', '431229', '431200');
INSERT INTO `tplay_area` VALUES (1893, '通道侗族自治县', '431230', '431200');
INSERT INTO `tplay_area` VALUES (1894, '洪江市', '431281', '431200');
INSERT INTO `tplay_area` VALUES (1895, '市辖区', '431301', '431300');
INSERT INTO `tplay_area` VALUES (1896, '娄星区', '431302', '431300');
INSERT INTO `tplay_area` VALUES (1897, '双峰县', '431321', '431300');
INSERT INTO `tplay_area` VALUES (1898, '新化县', '431322', '431300');
INSERT INTO `tplay_area` VALUES (1899, '冷水江市', '431381', '431300');
INSERT INTO `tplay_area` VALUES (1900, '涟源市', '431382', '431300');
INSERT INTO `tplay_area` VALUES (1901, '吉首市', '433101', '433100');
INSERT INTO `tplay_area` VALUES (1902, '泸溪县', '433122', '433100');
INSERT INTO `tplay_area` VALUES (1903, '凤凰县', '433123', '433100');
INSERT INTO `tplay_area` VALUES (1904, '花垣县', '433124', '433100');
INSERT INTO `tplay_area` VALUES (1905, '保靖县', '433125', '433100');
INSERT INTO `tplay_area` VALUES (1906, '古丈县', '433126', '433100');
INSERT INTO `tplay_area` VALUES (1907, '永顺县', '433127', '433100');
INSERT INTO `tplay_area` VALUES (1908, '龙山县', '433130', '433100');
INSERT INTO `tplay_area` VALUES (1909, '市辖区', '440101', '440100');
INSERT INTO `tplay_area` VALUES (1910, '荔湾区', '440103', '440100');
INSERT INTO `tplay_area` VALUES (1911, '越秀区', '440104', '440100');
INSERT INTO `tplay_area` VALUES (1912, '海珠区', '440105', '440100');
INSERT INTO `tplay_area` VALUES (1913, '天河区', '440106', '440100');
INSERT INTO `tplay_area` VALUES (1914, '白云区', '440111', '440100');
INSERT INTO `tplay_area` VALUES (1915, '黄埔区', '440112', '440100');
INSERT INTO `tplay_area` VALUES (1916, '番禺区', '440113', '440100');
INSERT INTO `tplay_area` VALUES (1917, '花都区', '440114', '440100');
INSERT INTO `tplay_area` VALUES (1918, '南沙区', '440115', '440100');
INSERT INTO `tplay_area` VALUES (1919, '从化区', '440117', '440100');
INSERT INTO `tplay_area` VALUES (1920, '增城区', '440118', '440100');
INSERT INTO `tplay_area` VALUES (1921, '市辖区', '440201', '440200');
INSERT INTO `tplay_area` VALUES (1922, '武江区', '440203', '440200');
INSERT INTO `tplay_area` VALUES (1923, '浈江区', '440204', '440200');
INSERT INTO `tplay_area` VALUES (1924, '曲江区', '440205', '440200');
INSERT INTO `tplay_area` VALUES (1925, '始兴县', '440222', '440200');
INSERT INTO `tplay_area` VALUES (1926, '仁化县', '440224', '440200');
INSERT INTO `tplay_area` VALUES (1927, '翁源县', '440229', '440200');
INSERT INTO `tplay_area` VALUES (1928, '乳源瑶族自治县', '440232', '440200');
INSERT INTO `tplay_area` VALUES (1929, '新丰县', '440233', '440200');
INSERT INTO `tplay_area` VALUES (1930, '乐昌市', '440281', '440200');
INSERT INTO `tplay_area` VALUES (1931, '南雄市', '440282', '440200');
INSERT INTO `tplay_area` VALUES (1932, '市辖区', '440301', '440300');
INSERT INTO `tplay_area` VALUES (1933, '罗湖区', '440303', '440300');
INSERT INTO `tplay_area` VALUES (1934, '福田区', '440304', '440300');
INSERT INTO `tplay_area` VALUES (1935, '南山区', '440305', '440300');
INSERT INTO `tplay_area` VALUES (1936, '宝安区', '440306', '440300');
INSERT INTO `tplay_area` VALUES (1937, '龙岗区', '440307', '440300');
INSERT INTO `tplay_area` VALUES (1938, '盐田区', '440308', '440300');
INSERT INTO `tplay_area` VALUES (1939, '市辖区', '440401', '440400');
INSERT INTO `tplay_area` VALUES (1940, '香洲区', '440402', '440400');
INSERT INTO `tplay_area` VALUES (1941, '斗门区', '440403', '440400');
INSERT INTO `tplay_area` VALUES (1942, '金湾区', '440404', '440400');
INSERT INTO `tplay_area` VALUES (1943, '市辖区', '440501', '440500');
INSERT INTO `tplay_area` VALUES (1944, '龙湖区', '440507', '440500');
INSERT INTO `tplay_area` VALUES (1945, '金平区', '440511', '440500');
INSERT INTO `tplay_area` VALUES (1946, '濠江区', '440512', '440500');
INSERT INTO `tplay_area` VALUES (1947, '潮阳区', '440513', '440500');
INSERT INTO `tplay_area` VALUES (1948, '潮南区', '440514', '440500');
INSERT INTO `tplay_area` VALUES (1949, '澄海区', '440515', '440500');
INSERT INTO `tplay_area` VALUES (1950, '南澳县', '440523', '440500');
INSERT INTO `tplay_area` VALUES (1951, '市辖区', '440601', '440600');
INSERT INTO `tplay_area` VALUES (1952, '禅城区', '440604', '440600');
INSERT INTO `tplay_area` VALUES (1953, '南海区', '440605', '440600');
INSERT INTO `tplay_area` VALUES (1954, '顺德区', '440606', '440600');
INSERT INTO `tplay_area` VALUES (1955, '三水区', '440607', '440600');
INSERT INTO `tplay_area` VALUES (1956, '高明区', '440608', '440600');
INSERT INTO `tplay_area` VALUES (1957, '市辖区', '440701', '440700');
INSERT INTO `tplay_area` VALUES (1958, '蓬江区', '440703', '440700');
INSERT INTO `tplay_area` VALUES (1959, '江海区', '440704', '440700');
INSERT INTO `tplay_area` VALUES (1960, '新会区', '440705', '440700');
INSERT INTO `tplay_area` VALUES (1961, '台山市', '440781', '440700');
INSERT INTO `tplay_area` VALUES (1962, '开平市', '440783', '440700');
INSERT INTO `tplay_area` VALUES (1963, '鹤山市', '440784', '440700');
INSERT INTO `tplay_area` VALUES (1964, '恩平市', '440785', '440700');
INSERT INTO `tplay_area` VALUES (1965, '市辖区', '440801', '440800');
INSERT INTO `tplay_area` VALUES (1966, '赤坎区', '440802', '440800');
INSERT INTO `tplay_area` VALUES (1967, '霞山区', '440803', '440800');
INSERT INTO `tplay_area` VALUES (1968, '坡头区', '440804', '440800');
INSERT INTO `tplay_area` VALUES (1969, '麻章区', '440811', '440800');
INSERT INTO `tplay_area` VALUES (1970, '遂溪县', '440823', '440800');
INSERT INTO `tplay_area` VALUES (1971, '徐闻县', '440825', '440800');
INSERT INTO `tplay_area` VALUES (1972, '廉江市', '440881', '440800');
INSERT INTO `tplay_area` VALUES (1973, '雷州市', '440882', '440800');
INSERT INTO `tplay_area` VALUES (1974, '吴川市', '440883', '440800');
INSERT INTO `tplay_area` VALUES (1975, '市辖区', '440901', '440900');
INSERT INTO `tplay_area` VALUES (1976, '茂南区', '440902', '440900');
INSERT INTO `tplay_area` VALUES (1977, '电白区', '440904', '440900');
INSERT INTO `tplay_area` VALUES (1978, '高州市', '440981', '440900');
INSERT INTO `tplay_area` VALUES (1979, '化州市', '440982', '440900');
INSERT INTO `tplay_area` VALUES (1980, '信宜市', '440983', '440900');
INSERT INTO `tplay_area` VALUES (1981, '市辖区', '441201', '441200');
INSERT INTO `tplay_area` VALUES (1982, '端州区', '441202', '441200');
INSERT INTO `tplay_area` VALUES (1983, '鼎湖区', '441203', '441200');
INSERT INTO `tplay_area` VALUES (1984, '高要区', '441204', '441200');
INSERT INTO `tplay_area` VALUES (1985, '广宁县', '441223', '441200');
INSERT INTO `tplay_area` VALUES (1986, '怀集县', '441224', '441200');
INSERT INTO `tplay_area` VALUES (1987, '封开县', '441225', '441200');
INSERT INTO `tplay_area` VALUES (1988, '德庆县', '441226', '441200');
INSERT INTO `tplay_area` VALUES (1989, '四会市', '441284', '441200');
INSERT INTO `tplay_area` VALUES (1990, '市辖区', '441301', '441300');
INSERT INTO `tplay_area` VALUES (1991, '惠城区', '441302', '441300');
INSERT INTO `tplay_area` VALUES (1992, '惠阳区', '441303', '441300');
INSERT INTO `tplay_area` VALUES (1993, '博罗县', '441322', '441300');
INSERT INTO `tplay_area` VALUES (1994, '惠东县', '441323', '441300');
INSERT INTO `tplay_area` VALUES (1995, '龙门县', '441324', '441300');
INSERT INTO `tplay_area` VALUES (1996, '市辖区', '441401', '441400');
INSERT INTO `tplay_area` VALUES (1997, '梅江区', '441402', '441400');
INSERT INTO `tplay_area` VALUES (1998, '梅县区', '441403', '441400');
INSERT INTO `tplay_area` VALUES (1999, '大埔县', '441422', '441400');
INSERT INTO `tplay_area` VALUES (2000, '丰顺县', '441423', '441400');
INSERT INTO `tplay_area` VALUES (2001, '五华县', '441424', '441400');
INSERT INTO `tplay_area` VALUES (2002, '平远县', '441426', '441400');
INSERT INTO `tplay_area` VALUES (2003, '蕉岭县', '441427', '441400');
INSERT INTO `tplay_area` VALUES (2004, '兴宁市', '441481', '441400');
INSERT INTO `tplay_area` VALUES (2005, '市辖区', '441501', '441500');
INSERT INTO `tplay_area` VALUES (2006, '城区', '441502', '441500');
INSERT INTO `tplay_area` VALUES (2007, '海丰县', '441521', '441500');
INSERT INTO `tplay_area` VALUES (2008, '陆河县', '441523', '441500');
INSERT INTO `tplay_area` VALUES (2009, '陆丰市', '441581', '441500');
INSERT INTO `tplay_area` VALUES (2010, '市辖区', '441601', '441600');
INSERT INTO `tplay_area` VALUES (2011, '源城区', '441602', '441600');
INSERT INTO `tplay_area` VALUES (2012, '紫金县', '441621', '441600');
INSERT INTO `tplay_area` VALUES (2013, '龙川县', '441622', '441600');
INSERT INTO `tplay_area` VALUES (2014, '连平县', '441623', '441600');
INSERT INTO `tplay_area` VALUES (2015, '和平县', '441624', '441600');
INSERT INTO `tplay_area` VALUES (2016, '东源县', '441625', '441600');
INSERT INTO `tplay_area` VALUES (2017, '市辖区', '441701', '441700');
INSERT INTO `tplay_area` VALUES (2018, '江城区', '441702', '441700');
INSERT INTO `tplay_area` VALUES (2019, '阳东区', '441704', '441700');
INSERT INTO `tplay_area` VALUES (2020, '阳西县', '441721', '441700');
INSERT INTO `tplay_area` VALUES (2021, '阳春市', '441781', '441700');
INSERT INTO `tplay_area` VALUES (2022, '市辖区', '441801', '441800');
INSERT INTO `tplay_area` VALUES (2023, '清城区', '441802', '441800');
INSERT INTO `tplay_area` VALUES (2024, '清新区', '441803', '441800');
INSERT INTO `tplay_area` VALUES (2025, '佛冈县', '441821', '441800');
INSERT INTO `tplay_area` VALUES (2026, '阳山县', '441823', '441800');
INSERT INTO `tplay_area` VALUES (2027, '连山壮族瑶族自治县', '441825', '441800');
INSERT INTO `tplay_area` VALUES (2028, '连南瑶族自治县', '441826', '441800');
INSERT INTO `tplay_area` VALUES (2029, '英德市', '441881', '441800');
INSERT INTO `tplay_area` VALUES (2030, '连州市', '441882', '441800');
INSERT INTO `tplay_area` VALUES (2031, '市辖区', '445101', '445100');
INSERT INTO `tplay_area` VALUES (2032, '湘桥区', '445102', '445100');
INSERT INTO `tplay_area` VALUES (2033, '潮安区', '445103', '445100');
INSERT INTO `tplay_area` VALUES (2034, '饶平县', '445122', '445100');
INSERT INTO `tplay_area` VALUES (2035, '市辖区', '445201', '445200');
INSERT INTO `tplay_area` VALUES (2036, '榕城区', '445202', '445200');
INSERT INTO `tplay_area` VALUES (2037, '揭东区', '445203', '445200');
INSERT INTO `tplay_area` VALUES (2038, '揭西县', '445222', '445200');
INSERT INTO `tplay_area` VALUES (2039, '惠来县', '445224', '445200');
INSERT INTO `tplay_area` VALUES (2040, '普宁市', '445281', '445200');
INSERT INTO `tplay_area` VALUES (2041, '市辖区', '445301', '445300');
INSERT INTO `tplay_area` VALUES (2042, '云城区', '445302', '445300');
INSERT INTO `tplay_area` VALUES (2043, '云安区', '445303', '445300');
INSERT INTO `tplay_area` VALUES (2044, '新兴县', '445321', '445300');
INSERT INTO `tplay_area` VALUES (2045, '郁南县', '445322', '445300');
INSERT INTO `tplay_area` VALUES (2046, '罗定市', '445381', '445300');
INSERT INTO `tplay_area` VALUES (2047, '市辖区', '450101', '450100');
INSERT INTO `tplay_area` VALUES (2048, '兴宁区', '450102', '450100');
INSERT INTO `tplay_area` VALUES (2049, '青秀区', '450103', '450100');
INSERT INTO `tplay_area` VALUES (2050, '江南区', '450105', '450100');
INSERT INTO `tplay_area` VALUES (2051, '西乡塘区', '450107', '450100');
INSERT INTO `tplay_area` VALUES (2052, '良庆区', '450108', '450100');
INSERT INTO `tplay_area` VALUES (2053, '邕宁区', '450109', '450100');
INSERT INTO `tplay_area` VALUES (2054, '武鸣区', '450110', '450100');
INSERT INTO `tplay_area` VALUES (2055, '隆安县', '450123', '450100');
INSERT INTO `tplay_area` VALUES (2056, '马山县', '450124', '450100');
INSERT INTO `tplay_area` VALUES (2057, '上林县', '450125', '450100');
INSERT INTO `tplay_area` VALUES (2058, '宾阳县', '450126', '450100');
INSERT INTO `tplay_area` VALUES (2059, '横县', '450127', '450100');
INSERT INTO `tplay_area` VALUES (2060, '市辖区', '450201', '450200');
INSERT INTO `tplay_area` VALUES (2061, '城中区', '450202', '450200');
INSERT INTO `tplay_area` VALUES (2062, '鱼峰区', '450203', '450200');
INSERT INTO `tplay_area` VALUES (2063, '柳南区', '450204', '450200');
INSERT INTO `tplay_area` VALUES (2064, '柳北区', '450205', '450200');
INSERT INTO `tplay_area` VALUES (2065, '柳江区', '450206', '450200');
INSERT INTO `tplay_area` VALUES (2066, '柳城县', '450222', '450200');
INSERT INTO `tplay_area` VALUES (2067, '鹿寨县', '450223', '450200');
INSERT INTO `tplay_area` VALUES (2068, '融安县', '450224', '450200');
INSERT INTO `tplay_area` VALUES (2069, '融水苗族自治县', '450225', '450200');
INSERT INTO `tplay_area` VALUES (2070, '三江侗族自治县', '450226', '450200');
INSERT INTO `tplay_area` VALUES (2071, '市辖区', '450301', '450300');
INSERT INTO `tplay_area` VALUES (2072, '秀峰区', '450302', '450300');
INSERT INTO `tplay_area` VALUES (2073, '叠彩区', '450303', '450300');
INSERT INTO `tplay_area` VALUES (2074, '象山区', '450304', '450300');
INSERT INTO `tplay_area` VALUES (2075, '七星区', '450305', '450300');
INSERT INTO `tplay_area` VALUES (2076, '雁山区', '450311', '450300');
INSERT INTO `tplay_area` VALUES (2077, '临桂区', '450312', '450300');
INSERT INTO `tplay_area` VALUES (2078, '阳朔县', '450321', '450300');
INSERT INTO `tplay_area` VALUES (2079, '灵川县', '450323', '450300');
INSERT INTO `tplay_area` VALUES (2080, '全州县', '450324', '450300');
INSERT INTO `tplay_area` VALUES (2081, '兴安县', '450325', '450300');
INSERT INTO `tplay_area` VALUES (2082, '永福县', '450326', '450300');
INSERT INTO `tplay_area` VALUES (2083, '灌阳县', '450327', '450300');
INSERT INTO `tplay_area` VALUES (2084, '龙胜各族自治县', '450328', '450300');
INSERT INTO `tplay_area` VALUES (2085, '资源县', '450329', '450300');
INSERT INTO `tplay_area` VALUES (2086, '平乐县', '450330', '450300');
INSERT INTO `tplay_area` VALUES (2087, '荔浦县', '450331', '450300');
INSERT INTO `tplay_area` VALUES (2088, '恭城瑶族自治县', '450332', '450300');
INSERT INTO `tplay_area` VALUES (2089, '市辖区', '450401', '450400');
INSERT INTO `tplay_area` VALUES (2090, '万秀区', '450403', '450400');
INSERT INTO `tplay_area` VALUES (2091, '长洲区', '450405', '450400');
INSERT INTO `tplay_area` VALUES (2092, '龙圩区', '450406', '450400');
INSERT INTO `tplay_area` VALUES (2093, '苍梧县', '450421', '450400');
INSERT INTO `tplay_area` VALUES (2094, '藤县', '450422', '450400');
INSERT INTO `tplay_area` VALUES (2095, '蒙山县', '450423', '450400');
INSERT INTO `tplay_area` VALUES (2096, '岑溪市', '450481', '450400');
INSERT INTO `tplay_area` VALUES (2097, '市辖区', '450501', '450500');
INSERT INTO `tplay_area` VALUES (2098, '海城区', '450502', '450500');
INSERT INTO `tplay_area` VALUES (2099, '银海区', '450503', '450500');
INSERT INTO `tplay_area` VALUES (2100, '铁山港区', '450512', '450500');
INSERT INTO `tplay_area` VALUES (2101, '合浦县', '450521', '450500');
INSERT INTO `tplay_area` VALUES (2102, '市辖区', '450601', '450600');
INSERT INTO `tplay_area` VALUES (2103, '港口区', '450602', '450600');
INSERT INTO `tplay_area` VALUES (2104, '防城区', '450603', '450600');
INSERT INTO `tplay_area` VALUES (2105, '上思县', '450621', '450600');
INSERT INTO `tplay_area` VALUES (2106, '东兴市', '450681', '450600');
INSERT INTO `tplay_area` VALUES (2107, '市辖区', '450701', '450700');
INSERT INTO `tplay_area` VALUES (2108, '钦南区', '450702', '450700');
INSERT INTO `tplay_area` VALUES (2109, '钦北区', '450703', '450700');
INSERT INTO `tplay_area` VALUES (2110, '灵山县', '450721', '450700');
INSERT INTO `tplay_area` VALUES (2111, '浦北县', '450722', '450700');
INSERT INTO `tplay_area` VALUES (2112, '市辖区', '450801', '450800');
INSERT INTO `tplay_area` VALUES (2113, '港北区', '450802', '450800');
INSERT INTO `tplay_area` VALUES (2114, '港南区', '450803', '450800');
INSERT INTO `tplay_area` VALUES (2115, '覃塘区', '450804', '450800');
INSERT INTO `tplay_area` VALUES (2116, '平南县', '450821', '450800');
INSERT INTO `tplay_area` VALUES (2117, '桂平市', '450881', '450800');
INSERT INTO `tplay_area` VALUES (2118, '市辖区', '450901', '450900');
INSERT INTO `tplay_area` VALUES (2119, '玉州区', '450902', '450900');
INSERT INTO `tplay_area` VALUES (2120, '福绵区', '450903', '450900');
INSERT INTO `tplay_area` VALUES (2121, '容县', '450921', '450900');
INSERT INTO `tplay_area` VALUES (2122, '陆川县', '450922', '450900');
INSERT INTO `tplay_area` VALUES (2123, '博白县', '450923', '450900');
INSERT INTO `tplay_area` VALUES (2124, '兴业县', '450924', '450900');
INSERT INTO `tplay_area` VALUES (2125, '北流市', '450981', '450900');
INSERT INTO `tplay_area` VALUES (2126, '市辖区', '451001', '451000');
INSERT INTO `tplay_area` VALUES (2127, '右江区', '451002', '451000');
INSERT INTO `tplay_area` VALUES (2128, '田阳县', '451021', '451000');
INSERT INTO `tplay_area` VALUES (2129, '田东县', '451022', '451000');
INSERT INTO `tplay_area` VALUES (2130, '平果县', '451023', '451000');
INSERT INTO `tplay_area` VALUES (2131, '德保县', '451024', '451000');
INSERT INTO `tplay_area` VALUES (2132, '那坡县', '451026', '451000');
INSERT INTO `tplay_area` VALUES (2133, '凌云县', '451027', '451000');
INSERT INTO `tplay_area` VALUES (2134, '乐业县', '451028', '451000');
INSERT INTO `tplay_area` VALUES (2135, '田林县', '451029', '451000');
INSERT INTO `tplay_area` VALUES (2136, '西林县', '451030', '451000');
INSERT INTO `tplay_area` VALUES (2137, '隆林各族自治县', '451031', '451000');
INSERT INTO `tplay_area` VALUES (2138, '靖西市', '451081', '451000');
INSERT INTO `tplay_area` VALUES (2139, '市辖区', '451101', '451100');
INSERT INTO `tplay_area` VALUES (2140, '八步区', '451102', '451100');
INSERT INTO `tplay_area` VALUES (2141, '平桂区', '451103', '451100');
INSERT INTO `tplay_area` VALUES (2142, '昭平县', '451121', '451100');
INSERT INTO `tplay_area` VALUES (2143, '钟山县', '451122', '451100');
INSERT INTO `tplay_area` VALUES (2144, '富川瑶族自治县', '451123', '451100');
INSERT INTO `tplay_area` VALUES (2145, '市辖区', '451201', '451200');
INSERT INTO `tplay_area` VALUES (2146, '金城江区', '451202', '451200');
INSERT INTO `tplay_area` VALUES (2147, '南丹县', '451221', '451200');
INSERT INTO `tplay_area` VALUES (2148, '天峨县', '451222', '451200');
INSERT INTO `tplay_area` VALUES (2149, '凤山县', '451223', '451200');
INSERT INTO `tplay_area` VALUES (2150, '东兰县', '451224', '451200');
INSERT INTO `tplay_area` VALUES (2151, '罗城仫佬族自治县', '451225', '451200');
INSERT INTO `tplay_area` VALUES (2152, '环江毛南族自治县', '451226', '451200');
INSERT INTO `tplay_area` VALUES (2153, '巴马瑶族自治县', '451227', '451200');
INSERT INTO `tplay_area` VALUES (2154, '都安瑶族自治县', '451228', '451200');
INSERT INTO `tplay_area` VALUES (2155, '大化瑶族自治县', '451229', '451200');
INSERT INTO `tplay_area` VALUES (2156, '宜州市', '451281', '451200');
INSERT INTO `tplay_area` VALUES (2157, '市辖区', '451301', '451300');
INSERT INTO `tplay_area` VALUES (2158, '兴宾区', '451302', '451300');
INSERT INTO `tplay_area` VALUES (2159, '忻城县', '451321', '451300');
INSERT INTO `tplay_area` VALUES (2160, '象州县', '451322', '451300');
INSERT INTO `tplay_area` VALUES (2161, '武宣县', '451323', '451300');
INSERT INTO `tplay_area` VALUES (2162, '金秀瑶族自治县', '451324', '451300');
INSERT INTO `tplay_area` VALUES (2163, '合山市', '451381', '451300');
INSERT INTO `tplay_area` VALUES (2164, '市辖区', '451401', '451400');
INSERT INTO `tplay_area` VALUES (2165, '江州区', '451402', '451400');
INSERT INTO `tplay_area` VALUES (2166, '扶绥县', '451421', '451400');
INSERT INTO `tplay_area` VALUES (2167, '宁明县', '451422', '451400');
INSERT INTO `tplay_area` VALUES (2168, '龙州县', '451423', '451400');
INSERT INTO `tplay_area` VALUES (2169, '大新县', '451424', '451400');
INSERT INTO `tplay_area` VALUES (2170, '天等县', '451425', '451400');
INSERT INTO `tplay_area` VALUES (2171, '凭祥市', '451481', '451400');
INSERT INTO `tplay_area` VALUES (2172, '市辖区', '460101', '460100');
INSERT INTO `tplay_area` VALUES (2173, '秀英区', '460105', '460100');
INSERT INTO `tplay_area` VALUES (2174, '龙华区', '460106', '460100');
INSERT INTO `tplay_area` VALUES (2175, '琼山区', '460107', '460100');
INSERT INTO `tplay_area` VALUES (2176, '美兰区', '460108', '460100');
INSERT INTO `tplay_area` VALUES (2177, '市辖区', '460201', '460200');
INSERT INTO `tplay_area` VALUES (2178, '海棠区', '460202', '460200');
INSERT INTO `tplay_area` VALUES (2179, '吉阳区', '460203', '460200');
INSERT INTO `tplay_area` VALUES (2180, '天涯区', '460204', '460200');
INSERT INTO `tplay_area` VALUES (2181, '崖州区', '460205', '460200');
INSERT INTO `tplay_area` VALUES (2182, '五指山市', '469001', '469000');
INSERT INTO `tplay_area` VALUES (2183, '琼海市', '469002', '469000');
INSERT INTO `tplay_area` VALUES (2184, '文昌市', '469005', '469000');
INSERT INTO `tplay_area` VALUES (2185, '万宁市', '469006', '469000');
INSERT INTO `tplay_area` VALUES (2186, '东方市', '469007', '469000');
INSERT INTO `tplay_area` VALUES (2187, '定安县', '469021', '469000');
INSERT INTO `tplay_area` VALUES (2188, '屯昌县', '469022', '469000');
INSERT INTO `tplay_area` VALUES (2189, '澄迈县', '469023', '469000');
INSERT INTO `tplay_area` VALUES (2190, '临高县', '469024', '469000');
INSERT INTO `tplay_area` VALUES (2191, '白沙黎族自治县', '469025', '469000');
INSERT INTO `tplay_area` VALUES (2192, '昌江黎族自治县', '469026', '469000');
INSERT INTO `tplay_area` VALUES (2193, '乐东黎族自治县', '469027', '469000');
INSERT INTO `tplay_area` VALUES (2194, '陵水黎族自治县', '469028', '469000');
INSERT INTO `tplay_area` VALUES (2195, '保亭黎族苗族自治县', '469029', '469000');
INSERT INTO `tplay_area` VALUES (2196, '琼中黎族苗族自治县', '469030', '469000');
INSERT INTO `tplay_area` VALUES (2197, '万州区', '500101', '500100');
INSERT INTO `tplay_area` VALUES (2198, '涪陵区', '500102', '500100');
INSERT INTO `tplay_area` VALUES (2199, '渝中区', '500103', '500100');
INSERT INTO `tplay_area` VALUES (2200, '大渡口区', '500104', '500100');
INSERT INTO `tplay_area` VALUES (2201, '江北区', '500105', '500100');
INSERT INTO `tplay_area` VALUES (2202, '沙坪坝区', '500106', '500100');
INSERT INTO `tplay_area` VALUES (2203, '九龙坡区', '500107', '500100');
INSERT INTO `tplay_area` VALUES (2204, '南岸区', '500108', '500100');
INSERT INTO `tplay_area` VALUES (2205, '北碚区', '500109', '500100');
INSERT INTO `tplay_area` VALUES (2206, '綦江区', '500110', '500100');
INSERT INTO `tplay_area` VALUES (2207, '大足区', '500111', '500100');
INSERT INTO `tplay_area` VALUES (2208, '渝北区', '500112', '500100');
INSERT INTO `tplay_area` VALUES (2209, '巴南区', '500113', '500100');
INSERT INTO `tplay_area` VALUES (2210, '黔江区', '500114', '500100');
INSERT INTO `tplay_area` VALUES (2211, '长寿区', '500115', '500100');
INSERT INTO `tplay_area` VALUES (2212, '江津区', '500116', '500100');
INSERT INTO `tplay_area` VALUES (2213, '合川区', '500117', '500100');
INSERT INTO `tplay_area` VALUES (2214, '永川区', '500118', '500100');
INSERT INTO `tplay_area` VALUES (2215, '南川区', '500119', '500100');
INSERT INTO `tplay_area` VALUES (2216, '璧山区', '500120', '500100');
INSERT INTO `tplay_area` VALUES (2217, '铜梁区', '500151', '500100');
INSERT INTO `tplay_area` VALUES (2218, '潼南区', '500152', '500100');
INSERT INTO `tplay_area` VALUES (2219, '荣昌区', '500153', '500100');
INSERT INTO `tplay_area` VALUES (2220, '开州区', '500154', '500100');
INSERT INTO `tplay_area` VALUES (2221, '梁平县', '500228', '500200');
INSERT INTO `tplay_area` VALUES (2222, '城口县', '500229', '500200');
INSERT INTO `tplay_area` VALUES (2223, '丰都县', '500230', '500200');
INSERT INTO `tplay_area` VALUES (2224, '垫江县', '500231', '500200');
INSERT INTO `tplay_area` VALUES (2225, '武隆县', '500232', '500200');
INSERT INTO `tplay_area` VALUES (2226, '忠县', '500233', '500200');
INSERT INTO `tplay_area` VALUES (2227, '云阳县', '500235', '500200');
INSERT INTO `tplay_area` VALUES (2228, '奉节县', '500236', '500200');
INSERT INTO `tplay_area` VALUES (2229, '巫山县', '500237', '500200');
INSERT INTO `tplay_area` VALUES (2230, '巫溪县', '500238', '500200');
INSERT INTO `tplay_area` VALUES (2231, '石柱土家族自治县', '500240', '500200');
INSERT INTO `tplay_area` VALUES (2232, '秀山土家族苗族自治县', '500241', '500200');
INSERT INTO `tplay_area` VALUES (2233, '酉阳土家族苗族自治县', '500242', '500200');
INSERT INTO `tplay_area` VALUES (2234, '彭水苗族土家族自治县', '500243', '500200');
INSERT INTO `tplay_area` VALUES (2235, '市辖区', '510101', '510100');
INSERT INTO `tplay_area` VALUES (2236, '锦江区', '510104', '510100');
INSERT INTO `tplay_area` VALUES (2237, '青羊区', '510105', '510100');
INSERT INTO `tplay_area` VALUES (2238, '金牛区', '510106', '510100');
INSERT INTO `tplay_area` VALUES (2239, '武侯区', '510107', '510100');
INSERT INTO `tplay_area` VALUES (2240, '成华区', '510108', '510100');
INSERT INTO `tplay_area` VALUES (2241, '龙泉驿区', '510112', '510100');
INSERT INTO `tplay_area` VALUES (2242, '青白江区', '510113', '510100');
INSERT INTO `tplay_area` VALUES (2243, '新都区', '510114', '510100');
INSERT INTO `tplay_area` VALUES (2244, '温江区', '510115', '510100');
INSERT INTO `tplay_area` VALUES (2245, '双流区', '510116', '510100');
INSERT INTO `tplay_area` VALUES (2246, '金堂县', '510121', '510100');
INSERT INTO `tplay_area` VALUES (2247, '郫县', '510124', '510100');
INSERT INTO `tplay_area` VALUES (2248, '大邑县', '510129', '510100');
INSERT INTO `tplay_area` VALUES (2249, '蒲江县', '510131', '510100');
INSERT INTO `tplay_area` VALUES (2250, '新津县', '510132', '510100');
INSERT INTO `tplay_area` VALUES (2251, '都江堰市', '510181', '510100');
INSERT INTO `tplay_area` VALUES (2252, '彭州市', '510182', '510100');
INSERT INTO `tplay_area` VALUES (2253, '邛崃市', '510183', '510100');
INSERT INTO `tplay_area` VALUES (2254, '崇州市', '510184', '510100');
INSERT INTO `tplay_area` VALUES (2255, '简阳市', '510185', '510100');
INSERT INTO `tplay_area` VALUES (2256, '市辖区', '510301', '510300');
INSERT INTO `tplay_area` VALUES (2257, '自流井区', '510302', '510300');
INSERT INTO `tplay_area` VALUES (2258, '贡井区', '510303', '510300');
INSERT INTO `tplay_area` VALUES (2259, '大安区', '510304', '510300');
INSERT INTO `tplay_area` VALUES (2260, '沿滩区', '510311', '510300');
INSERT INTO `tplay_area` VALUES (2261, '荣县', '510321', '510300');
INSERT INTO `tplay_area` VALUES (2262, '富顺县', '510322', '510300');
INSERT INTO `tplay_area` VALUES (2263, '市辖区', '510401', '510400');
INSERT INTO `tplay_area` VALUES (2264, '东区', '510402', '510400');
INSERT INTO `tplay_area` VALUES (2265, '西区', '510403', '510400');
INSERT INTO `tplay_area` VALUES (2266, '仁和区', '510411', '510400');
INSERT INTO `tplay_area` VALUES (2267, '米易县', '510421', '510400');
INSERT INTO `tplay_area` VALUES (2268, '盐边县', '510422', '510400');
INSERT INTO `tplay_area` VALUES (2269, '市辖区', '510501', '510500');
INSERT INTO `tplay_area` VALUES (2270, '江阳区', '510502', '510500');
INSERT INTO `tplay_area` VALUES (2271, '纳溪区', '510503', '510500');
INSERT INTO `tplay_area` VALUES (2272, '龙马潭区', '510504', '510500');
INSERT INTO `tplay_area` VALUES (2273, '泸县', '510521', '510500');
INSERT INTO `tplay_area` VALUES (2274, '合江县', '510522', '510500');
INSERT INTO `tplay_area` VALUES (2275, '叙永县', '510524', '510500');
INSERT INTO `tplay_area` VALUES (2276, '古蔺县', '510525', '510500');
INSERT INTO `tplay_area` VALUES (2277, '市辖区', '510601', '510600');
INSERT INTO `tplay_area` VALUES (2278, '旌阳区', '510603', '510600');
INSERT INTO `tplay_area` VALUES (2279, '中江县', '510623', '510600');
INSERT INTO `tplay_area` VALUES (2280, '罗江县', '510626', '510600');
INSERT INTO `tplay_area` VALUES (2281, '广汉市', '510681', '510600');
INSERT INTO `tplay_area` VALUES (2282, '什邡市', '510682', '510600');
INSERT INTO `tplay_area` VALUES (2283, '绵竹市', '510683', '510600');
INSERT INTO `tplay_area` VALUES (2284, '市辖区', '510701', '510700');
INSERT INTO `tplay_area` VALUES (2285, '涪城区', '510703', '510700');
INSERT INTO `tplay_area` VALUES (2286, '游仙区', '510704', '510700');
INSERT INTO `tplay_area` VALUES (2287, '安州区', '510705', '510700');
INSERT INTO `tplay_area` VALUES (2288, '三台县', '510722', '510700');
INSERT INTO `tplay_area` VALUES (2289, '盐亭县', '510723', '510700');
INSERT INTO `tplay_area` VALUES (2290, '梓潼县', '510725', '510700');
INSERT INTO `tplay_area` VALUES (2291, '北川羌族自治县', '510726', '510700');
INSERT INTO `tplay_area` VALUES (2292, '平武县', '510727', '510700');
INSERT INTO `tplay_area` VALUES (2293, '江油市', '510781', '510700');
INSERT INTO `tplay_area` VALUES (2294, '市辖区', '510801', '510800');
INSERT INTO `tplay_area` VALUES (2295, '利州区', '510802', '510800');
INSERT INTO `tplay_area` VALUES (2296, '昭化区', '510811', '510800');
INSERT INTO `tplay_area` VALUES (2297, '朝天区', '510812', '510800');
INSERT INTO `tplay_area` VALUES (2298, '旺苍县', '510821', '510800');
INSERT INTO `tplay_area` VALUES (2299, '青川县', '510822', '510800');
INSERT INTO `tplay_area` VALUES (2300, '剑阁县', '510823', '510800');
INSERT INTO `tplay_area` VALUES (2301, '苍溪县', '510824', '510800');
INSERT INTO `tplay_area` VALUES (2302, '市辖区', '510901', '510900');
INSERT INTO `tplay_area` VALUES (2303, '船山区', '510903', '510900');
INSERT INTO `tplay_area` VALUES (2304, '安居区', '510904', '510900');
INSERT INTO `tplay_area` VALUES (2305, '蓬溪县', '510921', '510900');
INSERT INTO `tplay_area` VALUES (2306, '射洪县', '510922', '510900');
INSERT INTO `tplay_area` VALUES (2307, '大英县', '510923', '510900');
INSERT INTO `tplay_area` VALUES (2308, '市辖区', '511001', '511000');
INSERT INTO `tplay_area` VALUES (2309, '市中区', '511002', '511000');
INSERT INTO `tplay_area` VALUES (2310, '东兴区', '511011', '511000');
INSERT INTO `tplay_area` VALUES (2311, '威远县', '511024', '511000');
INSERT INTO `tplay_area` VALUES (2312, '资中县', '511025', '511000');
INSERT INTO `tplay_area` VALUES (2313, '隆昌县', '511028', '511000');
INSERT INTO `tplay_area` VALUES (2314, '市辖区', '511101', '511100');
INSERT INTO `tplay_area` VALUES (2315, '市中区', '511102', '511100');
INSERT INTO `tplay_area` VALUES (2316, '沙湾区', '511111', '511100');
INSERT INTO `tplay_area` VALUES (2317, '五通桥区', '511112', '511100');
INSERT INTO `tplay_area` VALUES (2318, '金口河区', '511113', '511100');
INSERT INTO `tplay_area` VALUES (2319, '犍为县', '511123', '511100');
INSERT INTO `tplay_area` VALUES (2320, '井研县', '511124', '511100');
INSERT INTO `tplay_area` VALUES (2321, '夹江县', '511126', '511100');
INSERT INTO `tplay_area` VALUES (2322, '沐川县', '511129', '511100');
INSERT INTO `tplay_area` VALUES (2323, '峨边彝族自治县', '511132', '511100');
INSERT INTO `tplay_area` VALUES (2324, '马边彝族自治县', '511133', '511100');
INSERT INTO `tplay_area` VALUES (2325, '峨眉山市', '511181', '511100');
INSERT INTO `tplay_area` VALUES (2326, '市辖区', '511301', '511300');
INSERT INTO `tplay_area` VALUES (2327, '顺庆区', '511302', '511300');
INSERT INTO `tplay_area` VALUES (2328, '高坪区', '511303', '511300');
INSERT INTO `tplay_area` VALUES (2329, '嘉陵区', '511304', '511300');
INSERT INTO `tplay_area` VALUES (2330, '南部县', '511321', '511300');
INSERT INTO `tplay_area` VALUES (2331, '营山县', '511322', '511300');
INSERT INTO `tplay_area` VALUES (2332, '蓬安县', '511323', '511300');
INSERT INTO `tplay_area` VALUES (2333, '仪陇县', '511324', '511300');
INSERT INTO `tplay_area` VALUES (2334, '西充县', '511325', '511300');
INSERT INTO `tplay_area` VALUES (2335, '阆中市', '511381', '511300');
INSERT INTO `tplay_area` VALUES (2336, '市辖区', '511401', '511400');
INSERT INTO `tplay_area` VALUES (2337, '东坡区', '511402', '511400');
INSERT INTO `tplay_area` VALUES (2338, '彭山区', '511403', '511400');
INSERT INTO `tplay_area` VALUES (2339, '仁寿县', '511421', '511400');
INSERT INTO `tplay_area` VALUES (2340, '洪雅县', '511423', '511400');
INSERT INTO `tplay_area` VALUES (2341, '丹棱县', '511424', '511400');
INSERT INTO `tplay_area` VALUES (2342, '青神县', '511425', '511400');
INSERT INTO `tplay_area` VALUES (2343, '市辖区', '511501', '511500');
INSERT INTO `tplay_area` VALUES (2344, '翠屏区', '511502', '511500');
INSERT INTO `tplay_area` VALUES (2345, '南溪区', '511503', '511500');
INSERT INTO `tplay_area` VALUES (2346, '宜宾县', '511521', '511500');
INSERT INTO `tplay_area` VALUES (2347, '江安县', '511523', '511500');
INSERT INTO `tplay_area` VALUES (2348, '长宁县', '511524', '511500');
INSERT INTO `tplay_area` VALUES (2349, '高县', '511525', '511500');
INSERT INTO `tplay_area` VALUES (2350, '珙县', '511526', '511500');
INSERT INTO `tplay_area` VALUES (2351, '筠连县', '511527', '511500');
INSERT INTO `tplay_area` VALUES (2352, '兴文县', '511528', '511500');
INSERT INTO `tplay_area` VALUES (2353, '屏山县', '511529', '511500');
INSERT INTO `tplay_area` VALUES (2354, '市辖区', '511601', '511600');
INSERT INTO `tplay_area` VALUES (2355, '广安区', '511602', '511600');
INSERT INTO `tplay_area` VALUES (2356, '前锋区', '511603', '511600');
INSERT INTO `tplay_area` VALUES (2357, '岳池县', '511621', '511600');
INSERT INTO `tplay_area` VALUES (2358, '武胜县', '511622', '511600');
INSERT INTO `tplay_area` VALUES (2359, '邻水县', '511623', '511600');
INSERT INTO `tplay_area` VALUES (2360, '华蓥市', '511681', '511600');
INSERT INTO `tplay_area` VALUES (2361, '市辖区', '511701', '511700');
INSERT INTO `tplay_area` VALUES (2362, '通川区', '511702', '511700');
INSERT INTO `tplay_area` VALUES (2363, '达川区', '511703', '511700');
INSERT INTO `tplay_area` VALUES (2364, '宣汉县', '511722', '511700');
INSERT INTO `tplay_area` VALUES (2365, '开江县', '511723', '511700');
INSERT INTO `tplay_area` VALUES (2366, '大竹县', '511724', '511700');
INSERT INTO `tplay_area` VALUES (2367, '渠县', '511725', '511700');
INSERT INTO `tplay_area` VALUES (2368, '万源市', '511781', '511700');
INSERT INTO `tplay_area` VALUES (2369, '市辖区', '511801', '511800');
INSERT INTO `tplay_area` VALUES (2370, '雨城区', '511802', '511800');
INSERT INTO `tplay_area` VALUES (2371, '名山区', '511803', '511800');
INSERT INTO `tplay_area` VALUES (2372, '荥经县', '511822', '511800');
INSERT INTO `tplay_area` VALUES (2373, '汉源县', '511823', '511800');
INSERT INTO `tplay_area` VALUES (2374, '石棉县', '511824', '511800');
INSERT INTO `tplay_area` VALUES (2375, '天全县', '511825', '511800');
INSERT INTO `tplay_area` VALUES (2376, '芦山县', '511826', '511800');
INSERT INTO `tplay_area` VALUES (2377, '宝兴县', '511827', '511800');
INSERT INTO `tplay_area` VALUES (2378, '市辖区', '511901', '511900');
INSERT INTO `tplay_area` VALUES (2379, '巴州区', '511902', '511900');
INSERT INTO `tplay_area` VALUES (2380, '恩阳区', '511903', '511900');
INSERT INTO `tplay_area` VALUES (2381, '通江县', '511921', '511900');
INSERT INTO `tplay_area` VALUES (2382, '南江县', '511922', '511900');
INSERT INTO `tplay_area` VALUES (2383, '平昌县', '511923', '511900');
INSERT INTO `tplay_area` VALUES (2384, '市辖区', '512001', '512000');
INSERT INTO `tplay_area` VALUES (2385, '雁江区', '512002', '512000');
INSERT INTO `tplay_area` VALUES (2386, '安岳县', '512021', '512000');
INSERT INTO `tplay_area` VALUES (2387, '乐至县', '512022', '512000');
INSERT INTO `tplay_area` VALUES (2388, '马尔康市', '513201', '513200');
INSERT INTO `tplay_area` VALUES (2389, '汶川县', '513221', '513200');
INSERT INTO `tplay_area` VALUES (2390, '理县', '513222', '513200');
INSERT INTO `tplay_area` VALUES (2391, '茂县', '513223', '513200');
INSERT INTO `tplay_area` VALUES (2392, '松潘县', '513224', '513200');
INSERT INTO `tplay_area` VALUES (2393, '九寨沟县', '513225', '513200');
INSERT INTO `tplay_area` VALUES (2394, '金川县', '513226', '513200');
INSERT INTO `tplay_area` VALUES (2395, '小金县', '513227', '513200');
INSERT INTO `tplay_area` VALUES (2396, '黑水县', '513228', '513200');
INSERT INTO `tplay_area` VALUES (2397, '壤塘县', '513230', '513200');
INSERT INTO `tplay_area` VALUES (2398, '阿坝县', '513231', '513200');
INSERT INTO `tplay_area` VALUES (2399, '若尔盖县', '513232', '513200');
INSERT INTO `tplay_area` VALUES (2400, '红原县', '513233', '513200');
INSERT INTO `tplay_area` VALUES (2401, '康定市', '513301', '513300');
INSERT INTO `tplay_area` VALUES (2402, '泸定县', '513322', '513300');
INSERT INTO `tplay_area` VALUES (2403, '丹巴县', '513323', '513300');
INSERT INTO `tplay_area` VALUES (2404, '九龙县', '513324', '513300');
INSERT INTO `tplay_area` VALUES (2405, '雅江县', '513325', '513300');
INSERT INTO `tplay_area` VALUES (2406, '道孚县', '513326', '513300');
INSERT INTO `tplay_area` VALUES (2407, '炉霍县', '513327', '513300');
INSERT INTO `tplay_area` VALUES (2408, '甘孜县', '513328', '513300');
INSERT INTO `tplay_area` VALUES (2409, '新龙县', '513329', '513300');
INSERT INTO `tplay_area` VALUES (2410, '德格县', '513330', '513300');
INSERT INTO `tplay_area` VALUES (2411, '白玉县', '513331', '513300');
INSERT INTO `tplay_area` VALUES (2412, '石渠县', '513332', '513300');
INSERT INTO `tplay_area` VALUES (2413, '色达县', '513333', '513300');
INSERT INTO `tplay_area` VALUES (2414, '理塘县', '513334', '513300');
INSERT INTO `tplay_area` VALUES (2415, '巴塘县', '513335', '513300');
INSERT INTO `tplay_area` VALUES (2416, '乡城县', '513336', '513300');
INSERT INTO `tplay_area` VALUES (2417, '稻城县', '513337', '513300');
INSERT INTO `tplay_area` VALUES (2418, '得荣县', '513338', '513300');
INSERT INTO `tplay_area` VALUES (2419, '西昌市', '513401', '513400');
INSERT INTO `tplay_area` VALUES (2420, '木里藏族自治县', '513422', '513400');
INSERT INTO `tplay_area` VALUES (2421, '盐源县', '513423', '513400');
INSERT INTO `tplay_area` VALUES (2422, '德昌县', '513424', '513400');
INSERT INTO `tplay_area` VALUES (2423, '会理县', '513425', '513400');
INSERT INTO `tplay_area` VALUES (2424, '会东县', '513426', '513400');
INSERT INTO `tplay_area` VALUES (2425, '宁南县', '513427', '513400');
INSERT INTO `tplay_area` VALUES (2426, '普格县', '513428', '513400');
INSERT INTO `tplay_area` VALUES (2427, '布拖县', '513429', '513400');
INSERT INTO `tplay_area` VALUES (2428, '金阳县', '513430', '513400');
INSERT INTO `tplay_area` VALUES (2429, '昭觉县', '513431', '513400');
INSERT INTO `tplay_area` VALUES (2430, '喜德县', '513432', '513400');
INSERT INTO `tplay_area` VALUES (2431, '冕宁县', '513433', '513400');
INSERT INTO `tplay_area` VALUES (2432, '越西县', '513434', '513400');
INSERT INTO `tplay_area` VALUES (2433, '甘洛县', '513435', '513400');
INSERT INTO `tplay_area` VALUES (2434, '美姑县', '513436', '513400');
INSERT INTO `tplay_area` VALUES (2435, '雷波县', '513437', '513400');
INSERT INTO `tplay_area` VALUES (2436, '市辖区', '520101', '520100');
INSERT INTO `tplay_area` VALUES (2437, '南明区', '520102', '520100');
INSERT INTO `tplay_area` VALUES (2438, '云岩区', '520103', '520100');
INSERT INTO `tplay_area` VALUES (2439, '花溪区', '520111', '520100');
INSERT INTO `tplay_area` VALUES (2440, '乌当区', '520112', '520100');
INSERT INTO `tplay_area` VALUES (2441, '白云区', '520113', '520100');
INSERT INTO `tplay_area` VALUES (2442, '观山湖区', '520115', '520100');
INSERT INTO `tplay_area` VALUES (2443, '开阳县', '520121', '520100');
INSERT INTO `tplay_area` VALUES (2444, '息烽县', '520122', '520100');
INSERT INTO `tplay_area` VALUES (2445, '修文县', '520123', '520100');
INSERT INTO `tplay_area` VALUES (2446, '清镇市', '520181', '520100');
INSERT INTO `tplay_area` VALUES (2447, '钟山区', '520201', '520200');
INSERT INTO `tplay_area` VALUES (2448, '六枝特区', '520203', '520200');
INSERT INTO `tplay_area` VALUES (2449, '水城县', '520221', '520200');
INSERT INTO `tplay_area` VALUES (2450, '盘县', '520222', '520200');
INSERT INTO `tplay_area` VALUES (2451, '市辖区', '520301', '520300');
INSERT INTO `tplay_area` VALUES (2452, '红花岗区', '520302', '520300');
INSERT INTO `tplay_area` VALUES (2453, '汇川区', '520303', '520300');
INSERT INTO `tplay_area` VALUES (2454, '播州区', '520304', '520300');
INSERT INTO `tplay_area` VALUES (2455, '桐梓县', '520322', '520300');
INSERT INTO `tplay_area` VALUES (2456, '绥阳县', '520323', '520300');
INSERT INTO `tplay_area` VALUES (2457, '正安县', '520324', '520300');
INSERT INTO `tplay_area` VALUES (2458, '道真仡佬族苗族自治县', '520325', '520300');
INSERT INTO `tplay_area` VALUES (2459, '务川仡佬族苗族自治县', '520326', '520300');
INSERT INTO `tplay_area` VALUES (2460, '凤冈县', '520327', '520300');
INSERT INTO `tplay_area` VALUES (2461, '湄潭县', '520328', '520300');
INSERT INTO `tplay_area` VALUES (2462, '余庆县', '520329', '520300');
INSERT INTO `tplay_area` VALUES (2463, '习水县', '520330', '520300');
INSERT INTO `tplay_area` VALUES (2464, '赤水市', '520381', '520300');
INSERT INTO `tplay_area` VALUES (2465, '仁怀市', '520382', '520300');
INSERT INTO `tplay_area` VALUES (2466, '市辖区', '520401', '520400');
INSERT INTO `tplay_area` VALUES (2467, '西秀区', '520402', '520400');
INSERT INTO `tplay_area` VALUES (2468, '平坝区', '520403', '520400');
INSERT INTO `tplay_area` VALUES (2469, '普定县', '520422', '520400');
INSERT INTO `tplay_area` VALUES (2470, '镇宁布依族苗族自治县', '520423', '520400');
INSERT INTO `tplay_area` VALUES (2471, '关岭布依族苗族自治县', '520424', '520400');
INSERT INTO `tplay_area` VALUES (2472, '紫云苗族布依族自治县', '520425', '520400');
INSERT INTO `tplay_area` VALUES (2473, '市辖区', '520501', '520500');
INSERT INTO `tplay_area` VALUES (2474, '七星关区', '520502', '520500');
INSERT INTO `tplay_area` VALUES (2475, '大方县', '520521', '520500');
INSERT INTO `tplay_area` VALUES (2476, '黔西县', '520522', '520500');
INSERT INTO `tplay_area` VALUES (2477, '金沙县', '520523', '520500');
INSERT INTO `tplay_area` VALUES (2478, '织金县', '520524', '520500');
INSERT INTO `tplay_area` VALUES (2479, '纳雍县', '520525', '520500');
INSERT INTO `tplay_area` VALUES (2480, '威宁彝族回族苗族自治县', '520526', '520500');
INSERT INTO `tplay_area` VALUES (2481, '赫章县', '520527', '520500');
INSERT INTO `tplay_area` VALUES (2482, '市辖区', '520601', '520600');
INSERT INTO `tplay_area` VALUES (2483, '碧江区', '520602', '520600');
INSERT INTO `tplay_area` VALUES (2484, '万山区', '520603', '520600');
INSERT INTO `tplay_area` VALUES (2485, '江口县', '520621', '520600');
INSERT INTO `tplay_area` VALUES (2486, '玉屏侗族自治县', '520622', '520600');
INSERT INTO `tplay_area` VALUES (2487, '石阡县', '520623', '520600');
INSERT INTO `tplay_area` VALUES (2488, '思南县', '520624', '520600');
INSERT INTO `tplay_area` VALUES (2489, '印江土家族苗族自治县', '520625', '520600');
INSERT INTO `tplay_area` VALUES (2490, '德江县', '520626', '520600');
INSERT INTO `tplay_area` VALUES (2491, '沿河土家族自治县', '520627', '520600');
INSERT INTO `tplay_area` VALUES (2492, '松桃苗族自治县', '520628', '520600');
INSERT INTO `tplay_area` VALUES (2493, '兴义市', '522301', '522300');
INSERT INTO `tplay_area` VALUES (2494, '兴仁县', '522322', '522300');
INSERT INTO `tplay_area` VALUES (2495, '普安县', '522323', '522300');
INSERT INTO `tplay_area` VALUES (2496, '晴隆县', '522324', '522300');
INSERT INTO `tplay_area` VALUES (2497, '贞丰县', '522325', '522300');
INSERT INTO `tplay_area` VALUES (2498, '望谟县', '522326', '522300');
INSERT INTO `tplay_area` VALUES (2499, '册亨县', '522327', '522300');
INSERT INTO `tplay_area` VALUES (2500, '安龙县', '522328', '522300');
INSERT INTO `tplay_area` VALUES (2501, '凯里市', '522601', '522600');
INSERT INTO `tplay_area` VALUES (2502, '黄平县', '522622', '522600');
INSERT INTO `tplay_area` VALUES (2503, '施秉县', '522623', '522600');
INSERT INTO `tplay_area` VALUES (2504, '三穗县', '522624', '522600');
INSERT INTO `tplay_area` VALUES (2505, '镇远县', '522625', '522600');
INSERT INTO `tplay_area` VALUES (2506, '岑巩县', '522626', '522600');
INSERT INTO `tplay_area` VALUES (2507, '天柱县', '522627', '522600');
INSERT INTO `tplay_area` VALUES (2508, '锦屏县', '522628', '522600');
INSERT INTO `tplay_area` VALUES (2509, '剑河县', '522629', '522600');
INSERT INTO `tplay_area` VALUES (2510, '台江县', '522630', '522600');
INSERT INTO `tplay_area` VALUES (2511, '黎平县', '522631', '522600');
INSERT INTO `tplay_area` VALUES (2512, '榕江县', '522632', '522600');
INSERT INTO `tplay_area` VALUES (2513, '从江县', '522633', '522600');
INSERT INTO `tplay_area` VALUES (2514, '雷山县', '522634', '522600');
INSERT INTO `tplay_area` VALUES (2515, '麻江县', '522635', '522600');
INSERT INTO `tplay_area` VALUES (2516, '丹寨县', '522636', '522600');
INSERT INTO `tplay_area` VALUES (2517, '都匀市', '522701', '522700');
INSERT INTO `tplay_area` VALUES (2518, '福泉市', '522702', '522700');
INSERT INTO `tplay_area` VALUES (2519, '荔波县', '522722', '522700');
INSERT INTO `tplay_area` VALUES (2520, '贵定县', '522723', '522700');
INSERT INTO `tplay_area` VALUES (2521, '瓮安县', '522725', '522700');
INSERT INTO `tplay_area` VALUES (2522, '独山县', '522726', '522700');
INSERT INTO `tplay_area` VALUES (2523, '平塘县', '522727', '522700');
INSERT INTO `tplay_area` VALUES (2524, '罗甸县', '522728', '522700');
INSERT INTO `tplay_area` VALUES (2525, '长顺县', '522729', '522700');
INSERT INTO `tplay_area` VALUES (2526, '龙里县', '522730', '522700');
INSERT INTO `tplay_area` VALUES (2527, '惠水县', '522731', '522700');
INSERT INTO `tplay_area` VALUES (2528, '三都水族自治县', '522732', '522700');
INSERT INTO `tplay_area` VALUES (2529, '市辖区', '530101', '530100');
INSERT INTO `tplay_area` VALUES (2530, '五华区', '530102', '530100');
INSERT INTO `tplay_area` VALUES (2531, '盘龙区', '530103', '530100');
INSERT INTO `tplay_area` VALUES (2532, '官渡区', '530111', '530100');
INSERT INTO `tplay_area` VALUES (2533, '西山区', '530112', '530100');
INSERT INTO `tplay_area` VALUES (2534, '东川区', '530113', '530100');
INSERT INTO `tplay_area` VALUES (2535, '呈贡区', '530114', '530100');
INSERT INTO `tplay_area` VALUES (2536, '晋宁县', '530122', '530100');
INSERT INTO `tplay_area` VALUES (2537, '富民县', '530124', '530100');
INSERT INTO `tplay_area` VALUES (2538, '宜良县', '530125', '530100');
INSERT INTO `tplay_area` VALUES (2539, '石林彝族自治县', '530126', '530100');
INSERT INTO `tplay_area` VALUES (2540, '嵩明县', '530127', '530100');
INSERT INTO `tplay_area` VALUES (2541, '禄劝彝族苗族自治县', '530128', '530100');
INSERT INTO `tplay_area` VALUES (2542, '寻甸回族彝族自治县', '530129', '530100');
INSERT INTO `tplay_area` VALUES (2543, '安宁市', '530181', '530100');
INSERT INTO `tplay_area` VALUES (2544, '市辖区', '530301', '530300');
INSERT INTO `tplay_area` VALUES (2545, '麒麟区', '530302', '530300');
INSERT INTO `tplay_area` VALUES (2546, '沾益区', '530303', '530300');
INSERT INTO `tplay_area` VALUES (2547, '马龙县', '530321', '530300');
INSERT INTO `tplay_area` VALUES (2548, '陆良县', '530322', '530300');
INSERT INTO `tplay_area` VALUES (2549, '师宗县', '530323', '530300');
INSERT INTO `tplay_area` VALUES (2550, '罗平县', '530324', '530300');
INSERT INTO `tplay_area` VALUES (2551, '富源县', '530325', '530300');
INSERT INTO `tplay_area` VALUES (2552, '会泽县', '530326', '530300');
INSERT INTO `tplay_area` VALUES (2553, '宣威市', '530381', '530300');
INSERT INTO `tplay_area` VALUES (2554, '市辖区', '530401', '530400');
INSERT INTO `tplay_area` VALUES (2555, '红塔区', '530402', '530400');
INSERT INTO `tplay_area` VALUES (2556, '江川区', '530403', '530400');
INSERT INTO `tplay_area` VALUES (2557, '澄江县', '530422', '530400');
INSERT INTO `tplay_area` VALUES (2558, '通海县', '530423', '530400');
INSERT INTO `tplay_area` VALUES (2559, '华宁县', '530424', '530400');
INSERT INTO `tplay_area` VALUES (2560, '易门县', '530425', '530400');
INSERT INTO `tplay_area` VALUES (2561, '峨山彝族自治县', '530426', '530400');
INSERT INTO `tplay_area` VALUES (2562, '新平彝族傣族自治县', '530427', '530400');
INSERT INTO `tplay_area` VALUES (2563, '元江哈尼族彝族傣族自治县', '530428', '530400');
INSERT INTO `tplay_area` VALUES (2564, '市辖区', '530501', '530500');
INSERT INTO `tplay_area` VALUES (2565, '隆阳区', '530502', '530500');
INSERT INTO `tplay_area` VALUES (2566, '施甸县', '530521', '530500');
INSERT INTO `tplay_area` VALUES (2567, '龙陵县', '530523', '530500');
INSERT INTO `tplay_area` VALUES (2568, '昌宁县', '530524', '530500');
INSERT INTO `tplay_area` VALUES (2569, '腾冲市', '530581', '530500');
INSERT INTO `tplay_area` VALUES (2570, '市辖区', '530601', '530600');
INSERT INTO `tplay_area` VALUES (2571, '昭阳区', '530602', '530600');
INSERT INTO `tplay_area` VALUES (2572, '鲁甸县', '530621', '530600');
INSERT INTO `tplay_area` VALUES (2573, '巧家县', '530622', '530600');
INSERT INTO `tplay_area` VALUES (2574, '盐津县', '530623', '530600');
INSERT INTO `tplay_area` VALUES (2575, '大关县', '530624', '530600');
INSERT INTO `tplay_area` VALUES (2576, '永善县', '530625', '530600');
INSERT INTO `tplay_area` VALUES (2577, '绥江县', '530626', '530600');
INSERT INTO `tplay_area` VALUES (2578, '镇雄县', '530627', '530600');
INSERT INTO `tplay_area` VALUES (2579, '彝良县', '530628', '530600');
INSERT INTO `tplay_area` VALUES (2580, '威信县', '530629', '530600');
INSERT INTO `tplay_area` VALUES (2581, '水富县', '530630', '530600');
INSERT INTO `tplay_area` VALUES (2582, '市辖区', '530701', '530700');
INSERT INTO `tplay_area` VALUES (2583, '古城区', '530702', '530700');
INSERT INTO `tplay_area` VALUES (2584, '玉龙纳西族自治县', '530721', '530700');
INSERT INTO `tplay_area` VALUES (2585, '永胜县', '530722', '530700');
INSERT INTO `tplay_area` VALUES (2586, '华坪县', '530723', '530700');
INSERT INTO `tplay_area` VALUES (2587, '宁蒗彝族自治县', '530724', '530700');
INSERT INTO `tplay_area` VALUES (2588, '市辖区', '530801', '530800');
INSERT INTO `tplay_area` VALUES (2589, '思茅区', '530802', '530800');
INSERT INTO `tplay_area` VALUES (2590, '宁洱哈尼族彝族自治县', '530821', '530800');
INSERT INTO `tplay_area` VALUES (2591, '墨江哈尼族自治县', '530822', '530800');
INSERT INTO `tplay_area` VALUES (2592, '景东彝族自治县', '530823', '530800');
INSERT INTO `tplay_area` VALUES (2593, '景谷傣族彝族自治县', '530824', '530800');
INSERT INTO `tplay_area` VALUES (2594, '镇沅彝族哈尼族拉祜族自治县', '530825', '530800');
INSERT INTO `tplay_area` VALUES (2595, '江城哈尼族彝族自治县', '530826', '530800');
INSERT INTO `tplay_area` VALUES (2596, '孟连傣族拉祜族佤族自治县', '530827', '530800');
INSERT INTO `tplay_area` VALUES (2597, '澜沧拉祜族自治县', '530828', '530800');
INSERT INTO `tplay_area` VALUES (2598, '西盟佤族自治县', '530829', '530800');
INSERT INTO `tplay_area` VALUES (2599, '市辖区', '530901', '530900');
INSERT INTO `tplay_area` VALUES (2600, '临翔区', '530902', '530900');
INSERT INTO `tplay_area` VALUES (2601, '凤庆县', '530921', '530900');
INSERT INTO `tplay_area` VALUES (2602, '云县', '530922', '530900');
INSERT INTO `tplay_area` VALUES (2603, '永德县', '530923', '530900');
INSERT INTO `tplay_area` VALUES (2604, '镇康县', '530924', '530900');
INSERT INTO `tplay_area` VALUES (2605, '双江拉祜族佤族布朗族傣族自治县', '530925', '530900');
INSERT INTO `tplay_area` VALUES (2606, '耿马傣族佤族自治县', '530926', '530900');
INSERT INTO `tplay_area` VALUES (2607, '沧源佤族自治县', '530927', '530900');
INSERT INTO `tplay_area` VALUES (2608, '楚雄市', '532301', '532300');
INSERT INTO `tplay_area` VALUES (2609, '双柏县', '532322', '532300');
INSERT INTO `tplay_area` VALUES (2610, '牟定县', '532323', '532300');
INSERT INTO `tplay_area` VALUES (2611, '南华县', '532324', '532300');
INSERT INTO `tplay_area` VALUES (2612, '姚安县', '532325', '532300');
INSERT INTO `tplay_area` VALUES (2613, '大姚县', '532326', '532300');
INSERT INTO `tplay_area` VALUES (2614, '永仁县', '532327', '532300');
INSERT INTO `tplay_area` VALUES (2615, '元谋县', '532328', '532300');
INSERT INTO `tplay_area` VALUES (2616, '武定县', '532329', '532300');
INSERT INTO `tplay_area` VALUES (2617, '禄丰县', '532331', '532300');
INSERT INTO `tplay_area` VALUES (2618, '个旧市', '532501', '532500');
INSERT INTO `tplay_area` VALUES (2619, '开远市', '532502', '532500');
INSERT INTO `tplay_area` VALUES (2620, '蒙自市', '532503', '532500');
INSERT INTO `tplay_area` VALUES (2621, '弥勒市', '532504', '532500');
INSERT INTO `tplay_area` VALUES (2622, '屏边苗族自治县', '532523', '532500');
INSERT INTO `tplay_area` VALUES (2623, '建水县', '532524', '532500');
INSERT INTO `tplay_area` VALUES (2624, '石屏县', '532525', '532500');
INSERT INTO `tplay_area` VALUES (2625, '泸西县', '532527', '532500');
INSERT INTO `tplay_area` VALUES (2626, '元阳县', '532528', '532500');
INSERT INTO `tplay_area` VALUES (2627, '红河县', '532529', '532500');
INSERT INTO `tplay_area` VALUES (2628, '金平苗族瑶族傣族自治县', '532530', '532500');
INSERT INTO `tplay_area` VALUES (2629, '绿春县', '532531', '532500');
INSERT INTO `tplay_area` VALUES (2630, '河口瑶族自治县', '532532', '532500');
INSERT INTO `tplay_area` VALUES (2631, '文山市', '532601', '532600');
INSERT INTO `tplay_area` VALUES (2632, '砚山县', '532622', '532600');
INSERT INTO `tplay_area` VALUES (2633, '西畴县', '532623', '532600');
INSERT INTO `tplay_area` VALUES (2634, '麻栗坡县', '532624', '532600');
INSERT INTO `tplay_area` VALUES (2635, '马关县', '532625', '532600');
INSERT INTO `tplay_area` VALUES (2636, '丘北县', '532626', '532600');
INSERT INTO `tplay_area` VALUES (2637, '广南县', '532627', '532600');
INSERT INTO `tplay_area` VALUES (2638, '富宁县', '532628', '532600');
INSERT INTO `tplay_area` VALUES (2639, '景洪市', '532801', '532800');
INSERT INTO `tplay_area` VALUES (2640, '勐海县', '532822', '532800');
INSERT INTO `tplay_area` VALUES (2641, '勐腊县', '532823', '532800');
INSERT INTO `tplay_area` VALUES (2642, '大理市', '532901', '532900');
INSERT INTO `tplay_area` VALUES (2643, '漾濞彝族自治县', '532922', '532900');
INSERT INTO `tplay_area` VALUES (2644, '祥云县', '532923', '532900');
INSERT INTO `tplay_area` VALUES (2645, '宾川县', '532924', '532900');
INSERT INTO `tplay_area` VALUES (2646, '弥渡县', '532925', '532900');
INSERT INTO `tplay_area` VALUES (2647, '南涧彝族自治县', '532926', '532900');
INSERT INTO `tplay_area` VALUES (2648, '巍山彝族回族自治县', '532927', '532900');
INSERT INTO `tplay_area` VALUES (2649, '永平县', '532928', '532900');
INSERT INTO `tplay_area` VALUES (2650, '云龙县', '532929', '532900');
INSERT INTO `tplay_area` VALUES (2651, '洱源县', '532930', '532900');
INSERT INTO `tplay_area` VALUES (2652, '剑川县', '532931', '532900');
INSERT INTO `tplay_area` VALUES (2653, '鹤庆县', '532932', '532900');
INSERT INTO `tplay_area` VALUES (2654, '瑞丽市', '533102', '533100');
INSERT INTO `tplay_area` VALUES (2655, '芒市', '533103', '533100');
INSERT INTO `tplay_area` VALUES (2656, '梁河县', '533122', '533100');
INSERT INTO `tplay_area` VALUES (2657, '盈江县', '533123', '533100');
INSERT INTO `tplay_area` VALUES (2658, '陇川县', '533124', '533100');
INSERT INTO `tplay_area` VALUES (2659, '泸水市', '533301', '533300');
INSERT INTO `tplay_area` VALUES (2660, '福贡县', '533323', '533300');
INSERT INTO `tplay_area` VALUES (2661, '贡山独龙族怒族自治县', '533324', '533300');
INSERT INTO `tplay_area` VALUES (2662, '兰坪白族普米族自治县', '533325', '533300');
INSERT INTO `tplay_area` VALUES (2663, '香格里拉市', '533401', '533400');
INSERT INTO `tplay_area` VALUES (2664, '德钦县', '533422', '533400');
INSERT INTO `tplay_area` VALUES (2665, '维西傈僳族自治县', '533423', '533400');
INSERT INTO `tplay_area` VALUES (2666, '市辖区', '540101', '540100');
INSERT INTO `tplay_area` VALUES (2667, '城关区', '540102', '540100');
INSERT INTO `tplay_area` VALUES (2668, '堆龙德庆区', '540103', '540100');
INSERT INTO `tplay_area` VALUES (2669, '林周县', '540121', '540100');
INSERT INTO `tplay_area` VALUES (2670, '当雄县', '540122', '540100');
INSERT INTO `tplay_area` VALUES (2671, '尼木县', '540123', '540100');
INSERT INTO `tplay_area` VALUES (2672, '曲水县', '540124', '540100');
INSERT INTO `tplay_area` VALUES (2673, '达孜县', '540126', '540100');
INSERT INTO `tplay_area` VALUES (2674, '墨竹工卡县', '540127', '540100');
INSERT INTO `tplay_area` VALUES (2675, '桑珠孜区', '540202', '540200');
INSERT INTO `tplay_area` VALUES (2676, '南木林县', '540221', '540200');
INSERT INTO `tplay_area` VALUES (2677, '江孜县', '540222', '540200');
INSERT INTO `tplay_area` VALUES (2678, '定日县', '540223', '540200');
INSERT INTO `tplay_area` VALUES (2679, '萨迦县', '540224', '540200');
INSERT INTO `tplay_area` VALUES (2680, '拉孜县', '540225', '540200');
INSERT INTO `tplay_area` VALUES (2681, '昂仁县', '540226', '540200');
INSERT INTO `tplay_area` VALUES (2682, '谢通门县', '540227', '540200');
INSERT INTO `tplay_area` VALUES (2683, '白朗县', '540228', '540200');
INSERT INTO `tplay_area` VALUES (2684, '仁布县', '540229', '540200');
INSERT INTO `tplay_area` VALUES (2685, '康马县', '540230', '540200');
INSERT INTO `tplay_area` VALUES (2686, '定结县', '540231', '540200');
INSERT INTO `tplay_area` VALUES (2687, '仲巴县', '540232', '540200');
INSERT INTO `tplay_area` VALUES (2688, '亚东县', '540233', '540200');
INSERT INTO `tplay_area` VALUES (2689, '吉隆县', '540234', '540200');
INSERT INTO `tplay_area` VALUES (2690, '聂拉木县', '540235', '540200');
INSERT INTO `tplay_area` VALUES (2691, '萨嘎县', '540236', '540200');
INSERT INTO `tplay_area` VALUES (2692, '岗巴县', '540237', '540200');
INSERT INTO `tplay_area` VALUES (2693, '卡若区', '540302', '540300');
INSERT INTO `tplay_area` VALUES (2694, '江达县', '540321', '540300');
INSERT INTO `tplay_area` VALUES (2695, '贡觉县', '540322', '540300');
INSERT INTO `tplay_area` VALUES (2696, '类乌齐县', '540323', '540300');
INSERT INTO `tplay_area` VALUES (2697, '丁青县', '540324', '540300');
INSERT INTO `tplay_area` VALUES (2698, '察雅县', '540325', '540300');
INSERT INTO `tplay_area` VALUES (2699, '八宿县', '540326', '540300');
INSERT INTO `tplay_area` VALUES (2700, '左贡县', '540327', '540300');
INSERT INTO `tplay_area` VALUES (2701, '芒康县', '540328', '540300');
INSERT INTO `tplay_area` VALUES (2702, '洛隆县', '540329', '540300');
INSERT INTO `tplay_area` VALUES (2703, '边坝县', '540330', '540300');
INSERT INTO `tplay_area` VALUES (2704, '巴宜区', '540402', '540400');
INSERT INTO `tplay_area` VALUES (2705, '工布江达县', '540421', '540400');
INSERT INTO `tplay_area` VALUES (2706, '米林县', '540422', '540400');
INSERT INTO `tplay_area` VALUES (2707, '墨脱县', '540423', '540400');
INSERT INTO `tplay_area` VALUES (2708, '波密县', '540424', '540400');
INSERT INTO `tplay_area` VALUES (2709, '察隅县', '540425', '540400');
INSERT INTO `tplay_area` VALUES (2710, '朗县', '540426', '540400');
INSERT INTO `tplay_area` VALUES (2711, '市辖区', '540501', '540500');
INSERT INTO `tplay_area` VALUES (2712, '乃东区', '540502', '540500');
INSERT INTO `tplay_area` VALUES (2713, '扎囊县', '540521', '540500');
INSERT INTO `tplay_area` VALUES (2714, '贡嘎县', '540522', '540500');
INSERT INTO `tplay_area` VALUES (2715, '桑日县', '540523', '540500');
INSERT INTO `tplay_area` VALUES (2716, '琼结县', '540524', '540500');
INSERT INTO `tplay_area` VALUES (2717, '曲松县', '540525', '540500');
INSERT INTO `tplay_area` VALUES (2718, '措美县', '540526', '540500');
INSERT INTO `tplay_area` VALUES (2719, '洛扎县', '540527', '540500');
INSERT INTO `tplay_area` VALUES (2720, '加查县', '540528', '540500');
INSERT INTO `tplay_area` VALUES (2721, '隆子县', '540529', '540500');
INSERT INTO `tplay_area` VALUES (2722, '错那县', '540530', '540500');
INSERT INTO `tplay_area` VALUES (2723, '浪卡子县', '540531', '540500');
INSERT INTO `tplay_area` VALUES (2724, '那曲县', '542421', '542400');
INSERT INTO `tplay_area` VALUES (2725, '嘉黎县', '542422', '542400');
INSERT INTO `tplay_area` VALUES (2726, '比如县', '542423', '542400');
INSERT INTO `tplay_area` VALUES (2727, '聂荣县', '542424', '542400');
INSERT INTO `tplay_area` VALUES (2728, '安多县', '542425', '542400');
INSERT INTO `tplay_area` VALUES (2729, '申扎县', '542426', '542400');
INSERT INTO `tplay_area` VALUES (2730, '索县', '542427', '542400');
INSERT INTO `tplay_area` VALUES (2731, '班戈县', '542428', '542400');
INSERT INTO `tplay_area` VALUES (2732, '巴青县', '542429', '542400');
INSERT INTO `tplay_area` VALUES (2733, '尼玛县', '542430', '542400');
INSERT INTO `tplay_area` VALUES (2734, '双湖县', '542431', '542400');
INSERT INTO `tplay_area` VALUES (2735, '普兰县', '542521', '542500');
INSERT INTO `tplay_area` VALUES (2736, '札达县', '542522', '542500');
INSERT INTO `tplay_area` VALUES (2737, '噶尔县', '542523', '542500');
INSERT INTO `tplay_area` VALUES (2738, '日土县', '542524', '542500');
INSERT INTO `tplay_area` VALUES (2739, '革吉县', '542525', '542500');
INSERT INTO `tplay_area` VALUES (2740, '改则县', '542526', '542500');
INSERT INTO `tplay_area` VALUES (2741, '措勤县', '542527', '542500');
INSERT INTO `tplay_area` VALUES (2742, '市辖区', '610101', '610100');
INSERT INTO `tplay_area` VALUES (2743, '新城区', '610102', '610100');
INSERT INTO `tplay_area` VALUES (2744, '碑林区', '610103', '610100');
INSERT INTO `tplay_area` VALUES (2745, '莲湖区', '610104', '610100');
INSERT INTO `tplay_area` VALUES (2746, '灞桥区', '610111', '610100');
INSERT INTO `tplay_area` VALUES (2747, '未央区', '610112', '610100');
INSERT INTO `tplay_area` VALUES (2748, '雁塔区', '610113', '610100');
INSERT INTO `tplay_area` VALUES (2749, '阎良区', '610114', '610100');
INSERT INTO `tplay_area` VALUES (2750, '临潼区', '610115', '610100');
INSERT INTO `tplay_area` VALUES (2751, '长安区', '610116', '610100');
INSERT INTO `tplay_area` VALUES (2752, '高陵区', '610117', '610100');
INSERT INTO `tplay_area` VALUES (2753, '蓝田县', '610122', '610100');
INSERT INTO `tplay_area` VALUES (2754, '周至县', '610124', '610100');
INSERT INTO `tplay_area` VALUES (2755, '户县', '610125', '610100');
INSERT INTO `tplay_area` VALUES (2756, '市辖区', '610201', '610200');
INSERT INTO `tplay_area` VALUES (2757, '王益区', '610202', '610200');
INSERT INTO `tplay_area` VALUES (2758, '印台区', '610203', '610200');
INSERT INTO `tplay_area` VALUES (2759, '耀州区', '610204', '610200');
INSERT INTO `tplay_area` VALUES (2760, '宜君县', '610222', '610200');
INSERT INTO `tplay_area` VALUES (2761, '市辖区', '610301', '610300');
INSERT INTO `tplay_area` VALUES (2762, '渭滨区', '610302', '610300');
INSERT INTO `tplay_area` VALUES (2763, '金台区', '610303', '610300');
INSERT INTO `tplay_area` VALUES (2764, '陈仓区', '610304', '610300');
INSERT INTO `tplay_area` VALUES (2765, '凤翔县', '610322', '610300');
INSERT INTO `tplay_area` VALUES (2766, '岐山县', '610323', '610300');
INSERT INTO `tplay_area` VALUES (2767, '扶风县', '610324', '610300');
INSERT INTO `tplay_area` VALUES (2768, '眉县', '610326', '610300');
INSERT INTO `tplay_area` VALUES (2769, '陇县', '610327', '610300');
INSERT INTO `tplay_area` VALUES (2770, '千阳县', '610328', '610300');
INSERT INTO `tplay_area` VALUES (2771, '麟游县', '610329', '610300');
INSERT INTO `tplay_area` VALUES (2772, '凤县', '610330', '610300');
INSERT INTO `tplay_area` VALUES (2773, '太白县', '610331', '610300');
INSERT INTO `tplay_area` VALUES (2774, '市辖区', '610401', '610400');
INSERT INTO `tplay_area` VALUES (2775, '秦都区', '610402', '610400');
INSERT INTO `tplay_area` VALUES (2776, '杨陵区', '610403', '610400');
INSERT INTO `tplay_area` VALUES (2777, '渭城区', '610404', '610400');
INSERT INTO `tplay_area` VALUES (2778, '三原县', '610422', '610400');
INSERT INTO `tplay_area` VALUES (2779, '泾阳县', '610423', '610400');
INSERT INTO `tplay_area` VALUES (2780, '乾县', '610424', '610400');
INSERT INTO `tplay_area` VALUES (2781, '礼泉县', '610425', '610400');
INSERT INTO `tplay_area` VALUES (2782, '永寿县', '610426', '610400');
INSERT INTO `tplay_area` VALUES (2783, '彬县', '610427', '610400');
INSERT INTO `tplay_area` VALUES (2784, '长武县', '610428', '610400');
INSERT INTO `tplay_area` VALUES (2785, '旬邑县', '610429', '610400');
INSERT INTO `tplay_area` VALUES (2786, '淳化县', '610430', '610400');
INSERT INTO `tplay_area` VALUES (2787, '武功县', '610431', '610400');
INSERT INTO `tplay_area` VALUES (2788, '兴平市', '610481', '610400');
INSERT INTO `tplay_area` VALUES (2789, '市辖区', '610501', '610500');
INSERT INTO `tplay_area` VALUES (2790, '临渭区', '610502', '610500');
INSERT INTO `tplay_area` VALUES (2791, '华州区', '610503', '610500');
INSERT INTO `tplay_area` VALUES (2792, '潼关县', '610522', '610500');
INSERT INTO `tplay_area` VALUES (2793, '大荔县', '610523', '610500');
INSERT INTO `tplay_area` VALUES (2794, '合阳县', '610524', '610500');
INSERT INTO `tplay_area` VALUES (2795, '澄城县', '610525', '610500');
INSERT INTO `tplay_area` VALUES (2796, '蒲城县', '610526', '610500');
INSERT INTO `tplay_area` VALUES (2797, '白水县', '610527', '610500');
INSERT INTO `tplay_area` VALUES (2798, '富平县', '610528', '610500');
INSERT INTO `tplay_area` VALUES (2799, '韩城市', '610581', '610500');
INSERT INTO `tplay_area` VALUES (2800, '华阴市', '610582', '610500');
INSERT INTO `tplay_area` VALUES (2801, '市辖区', '610601', '610600');
INSERT INTO `tplay_area` VALUES (2802, '宝塔区', '610602', '610600');
INSERT INTO `tplay_area` VALUES (2803, '安塞区', '610603', '610600');
INSERT INTO `tplay_area` VALUES (2804, '延长县', '610621', '610600');
INSERT INTO `tplay_area` VALUES (2805, '延川县', '610622', '610600');
INSERT INTO `tplay_area` VALUES (2806, '子长县', '610623', '610600');
INSERT INTO `tplay_area` VALUES (2807, '志丹县', '610625', '610600');
INSERT INTO `tplay_area` VALUES (2808, '吴起县', '610626', '610600');
INSERT INTO `tplay_area` VALUES (2809, '甘泉县', '610627', '610600');
INSERT INTO `tplay_area` VALUES (2810, '富县', '610628', '610600');
INSERT INTO `tplay_area` VALUES (2811, '洛川县', '610629', '610600');
INSERT INTO `tplay_area` VALUES (2812, '宜川县', '610630', '610600');
INSERT INTO `tplay_area` VALUES (2813, '黄龙县', '610631', '610600');
INSERT INTO `tplay_area` VALUES (2814, '黄陵县', '610632', '610600');
INSERT INTO `tplay_area` VALUES (2815, '市辖区', '610701', '610700');
INSERT INTO `tplay_area` VALUES (2816, '汉台区', '610702', '610700');
INSERT INTO `tplay_area` VALUES (2817, '南郑县', '610721', '610700');
INSERT INTO `tplay_area` VALUES (2818, '城固县', '610722', '610700');
INSERT INTO `tplay_area` VALUES (2819, '洋县', '610723', '610700');
INSERT INTO `tplay_area` VALUES (2820, '西乡县', '610724', '610700');
INSERT INTO `tplay_area` VALUES (2821, '勉县', '610725', '610700');
INSERT INTO `tplay_area` VALUES (2822, '宁强县', '610726', '610700');
INSERT INTO `tplay_area` VALUES (2823, '略阳县', '610727', '610700');
INSERT INTO `tplay_area` VALUES (2824, '镇巴县', '610728', '610700');
INSERT INTO `tplay_area` VALUES (2825, '留坝县', '610729', '610700');
INSERT INTO `tplay_area` VALUES (2826, '佛坪县', '610730', '610700');
INSERT INTO `tplay_area` VALUES (2827, '市辖区', '610801', '610800');
INSERT INTO `tplay_area` VALUES (2828, '榆阳区', '610802', '610800');
INSERT INTO `tplay_area` VALUES (2829, '横山区', '610803', '610800');
INSERT INTO `tplay_area` VALUES (2830, '神木县', '610821', '610800');
INSERT INTO `tplay_area` VALUES (2831, '府谷县', '610822', '610800');
INSERT INTO `tplay_area` VALUES (2832, '靖边县', '610824', '610800');
INSERT INTO `tplay_area` VALUES (2833, '定边县', '610825', '610800');
INSERT INTO `tplay_area` VALUES (2834, '绥德县', '610826', '610800');
INSERT INTO `tplay_area` VALUES (2835, '米脂县', '610827', '610800');
INSERT INTO `tplay_area` VALUES (2836, '佳县', '610828', '610800');
INSERT INTO `tplay_area` VALUES (2837, '吴堡县', '610829', '610800');
INSERT INTO `tplay_area` VALUES (2838, '清涧县', '610830', '610800');
INSERT INTO `tplay_area` VALUES (2839, '子洲县', '610831', '610800');
INSERT INTO `tplay_area` VALUES (2840, '市辖区', '610901', '610900');
INSERT INTO `tplay_area` VALUES (2841, '汉滨区', '610902', '610900');
INSERT INTO `tplay_area` VALUES (2842, '汉阴县', '610921', '610900');
INSERT INTO `tplay_area` VALUES (2843, '石泉县', '610922', '610900');
INSERT INTO `tplay_area` VALUES (2844, '宁陕县', '610923', '610900');
INSERT INTO `tplay_area` VALUES (2845, '紫阳县', '610924', '610900');
INSERT INTO `tplay_area` VALUES (2846, '岚皋县', '610925', '610900');
INSERT INTO `tplay_area` VALUES (2847, '平利县', '610926', '610900');
INSERT INTO `tplay_area` VALUES (2848, '镇坪县', '610927', '610900');
INSERT INTO `tplay_area` VALUES (2849, '旬阳县', '610928', '610900');
INSERT INTO `tplay_area` VALUES (2850, '白河县', '610929', '610900');
INSERT INTO `tplay_area` VALUES (2851, '市辖区', '611001', '611000');
INSERT INTO `tplay_area` VALUES (2852, '商州区', '611002', '611000');
INSERT INTO `tplay_area` VALUES (2853, '洛南县', '611021', '611000');
INSERT INTO `tplay_area` VALUES (2854, '丹凤县', '611022', '611000');
INSERT INTO `tplay_area` VALUES (2855, '商南县', '611023', '611000');
INSERT INTO `tplay_area` VALUES (2856, '山阳县', '611024', '611000');
INSERT INTO `tplay_area` VALUES (2857, '镇安县', '611025', '611000');
INSERT INTO `tplay_area` VALUES (2858, '柞水县', '611026', '611000');
INSERT INTO `tplay_area` VALUES (2859, '市辖区', '620101', '620100');
INSERT INTO `tplay_area` VALUES (2860, '城关区', '620102', '620100');
INSERT INTO `tplay_area` VALUES (2861, '七里河区', '620103', '620100');
INSERT INTO `tplay_area` VALUES (2862, '西固区', '620104', '620100');
INSERT INTO `tplay_area` VALUES (2863, '安宁区', '620105', '620100');
INSERT INTO `tplay_area` VALUES (2864, '红古区', '620111', '620100');
INSERT INTO `tplay_area` VALUES (2865, '永登县', '620121', '620100');
INSERT INTO `tplay_area` VALUES (2866, '皋兰县', '620122', '620100');
INSERT INTO `tplay_area` VALUES (2867, '榆中县', '620123', '620100');
INSERT INTO `tplay_area` VALUES (2868, '市辖区', '620201', '620200');
INSERT INTO `tplay_area` VALUES (2869, '市辖区', '620301', '620300');
INSERT INTO `tplay_area` VALUES (2870, '金川区', '620302', '620300');
INSERT INTO `tplay_area` VALUES (2871, '永昌县', '620321', '620300');
INSERT INTO `tplay_area` VALUES (2872, '市辖区', '620401', '620400');
INSERT INTO `tplay_area` VALUES (2873, '白银区', '620402', '620400');
INSERT INTO `tplay_area` VALUES (2874, '平川区', '620403', '620400');
INSERT INTO `tplay_area` VALUES (2875, '靖远县', '620421', '620400');
INSERT INTO `tplay_area` VALUES (2876, '会宁县', '620422', '620400');
INSERT INTO `tplay_area` VALUES (2877, '景泰县', '620423', '620400');
INSERT INTO `tplay_area` VALUES (2878, '市辖区', '620501', '620500');
INSERT INTO `tplay_area` VALUES (2879, '秦州区', '620502', '620500');
INSERT INTO `tplay_area` VALUES (2880, '麦积区', '620503', '620500');
INSERT INTO `tplay_area` VALUES (2881, '清水县', '620521', '620500');
INSERT INTO `tplay_area` VALUES (2882, '秦安县', '620522', '620500');
INSERT INTO `tplay_area` VALUES (2883, '甘谷县', '620523', '620500');
INSERT INTO `tplay_area` VALUES (2884, '武山县', '620524', '620500');
INSERT INTO `tplay_area` VALUES (2885, '张家川回族自治县', '620525', '620500');
INSERT INTO `tplay_area` VALUES (2886, '市辖区', '620601', '620600');
INSERT INTO `tplay_area` VALUES (2887, '凉州区', '620602', '620600');
INSERT INTO `tplay_area` VALUES (2888, '民勤县', '620621', '620600');
INSERT INTO `tplay_area` VALUES (2889, '古浪县', '620622', '620600');
INSERT INTO `tplay_area` VALUES (2890, '天祝藏族自治县', '620623', '620600');
INSERT INTO `tplay_area` VALUES (2891, '市辖区', '620701', '620700');
INSERT INTO `tplay_area` VALUES (2892, '甘州区', '620702', '620700');
INSERT INTO `tplay_area` VALUES (2893, '肃南裕固族自治县', '620721', '620700');
INSERT INTO `tplay_area` VALUES (2894, '民乐县', '620722', '620700');
INSERT INTO `tplay_area` VALUES (2895, '临泽县', '620723', '620700');
INSERT INTO `tplay_area` VALUES (2896, '高台县', '620724', '620700');
INSERT INTO `tplay_area` VALUES (2897, '山丹县', '620725', '620700');
INSERT INTO `tplay_area` VALUES (2898, '市辖区', '620801', '620800');
INSERT INTO `tplay_area` VALUES (2899, '崆峒区', '620802', '620800');
INSERT INTO `tplay_area` VALUES (2900, '泾川县', '620821', '620800');
INSERT INTO `tplay_area` VALUES (2901, '灵台县', '620822', '620800');
INSERT INTO `tplay_area` VALUES (2902, '崇信县', '620823', '620800');
INSERT INTO `tplay_area` VALUES (2903, '华亭县', '620824', '620800');
INSERT INTO `tplay_area` VALUES (2904, '庄浪县', '620825', '620800');
INSERT INTO `tplay_area` VALUES (2905, '静宁县', '620826', '620800');
INSERT INTO `tplay_area` VALUES (2906, '市辖区', '620901', '620900');
INSERT INTO `tplay_area` VALUES (2907, '肃州区', '620902', '620900');
INSERT INTO `tplay_area` VALUES (2908, '金塔县', '620921', '620900');
INSERT INTO `tplay_area` VALUES (2909, '瓜州县', '620922', '620900');
INSERT INTO `tplay_area` VALUES (2910, '肃北蒙古族自治县', '620923', '620900');
INSERT INTO `tplay_area` VALUES (2911, '阿克塞哈萨克族自治县', '620924', '620900');
INSERT INTO `tplay_area` VALUES (2912, '玉门市', '620981', '620900');
INSERT INTO `tplay_area` VALUES (2913, '敦煌市', '620982', '620900');
INSERT INTO `tplay_area` VALUES (2914, '市辖区', '621001', '621000');
INSERT INTO `tplay_area` VALUES (2915, '西峰区', '621002', '621000');
INSERT INTO `tplay_area` VALUES (2916, '庆城县', '621021', '621000');
INSERT INTO `tplay_area` VALUES (2917, '环县', '621022', '621000');
INSERT INTO `tplay_area` VALUES (2918, '华池县', '621023', '621000');
INSERT INTO `tplay_area` VALUES (2919, '合水县', '621024', '621000');
INSERT INTO `tplay_area` VALUES (2920, '正宁县', '621025', '621000');
INSERT INTO `tplay_area` VALUES (2921, '宁县', '621026', '621000');
INSERT INTO `tplay_area` VALUES (2922, '镇原县', '621027', '621000');
INSERT INTO `tplay_area` VALUES (2923, '市辖区', '621101', '621100');
INSERT INTO `tplay_area` VALUES (2924, '安定区', '621102', '621100');
INSERT INTO `tplay_area` VALUES (2925, '通渭县', '621121', '621100');
INSERT INTO `tplay_area` VALUES (2926, '陇西县', '621122', '621100');
INSERT INTO `tplay_area` VALUES (2927, '渭源县', '621123', '621100');
INSERT INTO `tplay_area` VALUES (2928, '临洮县', '621124', '621100');
INSERT INTO `tplay_area` VALUES (2929, '漳县', '621125', '621100');
INSERT INTO `tplay_area` VALUES (2930, '岷县', '621126', '621100');
INSERT INTO `tplay_area` VALUES (2931, '市辖区', '621201', '621200');
INSERT INTO `tplay_area` VALUES (2932, '武都区', '621202', '621200');
INSERT INTO `tplay_area` VALUES (2933, '成县', '621221', '621200');
INSERT INTO `tplay_area` VALUES (2934, '文县', '621222', '621200');
INSERT INTO `tplay_area` VALUES (2935, '宕昌县', '621223', '621200');
INSERT INTO `tplay_area` VALUES (2936, '康县', '621224', '621200');
INSERT INTO `tplay_area` VALUES (2937, '西和县', '621225', '621200');
INSERT INTO `tplay_area` VALUES (2938, '礼县', '621226', '621200');
INSERT INTO `tplay_area` VALUES (2939, '徽县', '621227', '621200');
INSERT INTO `tplay_area` VALUES (2940, '两当县', '621228', '621200');
INSERT INTO `tplay_area` VALUES (2941, '临夏市', '622901', '622900');
INSERT INTO `tplay_area` VALUES (2942, '临夏县', '622921', '622900');
INSERT INTO `tplay_area` VALUES (2943, '康乐县', '622922', '622900');
INSERT INTO `tplay_area` VALUES (2944, '永靖县', '622923', '622900');
INSERT INTO `tplay_area` VALUES (2945, '广河县', '622924', '622900');
INSERT INTO `tplay_area` VALUES (2946, '和政县', '622925', '622900');
INSERT INTO `tplay_area` VALUES (2947, '东乡族自治县', '622926', '622900');
INSERT INTO `tplay_area` VALUES (2948, '积石山保安族东乡族撒拉族自治县', '622927', '622900');
INSERT INTO `tplay_area` VALUES (2949, '合作市', '623001', '623000');
INSERT INTO `tplay_area` VALUES (2950, '临潭县', '623021', '623000');
INSERT INTO `tplay_area` VALUES (2951, '卓尼县', '623022', '623000');
INSERT INTO `tplay_area` VALUES (2952, '舟曲县', '623023', '623000');
INSERT INTO `tplay_area` VALUES (2953, '迭部县', '623024', '623000');
INSERT INTO `tplay_area` VALUES (2954, '玛曲县', '623025', '623000');
INSERT INTO `tplay_area` VALUES (2955, '碌曲县', '623026', '623000');
INSERT INTO `tplay_area` VALUES (2956, '夏河县', '623027', '623000');
INSERT INTO `tplay_area` VALUES (2957, '市辖区', '630101', '630100');
INSERT INTO `tplay_area` VALUES (2958, '城东区', '630102', '630100');
INSERT INTO `tplay_area` VALUES (2959, '城中区', '630103', '630100');
INSERT INTO `tplay_area` VALUES (2960, '城西区', '630104', '630100');
INSERT INTO `tplay_area` VALUES (2961, '城北区', '630105', '630100');
INSERT INTO `tplay_area` VALUES (2962, '大通回族土族自治县', '630121', '630100');
INSERT INTO `tplay_area` VALUES (2963, '湟中县', '630122', '630100');
INSERT INTO `tplay_area` VALUES (2964, '湟源县', '630123', '630100');
INSERT INTO `tplay_area` VALUES (2965, '乐都区', '630202', '630200');
INSERT INTO `tplay_area` VALUES (2966, '平安区', '630203', '630200');
INSERT INTO `tplay_area` VALUES (2967, '民和回族土族自治县', '630222', '630200');
INSERT INTO `tplay_area` VALUES (2968, '互助土族自治县', '630223', '630200');
INSERT INTO `tplay_area` VALUES (2969, '化隆回族自治县', '630224', '630200');
INSERT INTO `tplay_area` VALUES (2970, '循化撒拉族自治县', '630225', '630200');
INSERT INTO `tplay_area` VALUES (2971, '门源回族自治县', '632221', '632200');
INSERT INTO `tplay_area` VALUES (2972, '祁连县', '632222', '632200');
INSERT INTO `tplay_area` VALUES (2973, '海晏县', '632223', '632200');
INSERT INTO `tplay_area` VALUES (2974, '刚察县', '632224', '632200');
INSERT INTO `tplay_area` VALUES (2975, '同仁县', '632321', '632300');
INSERT INTO `tplay_area` VALUES (2976, '尖扎县', '632322', '632300');
INSERT INTO `tplay_area` VALUES (2977, '泽库县', '632323', '632300');
INSERT INTO `tplay_area` VALUES (2978, '河南蒙古族自治县', '632324', '632300');
INSERT INTO `tplay_area` VALUES (2979, '共和县', '632521', '632500');
INSERT INTO `tplay_area` VALUES (2980, '同德县', '632522', '632500');
INSERT INTO `tplay_area` VALUES (2981, '贵德县', '632523', '632500');
INSERT INTO `tplay_area` VALUES (2982, '兴海县', '632524', '632500');
INSERT INTO `tplay_area` VALUES (2983, '贵南县', '632525', '632500');
INSERT INTO `tplay_area` VALUES (2984, '玛沁县', '632621', '632600');
INSERT INTO `tplay_area` VALUES (2985, '班玛县', '632622', '632600');
INSERT INTO `tplay_area` VALUES (2986, '甘德县', '632623', '632600');
INSERT INTO `tplay_area` VALUES (2987, '达日县', '632624', '632600');
INSERT INTO `tplay_area` VALUES (2988, '久治县', '632625', '632600');
INSERT INTO `tplay_area` VALUES (2989, '玛多县', '632626', '632600');
INSERT INTO `tplay_area` VALUES (2990, '玉树市', '632701', '632700');
INSERT INTO `tplay_area` VALUES (2991, '杂多县', '632722', '632700');
INSERT INTO `tplay_area` VALUES (2992, '称多县', '632723', '632700');
INSERT INTO `tplay_area` VALUES (2993, '治多县', '632724', '632700');
INSERT INTO `tplay_area` VALUES (2994, '囊谦县', '632725', '632700');
INSERT INTO `tplay_area` VALUES (2995, '曲麻莱县', '632726', '632700');
INSERT INTO `tplay_area` VALUES (2996, '格尔木市', '632801', '632800');
INSERT INTO `tplay_area` VALUES (2997, '德令哈市', '632802', '632800');
INSERT INTO `tplay_area` VALUES (2998, '乌兰县', '632821', '632800');
INSERT INTO `tplay_area` VALUES (2999, '都兰县', '632822', '632800');
INSERT INTO `tplay_area` VALUES (3000, '天峻县', '632823', '632800');
INSERT INTO `tplay_area` VALUES (3001, '市辖区', '640101', '640100');
INSERT INTO `tplay_area` VALUES (3002, '兴庆区', '640104', '640100');
INSERT INTO `tplay_area` VALUES (3003, '西夏区', '640105', '640100');
INSERT INTO `tplay_area` VALUES (3004, '金凤区', '640106', '640100');
INSERT INTO `tplay_area` VALUES (3005, '永宁县', '640121', '640100');
INSERT INTO `tplay_area` VALUES (3006, '贺兰县', '640122', '640100');
INSERT INTO `tplay_area` VALUES (3007, '灵武市', '640181', '640100');
INSERT INTO `tplay_area` VALUES (3008, '市辖区', '640201', '640200');
INSERT INTO `tplay_area` VALUES (3009, '大武口区', '640202', '640200');
INSERT INTO `tplay_area` VALUES (3010, '惠农区', '640205', '640200');
INSERT INTO `tplay_area` VALUES (3011, '平罗县', '640221', '640200');
INSERT INTO `tplay_area` VALUES (3012, '市辖区', '640301', '640300');
INSERT INTO `tplay_area` VALUES (3013, '利通区', '640302', '640300');
INSERT INTO `tplay_area` VALUES (3014, '红寺堡区', '640303', '640300');
INSERT INTO `tplay_area` VALUES (3015, '盐池县', '640323', '640300');
INSERT INTO `tplay_area` VALUES (3016, '同心县', '640324', '640300');
INSERT INTO `tplay_area` VALUES (3017, '青铜峡市', '640381', '640300');
INSERT INTO `tplay_area` VALUES (3018, '市辖区', '640401', '640400');
INSERT INTO `tplay_area` VALUES (3019, '原州区', '640402', '640400');
INSERT INTO `tplay_area` VALUES (3020, '西吉县', '640422', '640400');
INSERT INTO `tplay_area` VALUES (3021, '隆德县', '640423', '640400');
INSERT INTO `tplay_area` VALUES (3022, '泾源县', '640424', '640400');
INSERT INTO `tplay_area` VALUES (3023, '彭阳县', '640425', '640400');
INSERT INTO `tplay_area` VALUES (3024, '市辖区', '640501', '640500');
INSERT INTO `tplay_area` VALUES (3025, '沙坡头区', '640502', '640500');
INSERT INTO `tplay_area` VALUES (3026, '中宁县', '640521', '640500');
INSERT INTO `tplay_area` VALUES (3027, '海原县', '640522', '640500');
INSERT INTO `tplay_area` VALUES (3028, '市辖区', '650101', '650100');
INSERT INTO `tplay_area` VALUES (3029, '天山区', '650102', '650100');
INSERT INTO `tplay_area` VALUES (3030, '沙依巴克区', '650103', '650100');
INSERT INTO `tplay_area` VALUES (3031, '新市区', '650104', '650100');
INSERT INTO `tplay_area` VALUES (3032, '水磨沟区', '650105', '650100');
INSERT INTO `tplay_area` VALUES (3033, '头屯河区', '650106', '650100');
INSERT INTO `tplay_area` VALUES (3034, '达坂城区', '650107', '650100');
INSERT INTO `tplay_area` VALUES (3035, '米东区', '650109', '650100');
INSERT INTO `tplay_area` VALUES (3036, '乌鲁木齐县', '650121', '650100');
INSERT INTO `tplay_area` VALUES (3037, '市辖区', '650201', '650200');
INSERT INTO `tplay_area` VALUES (3038, '独山子区', '650202', '650200');
INSERT INTO `tplay_area` VALUES (3039, '克拉玛依区', '650203', '650200');
INSERT INTO `tplay_area` VALUES (3040, '白碱滩区', '650204', '650200');
INSERT INTO `tplay_area` VALUES (3041, '乌尔禾区', '650205', '650200');
INSERT INTO `tplay_area` VALUES (3042, '高昌区', '650402', '650400');
INSERT INTO `tplay_area` VALUES (3043, '鄯善县', '650421', '650400');
INSERT INTO `tplay_area` VALUES (3044, '托克逊县', '650422', '650400');
INSERT INTO `tplay_area` VALUES (3045, '伊州区', '650502', '650500');
INSERT INTO `tplay_area` VALUES (3046, '巴里坤哈萨克自治县', '650521', '650500');
INSERT INTO `tplay_area` VALUES (3047, '伊吾县', '650522', '650500');
INSERT INTO `tplay_area` VALUES (3048, '昌吉市', '652301', '652300');
INSERT INTO `tplay_area` VALUES (3049, '阜康市', '652302', '652300');
INSERT INTO `tplay_area` VALUES (3050, '呼图壁县', '652323', '652300');
INSERT INTO `tplay_area` VALUES (3051, '玛纳斯县', '652324', '652300');
INSERT INTO `tplay_area` VALUES (3052, '奇台县', '652325', '652300');
INSERT INTO `tplay_area` VALUES (3053, '吉木萨尔县', '652327', '652300');
INSERT INTO `tplay_area` VALUES (3054, '木垒哈萨克自治县', '652328', '652300');
INSERT INTO `tplay_area` VALUES (3055, '博乐市', '652701', '652700');
INSERT INTO `tplay_area` VALUES (3056, '阿拉山口市', '652702', '652700');
INSERT INTO `tplay_area` VALUES (3057, '精河县', '652722', '652700');
INSERT INTO `tplay_area` VALUES (3058, '温泉县', '652723', '652700');
INSERT INTO `tplay_area` VALUES (3059, '库尔勒市', '652801', '652800');
INSERT INTO `tplay_area` VALUES (3060, '轮台县', '652822', '652800');
INSERT INTO `tplay_area` VALUES (3061, '尉犁县', '652823', '652800');
INSERT INTO `tplay_area` VALUES (3062, '若羌县', '652824', '652800');
INSERT INTO `tplay_area` VALUES (3063, '且末县', '652825', '652800');
INSERT INTO `tplay_area` VALUES (3064, '焉耆回族自治县', '652826', '652800');
INSERT INTO `tplay_area` VALUES (3065, '和静县', '652827', '652800');
INSERT INTO `tplay_area` VALUES (3066, '和硕县', '652828', '652800');
INSERT INTO `tplay_area` VALUES (3067, '博湖县', '652829', '652800');
INSERT INTO `tplay_area` VALUES (3068, '阿克苏市', '652901', '652900');
INSERT INTO `tplay_area` VALUES (3069, '温宿县', '652922', '652900');
INSERT INTO `tplay_area` VALUES (3070, '库车县', '652923', '652900');
INSERT INTO `tplay_area` VALUES (3071, '沙雅县', '652924', '652900');
INSERT INTO `tplay_area` VALUES (3072, '新和县', '652925', '652900');
INSERT INTO `tplay_area` VALUES (3073, '拜城县', '652926', '652900');
INSERT INTO `tplay_area` VALUES (3074, '乌什县', '652927', '652900');
INSERT INTO `tplay_area` VALUES (3075, '阿瓦提县', '652928', '652900');
INSERT INTO `tplay_area` VALUES (3076, '柯坪县', '652929', '652900');
INSERT INTO `tplay_area` VALUES (3077, '阿图什市', '653001', '653000');
INSERT INTO `tplay_area` VALUES (3078, '阿克陶县', '653022', '653000');
INSERT INTO `tplay_area` VALUES (3079, '阿合奇县', '653023', '653000');
INSERT INTO `tplay_area` VALUES (3080, '乌恰县', '653024', '653000');
INSERT INTO `tplay_area` VALUES (3081, '喀什市', '653101', '653100');
INSERT INTO `tplay_area` VALUES (3082, '疏附县', '653121', '653100');
INSERT INTO `tplay_area` VALUES (3083, '疏勒县', '653122', '653100');
INSERT INTO `tplay_area` VALUES (3084, '英吉沙县', '653123', '653100');
INSERT INTO `tplay_area` VALUES (3085, '泽普县', '653124', '653100');
INSERT INTO `tplay_area` VALUES (3086, '莎车县', '653125', '653100');
INSERT INTO `tplay_area` VALUES (3087, '叶城县', '653126', '653100');
INSERT INTO `tplay_area` VALUES (3088, '麦盖提县', '653127', '653100');
INSERT INTO `tplay_area` VALUES (3089, '岳普湖县', '653128', '653100');
INSERT INTO `tplay_area` VALUES (3090, '伽师县', '653129', '653100');
INSERT INTO `tplay_area` VALUES (3091, '巴楚县', '653130', '653100');
INSERT INTO `tplay_area` VALUES (3092, '塔什库尔干塔吉克自治县', '653131', '653100');
INSERT INTO `tplay_area` VALUES (3093, '和田市', '653201', '653200');
INSERT INTO `tplay_area` VALUES (3094, '和田县', '653221', '653200');
INSERT INTO `tplay_area` VALUES (3095, '墨玉县', '653222', '653200');
INSERT INTO `tplay_area` VALUES (3096, '皮山县', '653223', '653200');
INSERT INTO `tplay_area` VALUES (3097, '洛浦县', '653224', '653200');
INSERT INTO `tplay_area` VALUES (3098, '策勒县', '653225', '653200');
INSERT INTO `tplay_area` VALUES (3099, '于田县', '653226', '653200');
INSERT INTO `tplay_area` VALUES (3100, '民丰县', '653227', '653200');
INSERT INTO `tplay_area` VALUES (3101, '伊宁市', '654002', '654000');
INSERT INTO `tplay_area` VALUES (3102, '奎屯市', '654003', '654000');
INSERT INTO `tplay_area` VALUES (3103, '霍尔果斯市', '654004', '654000');
INSERT INTO `tplay_area` VALUES (3104, '伊宁县', '654021', '654000');
INSERT INTO `tplay_area` VALUES (3105, '察布查尔锡伯自治县', '654022', '654000');
INSERT INTO `tplay_area` VALUES (3106, '霍城县', '654023', '654000');
INSERT INTO `tplay_area` VALUES (3107, '巩留县', '654024', '654000');
INSERT INTO `tplay_area` VALUES (3108, '新源县', '654025', '654000');
INSERT INTO `tplay_area` VALUES (3109, '昭苏县', '654026', '654000');
INSERT INTO `tplay_area` VALUES (3110, '特克斯县', '654027', '654000');
INSERT INTO `tplay_area` VALUES (3111, '尼勒克县', '654028', '654000');
INSERT INTO `tplay_area` VALUES (3112, '塔城市', '654201', '654200');
INSERT INTO `tplay_area` VALUES (3113, '乌苏市', '654202', '654200');
INSERT INTO `tplay_area` VALUES (3114, '额敏县', '654221', '654200');
INSERT INTO `tplay_area` VALUES (3115, '沙湾县', '654223', '654200');
INSERT INTO `tplay_area` VALUES (3116, '托里县', '654224', '654200');
INSERT INTO `tplay_area` VALUES (3117, '裕民县', '654225', '654200');
INSERT INTO `tplay_area` VALUES (3118, '和布克赛尔蒙古自治县', '654226', '654200');
INSERT INTO `tplay_area` VALUES (3119, '阿勒泰市', '654301', '654300');
INSERT INTO `tplay_area` VALUES (3120, '布尔津县', '654321', '654300');
INSERT INTO `tplay_area` VALUES (3121, '富蕴县', '654322', '654300');
INSERT INTO `tplay_area` VALUES (3122, '福海县', '654323', '654300');
INSERT INTO `tplay_area` VALUES (3123, '哈巴河县', '654324', '654300');
INSERT INTO `tplay_area` VALUES (3124, '青河县', '654325', '654300');
INSERT INTO `tplay_area` VALUES (3125, '吉木乃县', '654326', '654300');
INSERT INTO `tplay_area` VALUES (3126, '石河子市', '659001', '659000');
INSERT INTO `tplay_area` VALUES (3127, '阿拉尔市', '659002', '659000');
INSERT INTO `tplay_area` VALUES (3128, '图木舒克市', '659003', '659000');
INSERT INTO `tplay_area` VALUES (3129, '五家渠市', '659004', '659000');
INSERT INTO `tplay_area` VALUES (3130, '铁门关市', '659006', '659000');

-- ----------------------------
-- Table structure for tplay_article
-- ----------------------------
DROP TABLE IF EXISTS `tplay_article`;
CREATE TABLE `tplay_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `article_cate_id` int(11) NOT NULL,
  `thumb` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `admin_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `edit_admin_id` int(11) NOT NULL COMMENT '最后修改人',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0待审核1已审核',
  `is_top` int(1) NOT NULL DEFAULT 0 COMMENT '1置顶0普通',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_top`(`is_top`) USING BTREE,
  INDEX `article_cate_id`(`article_cate_id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tplay_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `tplay_article_cate`;
CREATE TABLE `tplay_article_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tplay_attachment
-- ----------------------------
DROP TABLE IF EXISTS `tplay_attachment`;
CREATE TABLE `tplay_attachment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `filename` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `filepath` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件路径+文件名',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `fileext` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `uploadip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上传IP',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未审核1已审核-1不通过',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(11) NOT NULL COMMENT '审核者id',
  `audit_time` int(11) NOT NULL COMMENT '审核时间',
  `use` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用处',
  `download` int(11) NOT NULL DEFAULT 0 COMMENT '下载量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `filename`(`filename`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tplay_attachment
-- ----------------------------
INSERT INTO `tplay_attachment` VALUES (1, 'admin', '0165ca8e55a04367e4154dc17cbb87e5.png', '\\uploads\\admin\\admin_thumb\\20181222\\0165ca8e55a04367e4154dc17cbb87e5.png', 26855, 'png', 1, '127.0.0.1', 1, 1545461615, 1, 1545461615, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (2, 'admin', 'b775dac8b4da24472d47d328e812eabc.png', '\\uploads\\admin\\admin_thumb\\20181222\\b775dac8b4da24472d47d328e812eabc.png', 26855, 'png', 16, '127.0.0.1', 1, 1545461654, 16, 1545461654, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (3, 'admin', '2a9e3f25cb120e6d7ac396d75b9cb06d.png', '\\uploads\\admin\\banner\\20181222\\2a9e3f25cb120e6d7ac396d75b9cb06d.png', 503705, 'png', 1, '127.0.0.1', 1, 1545461727, 1, 1545461727, 'banner', 0);
INSERT INTO `tplay_attachment` VALUES (4, 'admin', 'f2fe745a7554256b617a5580f5e197f6.png', '\\uploads\\admin\\banner\\20181222\\f2fe745a7554256b617a5580f5e197f6.png', 578229, 'png', 1, '127.0.0.1', 1, 1545461742, 1, 1545461742, 'banner', 0);
INSERT INTO `tplay_attachment` VALUES (5, 'admin', 'a42f24d4105441c0b8b26922aa95449b.png', '\\uploads\\admin\\banner\\20181222\\a42f24d4105441c0b8b26922aa95449b.png', 425588, 'png', 1, '127.0.0.1', 1, 1545461758, 1, 1545461758, 'banner', 0);
INSERT INTO `tplay_attachment` VALUES (6, 'admin', '49e70e20aa08a8d6b9f50a04922ad405.png', '\\uploads\\admin\\banner\\20181222\\49e70e20aa08a8d6b9f50a04922ad405.png', 410294, 'png', 1, '127.0.0.1', 1, 1545461878, 1, 1545461878, 'banner', 0);
INSERT INTO `tplay_attachment` VALUES (7, 'admin', '939044fde44e84dea2062436eee36afd.jpg', '\\uploads\\admin\\banner\\20181222\\939044fde44e84dea2062436eee36afd.jpg', 342275, 'jpg', 1, '127.0.0.1', 1, 1545462035, 1, 1545462035, 'banner', 0);
INSERT INTO `tplay_attachment` VALUES (8, 'admin', '55945230a8b81821d9d133d18e372fb0.jpg', '\\uploads\\admin\\house_cover_head\\20181222\\55945230a8b81821d9d133d18e372fb0.jpg', 138140, 'jpg', 1, '127.0.0.1', 1, 1545462121, 1, 1545462121, 'house_cover_head', 0);
INSERT INTO `tplay_attachment` VALUES (9, 'admin', 'a14f5a5fd1e47717fe5308f75ca6e27e.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\a14f5a5fd1e47717fe5308f75ca6e27e.jpg', 342275, 'jpg', 1, '127.0.0.1', 1, 1545462127, 1, 1545462127, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (10, 'admin', '08f2a1a80db0f60f992c974d71cd60c2.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\08f2a1a80db0f60f992c974d71cd60c2.jpg', 134507, 'jpg', 1, '127.0.0.1', 1, 1545462131, 1, 1545462131, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (11, 'admin', 'e7840ad3ebf08b4beaacecc3bb21ad88.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\e7840ad3ebf08b4beaacecc3bb21ad88.jpg', 178895, 'jpg', 1, '127.0.0.1', 1, 1545462133, 1, 1545462133, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (12, 'admin', '88b91a4a7a8a3e53ff9bd691bfc439f2.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\88b91a4a7a8a3e53ff9bd691bfc439f2.jpg', 145887, 'jpg', 1, '127.0.0.1', 1, 1545462139, 1, 1545462139, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (13, 'admin', '863bd7e3c8accc78770057d75bffc98b.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\863bd7e3c8accc78770057d75bffc98b.jpg', 174261, 'jpg', 1, '127.0.0.1', 1, 1545462144, 1, 1545462144, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (14, 'admin', '71b6b40753644b29dfce1da4799a98bd.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\71b6b40753644b29dfce1da4799a98bd.jpg', 664074, 'jpg', 1, '127.0.0.1', 1, 1545462149, 1, 1545462149, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (15, 'admin', '3d4bc75de004efee15bcddb440802866.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\3d4bc75de004efee15bcddb440802866.jpg', 255504, 'jpg', 1, '127.0.0.1', 1, 1545462217, 1, 1545462217, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (16, 'admin', '2805ffdc5067c93a6359c61446219860.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\2805ffdc5067c93a6359c61446219860.jpg', 219148, 'jpg', 1, '127.0.0.1', 1, 1545462220, 1, 1545462220, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (17, 'admin', 'ad0e8a04f0e8b2ab324ffab015122b8a.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\ad0e8a04f0e8b2ab324ffab015122b8a.jpg', 249669, 'jpg', 1, '127.0.0.1', 1, 1545462223, 1, 1545462223, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (18, 'admin', 'cc25c139ebecd7a24235368bf7134438.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\cc25c139ebecd7a24235368bf7134438.jpg', 143020, 'jpg', 1, '127.0.0.1', 1, 1545462227, 1, 1545462227, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (19, 'admin', 'fd186927a936e3230a0e0db1d576d8bf.jpg', '\\uploads\\admin\\house_cover_head\\20181222\\fd186927a936e3230a0e0db1d576d8bf.jpg', 152165, 'jpg', 1, '127.0.0.1', 1, 1545463225, 1, 1545463225, 'house_cover_head', 0);
INSERT INTO `tplay_attachment` VALUES (20, 'admin', '9fa84cc6b2f488b20a3e944225d1d17c.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\9fa84cc6b2f488b20a3e944225d1d17c.jpg', 280594, 'jpg', 1, '127.0.0.1', 1, 1545463229, 1, 1545463229, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (21, 'admin', '264083cfbcdb399f3621c0f12b184081.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\264083cfbcdb399f3621c0f12b184081.jpg', 255870, 'jpg', 1, '127.0.0.1', 1, 1545463233, 1, 1545463233, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (22, 'admin', 'a87733ee2869b03599c6f1b0aab608b3.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\a87733ee2869b03599c6f1b0aab608b3.jpg', 361837, 'jpg', 1, '127.0.0.1', 1, 1545463236, 1, 1545463236, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (23, 'admin', '2c3234a09beb7569c04f83d955dd00dd.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\2c3234a09beb7569c04f83d955dd00dd.jpg', 637148, 'jpg', 1, '127.0.0.1', 1, 1545463239, 1, 1545463239, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (24, 'admin', '6013dc184feb827e394a23e5094074d4.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\6013dc184feb827e394a23e5094074d4.jpg', 361837, 'jpg', 1, '127.0.0.1', 1, 1545463361, 1, 1545463361, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (25, 'admin', '44f4144077ee32848ddc3c4f72c22ecd.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\44f4144077ee32848ddc3c4f72c22ecd.jpg', 255870, 'jpg', 1, '127.0.0.1', 1, 1545463364, 1, 1545463364, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (26, 'admin', 'f69d58d7cf51adb371e4e954974f2e11.jpg', '\\uploads\\admin\\house_cover_head\\20181222\\f69d58d7cf51adb371e4e954974f2e11.jpg', 113985, 'jpg', 1, '127.0.0.1', 1, 1545463439, 1, 1545463439, 'house_cover_head', 0);
INSERT INTO `tplay_attachment` VALUES (27, 'admin', '3f12a3084d1e04764c157e9ce0111956.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\3f12a3084d1e04764c157e9ce0111956.jpg', 146135, 'jpg', 1, '127.0.0.1', 1, 1545463514, 1, 1545463514, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (28, 'admin', '131a01f3090ba2bd708beaa6d303f1a8.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\131a01f3090ba2bd708beaa6d303f1a8.jpg', 217145, 'jpg', 1, '127.0.0.1', 1, 1545463517, 1, 1545463517, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (29, 'admin', '8d57fb8f221bd10f7a5b125cfad8b707.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\8d57fb8f221bd10f7a5b125cfad8b707.jpg', 189665, 'jpg', 1, '127.0.0.1', 1, 1545463519, 1, 1545463519, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (30, 'admin', '3ec79add751ac2a3f55b2fbe9adc51d0.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\3ec79add751ac2a3f55b2fbe9adc51d0.jpg', 135799, 'jpg', 1, '127.0.0.1', 1, 1545463522, 1, 1545463522, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (31, 'admin', '2038a05fe24a92e2f24d40e562cc4d55.jpg', '\\uploads\\admin\\admin_thumb\\20181222\\2038a05fe24a92e2f24d40e562cc4d55.jpg', 126219, 'jpg', 1, '127.0.0.1', 1, 1545463632, 1, 1545463632, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (32, 'admin', 'e3be6c7a46f65e58f43f842dc833bdb7.jpg', '\\uploads\\admin\\store\\20181222\\e3be6c7a46f65e58f43f842dc833bdb7.jpg', 45816, 'jpg', 1, '127.0.0.1', 1, 1545465620, 1, 1545465620, 'store', 0);
INSERT INTO `tplay_attachment` VALUES (33, 'admin', 'af84f0021d5c9e40a1f2c1ebbcb71285.png', '\\uploads\\admin\\store\\20181222\\af84f0021d5c9e40a1f2c1ebbcb71285.png', 26855, 'png', 1, '127.0.0.1', 1, 1545465906, 1, 1545465906, 'store', 0);
INSERT INTO `tplay_attachment` VALUES (34, 'admin', '47be5a62b5eb05bdfd007fcad45b6ae4.png', '\\uploads\\admin\\store\\20181222\\47be5a62b5eb05bdfd007fcad45b6ae4.png', 62804, 'png', 1, '127.0.0.1', 1, 1545466164, 1, 1545466164, 'store', 0);

-- ----------------------------
-- Table structure for tplay_banner
-- ----------------------------
DROP TABLE IF EXISTS `tplay_banner`;
CREATE TABLE `tplay_banner`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NULL DEFAULT NULL,
  `link_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跳转地址',
  `type_id` tinyint(1) NULL DEFAULT 1 COMMENT '1:借款页面; 2:信用卡页面',
  `order_id` int(11) NOT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tplay_banner
-- ----------------------------
INSERT INTO `tplay_banner` VALUES (1, 5, '', 1, 0, NULL, 1545459815, 1545461759);
INSERT INTO `tplay_banner` VALUES (2, 4, '', 1, 0, NULL, 1545459830, 1545461743);
INSERT INTO `tplay_banner` VALUES (3, 3, '', 1, 0, NULL, 1545459844, 1545461728);
INSERT INTO `tplay_banner` VALUES (4, 6, '', 1, 0, NULL, 1545459853, 1545462013);
INSERT INTO `tplay_banner` VALUES (5, 7, '', 1, 0, NULL, 1545462061, 1545462061);

-- ----------------------------
-- Table structure for tplay_brokerage
-- ----------------------------
DROP TABLE IF EXISTS `tplay_brokerage`;
CREATE TABLE `tplay_brokerage`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `house_area` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋面积范围',
  `house_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋类型',
  `price` decimal(10, 2) NOT NULL COMMENT '佣金',
  `store_percentage` int(10) NOT NULL COMMENT '门店经纪人比例',
  `public_percentage` int(10) NOT NULL COMMENT '大众经纪人比例',
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tplay_brokerage
-- ----------------------------
INSERT INTO `tplay_brokerage` VALUES (1, '30-60', '门面', 800.00, 60, 40, 1545460602, 1545460602, NULL);
INSERT INTO `tplay_brokerage` VALUES (2, '60-120', '公寓', 1000.00, 70, 50, 1545460796, 1545460796, NULL);
INSERT INTO `tplay_brokerage` VALUES (3, '80-120', '住宅', 1000.00, 90, 60, 1545460929, 1545460929, NULL);
INSERT INTO `tplay_brokerage` VALUES (4, '120-180', '住宅', 2000.00, 90, 60, 1545461056, 1545461056, NULL);
INSERT INTO `tplay_brokerage` VALUES (5, '200-400', '别墅', 10000.00, 95, 70, 1545461078, 1545461078, NULL);

-- ----------------------------
-- Table structure for tplay_city
-- ----------------------------
DROP TABLE IF EXISTS `tplay_city`;
CREATE TABLE `tplay_city`  (
  `_id` int(11) NOT NULL,
  `city_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tplay_city
-- ----------------------------
INSERT INTO `tplay_city` VALUES (1, '110100', '市辖区', '110000');
INSERT INTO `tplay_city` VALUES (2, '120100', '市辖区', '120000');
INSERT INTO `tplay_city` VALUES (3, '130100', '石家庄市', '130000');
INSERT INTO `tplay_city` VALUES (4, '130200', '唐山市', '130000');
INSERT INTO `tplay_city` VALUES (5, '130300', '秦皇岛市', '130000');
INSERT INTO `tplay_city` VALUES (6, '130400', '邯郸市', '130000');
INSERT INTO `tplay_city` VALUES (7, '130500', '邢台市', '130000');
INSERT INTO `tplay_city` VALUES (8, '130600', '保定市', '130000');
INSERT INTO `tplay_city` VALUES (9, '130700', '张家口市', '130000');
INSERT INTO `tplay_city` VALUES (10, '130800', '承德市', '130000');
INSERT INTO `tplay_city` VALUES (11, '130900', '沧州市', '130000');
INSERT INTO `tplay_city` VALUES (12, '131000', '廊坊市', '130000');
INSERT INTO `tplay_city` VALUES (13, '131100', '衡水市', '130000');
INSERT INTO `tplay_city` VALUES (14, '139000', '省直辖县级行政区划', '130000');
INSERT INTO `tplay_city` VALUES (15, '140100', '太原市', '140000');
INSERT INTO `tplay_city` VALUES (16, '140200', '大同市', '140000');
INSERT INTO `tplay_city` VALUES (17, '140300', '阳泉市', '140000');
INSERT INTO `tplay_city` VALUES (18, '140400', '长治市', '140000');
INSERT INTO `tplay_city` VALUES (19, '140500', '晋城市', '140000');
INSERT INTO `tplay_city` VALUES (20, '140600', '朔州市', '140000');
INSERT INTO `tplay_city` VALUES (21, '140700', '晋中市', '140000');
INSERT INTO `tplay_city` VALUES (22, '140800', '运城市', '140000');
INSERT INTO `tplay_city` VALUES (23, '140900', '忻州市', '140000');
INSERT INTO `tplay_city` VALUES (24, '141000', '临汾市', '140000');
INSERT INTO `tplay_city` VALUES (25, '141100', '吕梁市', '140000');
INSERT INTO `tplay_city` VALUES (26, '150100', '呼和浩特市', '150000');
INSERT INTO `tplay_city` VALUES (27, '150200', '包头市', '150000');
INSERT INTO `tplay_city` VALUES (28, '150300', '乌海市', '150000');
INSERT INTO `tplay_city` VALUES (29, '150400', '赤峰市', '150000');
INSERT INTO `tplay_city` VALUES (30, '150500', '通辽市', '150000');
INSERT INTO `tplay_city` VALUES (31, '150600', '鄂尔多斯市', '150000');
INSERT INTO `tplay_city` VALUES (32, '150700', '呼伦贝尔市', '150000');
INSERT INTO `tplay_city` VALUES (33, '150800', '巴彦淖尔市', '150000');
INSERT INTO `tplay_city` VALUES (34, '150900', '乌兰察布市', '150000');
INSERT INTO `tplay_city` VALUES (35, '152200', '兴安盟', '150000');
INSERT INTO `tplay_city` VALUES (36, '152500', '锡林郭勒盟', '150000');
INSERT INTO `tplay_city` VALUES (37, '152900', '阿拉善盟', '150000');
INSERT INTO `tplay_city` VALUES (38, '210100', '沈阳市', '210000');
INSERT INTO `tplay_city` VALUES (39, '210200', '大连市', '210000');
INSERT INTO `tplay_city` VALUES (40, '210300', '鞍山市', '210000');
INSERT INTO `tplay_city` VALUES (41, '210400', '抚顺市', '210000');
INSERT INTO `tplay_city` VALUES (42, '210500', '本溪市', '210000');
INSERT INTO `tplay_city` VALUES (43, '210600', '丹东市', '210000');
INSERT INTO `tplay_city` VALUES (44, '210700', '锦州市', '210000');
INSERT INTO `tplay_city` VALUES (45, '210800', '营口市', '210000');
INSERT INTO `tplay_city` VALUES (46, '210900', '阜新市', '210000');
INSERT INTO `tplay_city` VALUES (47, '211000', '辽阳市', '210000');
INSERT INTO `tplay_city` VALUES (48, '211100', '盘锦市', '210000');
INSERT INTO `tplay_city` VALUES (49, '211200', '铁岭市', '210000');
INSERT INTO `tplay_city` VALUES (50, '211300', '朝阳市', '210000');
INSERT INTO `tplay_city` VALUES (51, '211400', '葫芦岛市', '210000');
INSERT INTO `tplay_city` VALUES (52, '220100', '长春市', '220000');
INSERT INTO `tplay_city` VALUES (53, '220200', '吉林市', '220000');
INSERT INTO `tplay_city` VALUES (54, '220300', '四平市', '220000');
INSERT INTO `tplay_city` VALUES (55, '220400', '辽源市', '220000');
INSERT INTO `tplay_city` VALUES (56, '220500', '通化市', '220000');
INSERT INTO `tplay_city` VALUES (57, '220600', '白山市', '220000');
INSERT INTO `tplay_city` VALUES (58, '220700', '松原市', '220000');
INSERT INTO `tplay_city` VALUES (59, '220800', '白城市', '220000');
INSERT INTO `tplay_city` VALUES (60, '222400', '延边朝鲜族自治州', '220000');
INSERT INTO `tplay_city` VALUES (61, '230100', '哈尔滨市', '230000');
INSERT INTO `tplay_city` VALUES (62, '230200', '齐齐哈尔市', '230000');
INSERT INTO `tplay_city` VALUES (63, '230300', '鸡西市', '230000');
INSERT INTO `tplay_city` VALUES (64, '230400', '鹤岗市', '230000');
INSERT INTO `tplay_city` VALUES (65, '230500', '双鸭山市', '230000');
INSERT INTO `tplay_city` VALUES (66, '230600', '大庆市', '230000');
INSERT INTO `tplay_city` VALUES (67, '230700', '伊春市', '230000');
INSERT INTO `tplay_city` VALUES (68, '230800', '佳木斯市', '230000');
INSERT INTO `tplay_city` VALUES (69, '230900', '七台河市', '230000');
INSERT INTO `tplay_city` VALUES (70, '231000', '牡丹江市', '230000');
INSERT INTO `tplay_city` VALUES (71, '231100', '黑河市', '230000');
INSERT INTO `tplay_city` VALUES (72, '231200', '绥化市', '230000');
INSERT INTO `tplay_city` VALUES (73, '232700', '大兴安岭地区', '230000');
INSERT INTO `tplay_city` VALUES (74, '310100', '市辖区', '310000');
INSERT INTO `tplay_city` VALUES (75, '320100', '南京市', '320000');
INSERT INTO `tplay_city` VALUES (76, '320200', '无锡市', '320000');
INSERT INTO `tplay_city` VALUES (77, '320300', '徐州市', '320000');
INSERT INTO `tplay_city` VALUES (78, '320400', '常州市', '320000');
INSERT INTO `tplay_city` VALUES (79, '320500', '苏州市', '320000');
INSERT INTO `tplay_city` VALUES (80, '320600', '南通市', '320000');
INSERT INTO `tplay_city` VALUES (81, '320700', '连云港市', '320000');
INSERT INTO `tplay_city` VALUES (82, '320800', '淮安市', '320000');
INSERT INTO `tplay_city` VALUES (83, '320900', '盐城市', '320000');
INSERT INTO `tplay_city` VALUES (84, '321000', '扬州市', '320000');
INSERT INTO `tplay_city` VALUES (85, '321100', '镇江市', '320000');
INSERT INTO `tplay_city` VALUES (86, '321200', '泰州市', '320000');
INSERT INTO `tplay_city` VALUES (87, '321300', '宿迁市', '320000');
INSERT INTO `tplay_city` VALUES (88, '330100', '杭州市', '330000');
INSERT INTO `tplay_city` VALUES (89, '330200', '宁波市', '330000');
INSERT INTO `tplay_city` VALUES (90, '330300', '温州市', '330000');
INSERT INTO `tplay_city` VALUES (91, '330400', '嘉兴市', '330000');
INSERT INTO `tplay_city` VALUES (92, '330500', '湖州市', '330000');
INSERT INTO `tplay_city` VALUES (93, '330600', '绍兴市', '330000');
INSERT INTO `tplay_city` VALUES (94, '330700', '金华市', '330000');
INSERT INTO `tplay_city` VALUES (95, '330800', '衢州市', '330000');
INSERT INTO `tplay_city` VALUES (96, '330900', '舟山市', '330000');
INSERT INTO `tplay_city` VALUES (97, '331000', '台州市', '330000');
INSERT INTO `tplay_city` VALUES (98, '331100', '丽水市', '330000');
INSERT INTO `tplay_city` VALUES (99, '340100', '合肥市', '340000');
INSERT INTO `tplay_city` VALUES (100, '340200', '芜湖市', '340000');
INSERT INTO `tplay_city` VALUES (101, '340300', '蚌埠市', '340000');
INSERT INTO `tplay_city` VALUES (102, '340400', '淮南市', '340000');
INSERT INTO `tplay_city` VALUES (103, '340500', '马鞍山市', '340000');
INSERT INTO `tplay_city` VALUES (104, '340600', '淮北市', '340000');
INSERT INTO `tplay_city` VALUES (105, '340700', '铜陵市', '340000');
INSERT INTO `tplay_city` VALUES (106, '340800', '安庆市', '340000');
INSERT INTO `tplay_city` VALUES (107, '341000', '黄山市', '340000');
INSERT INTO `tplay_city` VALUES (108, '341100', '滁州市', '340000');
INSERT INTO `tplay_city` VALUES (109, '341200', '阜阳市', '340000');
INSERT INTO `tplay_city` VALUES (110, '341300', '宿州市', '340000');
INSERT INTO `tplay_city` VALUES (111, '341500', '六安市', '340000');
INSERT INTO `tplay_city` VALUES (112, '341600', '亳州市', '340000');
INSERT INTO `tplay_city` VALUES (113, '341700', '池州市', '340000');
INSERT INTO `tplay_city` VALUES (114, '341800', '宣城市', '340000');
INSERT INTO `tplay_city` VALUES (115, '350100', '福州市', '350000');
INSERT INTO `tplay_city` VALUES (116, '350200', '厦门市', '350000');
INSERT INTO `tplay_city` VALUES (117, '350300', '莆田市', '350000');
INSERT INTO `tplay_city` VALUES (118, '350400', '三明市', '350000');
INSERT INTO `tplay_city` VALUES (119, '350500', '泉州市', '350000');
INSERT INTO `tplay_city` VALUES (120, '350600', '漳州市', '350000');
INSERT INTO `tplay_city` VALUES (121, '350700', '南平市', '350000');
INSERT INTO `tplay_city` VALUES (122, '350800', '龙岩市', '350000');
INSERT INTO `tplay_city` VALUES (123, '350900', '宁德市', '350000');
INSERT INTO `tplay_city` VALUES (124, '360100', '南昌市', '360000');
INSERT INTO `tplay_city` VALUES (125, '360200', '景德镇市', '360000');
INSERT INTO `tplay_city` VALUES (126, '360300', '萍乡市', '360000');
INSERT INTO `tplay_city` VALUES (127, '360400', '九江市', '360000');
INSERT INTO `tplay_city` VALUES (128, '360500', '新余市', '360000');
INSERT INTO `tplay_city` VALUES (129, '360600', '鹰潭市', '360000');
INSERT INTO `tplay_city` VALUES (130, '360700', '赣州市', '360000');
INSERT INTO `tplay_city` VALUES (131, '360800', '吉安市', '360000');
INSERT INTO `tplay_city` VALUES (132, '360900', '宜春市', '360000');
INSERT INTO `tplay_city` VALUES (133, '361000', '抚州市', '360000');
INSERT INTO `tplay_city` VALUES (134, '361100', '上饶市', '360000');
INSERT INTO `tplay_city` VALUES (135, '370100', '济南市', '370000');
INSERT INTO `tplay_city` VALUES (136, '370200', '青岛市', '370000');
INSERT INTO `tplay_city` VALUES (137, '370300', '淄博市', '370000');
INSERT INTO `tplay_city` VALUES (138, '370400', '枣庄市', '370000');
INSERT INTO `tplay_city` VALUES (139, '370500', '东营市', '370000');
INSERT INTO `tplay_city` VALUES (140, '370600', '烟台市', '370000');
INSERT INTO `tplay_city` VALUES (141, '370700', '潍坊市', '370000');
INSERT INTO `tplay_city` VALUES (142, '370800', '济宁市', '370000');
INSERT INTO `tplay_city` VALUES (143, '370900', '泰安市', '370000');
INSERT INTO `tplay_city` VALUES (144, '371000', '威海市', '370000');
INSERT INTO `tplay_city` VALUES (145, '371100', '日照市', '370000');
INSERT INTO `tplay_city` VALUES (146, '371200', '莱芜市', '370000');
INSERT INTO `tplay_city` VALUES (147, '371300', '临沂市', '370000');
INSERT INTO `tplay_city` VALUES (148, '371400', '德州市', '370000');
INSERT INTO `tplay_city` VALUES (149, '371500', '聊城市', '370000');
INSERT INTO `tplay_city` VALUES (150, '371600', '滨州市', '370000');
INSERT INTO `tplay_city` VALUES (151, '371700', '菏泽市', '370000');
INSERT INTO `tplay_city` VALUES (152, '410100', '郑州市', '410000');
INSERT INTO `tplay_city` VALUES (153, '410200', '开封市', '410000');
INSERT INTO `tplay_city` VALUES (154, '410300', '洛阳市', '410000');
INSERT INTO `tplay_city` VALUES (155, '410400', '平顶山市', '410000');
INSERT INTO `tplay_city` VALUES (156, '410500', '安阳市', '410000');
INSERT INTO `tplay_city` VALUES (157, '410600', '鹤壁市', '410000');
INSERT INTO `tplay_city` VALUES (158, '410700', '新乡市', '410000');
INSERT INTO `tplay_city` VALUES (159, '410800', '焦作市', '410000');
INSERT INTO `tplay_city` VALUES (160, '410900', '濮阳市', '410000');
INSERT INTO `tplay_city` VALUES (161, '411000', '许昌市', '410000');
INSERT INTO `tplay_city` VALUES (162, '411100', '漯河市', '410000');
INSERT INTO `tplay_city` VALUES (163, '411200', '三门峡市', '410000');
INSERT INTO `tplay_city` VALUES (164, '411300', '南阳市', '410000');
INSERT INTO `tplay_city` VALUES (165, '411400', '商丘市', '410000');
INSERT INTO `tplay_city` VALUES (166, '411500', '信阳市', '410000');
INSERT INTO `tplay_city` VALUES (167, '411600', '周口市', '410000');
INSERT INTO `tplay_city` VALUES (168, '411700', '驻马店市', '410000');
INSERT INTO `tplay_city` VALUES (169, '419000', '省直辖县级行政区划', '410000');
INSERT INTO `tplay_city` VALUES (170, '420100', '武汉市', '420000');
INSERT INTO `tplay_city` VALUES (171, '420200', '黄石市', '420000');
INSERT INTO `tplay_city` VALUES (172, '420300', '十堰市', '420000');
INSERT INTO `tplay_city` VALUES (173, '420500', '宜昌市', '420000');
INSERT INTO `tplay_city` VALUES (174, '420600', '襄阳市', '420000');
INSERT INTO `tplay_city` VALUES (175, '420700', '鄂州市', '420000');
INSERT INTO `tplay_city` VALUES (176, '420800', '荆门市', '420000');
INSERT INTO `tplay_city` VALUES (177, '420900', '孝感市', '420000');
INSERT INTO `tplay_city` VALUES (178, '421000', '荆州市', '420000');
INSERT INTO `tplay_city` VALUES (179, '421100', '黄冈市', '420000');
INSERT INTO `tplay_city` VALUES (180, '421200', '咸宁市', '420000');
INSERT INTO `tplay_city` VALUES (181, '421300', '随州市', '420000');
INSERT INTO `tplay_city` VALUES (182, '422800', '恩施土家族苗族自治州', '420000');
INSERT INTO `tplay_city` VALUES (183, '429000', '省直辖县级行政区划', '420000');
INSERT INTO `tplay_city` VALUES (184, '430100', '长沙市', '430000');
INSERT INTO `tplay_city` VALUES (185, '430200', '株洲市', '430000');
INSERT INTO `tplay_city` VALUES (186, '430300', '湘潭市', '430000');
INSERT INTO `tplay_city` VALUES (187, '430400', '衡阳市', '430000');
INSERT INTO `tplay_city` VALUES (188, '430500', '邵阳市', '430000');
INSERT INTO `tplay_city` VALUES (189, '430600', '岳阳市', '430000');
INSERT INTO `tplay_city` VALUES (190, '430700', '常德市', '430000');
INSERT INTO `tplay_city` VALUES (191, '430800', '张家界市', '430000');
INSERT INTO `tplay_city` VALUES (192, '430900', '益阳市', '430000');
INSERT INTO `tplay_city` VALUES (193, '431000', '郴州市', '430000');
INSERT INTO `tplay_city` VALUES (194, '431100', '永州市', '430000');
INSERT INTO `tplay_city` VALUES (195, '431200', '怀化市', '430000');
INSERT INTO `tplay_city` VALUES (196, '431300', '娄底市', '430000');
INSERT INTO `tplay_city` VALUES (197, '433100', '湘西土家族苗族自治州', '430000');
INSERT INTO `tplay_city` VALUES (198, '440100', '广州市', '440000');
INSERT INTO `tplay_city` VALUES (199, '440200', '韶关市', '440000');
INSERT INTO `tplay_city` VALUES (200, '440300', '深圳市', '440000');
INSERT INTO `tplay_city` VALUES (201, '440400', '珠海市', '440000');
INSERT INTO `tplay_city` VALUES (202, '440500', '汕头市', '440000');
INSERT INTO `tplay_city` VALUES (203, '440600', '佛山市', '440000');
INSERT INTO `tplay_city` VALUES (204, '440700', '江门市', '440000');
INSERT INTO `tplay_city` VALUES (205, '440800', '湛江市', '440000');
INSERT INTO `tplay_city` VALUES (206, '440900', '茂名市', '440000');
INSERT INTO `tplay_city` VALUES (207, '441200', '肇庆市', '440000');
INSERT INTO `tplay_city` VALUES (208, '441300', '惠州市', '440000');
INSERT INTO `tplay_city` VALUES (209, '441400', '梅州市', '440000');
INSERT INTO `tplay_city` VALUES (210, '441500', '汕尾市', '440000');
INSERT INTO `tplay_city` VALUES (211, '441600', '河源市', '440000');
INSERT INTO `tplay_city` VALUES (212, '441700', '阳江市', '440000');
INSERT INTO `tplay_city` VALUES (213, '441800', '清远市', '440000');
INSERT INTO `tplay_city` VALUES (214, '441900', '东莞市', '440000');
INSERT INTO `tplay_city` VALUES (215, '442000', '中山市', '440000');
INSERT INTO `tplay_city` VALUES (216, '445100', '潮州市', '440000');
INSERT INTO `tplay_city` VALUES (217, '445200', '揭阳市', '440000');
INSERT INTO `tplay_city` VALUES (218, '445300', '云浮市', '440000');
INSERT INTO `tplay_city` VALUES (219, '450100', '南宁市', '450000');
INSERT INTO `tplay_city` VALUES (220, '450200', '柳州市', '450000');
INSERT INTO `tplay_city` VALUES (221, '450300', '桂林市', '450000');
INSERT INTO `tplay_city` VALUES (222, '450400', '梧州市', '450000');
INSERT INTO `tplay_city` VALUES (223, '450500', '北海市', '450000');
INSERT INTO `tplay_city` VALUES (224, '450600', '防城港市', '450000');
INSERT INTO `tplay_city` VALUES (225, '450700', '钦州市', '450000');
INSERT INTO `tplay_city` VALUES (226, '450800', '贵港市', '450000');
INSERT INTO `tplay_city` VALUES (227, '450900', '玉林市', '450000');
INSERT INTO `tplay_city` VALUES (228, '451000', '百色市', '450000');
INSERT INTO `tplay_city` VALUES (229, '451100', '贺州市', '450000');
INSERT INTO `tplay_city` VALUES (230, '451200', '河池市', '450000');
INSERT INTO `tplay_city` VALUES (231, '451300', '来宾市', '450000');
INSERT INTO `tplay_city` VALUES (232, '451400', '崇左市', '450000');
INSERT INTO `tplay_city` VALUES (233, '460100', '海口市', '460000');
INSERT INTO `tplay_city` VALUES (234, '460200', '三亚市', '460000');
INSERT INTO `tplay_city` VALUES (235, '460300', '三沙市', '460000');
INSERT INTO `tplay_city` VALUES (236, '460400', '儋州市', '460000');
INSERT INTO `tplay_city` VALUES (237, '469000', '省直辖县级行政区划', '460000');
INSERT INTO `tplay_city` VALUES (238, '500100', '市辖区', '500000');
INSERT INTO `tplay_city` VALUES (239, '500200', '县', '500000');
INSERT INTO `tplay_city` VALUES (240, '510100', '成都市', '510000');
INSERT INTO `tplay_city` VALUES (241, '510300', '自贡市', '510000');
INSERT INTO `tplay_city` VALUES (242, '510400', '攀枝花市', '510000');
INSERT INTO `tplay_city` VALUES (243, '510500', '泸州市', '510000');
INSERT INTO `tplay_city` VALUES (244, '510600', '德阳市', '510000');
INSERT INTO `tplay_city` VALUES (245, '510700', '绵阳市', '510000');
INSERT INTO `tplay_city` VALUES (246, '510800', '广元市', '510000');
INSERT INTO `tplay_city` VALUES (247, '510900', '遂宁市', '510000');
INSERT INTO `tplay_city` VALUES (248, '511000', '内江市', '510000');
INSERT INTO `tplay_city` VALUES (249, '511100', '乐山市', '510000');
INSERT INTO `tplay_city` VALUES (250, '511300', '南充市', '510000');
INSERT INTO `tplay_city` VALUES (251, '511400', '眉山市', '510000');
INSERT INTO `tplay_city` VALUES (252, '511500', '宜宾市', '510000');
INSERT INTO `tplay_city` VALUES (253, '511600', '广安市', '510000');
INSERT INTO `tplay_city` VALUES (254, '511700', '达州市', '510000');
INSERT INTO `tplay_city` VALUES (255, '511800', '雅安市', '510000');
INSERT INTO `tplay_city` VALUES (256, '511900', '巴中市', '510000');
INSERT INTO `tplay_city` VALUES (257, '512000', '资阳市', '510000');
INSERT INTO `tplay_city` VALUES (258, '513200', '阿坝藏族羌族自治州', '510000');
INSERT INTO `tplay_city` VALUES (259, '513300', '甘孜藏族自治州', '510000');
INSERT INTO `tplay_city` VALUES (260, '513400', '凉山彝族自治州', '510000');
INSERT INTO `tplay_city` VALUES (261, '520100', '贵阳市', '520000');
INSERT INTO `tplay_city` VALUES (262, '520200', '六盘水市', '520000');
INSERT INTO `tplay_city` VALUES (263, '520300', '遵义市', '520000');
INSERT INTO `tplay_city` VALUES (264, '520400', '安顺市', '520000');
INSERT INTO `tplay_city` VALUES (265, '520500', '毕节市', '520000');
INSERT INTO `tplay_city` VALUES (266, '520600', '铜仁市', '520000');
INSERT INTO `tplay_city` VALUES (267, '522300', '黔西南布依族苗族自治州', '520000');
INSERT INTO `tplay_city` VALUES (268, '522600', '黔东南苗族侗族自治州', '520000');
INSERT INTO `tplay_city` VALUES (269, '522700', '黔南布依族苗族自治州', '520000');
INSERT INTO `tplay_city` VALUES (270, '530100', '昆明市', '530000');
INSERT INTO `tplay_city` VALUES (271, '530300', '曲靖市', '530000');
INSERT INTO `tplay_city` VALUES (272, '530400', '玉溪市', '530000');
INSERT INTO `tplay_city` VALUES (273, '530500', '保山市', '530000');
INSERT INTO `tplay_city` VALUES (274, '530600', '昭通市', '530000');
INSERT INTO `tplay_city` VALUES (275, '530700', '丽江市', '530000');
INSERT INTO `tplay_city` VALUES (276, '530800', '普洱市', '530000');
INSERT INTO `tplay_city` VALUES (277, '530900', '临沧市', '530000');
INSERT INTO `tplay_city` VALUES (278, '532300', '楚雄彝族自治州', '530000');
INSERT INTO `tplay_city` VALUES (279, '532500', '红河哈尼族彝族自治州', '530000');
INSERT INTO `tplay_city` VALUES (280, '532600', '文山壮族苗族自治州', '530000');
INSERT INTO `tplay_city` VALUES (281, '532800', '西双版纳傣族自治州', '530000');
INSERT INTO `tplay_city` VALUES (282, '532900', '大理白族自治州', '530000');
INSERT INTO `tplay_city` VALUES (283, '533100', '德宏傣族景颇族自治州', '530000');
INSERT INTO `tplay_city` VALUES (284, '533300', '怒江傈僳族自治州', '530000');
INSERT INTO `tplay_city` VALUES (285, '533400', '迪庆藏族自治州', '530000');
INSERT INTO `tplay_city` VALUES (286, '540100', '拉萨市', '540000');
INSERT INTO `tplay_city` VALUES (287, '540200', '日喀则市', '540000');
INSERT INTO `tplay_city` VALUES (288, '540300', '昌都市', '540000');
INSERT INTO `tplay_city` VALUES (289, '540400', '林芝市', '540000');
INSERT INTO `tplay_city` VALUES (290, '540500', '山南市', '540000');
INSERT INTO `tplay_city` VALUES (291, '542400', '那曲地区', '540000');
INSERT INTO `tplay_city` VALUES (292, '542500', '阿里地区', '540000');
INSERT INTO `tplay_city` VALUES (293, '610100', '西安市', '610000');
INSERT INTO `tplay_city` VALUES (294, '610200', '铜川市', '610000');
INSERT INTO `tplay_city` VALUES (295, '610300', '宝鸡市', '610000');
INSERT INTO `tplay_city` VALUES (296, '610400', '咸阳市', '610000');
INSERT INTO `tplay_city` VALUES (297, '610500', '渭南市', '610000');
INSERT INTO `tplay_city` VALUES (298, '610600', '延安市', '610000');
INSERT INTO `tplay_city` VALUES (299, '610700', '汉中市', '610000');
INSERT INTO `tplay_city` VALUES (300, '610800', '榆林市', '610000');
INSERT INTO `tplay_city` VALUES (301, '610900', '安康市', '610000');
INSERT INTO `tplay_city` VALUES (302, '611000', '商洛市', '610000');
INSERT INTO `tplay_city` VALUES (303, '620100', '兰州市', '620000');
INSERT INTO `tplay_city` VALUES (304, '620200', '嘉峪关市', '620000');
INSERT INTO `tplay_city` VALUES (305, '620300', '金昌市', '620000');
INSERT INTO `tplay_city` VALUES (306, '620400', '白银市', '620000');
INSERT INTO `tplay_city` VALUES (307, '620500', '天水市', '620000');
INSERT INTO `tplay_city` VALUES (308, '620600', '武威市', '620000');
INSERT INTO `tplay_city` VALUES (309, '620700', '张掖市', '620000');
INSERT INTO `tplay_city` VALUES (310, '620800', '平凉市', '620000');
INSERT INTO `tplay_city` VALUES (311, '620900', '酒泉市', '620000');
INSERT INTO `tplay_city` VALUES (312, '621000', '庆阳市', '620000');
INSERT INTO `tplay_city` VALUES (313, '621100', '定西市', '620000');
INSERT INTO `tplay_city` VALUES (314, '621200', '陇南市', '620000');
INSERT INTO `tplay_city` VALUES (315, '622900', '临夏回族自治州', '620000');
INSERT INTO `tplay_city` VALUES (316, '623000', '甘南藏族自治州', '620000');
INSERT INTO `tplay_city` VALUES (317, '630100', '西宁市', '630000');
INSERT INTO `tplay_city` VALUES (318, '630200', '海东市', '630000');
INSERT INTO `tplay_city` VALUES (319, '632200', '海北藏族自治州', '630000');
INSERT INTO `tplay_city` VALUES (320, '632300', '黄南藏族自治州', '630000');
INSERT INTO `tplay_city` VALUES (321, '632500', '海南藏族自治州', '630000');
INSERT INTO `tplay_city` VALUES (322, '632600', '果洛藏族自治州', '630000');
INSERT INTO `tplay_city` VALUES (323, '632700', '玉树藏族自治州', '630000');
INSERT INTO `tplay_city` VALUES (324, '632800', '海西蒙古族藏族自治州', '630000');
INSERT INTO `tplay_city` VALUES (325, '640100', '银川市', '640000');
INSERT INTO `tplay_city` VALUES (326, '640200', '石嘴山市', '640000');
INSERT INTO `tplay_city` VALUES (327, '640300', '吴忠市', '640000');
INSERT INTO `tplay_city` VALUES (328, '640400', '固原市', '640000');
INSERT INTO `tplay_city` VALUES (329, '640500', '中卫市', '640000');
INSERT INTO `tplay_city` VALUES (330, '650100', '乌鲁木齐市', '650000');
INSERT INTO `tplay_city` VALUES (331, '650200', '克拉玛依市', '650000');
INSERT INTO `tplay_city` VALUES (332, '650400', '吐鲁番市', '650000');
INSERT INTO `tplay_city` VALUES (333, '650500', '哈密市', '650000');
INSERT INTO `tplay_city` VALUES (334, '652300', '昌吉回族自治州', '650000');
INSERT INTO `tplay_city` VALUES (335, '652700', '博尔塔拉蒙古自治州', '650000');
INSERT INTO `tplay_city` VALUES (336, '652800', '巴音郭楞蒙古自治州', '650000');
INSERT INTO `tplay_city` VALUES (337, '652900', '阿克苏地区', '650000');
INSERT INTO `tplay_city` VALUES (338, '653000', '克孜勒苏柯尔克孜自治州', '650000');
INSERT INTO `tplay_city` VALUES (339, '653100', '喀什地区', '650000');
INSERT INTO `tplay_city` VALUES (340, '653200', '和田地区', '650000');
INSERT INTO `tplay_city` VALUES (341, '654000', '伊犁哈萨克自治州', '650000');
INSERT INTO `tplay_city` VALUES (342, '654200', '塔城地区', '650000');
INSERT INTO `tplay_city` VALUES (343, '654300', '阿勒泰地区', '650000');
INSERT INTO `tplay_city` VALUES (344, '659000', '自治区直辖县级行政区划', '650000');

-- ----------------------------
-- Table structure for tplay_commission
-- ----------------------------
DROP TABLE IF EXISTS `tplay_commission`;
CREATE TABLE `tplay_commission`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `order_id` int(11) UNSIGNED NOT NULL COMMENT '报备订单id',
  `house_id` int(11) UNSIGNED NOT NULL COMMENT '楼盘id',
  `brokerage_id` int(11) UNSIGNED NOT NULL COMMENT '佣金方案的id',
  `house_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '楼盘大小 例如80-120',
  `house_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房子类型 例如 门面',
  `price` float(11, 2) UNSIGNED NOT NULL COMMENT '佣金方案的佣金',
  `store_percentage` int(11) UNSIGNED NOT NULL COMMENT '门店经纪人 佣金比例',
  `public_percentage` int(11) UNSIGNED NOT NULL COMMENT '大众经纪人 佣金比例',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报备订单的名字',
  `house_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房子名字',
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报备手机号',
  `commission` float(11, 2) UNSIGNED NOT NULL COMMENT '获得的实际佣金',
  `level` tinyint(1) NOT NULL COMMENT '用户身份',
  `date` int(11) NOT NULL DEFAULT 0 COMMENT '佣金结算时间',
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tplay_emailconfig
-- ----------------------------
DROP TABLE IF EXISTS `tplay_emailconfig`;
CREATE TABLE `tplay_emailconfig`  (
  `email` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱配置标识',
  `from_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件来源也就是邮件地址',
  `from_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `smtp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱smtp服务器',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱账号',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱密码',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件模板',
  INDEX `email`(`email`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_emailconfig
-- ----------------------------
INSERT INTO `tplay_emailconfig` VALUES ('email', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for tplay_house_source
-- ----------------------------
DROP TABLE IF EXISTS `tplay_house_source`;
CREATE TABLE `tplay_house_source`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `cover_img` int(10) NOT NULL COMMENT '封面图',
  `head_img` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头部轮播图',
  `house_price` decimal(10, 2) NOT NULL COMMENT '房价__元/㎡',
  `opening_time` int(11) NOT NULL COMMENT '开盘时间',
  `house_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房源地址',
  `brokerage_plan` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL COMMENT '佣金方案',
  `developer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开发商',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `area` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区',
  `greening_rate` int(10) NOT NULL COMMENT '绿化率__%',
  `parking_space` int(10) NOT NULL COMMENT '车位数量',
  `floor_area` int(10) NOT NULL COMMENT '占地面积__㎡',
  `property_costs` decimal(10, 2) NULL DEFAULT NULL COMMENT '物业费__元/㎡',
  `property_company` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物业公司',
  `decoration_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '装修类型以 , 逗号相隔',
  `room_map` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '户型图以 , 逗号相隔',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情介绍',
  `is_head` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否头条:0否,1是',
  `house_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋类型,仅供2手房',
  `init_status` tinyint(1) NOT NULL COMMENT '1新房，2二手房',
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tplay_house_source
-- ----------------------------
INSERT INTO `tplay_house_source` VALUES (1, '时代之光', '时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。', 8, '9,10,11,12,13,14', 25556.00, 1544544000, '安徽省合肥市滨湖区庐州大道与南京路交汇处向东100米', '1,2,3,4,5', ' 	合肥万科瑞益地产有限公司', '340000', '340100', '1006', 40, 7946, 85253, 3.20, '南京万科物业服务有限公司', '毛坯,简约,豪华装,别墅', '15,16,17,18', '<h2>省府板块 1号线旁 双平层叠墅</h2><p>时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。时代之光打造纯粹的高端低密社区，开启了合肥创新墅居时代。</p><p class=\"small-remarks\">项目周边配套醇熟。地铁1号线滨湖会展中心站点、约40万方成熟购物中心、五星级酒店、三级甲等滨湖医院、合肥一中等完善配套。南边更有840万方公园，环境优美，是滨湖的天然氧吧。</p><p class=\"small-remarks\"><img src=\"h', 0, '', 1, 1545462574, 1545462943, NULL);
INSERT INTO `tplay_house_source` VALUES (2, '万科·公园大道', '公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级', 19, '20,21,22,23', 14000.00, 0, '阜阳北路与清颖路交口东南角', '', '', '340000', '340100', '1006', 0, 0, 160, 2.44, '', '毛坯,简约,豪华装', '24,25', '<h2>宽境</h2><p>公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级，一公里范围内可以满足吃喝玩乐、休闲娱乐购，是真正意义上的一公里漫步生活区，能够为业主提供更舒适的生活环境。</p><p class=\"small-remarks\">万科·公园大道项目总建面约33万方，21栋高层，10栋洋房。&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p><img s', 0, '三室两厅一卫 |三室两厅两卫', 2, 1545462575, 1545463381, NULL);
INSERT INTO `tplay_house_source` VALUES (3, '时光印象小区', '时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路', 26, '27,28,29,30', 23546.00, 1546185600, '合肥市滨湖新区四川路与贵阳路交口西200米', '1,2,3,4,5', '合肥新城创域房地产有限公司', '340000', '340100', '1006', 44, 7946, 41479, 2.50, '合肥新城创域物业有限公司', '豪华装', '31', '<h2>时光印象热销中</h2><p>时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路，纵享滨湖十年发展精华， 地处金融西版块发展蓝图的核心位置，打造国际滨湖·人文艺术综合住区。</p><p class=\"small-remarks\">围合式低密社区布局，两轴三园，打造私密的组团、开放的社区，小区内规划樱花大道、梧桐大道，根据不同人群需求，设置儿童活动中心、青年运动场地、老年活动中心等。</p><ul class=\" list-paddingleft-2\"><li><p><i', 0, '', 1, 1545462578, 1545463673, NULL);
INSERT INTO `tplay_house_source` VALUES (4, '时代之光', '时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。', 8, '9,10,11,12,13,14', 25556.00, 1544544000, '安徽省合肥市滨湖区庐州大道与南京路交汇处向东100米', '1,2,3,4,5', ' 	合肥万科瑞益地产有限公司', '340000', '340100', '1006', 40, 7946, 85253, 3.20, '南京万科物业服务有限公司', '毛坯,简约,豪华装,别墅', '15,16,17,18', '<h2>省府板块 1号线旁 双平层叠墅</h2><p>时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。时代之光打造纯粹的高端低密社区，开启了合肥创新墅居时代。</p><p class=\"small-remarks\">项目周边配套醇熟。地铁1号线滨湖会展中心站点、约40万方成熟购物中心、五星级酒店、三级甲等滨湖医院、合肥一中等完善配套。南边更有840万方公园，环境优美，是滨湖的天然氧吧。</p><p class=\"small-remarks\"><img src=\"h', 1, '', 1, 1545462581, 1545464376, NULL);
INSERT INTO `tplay_house_source` VALUES (5, '万科·公园大道', '公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级', 19, '20,21,22,23', 14000.00, 0, '阜阳北路与清颖路交口东南角', '', '', '340000', '340100', '1006', 0, 0, 160, 2.44, '', '毛坯,简约,豪华装', '24,25', '<h2>宽境</h2><p>公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级，一公里范围内可以满足吃喝玩乐、休闲娱乐购，是真正意义上的一公里漫步生活区，能够为业主提供更舒适的生活环境。</p><p class=\"small-remarks\">万科·公园大道项目总建面约33万方，21栋高层，10栋洋房。&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p><img s', 0, '三室两厅一卫 |三室两厅两卫', 2, 1545462582, 1545463381, NULL);
INSERT INTO `tplay_house_source` VALUES (6, '时光印象小区', '时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路', 26, '27,28,29,30', 23546.00, 1546185600, '合肥市滨湖新区四川路与贵阳路交口西200米', '1,2,3,4,5', '合肥新城创域房地产有限公司', '340000', '340100', '1006', 44, 7946, 41479, 2.50, '合肥新城创域物业有限公司', '豪华装', '31', '<h2>时光印象热销中</h2><p>时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路，纵享滨湖十年发展精华， 地处金融西版块发展蓝图的核心位置，打造国际滨湖·人文艺术综合住区。</p><p class=\"small-remarks\">围合式低密社区布局，两轴三园，打造私密的组团、开放的社区，小区内规划樱花大道、梧桐大道，根据不同人群需求，设置儿童活动中心、青年运动场地、老年活动中心等。</p><ul class=\" list-paddingleft-2\"><li><p><i', 0, '', 1, 1545462583, 1545463673, NULL);
INSERT INTO `tplay_house_source` VALUES (7, '时代之光', '时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。', 8, '9,10,11,12,13,14', 25556.00, 1544544000, '安徽省合肥市滨湖区庐州大道与南京路交汇处向东100米', '1,2,3,4,5', ' 	合肥万科瑞益地产有限公司', '340000', '340100', '1006', 40, 7946, 85253, 3.20, '南京万科物业服务有限公司', '毛坯,简约,豪华装,别墅', '15,16,17,18', '<h2>省府板块 1号线旁 双平层叠墅</h2><p>时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。时代之光打造纯粹的高端低密社区，开启了合肥创新墅居时代。</p><p class=\"small-remarks\">项目周边配套醇熟。地铁1号线滨湖会展中心站点、约40万方成熟购物中心、五星级酒店、三级甲等滨湖医院、合肥一中等完善配套。南边更有840万方公园，环境优美，是滨湖的天然氧吧。</p><p class=\"small-remarks\"><img src=\"h', 0, '', 1, 1545462585, 1545462943, NULL);
INSERT INTO `tplay_house_source` VALUES (8, '万科·公园大道', '公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级', 19, '20,21,22,23', 14000.00, 0, '阜阳北路与清颖路交口东南角', '', '', '340000', '340100', '1006', 0, 0, 160, 2.44, '', '毛坯,简约,豪华装', '24,25', '<h2>宽境</h2><p>公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级，一公里范围内可以满足吃喝玩乐、休闲娱乐购，是真正意义上的一公里漫步生活区，能够为业主提供更舒适的生活环境。</p><p class=\"small-remarks\">万科·公园大道项目总建面约33万方，21栋高层，10栋洋房。&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p><img s', 1, '三室两厅一卫 |三室两厅两卫', 2, 1545462586, 1545464377, NULL);
INSERT INTO `tplay_house_source` VALUES (9, '时光印象小区', '时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路', 26, '27,28,29,30', 23546.00, 1546185600, '合肥市滨湖新区四川路与贵阳路交口西200米', '1,2,3,4,5', '合肥新城创域房地产有限公司', '340000', '340100', '1006', 44, 7946, 41479, 2.50, '合肥新城创域物业有限公司', '豪华装', '31', '<h2>时光印象热销中</h2><p>时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路，纵享滨湖十年发展精华， 地处金融西版块发展蓝图的核心位置，打造国际滨湖·人文艺术综合住区。</p><p class=\"small-remarks\">围合式低密社区布局，两轴三园，打造私密的组团、开放的社区，小区内规划樱花大道、梧桐大道，根据不同人群需求，设置儿童活动中心、青年运动场地、老年活动中心等。</p><ul class=\" list-paddingleft-2\"><li><p><i', 0, '', 1, 1545462587, 1545463673, NULL);
INSERT INTO `tplay_house_source` VALUES (10, '时代之光', '时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。', 8, '9,10,11,12,13,14', 25556.00, 1544544000, '安徽省合肥市滨湖区庐州大道与南京路交汇处向东100米', '1,2,3,4,5', ' 	合肥万科瑞益地产有限公司', '340000', '340100', '1006', 40, 7946, 85253, 3.20, '南京万科物业服务有限公司', '毛坯,简约,豪华装,别墅', '15,16,17,18', '<h2>省府板块 1号线旁 双平层叠墅</h2><p>时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。时代之光打造纯粹的高端低密社区，开启了合肥创新墅居时代。</p><p class=\"small-remarks\">项目周边配套醇熟。地铁1号线滨湖会展中心站点、约40万方成熟购物中心、五星级酒店、三级甲等滨湖医院、合肥一中等完善配套。南边更有840万方公园，环境优美，是滨湖的天然氧吧。</p><p class=\"small-remarks\"><img src=\"h', 0, '', 1, 1545462589, 1545462943, NULL);
INSERT INTO `tplay_house_source` VALUES (11, '万科·公园大道', '公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级', 19, '20,21,22,23', 14000.00, 0, '阜阳北路与清颖路交口东南角', '', '', '340000', '340100', '1006', 0, 0, 160, 2.44, '', '毛坯,简约,豪华装', '24,25', '<h2>宽境</h2><p>公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级，一公里范围内可以满足吃喝玩乐、休闲娱乐购，是真正意义上的一公里漫步生活区，能够为业主提供更舒适的生活环境。</p><p class=\"small-remarks\">万科·公园大道项目总建面约33万方，21栋高层，10栋洋房。&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p><img s', 1, '三室两厅一卫 |三室两厅两卫', 2, 1545462595, 1545464373, NULL);
INSERT INTO `tplay_house_source` VALUES (12, '时光印象小区', '时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路', 26, '27,28,29,30', 23546.00, 1546185600, '合肥市滨湖新区四川路与贵阳路交口西200米', '1,2,3,4,5', '合肥新城创域房地产有限公司', '340000', '340100', '1006', 44, 7946, 41479, 2.50, '合肥新城创域物业有限公司', '豪华装', '31', '<h2>时光印象热销中</h2><p>时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路，纵享滨湖十年发展精华， 地处金融西版块发展蓝图的核心位置，打造国际滨湖·人文艺术综合住区。</p><p class=\"small-remarks\">围合式低密社区布局，两轴三园，打造私密的组团、开放的社区，小区内规划樱花大道、梧桐大道，根据不同人群需求，设置儿童活动中心、青年运动场地、老年活动中心等。</p><ul class=\" list-paddingleft-2\"><li><p><i', 0, '', 1, 1545462596, 1545463673, NULL);
INSERT INTO `tplay_house_source` VALUES (14, '时代之光', '时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。', 8, '9,10,11,12,13,14', 25556.00, 1544544000, '安徽省合肥市滨湖区庐州大道与南京路交汇处向东100米', '1,2,3,4,5', ' 	合肥万科瑞益地产有限公司', '340000', '340100', '1006', 40, 7946, 85253, 3.20, '南京万科物业服务有限公司', '毛坯,简约,豪华装,别墅', '15,16,17,18', '<h2>省府板块 1号线旁 双平层叠墅</h2><p>时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。时代之光打造纯粹的高端低密社区，开启了合肥创新墅居时代。</p><p class=\"small-remarks\">项目周边配套醇熟。地铁1号线滨湖会展中心站点、约40万方成熟购物中心、五星级酒店、三级甲等滨湖医院、合肥一中等完善配套。南边更有840万方公园，环境优美，是滨湖的天然氧吧。</p><p class=\"small-remarks\"><img src=\"h', 0, '', 1, 1545462597, 1545462943, NULL);
INSERT INTO `tplay_house_source` VALUES (15, '万科·公园大道', '公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级', 19, '20,21,22,23', 14000.00, 0, '阜阳北路与清颖路交口东南角', '', '', '340000', '340100', '1006', 0, 0, 160, 2.44, '', '毛坯,简约,豪华装', '24,25', '<h2>宽境</h2><p>公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级，一公里范围内可以满足吃喝玩乐、休闲娱乐购，是真正意义上的一公里漫步生活区，能够为业主提供更舒适的生活环境。</p><p class=\"small-remarks\">万科·公园大道项目总建面约33万方，21栋高层，10栋洋房。&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p><img s', 0, '三室两厅一卫 |三室两厅两卫', 2, 1545462598, 1545463381, NULL);
INSERT INTO `tplay_house_source` VALUES (16, '时光印象小区', '时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路', 26, '27,28,29,30', 23546.00, 1546185600, '合肥市滨湖新区四川路与贵阳路交口西200米', '1,2,3,4,5', '合肥新城创域房地产有限公司', '340000', '340100', '1006', 44, 7946, 41479, 2.50, '合肥新城创域物业有限公司', '豪华装', '31', '<h2>时光印象热销中</h2><p>时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路，纵享滨湖十年发展精华， 地处金融西版块发展蓝图的核心位置，打造国际滨湖·人文艺术综合住区。</p><p class=\"small-remarks\">围合式低密社区布局，两轴三园，打造私密的组团、开放的社区，小区内规划樱花大道、梧桐大道，根据不同人群需求，设置儿童活动中心、青年运动场地、老年活动中心等。</p><ul class=\" list-paddingleft-2\"><li><p><i', 0, '', 1, 1545462599, 1545463673, NULL);
INSERT INTO `tplay_house_source` VALUES (17, '时代之光', '时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。', 8, '9,10,11,12,13,14', 25556.00, 1544544000, '安徽省合肥市滨湖区庐州大道与南京路交汇处向东100米', '1,2,3,4,5', ' 	合肥万科瑞益地产有限公司', '340000', '340100', '1006', 40, 7946, 85253, 3.20, '南京万科物业服务有限公司', '毛坯,简约,豪华装,别墅', '15,16,17,18', '<h2>省府板块 1号线旁 双平层叠墅</h2><p>时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。时代之光打造纯粹的高端低密社区，开启了合肥创新墅居时代。</p><p class=\"small-remarks\">项目周边配套醇熟。地铁1号线滨湖会展中心站点、约40万方成熟购物中心、五星级酒店、三级甲等滨湖医院、合肥一中等完善配套。南边更有840万方公园，环境优美，是滨湖的天然氧吧。</p><p class=\"small-remarks\"><img src=\"h', 0, '', 1, 1545462600, 1545462943, NULL);
INSERT INTO `tplay_house_source` VALUES (18, '万科·公园大道', '公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级', 19, '20,21,22,23', 14000.00, 0, '阜阳北路与清颖路交口东南角', '', '', '340000', '340100', '1006', 0, 0, 160, 2.44, '', '毛坯,简约,豪华装', '24,25', '<h2>宽境</h2><p>公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级，一公里范围内可以满足吃喝玩乐、休闲娱乐购，是真正意义上的一公里漫步生活区，能够为业主提供更舒适的生活环境。</p><p class=\"small-remarks\">万科·公园大道项目总建面约33万方，21栋高层，10栋洋房。&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p><img s', 0, '三室两厅一卫 |三室两厅两卫', 2, 1545462601, 1545463381, NULL);
INSERT INTO `tplay_house_source` VALUES (19, '时光印象小区', '时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路', 26, '27,28,29,30', 23546.00, 1546185600, '合肥市滨湖新区四川路与贵阳路交口西200米', '1,2,3,4,5', '合肥新城创域房地产有限公司', '340000', '340100', '1006', 44, 7946, 41479, 2.50, '合肥新城创域物业有限公司', '豪华装', '31', '<h2>时光印象热销中</h2><p>时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路，纵享滨湖十年发展精华， 地处金融西版块发展蓝图的核心位置，打造国际滨湖·人文艺术综合住区。</p><p class=\"small-remarks\">围合式低密社区布局，两轴三园，打造私密的组团、开放的社区，小区内规划樱花大道、梧桐大道，根据不同人群需求，设置儿童活动中心、青年运动场地、老年活动中心等。</p><ul class=\" list-paddingleft-2\"><li><p><i', 1, '', 1, 1545462602, 1545464368, NULL);
INSERT INTO `tplay_house_source` VALUES (20, '时代之光', '时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。', 8, '9,10,11,12,13,14', 25556.00, 1544544000, '安徽省合肥市滨湖区庐州大道与南京路交汇处向东100米', '1,2,3,4,5', ' 	合肥万科瑞益地产有限公司', '340000', '340100', '1006', 40, 7946, 85253, 3.20, '南京万科物业服务有限公司', '毛坯,简约,豪华装,别墅', '15,16,17,18', '<h2>省府板块 1号线旁 双平层叠墅</h2><p>时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。时代之光打造纯粹的高端低密社区，开启了合肥创新墅居时代。</p><p class=\"small-remarks\">项目周边配套醇熟。地铁1号线滨湖会展中心站点、约40万方成熟购物中心、五星级酒店、三级甲等滨湖医院、合肥一中等完善配套。南边更有840万方公园，环境优美，是滨湖的天然氧吧。</p><p class=\"small-remarks\"><img src=\"h', 1, '', 1, 1545462606, 1545464368, NULL);
INSERT INTO `tplay_house_source` VALUES (21, '万科·公园大道', '公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级', 19, '20,21,22,23', 14000.00, 0, '阜阳北路与清颖路交口东南角', '', '', '340000', '340100', '1006', 0, 0, 160, 2.44, '', '毛坯,简约,豪华装', '24,25', '<h2>宽境</h2><p>公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级，一公里范围内可以满足吃喝玩乐、休闲娱乐购，是真正意义上的一公里漫步生活区，能够为业主提供更舒适的生活环境。</p><p class=\"small-remarks\">万科·公园大道项目总建面约33万方，21栋高层，10栋洋房。&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p><img s', 0, '三室两厅一卫 |三室两厅两卫', 2, 1545462609, 1545463381, NULL);
INSERT INTO `tplay_house_source` VALUES (22, '时光印象小区', '时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路', 26, '27,28,29,30', 23546.00, 1546185600, '合肥市滨湖新区四川路与贵阳路交口西200米', '1,2,3,4,5', '合肥新城创域房地产有限公司', '340000', '340100', '1006', 44, 7946, 41479, 2.50, '合肥新城创域物业有限公司', '豪华装', '31', '<h2>时光印象热销中</h2><p>时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路，纵享滨湖十年发展精华， 地处金融西版块发展蓝图的核心位置，打造国际滨湖·人文艺术综合住区。</p><p class=\"small-remarks\">围合式低密社区布局，两轴三园，打造私密的组团、开放的社区，小区内规划樱花大道、梧桐大道，根据不同人群需求，设置儿童活动中心、青年运动场地、老年活动中心等。</p><ul class=\" list-paddingleft-2\"><li><p><i', 0, '', 1, 1545462700, 1545463673, NULL);
INSERT INTO `tplay_house_source` VALUES (23, '时代之光', '时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。', 8, '9,10,11,12,13,14', 25556.00, 1544544000, '安徽省合肥市滨湖区庐州大道与南京路交汇处向东100米', '1,2,3,4,5', ' 	合肥万科瑞益地产有限公司', '340000', '340100', '1006', 40, 7946, 85253, 3.20, '南京万科物业服务有限公司', '毛坯,简约,豪华装,别墅', '15,16,17,18', '<h2>省府板块 1号线旁 双平层叠墅</h2><p>时代之光为合肥万科高端光系作品，地处滨湖新区省政府核心板块，毗邻国际会展中心及地铁一号线。时代之光打造纯粹的高端低密社区，开启了合肥创新墅居时代。</p><p class=\"small-remarks\">项目周边配套醇熟。地铁1号线滨湖会展中心站点、约40万方成熟购物中心、五星级酒店、三级甲等滨湖医院、合肥一中等完善配套。南边更有840万方公园，环境优美，是滨湖的天然氧吧。</p><p class=\"small-remarks\"><img src=\"h', 1, '', 1, 1545462720, 1545464366, NULL);
INSERT INTO `tplay_house_source` VALUES (24, '万科·公园大道', '公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级', 19, '20,21,22,23', 14000.00, 0, '阜阳北路与清颖路交口东南角', '', '', '340000', '340100', '1006', 0, 0, 160, 2.44, '', '毛坯,简约,豪华装', '24,25', '<h2>宽境</h2><p>公园大道位于阜阳北路与清颖路交口东南侧，公园大道为万科“公园系”产品的迭代升级，一公里范围内可以满足吃喝玩乐、休闲娱乐购，是真正意义上的一公里漫步生活区，能够为业主提供更舒适的生活环境。</p><p class=\"small-remarks\">万科·公园大道项目总建面约33万方，21栋高层，10栋洋房。&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p><img s', 1, '三室两厅一卫 |三室两厅两卫', 2, 1545462730, 1545464365, NULL);
INSERT INTO `tplay_house_source` VALUES (25, '时光印象小区', '时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路', 26, '27,28,29,30', 23546.00, 1546185600, '合肥市滨湖新区四川路与贵阳路交口西200米', '1,2,3,4,5', '合肥新城创域房地产有限公司', '340000', '340100', '1006', 44, 7946, 41479, 2.50, '合肥新城创域物业有限公司', '豪华装', '31', '<h2>时光印象热销中</h2><p>时光印象为滨湖高端品质社区，项目北至贵阳路，西至贵州路，东至四川路，南至遵义路，纵享滨湖十年发展精华， 地处金融西版块发展蓝图的核心位置，打造国际滨湖·人文艺术综合住区。</p><p class=\"small-remarks\">围合式低密社区布局，两轴三园，打造私密的组团、开放的社区，小区内规划樱花大道、梧桐大道，根据不同人群需求，设置儿童活动中心、青年运动场地、老年活动中心等。</p><ul class=\" list-paddingleft-2\"><li><p><i', 1, '', 1, 1545462734, 1545464365, NULL);

-- ----------------------------
-- Table structure for tplay_messages
-- ----------------------------
DROP TABLE IF EXISTS `tplay_messages`;
CREATE TABLE `tplay_messages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_look` int(1) NOT NULL DEFAULT 0 COMMENT '0未读1已读',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `is_look`(`is_look`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tplay_notice
-- ----------------------------
DROP TABLE IF EXISTS `tplay_notice`;
CREATE TABLE `tplay_notice`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `title` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_notice
-- ----------------------------
INSERT INTO `tplay_notice` VALUES (1, '欢迎进驻和房宝平台', '<p>来的这里，您可以第一时间了解最新房源信息</p>', 1545465459, 1545465459, 0);

-- ----------------------------
-- Table structure for tplay_order
-- ----------------------------
DROP TABLE IF EXISTS `tplay_order`;
CREATE TABLE `tplay_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '报备的订单id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '提交报备的用户id',
  `name` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名字',
  `number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `gender` tinyint(1) UNSIGNED NOT NULL COMMENT '性别 1是男 2是女',
  `date` int(11) UNSIGNED NOT NULL COMMENT '预计带看时间',
  `content` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购房意向内容',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '删除时间',
  `is_new` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已报备状态  1是已报备 ',
  `is_visit` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已到访状态  1是已到访',
  `is_deal` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已成交状态  1是已成交',
  `is_pay` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已提额状态  1是已提额',
  `house_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '楼盘名字',
  `province` int(11) NOT NULL DEFAULT 0 COMMENT '省',
  `city` int(11) NOT NULL DEFAULT 0 COMMENT '市',
  `area` int(11) NOT NULL DEFAULT 0 COMMENT '区县',
  `house_id` int(11) NOT NULL DEFAULT 0 COMMENT '楼盘id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tplay_province
-- ----------------------------
DROP TABLE IF EXISTS `tplay_province`;
CREATE TABLE `tplay_province`  (
  `_id` int(11) NOT NULL,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tplay_province
-- ----------------------------
INSERT INTO `tplay_province` VALUES (1, '北京市', '110000');
INSERT INTO `tplay_province` VALUES (2, '天津市', '120000');
INSERT INTO `tplay_province` VALUES (3, '河北省', '130000');
INSERT INTO `tplay_province` VALUES (4, '山西省', '140000');
INSERT INTO `tplay_province` VALUES (5, '内蒙古自治区', '150000');
INSERT INTO `tplay_province` VALUES (6, '辽宁省', '210000');
INSERT INTO `tplay_province` VALUES (7, '吉林省', '220000');
INSERT INTO `tplay_province` VALUES (8, '黑龙江省', '230000');
INSERT INTO `tplay_province` VALUES (9, '上海市', '310000');
INSERT INTO `tplay_province` VALUES (10, '江苏省', '320000');
INSERT INTO `tplay_province` VALUES (11, '浙江省', '330000');
INSERT INTO `tplay_province` VALUES (12, '安徽省', '340000');
INSERT INTO `tplay_province` VALUES (13, '福建省', '350000');
INSERT INTO `tplay_province` VALUES (14, '江西省', '360000');
INSERT INTO `tplay_province` VALUES (15, '山东省', '370000');
INSERT INTO `tplay_province` VALUES (16, '河南省', '410000');
INSERT INTO `tplay_province` VALUES (17, '湖北省', '420000');
INSERT INTO `tplay_province` VALUES (18, '湖南省', '430000');
INSERT INTO `tplay_province` VALUES (19, '广东省', '440000');
INSERT INTO `tplay_province` VALUES (20, '广西壮族自治区', '450000');
INSERT INTO `tplay_province` VALUES (21, '海南省', '460000');
INSERT INTO `tplay_province` VALUES (22, '重庆市', '500000');
INSERT INTO `tplay_province` VALUES (23, '四川省', '510000');
INSERT INTO `tplay_province` VALUES (24, '贵州省', '520000');
INSERT INTO `tplay_province` VALUES (25, '云南省', '530000');
INSERT INTO `tplay_province` VALUES (26, '西藏自治区', '540000');
INSERT INTO `tplay_province` VALUES (27, '陕西省', '610000');
INSERT INTO `tplay_province` VALUES (28, '甘肃省', '620000');
INSERT INTO `tplay_province` VALUES (29, '青海省', '630000');
INSERT INTO `tplay_province` VALUES (30, '宁夏回族自治区', '640000');
INSERT INTO `tplay_province` VALUES (31, '新疆维吾尔自治区', '650000');
INSERT INTO `tplay_province` VALUES (32, '台湾省', '710000');
INSERT INTO `tplay_province` VALUES (33, '香港特别行政区', '810000');
INSERT INTO `tplay_province` VALUES (34, '澳门特别行政区', '820000');

-- ----------------------------
-- Table structure for tplay_smsconfig
-- ----------------------------
DROP TABLE IF EXISTS `tplay_smsconfig`;
CREATE TABLE `tplay_smsconfig`  (
  `sms` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sms' COMMENT '标识',
  `appkey` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `secretkey` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'normal' COMMENT '短信类型',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '短信签名',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '短信模板ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '短信默认模板',
  INDEX `sms`(`sms`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_smsconfig
-- ----------------------------
INSERT INTO `tplay_smsconfig` VALUES ('sms', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for tplay_store
-- ----------------------------
DROP TABLE IF EXISTS `tplay_store`;
CREATE TABLE `tplay_store`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店名',
  `manager` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '负责人',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `img_id` int(10) NOT NULL COMMENT '门店照',
  `reg_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册邀请码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系方式',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '入驻状态,1成功入驻',
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `area` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tplay_store
-- ----------------------------
INSERT INTO `tplay_store` VALUES (1, '百利房地产', '某总', '合肥市蜀山区潜山路888号', 33, '651055', '18888888888', 0, '', '', '合肥', 1545465908, 1545465908, NULL);
INSERT INTO `tplay_store` VALUES (2, '丽人房产', '李总', '安徽省合肥市包河区金寨路96号', 34, '666666', '17666666666', 0, '', '', '合肥', 1545466165, 1545466165, NULL);

-- ----------------------------
-- Table structure for tplay_urlconfig
-- ----------------------------
DROP TABLE IF EXISTS `tplay_urlconfig`;
CREATE TABLE `tplay_urlconfig`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aliases` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '想要设置的别名',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原url结构',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0禁用1使用',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_urlconfig
-- ----------------------------
INSERT INTO `tplay_urlconfig` VALUES (1, 'admin_login', 'admin/common/login', '后台登录地址。', 0, 1517621629, 1517621629);

-- ----------------------------
-- Table structure for tplay_user
-- ----------------------------
DROP TABLE IF EXISTS `tplay_user`;
CREATE TABLE `tplay_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `is_realname` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否实名0否,1是',
  `sex` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '性别',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `level` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户级别:1门店经纪人,2大众经纪人',
  `area` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主营地区',
  `store_id` int(10) NOT NULL COMMENT '门店id',
  `login_time` int(11) NOT NULL COMMENT '最后一次登录时间',
  `delete_time` int(11) NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL COMMENT ' ',
  `card_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实名姓名',
  `card_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '实名身份证号',
  `card_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实名填的手机号',
  `card_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证照片',
  `is_submit` int(1) NOT NULL DEFAULT 0 COMMENT '是否提交了实名认证 0未提交  1已提交',
  `is_examine` int(1) NULL DEFAULT 0 COMMENT '审核状态 0待审核 1已通过 2未通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tplay_user
-- ----------------------------
INSERT INTO `tplay_user` VALUES (1, '明天你好', 0, 0, 'f0c1361b39e445af40f69950c6fa05a5', 'uploads\\user\\20181216\\8213411574ccaf848d65563f854f4108.jpg', '', '17681125543', 2, '合肥', 0, 1545384641, NULL, NULL, 1544971823, '', '0', '', '', 0, NULL);
INSERT INTO `tplay_user` VALUES (2, '17355105312', 0, 0, 'f0c1361b39e445af40f69950c6fa05a5', 'uploads\\user\\20181216\\8213411574ccaf848d65563f854f4108.jpg', '', '17355105312', 2, '', 0, 1545294221, NULL, NULL, 1545374250, '金磊磊1', '340827199405050018', '', '', 0, NULL);
INSERT INTO `tplay_user` VALUES (3, '15256935637', 0, 0, '47b6f8017c9629e1e6bff9e03083b5e6', 'uploads\\user\\20181216\\8213411574ccaf848d65563f854f4108.jpg', '', '15256935637', 2, '', 0, 1545460453, NULL, 1544583825, 1545441753, '金磊磊', '340827199405050018', '15256935637', '\\uploads\\user_card\\20181222\\d4df419d3d4ea93afb7d531f020e8fa5.jpg', 1, 0);

-- ----------------------------
-- Table structure for tplay_webconfig
-- ----------------------------
DROP TABLE IF EXISTS `tplay_webconfig`;
CREATE TABLE `tplay_webconfig`  (
  `web` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站配置标识',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关键词',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `is_log` int(1) NOT NULL DEFAULT 1 COMMENT '1开启日志0关闭',
  `file_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '允许上传的类型',
  `file_size` bigint(20) NULL DEFAULT NULL COMMENT '允许上传的最大值',
  `statistics` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '统计代码',
  `black_ip` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ip黑名单',
  `url_suffix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url伪静态后缀',
  INDEX `web`(`web`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_webconfig
-- ----------------------------
INSERT INTO `tplay_webconfig` VALUES ('web', '后台管理系统', '', '', 1, 'jpg,png,gif,mp4,zip,jpeg', 80000, '', '', '');

SET FOREIGN_KEY_CHECKS = 1;
