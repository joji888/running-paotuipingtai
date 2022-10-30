/*
 Navicat Premium Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 101.43.53.80:3306
 Source Schema         : running_db

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 27/10/2022 11:52:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `a_id` int(0) NOT NULL COMMENT 'ID',
  `a_account` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '账号',
  `a_password` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `a_role` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '7bfec0eb412229e78e4913bdb9eb07f0487cc629cb590c311be0b9f900f3ec54', NULL);

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `apply_id` int(0) NOT NULL COMMENT 'ID',
  `apply_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `apply_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '申请状态',
  `apply_identity_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证',
  `apply_identity_code_front` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证正面',
  `apply_identity_code_back` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证背面',
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户申请跑腿表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `c_id` int(0) NOT NULL COMMENT '评论ID',
  `o_id` int(0) NOT NULL COMMENT '订单ID',
  `u_id` int(0) NOT NULL COMMENT '用户ID',
  `c_time` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  `c_type` enum('差评','好评') CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '差好评',
  `c_content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '评论内容',
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `o_id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `u_id` int(0) NOT NULL COMMENT '用户ID',
  `ts_id` int(0) NULL DEFAULT NULL COMMENT '订单子类',
  `ot_id` int(0) NULL DEFAULT NULL COMMENT '订单类型',
  `o_tile` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `o_state` int(0) NULL DEFAULT NULL COMMENT '订单状态(0过期，1正常，2已接单，3结束)',
  `o_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单图片',
  `o_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单描述',
  `o_end_time` datetime(0) NULL DEFAULT NULL COMMENT '订单结束时间',
  `o_create_time` datetime(0) NULL DEFAULT NULL COMMENT '订单发布时间',
  `o_price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`o_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (2, 2, 1, 1, '12312', 1, 'file/460d189701604593875379a93b697b0b.jpg', '123123123', '2022-10-29 16:54:00', '2022-10-27 02:40:00', 123123.00);

-- ----------------------------
-- Table structure for order_type
-- ----------------------------
DROP TABLE IF EXISTS `order_type`;
CREATE TABLE `order_type`  (
  `ot_id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ot_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '类型名',
  PRIMARY KEY (`ot_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_type
-- ----------------------------
INSERT INTO `order_type` VALUES (1, '2');

-- ----------------------------
-- Table structure for order_type_son
-- ----------------------------
DROP TABLE IF EXISTS `order_type_son`;
CREATE TABLE `order_type_son`  (
  `ts_id` int(0) NOT NULL COMMENT 'ID',
  `ts_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '子类型名',
  `ts_price` int(0) NULL DEFAULT NULL COMMENT '单价',
  `ot_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ts_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单子类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_type_son
-- ----------------------------
INSERT INTO `order_type_son` VALUES (1, '1', 100, 1);

-- ----------------------------
-- Table structure for receive
-- ----------------------------
DROP TABLE IF EXISTS `receive`;
CREATE TABLE `receive`  (
  `r_id` int(0) NOT NULL COMMENT 'ID',
  `r_begin_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `r_end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `r_seate` int(0) NULL DEFAULT NULL COMMENT '跑腿状态（0结束，1开始）',
  `o_id` int(0) NULL DEFAULT NULL,
  `u_id` int(0) NULL DEFAULT NULL,
  `ru_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '跑腿接单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receive
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `u_nick` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '昵称',
  `u_account` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '账号',
  `u_password` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `u_email` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `u_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机',
  `u_head_img` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `u_gender` enum('男','女') CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `u_role` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, '用户716662', '15226382287', 'ed938ed29984d06b42d4e89067374b32a1880bdac5716402d9a9130f7c17140c', '15226382287@163.com', '15226382287', 'file/e3f41820a8f845ebae037dcdf14aabb1.jpg', '男', '普通用户');

SET FOREIGN_KEY_CHECKS = 1;
