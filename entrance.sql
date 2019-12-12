/*
 Navicat Premium Data Transfer

 Source Server         : php_root
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : entrance

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 12/12/2019 11:30:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for en_admin
-- ----------------------------
DROP TABLE IF EXISTS `en_admin`;
CREATE TABLE `en_admin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id编号',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员用户名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `login_time` datetime NOT NULL COMMENT '最后登录时间',
  `login_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最后登录ip地址',
  `login_site` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最后登录物理地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of en_admin
-- ----------------------------
INSERT INTO `en_admin` VALUES (1, 'admin', '123456', '2019-12-10 22:41:25', '2019-12-10 23:39:05', '0.0.0.0', 'IANA保留地址');

-- ----------------------------
-- Table structure for en_grade
-- ----------------------------
DROP TABLE IF EXISTS `en_grade`;
CREATE TABLE `en_grade`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id编号',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价内容',
  `major` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业名称',
  `star` int(10) NOT NULL COMMENT '起始分',
  `end` int(10) NOT NULL COMMENT '结束分',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of en_grade
-- ----------------------------
INSERT INTO `en_grade` VALUES (3, '你意志力强，头脑冷静，有较强的领导欲，事业心强，不达目的不罢休，外表和善，自信，对有利于自己的人际关系处理得很好，有很强的逻辑思维能力，不轻易认输,思维理性。', '', 90, 100, '2019-12-11 00:16:41');
INSERT INTO `en_grade` VALUES (4, '你聪明，性格活泼，人缘好，善于交朋友。事业心强，渴望成功。思维理性，崇尚爱情，在遇到很多事情同时发生的时候，你会处理得很好,有很强的上进心。', '', 80, 90, '2019-12-11 00:17:00');
INSERT INTO `en_grade` VALUES (5, '你爱好幻想，思维感性，人际关系好。性格自信，事业心较强，喜欢有创造性的工作，不喜欢按常规办事。不会安于现状，总是向着人生的目标不断努力。', '', 60, 80, '2019-12-11 00:17:46');
INSERT INTO `en_grade` VALUES (6, '你善良，重友谊，待人热情，性格塌实稳重,善于享受生活，我行我素。有较好的异性缘，对爱情坚持认真，从崇生活,善于理财。', '', 0, 0, '2019-12-11 00:17:58');
INSERT INTO `en_grade` VALUES (7, '该专业要求学生有敏锐的洞察能力，对淘宝等购物平台很熟悉，有一定的投资意识,具有一定营销的能力，并且具备良好的口才，能推销自己。同时能掌握一定的网站制作和维护能力。', '跨境电商', 0, 0, '2019-12-11 00:19:40');
INSERT INTO `en_grade` VALUES (8, '该专业要求学生有敏锐的洞察能力，对各大新媒体和直播平台很熟悉，有一定的投资意识,具有一定语言沟通的能力，并且具备良好的口才，能推销自己。', '新媒体运营与直播', 0, 0, '2019-12-11 00:19:56');
INSERT INTO `en_grade` VALUES (9, '该专业要求学生具有较强的学习能力和动手能力，数学较好，对业务逻辑判断能力强。并且吃苦耐劳，踏实认真专研，耐得住寂寞，能够持之以恒。', 'DT大数据', 0, 0, '2019-12-11 00:21:25');
INSERT INTO `en_grade` VALUES (10, '该专业要求学生具有较强的学习能力和动手能力，数学较好，对业务逻辑判断能力强。并且吃苦耐劳，踏实认真专研，耐得住寂寞，能够持之以恒。', '智能家居', 0, 0, '2019-12-11 00:21:38');
INSERT INTO `en_grade` VALUES (11, '具备一定的逻辑推理能力，数学较好，喜欢专研程序，逻辑判断能力较强。动手能力强，对抽象的事物有良好的理解能力。需要一定的逻辑思维能力，并且吃苦耐劳，踏实认真专研，耐得住寂寞，能够持之以恒。', '计算机程序设计', 0, 0, '2019-12-11 00:22:09');
INSERT INTO `en_grade` VALUES (12, '动画造型能力、动漫设计与制作能力、影视动画设计与制作能力。所以要求学生具备一定的绘画能力，角色造型能力，观察事物的能力，具备审美能力。而且一定喜欢看动画片，对绘画、动画都有很高的热情，也有一定的绘画基础。', '4D动漫游戏设计师', 0, 0, '2019-12-11 00:22:20');
INSERT INTO `en_grade` VALUES (13, '该专业要求学生对美术和创意感兴趣，热爱研究色彩，对各种精美的界面和图标着迷，喜欢精致的细节。主要培养学生的审美能力，色彩的应用能力，能利用各种绘制软件完成软件、网站、手机应用等界面和图标的设计。', 'UI设计专业', 0, 0, '2019-12-11 00:22:36');
INSERT INTO `en_grade` VALUES (15, '该专业要求学生对计算机软硬件感兴趣，对互联网运营和互联网的设备设置感兴趣。互联网的网络安全等有一定的兴趣。', '网络安全工程师', 0, 0, '2019-12-11 00:23:11');
INSERT INTO `en_grade` VALUES (16, '该专业要求学生对计算机感兴趣，数学较好，喜欢编程语言。具有较强的逻辑推理能力，并且吃苦耐劳，踏实认真专研，耐得住寂寞，能够持之以恒。', '云开发软件', 0, 0, '2019-12-11 00:23:26');
INSERT INTO `en_grade` VALUES (17, '该专业要求学生对计算机感兴趣，数学较好，喜欢编程语言,对人工智能有一定的理解能力,对喜爱本专业。具有较强的逻辑推理能力，并且吃苦耐劳，踏实认真专研，耐得住寂寞，能够持之以恒,遇见问题永不放弃的精神。', '人工智能', 0, 0, '2019-12-11 00:24:01');
INSERT INTO `en_grade` VALUES (18, '该专业要求学生对电子商务以及财会感兴趣，数学较好，喜欢电商,对数字比较敏感。具有较强的逻辑推理能力，并且吃苦耐劳，踏实认真专研，能够持之以恒。', '电商商务与财会', 0, 0, '2019-12-11 00:24:26');

-- ----------------------------
-- Table structure for en_login_info
-- ----------------------------
DROP TABLE IF EXISTS `en_login_info`;
CREATE TABLE `en_login_info`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id编号',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录姓名',
  `qq` int(32) NOT NULL COMMENT '登录qq号码',
  `tel` int(20) NOT NULL COMMENT '登录手机号码',
  `score` int(10) NOT NULL COMMENT '测试分数',
  `login_time` datetime NOT NULL COMMENT '最后登录时间',
  `login_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最后登录ip地址',
  `login_site` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最后登录物理地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of en_login_info
-- ----------------------------
INSERT INTO `en_login_info` VALUES (5, '请问qw', 0, 0, 0, '2019-12-10 18:12:21', '0.0.0.0', '');
INSERT INTO `en_login_info` VALUES (15, '请问额二', 0, 0, 25, '2019-12-12 01:27:44', '0.0.0.0', 'IANA保留地址');
INSERT INTO `en_login_info` VALUES (14, '测试', 0, 0, 0, '2019-12-12 01:24:44', '0.0.0.0', 'IANA保留地址');

-- ----------------------------
-- Table structure for en_major
-- ----------------------------
DROP TABLE IF EXISTS `en_major`;
CREATE TABLE `en_major`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id字段',
  `major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业名称',
  `major_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业图片',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of en_major
-- ----------------------------
INSERT INTO `en_major` VALUES (1, '电子竞技', 'public\\upload_major_img\\20191211\\4d311a0f977fb0ea1c8388e5be253e4e.jpg', '2019-12-11 11:01:11');
INSERT INTO `en_major` VALUES (2, '智能家居', 'public\\upload_major_img\\20191211\\c0f817d45c3c6643e90d5ce9fe106363.jpg', '2019-12-11 11:05:35');
INSERT INTO `en_major` VALUES (3, '新媒体运营与直播', 'public\\upload_major_img\\20191211\\cb525c0726bd4bbb1821aaebee427e47.png', '2019-12-11 11:54:58');

-- ----------------------------
-- Table structure for en_topic
-- ----------------------------
DROP TABLE IF EXISTS `en_topic`;
CREATE TABLE `en_topic`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id编号',
  `topic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目',
  `A` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'A选项',
  `B` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'B选项',
  `C` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'C选项',
  `D` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'D选项',
  `right_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '正确答案',
  `major_id` int(15) NOT NULL COMMENT '专业',
  `topic_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目图片',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of en_topic
-- ----------------------------
INSERT INTO `en_topic` VALUES (1, '下图你能看见什么数字？', 'A', 'B', 'C', '无', 'C', 3, 'public\\upload_topic_img\\20191211\\e3bed1a954759b92817cc23985d5daac.jpg', '2019-12-11 10:21:38');
INSERT INTO `en_topic` VALUES (2, '抖音是哪个公司的产品', '今日头条', '快手', '腾讯', '百度', 'A', 3, '', '2019-12-11 11:47:11');
INSERT INTO `en_topic` VALUES (3, '微视是哪个公司的产品', '今日头条', '快手', '腾讯', '百度', 'C', 3, '', '2019-12-12 10:48:47');
INSERT INTO `en_topic` VALUES (4, '下面的产品中哪个不是今日头条旗下的产品', '抖音', '火山小视频', '西瓜视频', '快手', 'D', 3, '', '2019-12-12 10:49:17');
INSERT INTO `en_topic` VALUES (5, '下面的短视频网红人物中，哪个是男性', 'Papi酱', '毛毛姐', '冯提莫', '代古拉K', 'B', 3, '', '2019-12-12 10:49:57');

SET FOREIGN_KEY_CHECKS = 1;
