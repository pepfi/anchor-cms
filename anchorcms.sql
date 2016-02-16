/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : anchorcms

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-02-16 14:30:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `anchor_categories`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_categories`;
CREATE TABLE `anchor_categories` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `slug` varchar(40) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_categories
-- ----------------------------
INSERT INTO `anchor_categories` VALUES ('1', 'Uncategorised', 'uncategorised', 'Ain\'t no category here.');
INSERT INTO `anchor_categories` VALUES ('3', 'fff', 'fff', '');
INSERT INTO `anchor_categories` VALUES ('4', '传媒', 'chuanmei', '');
INSERT INTO `anchor_categories` VALUES ('5', '金融', 'jinrong', '');
INSERT INTO `anchor_categories` VALUES ('6', 'IT行业', 'ithangye', '');
INSERT INTO `anchor_categories` VALUES ('7', '医学', 'yixue', '');
INSERT INTO `anchor_categories` VALUES ('8', '设计', 'sheji', '');

-- ----------------------------
-- Table structure for `anchor_category_meta`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_category_meta`;
CREATE TABLE `anchor_category_meta` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `category` int(6) NOT NULL,
  `extend` int(6) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`category`),
  KEY `extend` (`extend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_category_meta
-- ----------------------------

-- ----------------------------
-- Table structure for `anchor_comments`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_comments`;
CREATE TABLE `anchor_comments` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `post` int(6) NOT NULL,
  `status` enum('pending','approved','spam') NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(140) NOT NULL,
  `email` varchar(140) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post` (`post`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `anchor_companies`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_companies`;
CREATE TABLE `anchor_companies` (
  `id` int(150) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(225) NOT NULL,
  `slug` varchar(40) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_companies
-- ----------------------------
INSERT INTO `anchor_companies` VALUES ('1', '百度', 'baidu', '');
INSERT INTO `anchor_companies` VALUES ('2', '搜狐', 'souhu', '');
INSERT INTO `anchor_companies` VALUES ('4', '傲天动联', 'autelan', '');
INSERT INTO `anchor_companies` VALUES ('5', '腾讯', 'tengxun', '');
INSERT INTO `anchor_companies` VALUES ('6', '天融信', 'tianrongxin', '');

-- ----------------------------
-- Table structure for `anchor_departments`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_departments`;
CREATE TABLE `anchor_departments` (
  `id` int(150) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(225) NOT NULL,
  `slug` varchar(40) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_departments
-- ----------------------------
INSERT INTO `anchor_departments` VALUES ('1', '人事', 'renshi', '');
INSERT INTO `anchor_departments` VALUES ('2', '财务', 'caiwu', '');
INSERT INTO `anchor_departments` VALUES ('3', '研发', 'yanfa', '');

-- ----------------------------
-- Table structure for `anchor_extend`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_extend`;
CREATE TABLE `anchor_extend` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `type` enum('post','page','category','user') NOT NULL,
  `pagetype` varchar(140) NOT NULL DEFAULT 'all',
  `field` enum('text','html','image','file') NOT NULL,
  `key` varchar(160) NOT NULL,
  `label` varchar(160) NOT NULL,
  `attributes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_extend
-- ----------------------------

-- ----------------------------
-- Table structure for `anchor_meta`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_meta`;
CREATE TABLE `anchor_meta` (
  `key` varchar(140) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_meta
-- ----------------------------
INSERT INTO `anchor_meta` VALUES ('auto_published_comments', '0');
INSERT INTO `anchor_meta` VALUES ('comment_moderation_keys', '');
INSERT INTO `anchor_meta` VALUES ('comment_notifications', '0');
INSERT INTO `anchor_meta` VALUES ('current_migration', '210');
INSERT INTO `anchor_meta` VALUES ('date_format', 'jS M, Y');
INSERT INTO `anchor_meta` VALUES ('description', 'It’s not just any blog. It’s an Anchor blog.');
INSERT INTO `anchor_meta` VALUES ('home_page', '1');
INSERT INTO `anchor_meta` VALUES ('last_update_check', '2016-01-17 15:58:31');
INSERT INTO `anchor_meta` VALUES ('posts_page', '1');
INSERT INTO `anchor_meta` VALUES ('posts_per_page', '6');
INSERT INTO `anchor_meta` VALUES ('show_all_posts', '0');
INSERT INTO `anchor_meta` VALUES ('sitename', 'My First Anchor Blog');
INSERT INTO `anchor_meta` VALUES ('theme', 'default');

-- ----------------------------
-- Table structure for `anchor_pages`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_pages`;
CREATE TABLE `anchor_pages` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `parent` int(6) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `pagetype` varchar(140) NOT NULL DEFAULT 'all',
  `name` varchar(64) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `status` enum('draft','published','archived') NOT NULL,
  `redirect` text NOT NULL,
  `show_in_menu` tinyint(1) NOT NULL,
  `menu_order` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_pages
-- ----------------------------
INSERT INTO `anchor_pages` VALUES ('1', '0', 'posts', 'all', 'Posts', 'My posts and thoughts', 'Welcome!', 'published', '', '1', '0');
INSERT INTO `anchor_pages` VALUES ('2', '0', 'company', 'all', '公司', '公司', '公司', 'published', '', '1', '0');

-- ----------------------------
-- Table structure for `anchor_pagetypes`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_pagetypes`;
CREATE TABLE `anchor_pagetypes` (
  `key` varchar(32) NOT NULL,
  `value` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_pagetypes
-- ----------------------------
INSERT INTO `anchor_pagetypes` VALUES ('all', 'All Pages');

-- ----------------------------
-- Table structure for `anchor_page_meta`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_page_meta`;
CREATE TABLE `anchor_page_meta` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `page` int(6) NOT NULL,
  `extend` int(6) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page` (`page`),
  KEY `extend` (`extend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_page_meta
-- ----------------------------

-- ----------------------------
-- Table structure for `anchor_posts`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_posts`;
CREATE TABLE `anchor_posts` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `html` mediumtext NOT NULL,
  `css` text NOT NULL,
  `js` text NOT NULL,
  `created` datetime NOT NULL,
  `author` int(6) NOT NULL,
  `category` int(6) NOT NULL,
  `status` enum('draft','published','archived') NOT NULL,
  `comments` tinyint(1) NOT NULL,
  `company` int(6) NOT NULL,
  `department` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_posts
-- ----------------------------
INSERT INTO `anchor_posts` VALUES ('1', 'Hello World', 'hello-world', 'This is the first post.', 'Hello World!\r\n\r\nThis is the first post.', '', '', '2016-01-18 02:07:18', '1', '1', 'published', '0', '0', '0');
INSERT INTO `anchor_posts` VALUES ('2', 'nihao', 'nihao', '', 'PHP（外文名: Hypertext Preprocessor，中文名：“超文本预处理器”）是一种通用开源脚本语言。语法吸收了C语言、Java和Perl的特点，入门门槛较低，易于学习，使用广泛，主要适用于Web开发领域。PHP的文件后缀名为php。\n\n\n本文为大家讲解的是PHP Warning:  json_encode() : Invalid UTF-8 sequence in argument in解决方法，感兴趣的同学参考下。\n错误描述\n\nPHP Warning:  json_encode() [<a href=\'function.json-encode\'>function.json-encode</a>]: Invalid UTF-8 sequence in argument in /xxx.php on line 行号\n原因分析\n\njson_encode只能对utf8编码的中文进行编码，如果提交给json_encode的参数里包含非utf8编码的中文，就会json编码失败返回null\n解决方法\n\n在编码之前对数据进行检查，或直接用iconv,mb_convert_encoding转码。', '', '', '2016-01-18 02:59:40', '1', '1', 'published', '0', '0', '0');
INSERT INTO `anchor_posts` VALUES ('3', '啦啦啦啦啦', 'post', '', '啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啊啊啊啊啊啊啊啦啦啦啦啦啦啦啦啦啦啦啦啊啊啊啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦', '', '', '2016-01-18 07:43:12', '1', '3', 'published', '0', '0', '0');
INSERT INTO `anchor_posts` VALUES ('4', 'fafdsafdsa', 'fafdsafdsa', '', 'asdfasdf', '', '', '2016-02-15 13:29:43', '1', '8', 'published', '0', '6', '1');
INSERT INTO `anchor_posts` VALUES ('5', '啊啊啊啊啊啊啊啊啊', 'aaa', '', '啊啊啊啊啊啊啊啊啊啊啊', '', '', '2016-02-15 13:31:04', '1', '6', 'published', '0', '4', '2');
INSERT INTO `anchor_posts` VALUES ('6', '微信提现收费罪在银行？抱歉，这锅弱势群体不背', 'weixin', '', '先用大家能理解的语言简单的解释下包括微信支付背后的财付通在内的第三方支付公司的运作模式：第三方支付公司有一家主要的存管银行和很多协办的合作银行，每家银行都有一个或者多个账户用来放客户的资金（收付和汇缴账户为方便理解不展开说了）。我们往里充值的时候例如发红包，钱从我们的银行卡里扣除后转入第三方支付在你的银行卡所属银行所开立的账户里；而提现的时候就是这个流程反过来，把钱转入你的银行卡而不是给你现金。如果不提现，你的钱就在第三方支付公司的账户里放着，你可以通过其提供的方式查看你在这家公司记账的金额，在微信里的话就显示为“我的零钱”。\n\n\n从上面这段描述里可以看出，大多数情况下第三方支付都是在银行内部进行资金划转操作，实际需要跨行交易的资金笔数相对较少。而第三方支付所谓的跨行转账功能，其实就是分别在两家银行的一笔行内转入和一笔行内转出，以及第三方支付自己的一次虚拟记账，微信好友之间转账更只是一次虚拟记账而已。\n\n\n', '', '', '2016-02-16 02:12:20', '1', '5', 'published', '1', '1', '1');

-- ----------------------------
-- Table structure for `anchor_post_meta`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_post_meta`;
CREATE TABLE `anchor_post_meta` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `post` int(6) NOT NULL,
  `extend` int(6) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post` (`post`),
  KEY `extend` (`extend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_post_meta
-- ----------------------------

-- ----------------------------
-- Table structure for `anchor_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_sessions`;
CREATE TABLE `anchor_sessions` (
  `id` char(32) NOT NULL,
  `expire` int(10) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_sessions
-- ----------------------------
INSERT INTO `anchor_sessions` VALUES ('6FwR3zU5lj14N46Iu05ip4vxbPYLl9ak', '1455624651', 'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}');
INSERT INTO `anchor_sessions` VALUES ('H3JBup22l77SKDsZDpMDfEQc95MhknGX', '1455689930', 'a:4:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}s:11:\"csrf_tokens\";a:65:{i:0;s:32:\"277a60326ee4cf3efbfeadecde54c653\";i:1;s:32:\"2b78bdc3e008e5747783365650ae95ae\";i:2;s:32:\"e5dbe1849aef4ea3db447cb2f3062d75\";i:3;s:32:\"c3f342f1bb3b5d6bf88adcf6f238d72a\";i:4;s:32:\"cb67a2f283b65e02e57d4202af255b2e\";i:5;s:32:\"570614624ee2ef1071584ed20fb556fa\";i:6;s:32:\"72fcfd4a1f32becf5e5b9f8312324f0d\";i:7;s:32:\"907889cce84d4993670e1bf090b22dc0\";i:8;s:32:\"1c627c2fab66756165937ea78efb6a21\";i:9;s:32:\"3fa44bc4e34b9f13abbb6e0c99ea8a6b\";i:10;s:32:\"288102dce38960853aceedffc5146df1\";i:11;s:32:\"314a486a06ba988674254fbdcafee611\";i:12;s:32:\"3ddfa8ad783807b83097e0af116e08e2\";i:13;s:32:\"4dd17edcf9f6d356b0d8b37e655d3259\";i:14;s:32:\"560299c08daadf91e3808aaa2c2df433\";i:15;s:32:\"d84ab55e1764a8dd24b37542c52ed37b\";i:16;s:32:\"5ebb9b1994d41df05f1cd546492d1397\";i:17;s:32:\"6e0e6a0cdb8be9a197bcf025ad3ce822\";i:18;s:32:\"83d0b3b72ac7d1febd14d2e942de6790\";i:19;s:32:\"85702106b814f91bd6b08ed53a2aac57\";i:20;s:32:\"e31594f74a95b2760e897d1033eb8af3\";i:21;s:32:\"f3f90ab25f24c3ff05a271d61f23cef2\";i:22;s:32:\"5d5aff6b42257a84ba5fa4ef7ac63e53\";i:23;s:32:\"519d9ce6049a879f6a92337bed03a08c\";i:24;s:32:\"7698d9f9238ecff605301010f32c6cd7\";i:25;s:32:\"7c96623b8da43f7870f3f5dcce74d793\";i:26;s:32:\"5a65e7ea378065cbfd94fa877e47bcd9\";i:27;s:32:\"077af6b63bb33711e475aef7d34a6f0a\";i:28;s:32:\"81515dd8a34438cec14c74a060bf9a17\";i:29;s:32:\"72c1cd44e4bac21d6b8de7bab488a02b\";i:30;s:32:\"076374ef2aa1d8913aaa0dd65566bd9f\";i:31;s:32:\"309d841aa983b70bd1abdafe13a4d969\";i:32;s:32:\"ba9162e22576a9a038503e435663a4f9\";i:33;s:32:\"d7e9a2ac7556e5248597f81382c820a3\";i:34;s:32:\"b2633c50bf3744426a2390a15ecec711\";i:35;s:32:\"4459956246b95b20535c09dfed8d3797\";i:36;s:32:\"7f0eb2cdbdb3fe5dc6b4c5a6f5d6bbcf\";i:37;s:32:\"8d37f9ba5a1a9300f80a727a4c48f4ce\";i:38;s:32:\"20bf3f54b4a19ec2775b14c5066a5305\";i:39;s:32:\"061d2bc4b737017010616742cb52a4dc\";i:40;s:32:\"155249593bb7e2cb32a5e716afa69595\";i:41;s:32:\"186356f749aec20e913fbe805db0a0b4\";i:42;s:32:\"c14c6f0338aeec0b9c43fdd64bbec96c\";i:43;s:32:\"3a6d2b773609ce9619e27ec5cc09fa10\";i:44;s:32:\"d54d2c5e64ffe69408c0a43d3204cc31\";i:45;s:32:\"27405811cb63a60d3f90aaf15d7a3ae5\";i:46;s:32:\"fa7d2b9eaf27df1a934704de06654882\";i:47;s:32:\"15ad61512987dbdbcdbe9b745c57beeb\";i:48;s:32:\"9cd471ef17c6c45fc0f1644d5b335cce\";i:49;s:32:\"bce16bdaaaed2f9db783788a890710e8\";i:50;s:32:\"b278e62ed952f52a8810688948de5642\";i:51;s:32:\"ff124762c97847224df765612cac574e\";i:52;s:32:\"1e911c056ac960570dd91aeff506e843\";i:53;s:32:\"d55b157f403876d0fb90c4bbd35e1001\";i:54;s:32:\"34867dc5cd604de176d6fa4435b412cd\";i:55;s:32:\"e5269818387e8aa591eb61332f76f94f\";i:56;s:32:\"47a7c52fd9c221540374d08463a3970b\";i:57;s:32:\"3fb6affe5e15aa641004c844d7c39b4a\";i:58;s:32:\"4dc621a4c1486a68585e2d7ac6a93795\";i:59;s:32:\"9bed19565ff07bf07f3c4ed0aa28c5c4\";i:60;s:32:\"e92709301f36c03d6bd63a94f8fce86a\";i:61;s:32:\"7f1d84d47445a290e2de09d3c155ba99\";i:62;s:32:\"997f9ce2a6fd56618fc447450b5513a8\";i:63;s:32:\"af8645ac976adbbd34e2c6d587effde7\";i:64;s:32:\"cd21cdd03b3440d2679aa37cca31c4a7\";}s:4:\"auth\";s:1:\"1\";}');
INSERT INTO `anchor_sessions` VALUES ('kSDANaJGk43Mpg1roicauwBDOt0MGr6E', '1455608268', 'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}');
INSERT INTO `anchor_sessions` VALUES ('RinzsO7aLomWEKQqnwv3CfcXDsiO3SZS', '1455672805', 'a:4:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}s:11:\"csrf_tokens\";a:14:{i:0;s:32:\"72d441243d3cbe9bcde5502127dfb7b3\";i:1;s:32:\"47e5c19f0aa022b2f1072f6b6cdca3c8\";i:2;s:32:\"cba173de5e25cde20698f520d95f7453\";i:3;s:32:\"811d8686556dcb29ef6a87f571cb3890\";i:4;s:32:\"f9490481dcc44775f42ba7855551c2f9\";i:5;s:32:\"3a48dd7e9f112cc6a2a42f8659e1d6af\";i:6;s:32:\"5f17bc336fa185247521041ad9a648b8\";i:7;s:32:\"058b66fee50afc063d7d3f3ffbc92995\";i:8;s:32:\"21fdd84c4554cae82c1b65997b88503f\";i:9;s:32:\"96aa9dfda0978ed0e42690f5d3a1f73a\";i:10;s:32:\"ca2c0d97f4e4fdbb1d07a73dd971fe17\";i:11;s:32:\"8cb570e283416e0b703b639e7db9aa6e\";i:12;s:32:\"5bdd8a402fce31cec659676986540258\";i:13;s:32:\"0d39afbfd493c86ae2236b25d530b746\";}s:4:\"auth\";s:1:\"1\";}');

-- ----------------------------
-- Table structure for `anchor_users`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_users`;
CREATE TABLE `anchor_users` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(140) NOT NULL,
  `real_name` varchar(140) NOT NULL,
  `bio` text NOT NULL,
  `status` enum('inactive','active') NOT NULL,
  `role` enum('administrator','editor','user') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_users
-- ----------------------------
INSERT INTO `anchor_users` VALUES ('1', 'admin', '$2a$10$4o7pznfHmYJsmwyTbBjjYeUMsnh9amIPeyMkQsCZuMGbpS87xjZnW', 'huangxiyun@163.com', 'Administrator', 'The bouse', 'active', 'administrator');

-- ----------------------------
-- Table structure for `anchor_user_meta`
-- ----------------------------
DROP TABLE IF EXISTS `anchor_user_meta`;
CREATE TABLE `anchor_user_meta` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `user` int(6) NOT NULL,
  `extend` int(6) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`user`),
  KEY `extend` (`extend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor_user_meta
-- ----------------------------
