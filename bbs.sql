/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : bbs

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 15/11/2024 17:16:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fileupload
-- ----------------------------
DROP TABLE IF EXISTS `fileupload`;
CREATE TABLE `fileupload`  (
  `fileId` int NOT NULL AUTO_INCREMENT COMMENT '文件唯一标识',
  `fileName` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件名',
  `filePath` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件路径',
  `fileSize` bigint NOT NULL COMMENT '文件大小',
  `uploadTime` datetime NOT NULL COMMENT '上传时间',
  `state` int NOT NULL COMMENT '文件状态',
  `uid` int NOT NULL COMMENT '用户id',
  PRIMARY KEY (`fileId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fileupload
-- ----------------------------
INSERT INTO `fileupload` VALUES (25, 'Log.txt', '/file/8b273a3d907e48cd926c8a3255ec778a.txt', 3135, '2024-11-15 09:14:02', 1, 1);

-- ----------------------------
-- Table structure for invitecode
-- ----------------------------
DROP TABLE IF EXISTS `invitecode`;
CREATE TABLE `invitecode`  (
  `icode` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `icreatetime` datetime NOT NULL,
  `istate` int NOT NULL,
  `uid` int NULL DEFAULT NULL,
  PRIMARY KEY (`icode`) USING BTREE,
  INDEX `uid`(`uid` ASC) USING BTREE,
  CONSTRAINT `invitecode_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invitecode
-- ----------------------------

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `pid` bigint NOT NULL AUTO_INCREMENT,
  `ptitle` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pbody` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `psendtime` datetime NOT NULL,
  `lastreplytime` datetime NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `uid`(`uid` ASC) USING BTREE,
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (24, '知响社交圈', '现代软件工程学-小组任务', '2024-11-15 09:14:34', '2024-11-15 09:16:27', 1);

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `pid` bigint NOT NULL,
  `uid` int NOT NULL,
  `replymessage` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `replytime` datetime NOT NULL,
  `rid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rid`) USING BTREE,
  INDEX `uid`(`uid` ASC) USING BTREE,
  INDEX `pid`(`pid` ASC) USING BTREE,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reply_ibfk_3` FOREIGN KEY (`pid`) REFERENCES `post` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES (24, 1, '胡姗', '2024-11-15 09:16:27', 41);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `upwd` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ustate` int NOT NULL,
  `ucreatetime` datetime NOT NULL,
  `level` int NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `unique`(`uname` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, '2020-08-12 10:57:45', 0);

SET FOREIGN_KEY_CHECKS = 1;
