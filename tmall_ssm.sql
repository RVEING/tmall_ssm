/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : tmall_ssm

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-04-04 23:34:25
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) NOT NULL COMMENT '分类的名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '女装 /内衣');
INSERT INTO `category` VALUES ('2', '男装 /运动户外');
INSERT INTO `category` VALUES ('3', '女鞋 /男鞋 /箱包');
INSERT INTO `category` VALUES ('4', '美妆 /个人护理');
INSERT INTO `category` VALUES ('5', '腕表 /眼镜 /珠宝饰品');
INSERT INTO `category` VALUES ('6', '手机 /数码 /电脑办公');
INSERT INTO `category` VALUES ('7', '母婴玩具');
INSERT INTO `category` VALUES ('8', '零食 /茶酒 /进口食品');
INSERT INTO `category` VALUES ('9', '生鲜水果');
INSERT INTO `category` VALUES ('10', '大家电 /生活电器');
INSERT INTO `category` VALUES ('11', '家具建材');
INSERT INTO `category` VALUES ('12', '汽车 /配件 /用品');
INSERT INTO `category` VALUES ('13', '家纺 /家饰 /鲜花');
INSERT INTO `category` VALUES ('14', '医药保健');
INSERT INTO `category` VALUES ('15', '厨具 /收纳 /宠物');
INSERT INTO `category` VALUES ('16', '图书音像');
INSERT INTO `category` VALUES ('17', '测试分类1');
INSERT INTO `category` VALUES ('18', '测试分类2');
INSERT INTO `category` VALUES ('19', '测试分类3');
INSERT INTO `category` VALUES ('20', '测试分类4');
INSERT INTO `category` VALUES ('21', '测试分类5');
INSERT INTO `category` VALUES ('22', '测试分类6');
INSERT INTO `category` VALUES ('23', '测试分类7');
INSERT INTO `category` VALUES ('24', '测试分类8');
INSERT INTO `category` VALUES ('25', '测试分类9');
INSERT INTO `category` VALUES ('26', '测试分类10');
INSERT INTO `category` VALUES ('28', '1');
INSERT INTO `category` VALUES ('29', '2');
INSERT INTO `category` VALUES ('37', 'xxxx');

-- ----------------------------
-- Table structure for `order_`
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `order_code` varchar(255) NOT NULL COMMENT '订单号',
  `address` varchar(255) NOT NULL COMMENT '收货地址',
  `post` varchar(255) NOT NULL COMMENT '邮编',
  `receiver` varchar(255) NOT NULL COMMENT '收货人姓名',
  `mobile` varchar(255) NOT NULL COMMENT '手机号码',
  `user_message` varchar(255) NOT NULL COMMENT '用户备注的信息',
  `create_date` datetime NOT NULL COMMENT '订单创建时间',
  `pay_date` datetime DEFAULT NULL COMMENT '订单支付时间',
  `delivery_date` datetime DEFAULT NULL COMMENT '发货日期',
  `confirm_date` datetime DEFAULT NULL COMMENT '确认收货日期',
  `user_id` int(11) DEFAULT NULL COMMENT '对应的用户id',
  `status` varchar(255) NOT NULL COMMENT '订单状态',
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`user_id`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES ('1', '123456', '地球村', '', '我没有三颗心脏', '', '', '1996-11-30 00:00:00', '2018-04-29 00:00:00', '2018-04-29 00:00:00', '2018-04-29 00:00:00', '1', 'delete');
INSERT INTO `order_` VALUES ('10', '20180506143826504', '123123', '', '我没有三颗心脏', '12345678910', '', '2018-05-06 00:00:00', '2018-05-06 00:00:00', null, null, '1', 'waitDelivery');
INSERT INTO `order_` VALUES ('11', '20180507092435428', '详细地址', '', '我没有三颗心脏', '12345678910', '卖家留言', '2018-05-07 00:00:00', '2018-05-07 00:00:00', null, null, '1', 'finish');
INSERT INTO `order_` VALUES ('12', '20180507180327444', '123', '', '我没有三颗心脏', '12345678910', '', '2018-05-07 00:00:00', '2018-05-07 00:00:00', '2018-05-07 00:00:00', '2018-05-07 00:00:00', '1', 'finish');
INSERT INTO `order_` VALUES ('13', '20180507205110309', '', '', '', '', '', '2018-05-07 00:00:00', '2018-05-07 20:51:56', null, null, '1', 'waitDelivery');
INSERT INTO `order_` VALUES ('14', '20180716093257383', '', '', '', '', '', '2018-07-16 00:00:00', '2018-07-16 09:32:59', '2020-04-02 21:44:50', null, '4', 'waitConfirm');

-- ----------------------------
-- Table structure for `order_item`
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `product_id` int(11) NOT NULL COMMENT '对应产品id',
  `order_id` int(11) DEFAULT NULL COMMENT '对应订单id',
  `user_id` int(11) NOT NULL COMMENT '对应用户id',
  `number` int(11) DEFAULT NULL COMMENT '对应产品购买的数量',
  PRIMARY KEY (`id`),
  KEY `fk_order_item_product` (`product_id`),
  KEY `fk_order_item_order` (`order_id`),
  KEY `fk_order_item_user` (`user_id`),
  CONSTRAINT `fk_order_item_order` FOREIGN KEY (`order_id`) REFERENCES `order_` (`id`),
  CONSTRAINT `fk_order_item_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_order_item_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('14', '5', '11', '1', '1');
INSERT INTO `order_item` VALUES ('15', '6', '11', '1', '1');
INSERT INTO `order_item` VALUES ('16', '4', null, '1', '5');
INSERT INTO `order_item` VALUES ('17', '4', '12', '1', '1');
INSERT INTO `order_item` VALUES ('18', '8', '13', '1', '1');
INSERT INTO `order_item` VALUES ('19', '5', '14', '4', '1');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) NOT NULL COMMENT '产品的名称',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '小标题',
  `price` float DEFAULT NULL COMMENT '价格',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `category_id` int(11) DEFAULT NULL COMMENT '对应的分类id',
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`category_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('4', '男装 袋装圆领T恤(短袖) 404133 优衣库UNIQLO', '初上市价格39元', '39', '107769', '9999', '1');
INSERT INTO `product` VALUES ('5', '复古连衣裙2018春夏新款女装休闲宽松韩版气质圆领中袖丝麻连衣裙', '丝麻面料 做工精细 气质优雅', '368', '1148', '9999', '1');
INSERT INTO `product` VALUES ('6', '【满400减40】ONLY夏新喇叭长袖高腰碎花连衣裙女|117207510', '纯色内衬 镂空设计7天降退差价', '224.5', '946', '9999', '1');
INSERT INTO `product` VALUES ('7', '夏季2018新款短袖男士t恤韩版宽松ulzzang百搭潮流半袖七分袖上衣', '2件装79元！收藏加购优先发货！', '79', '9543', '9999', '1');
INSERT INTO `product` VALUES ('8', '唐狮春秋季牛仔外套男牛仔衣夹克韩版潮流修身帅气情侣装男生外套', '潮流多色，热卖上万件', '169', '4909', '9999', '1');
INSERT INTO `product` VALUES ('9', '产品6', '', null, null, null, '1');
INSERT INTO `product` VALUES ('10', '产品7', '', null, null, null, '1');
INSERT INTO `product` VALUES ('11', '产品8', '', null, null, null, '1');
INSERT INTO `product` VALUES ('12', '产品9', '', null, null, null, '1');
INSERT INTO `product` VALUES ('13', '产品10', '', null, null, null, '1');
INSERT INTO `product` VALUES ('14', '产品11', '', null, null, null, '1');
INSERT INTO `product` VALUES ('15', '产品12', '', null, null, null, '1');
INSERT INTO `product` VALUES ('16', '产品13', '', null, null, null, '1');
INSERT INTO `product` VALUES ('17', '产品14', '', null, null, null, '1');
INSERT INTO `product` VALUES ('18', '产品15', '', null, null, null, '1');
INSERT INTO `product` VALUES ('19', '产品16', '', null, null, null, '1');
INSERT INTO `product` VALUES ('20', '产品17', '', null, null, null, '1');
INSERT INTO `product` VALUES ('26', 'xxxx', '产品123', '99.98', null, '99', '28');
INSERT INTO `product` VALUES ('27', '王者', '产品123', '99.98', '12', '99', '28');
INSERT INTO `product` VALUES ('38', 'qq', '产品123', '99.98', '124', '99', '37');

-- ----------------------------
-- Table structure for `product_image`
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `product_id` int(11) DEFAULT NULL COMMENT '对应的产品id',
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_image_product` (`product_id`),
  CONSTRAINT `fk_product_image_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('12', '4', 'type_detail');
INSERT INTO `product_image` VALUES ('13', '4', 'type_detail');
INSERT INTO `product_image` VALUES ('14', '4', 'type_detail');
INSERT INTO `product_image` VALUES ('15', '4', 'type_detail');
INSERT INTO `product_image` VALUES ('16', '5', null);
INSERT INTO `product_image` VALUES ('17', '5', null);
INSERT INTO `product_image` VALUES ('18', '5', null);
INSERT INTO `product_image` VALUES ('19', '5', null);
INSERT INTO `product_image` VALUES ('20', '5', null);
INSERT INTO `product_image` VALUES ('21', '6', null);
INSERT INTO `product_image` VALUES ('22', '6', null);
INSERT INTO `product_image` VALUES ('23', '6', null);
INSERT INTO `product_image` VALUES ('24', '6', null);
INSERT INTO `product_image` VALUES ('25', '6', null);
INSERT INTO `product_image` VALUES ('26', '7', null);
INSERT INTO `product_image` VALUES ('27', '7', null);
INSERT INTO `product_image` VALUES ('28', '7', null);
INSERT INTO `product_image` VALUES ('29', '7', null);
INSERT INTO `product_image` VALUES ('30', '7', null);
INSERT INTO `product_image` VALUES ('31', '8', null);
INSERT INTO `product_image` VALUES ('32', '8', null);
INSERT INTO `product_image` VALUES ('33', '8', null);
INSERT INTO `product_image` VALUES ('34', '8', null);
INSERT INTO `product_image` VALUES ('35', '8', null);
INSERT INTO `product_image` VALUES ('36', '9', null);
INSERT INTO `product_image` VALUES ('37', '9', null);
INSERT INTO `product_image` VALUES ('38', '9', null);
INSERT INTO `product_image` VALUES ('39', '9', null);
INSERT INTO `product_image` VALUES ('40', '9', null);
INSERT INTO `product_image` VALUES ('41', '10', null);
INSERT INTO `product_image` VALUES ('42', '10', null);
INSERT INTO `product_image` VALUES ('43', '10', null);
INSERT INTO `product_image` VALUES ('44', '10', null);
INSERT INTO `product_image` VALUES ('45', '10', null);
INSERT INTO `product_image` VALUES ('46', '11', null);
INSERT INTO `product_image` VALUES ('47', '11', null);
INSERT INTO `product_image` VALUES ('48', '11', null);
INSERT INTO `product_image` VALUES ('49', '11', null);
INSERT INTO `product_image` VALUES ('50', '11', null);
INSERT INTO `product_image` VALUES ('51', '12', null);
INSERT INTO `product_image` VALUES ('52', '12', null);
INSERT INTO `product_image` VALUES ('53', '12', null);
INSERT INTO `product_image` VALUES ('54', '12', null);
INSERT INTO `product_image` VALUES ('55', '12', null);
INSERT INTO `product_image` VALUES ('56', '13', null);
INSERT INTO `product_image` VALUES ('57', '13', null);
INSERT INTO `product_image` VALUES ('58', '13', null);
INSERT INTO `product_image` VALUES ('59', '13', null);
INSERT INTO `product_image` VALUES ('60', '13', null);
INSERT INTO `product_image` VALUES ('61', '14', null);
INSERT INTO `product_image` VALUES ('62', '14', null);
INSERT INTO `product_image` VALUES ('63', '14', null);
INSERT INTO `product_image` VALUES ('64', '14', null);
INSERT INTO `product_image` VALUES ('65', '14', null);
INSERT INTO `product_image` VALUES ('66', '15', null);
INSERT INTO `product_image` VALUES ('67', '15', null);
INSERT INTO `product_image` VALUES ('68', '15', null);
INSERT INTO `product_image` VALUES ('69', '15', null);
INSERT INTO `product_image` VALUES ('70', '15', null);
INSERT INTO `product_image` VALUES ('71', '16', null);
INSERT INTO `product_image` VALUES ('72', '16', null);
INSERT INTO `product_image` VALUES ('73', '16', null);
INSERT INTO `product_image` VALUES ('74', '16', null);
INSERT INTO `product_image` VALUES ('75', '16', null);
INSERT INTO `product_image` VALUES ('76', '17', null);
INSERT INTO `product_image` VALUES ('77', '17', null);
INSERT INTO `product_image` VALUES ('78', '17', null);
INSERT INTO `product_image` VALUES ('79', '17', null);
INSERT INTO `product_image` VALUES ('80', '17', null);
INSERT INTO `product_image` VALUES ('81', '18', null);
INSERT INTO `product_image` VALUES ('82', '18', null);
INSERT INTO `product_image` VALUES ('83', '18', null);
INSERT INTO `product_image` VALUES ('84', '18', null);
INSERT INTO `product_image` VALUES ('85', '18', null);
INSERT INTO `product_image` VALUES ('86', '19', null);
INSERT INTO `product_image` VALUES ('87', '19', null);
INSERT INTO `product_image` VALUES ('88', '19', null);
INSERT INTO `product_image` VALUES ('89', '19', null);
INSERT INTO `product_image` VALUES ('90', '19', null);
INSERT INTO `product_image` VALUES ('91', '20', null);
INSERT INTO `product_image` VALUES ('92', '20', null);
INSERT INTO `product_image` VALUES ('93', '20', null);
INSERT INTO `product_image` VALUES ('94', '20', null);
INSERT INTO `product_image` VALUES ('95', '20', null);
INSERT INTO `product_image` VALUES ('96', null, 'type_single');
INSERT INTO `product_image` VALUES ('97', null, 'type_single');
INSERT INTO `product_image` VALUES ('98', null, 'type_single');
INSERT INTO `product_image` VALUES ('99', null, 'type_detail');
INSERT INTO `product_image` VALUES ('100', null, 'type_single');
INSERT INTO `product_image` VALUES ('101', null, 'type_single');
INSERT INTO `product_image` VALUES ('102', null, 'type_single');
INSERT INTO `product_image` VALUES ('103', '4', 'type_single');
INSERT INTO `product_image` VALUES ('105', null, 'type_detail');
INSERT INTO `product_image` VALUES ('106', null, 'type_detail');
INSERT INTO `product_image` VALUES ('111', '38', 'type_single');
INSERT INTO `product_image` VALUES ('112', '38', 'type_detail');
INSERT INTO `product_image` VALUES ('113', '38', 'type_single');
INSERT INTO `product_image` VALUES ('115', '4', 'type_single');

-- ----------------------------
-- Table structure for `property`
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) DEFAULT NULL COMMENT '属性名称',
  `category_id` int(11) NOT NULL COMMENT '对应的分类id',
  PRIMARY KEY (`id`),
  KEY `fk_property_category` (`category_id`),
  CONSTRAINT `fk_property_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES ('1', '尺寸', '1');
INSERT INTO `property` VALUES ('2', '厚薄', '1');
INSERT INTO `property` VALUES ('3', '材质成分', '1');
INSERT INTO `property` VALUES ('4', '货号', '1');
INSERT INTO `property` VALUES ('5', '基础风格', '1');
INSERT INTO `property` VALUES ('6', '品牌', '1');
INSERT INTO `property` VALUES ('11', '来源', '1');

-- ----------------------------
-- Table structure for `property_value`
-- ----------------------------
DROP TABLE IF EXISTS `property_value`;
CREATE TABLE `property_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `product_id` int(11) NOT NULL COMMENT '对应产品id',
  `property_id` int(11) NOT NULL COMMENT '对应属性id',
  `value` varchar(255) DEFAULT NULL COMMENT '具体的属性值',
  PRIMARY KEY (`id`),
  KEY `fk_property_value_property` (`property_id`),
  KEY `fk_property_value_product` (`product_id`),
  CONSTRAINT `fk_property_value_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_property_value_property` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of property_value
-- ----------------------------
INSERT INTO `property_value` VALUES ('1', '4', '1', 'L M XL XLL');
INSERT INTO `property_value` VALUES ('2', '4', '2', '常规');
INSERT INTO `property_value` VALUES ('3', '4', '3', '棉66% 聚酯纤维34%');
INSERT INTO `property_value` VALUES ('4', '4', '4', 'UQ404133000');
INSERT INTO `property_value` VALUES ('5', '4', '5', '其他1');
INSERT INTO `property_value` VALUES ('6', '4', '6', 'Uniqlo/优衣库');
INSERT INTO `property_value` VALUES ('7', '20', '1', '共有3个兵马俑坑。一号坑是战车和步兵相间的主力军阵，约有6000个真人大小的陶俑。二号坑由战车、骑兵、弩兵混合编组。三号坑是军阵的指挥系统。');
INSERT INTO `property_value` VALUES ('8', '20', '2', null);
INSERT INTO `property_value` VALUES ('9', '20', '3', null);
INSERT INTO `property_value` VALUES ('10', '20', '4', null);
INSERT INTO `property_value` VALUES ('11', '20', '5', null);
INSERT INTO `property_value` VALUES ('12', '20', '6', null);
INSERT INTO `property_value` VALUES ('13', '20', '11', null);

-- ----------------------------
-- Table structure for `referal_link`
-- ----------------------------
DROP TABLE IF EXISTS `referal_link`;
CREATE TABLE `referal_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `text` varchar(255) NOT NULL COMMENT '超链显示的文字',
  `link` varchar(255) NOT NULL COMMENT '超链的地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of referal_link
-- ----------------------------
INSERT INTO `referal_link` VALUES ('1', '天猫会员', '#nowhere');
INSERT INTO `referal_link` VALUES ('2', '电器城', '#nowhere');
INSERT INTO `referal_link` VALUES ('3', '喵鲜生', '#nowhere');
INSERT INTO `referal_link` VALUES ('4', '医药馆', '#nowhere');
INSERT INTO `referal_link` VALUES ('5', '营业厅', '#nowhere');
INSERT INTO `referal_link` VALUES ('6', '魅力惠', '#nowhere');
INSERT INTO `referal_link` VALUES ('7', '飞猪旅游', '#nowhere');
INSERT INTO `referal_link` VALUES ('8', '苏宁易购', '#nowhere');

-- ----------------------------
-- Table structure for `review`
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `content` varchar(4000) DEFAULT NULL COMMENT '评价内容',
  `user_id` int(11) NOT NULL COMMENT '对应的用户id',
  `product_id` int(11) NOT NULL COMMENT '对应的产品id',
  `createDate` datetime DEFAULT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`),
  KEY `fk_review_product` (`product_id`),
  KEY `fk_review_user` (`user_id`),
  CONSTRAINT `fk_review_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_review_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('2', '这款短袖T恤不错哦，没想到买的号码挺准。上身效果好看，特别时尚休闲。和图片上的一样，没色差，衣服料子很好，没线头，布料是棉的，摸起来舒服，比想象的要厚实。朋友们都说好看，款式简洁大方。真的是超级赞，以后就认准这家啦，有想买的亲赶快下手哦。我是这的老顾客了，这家产品确实一直棒棒的哦。', '1', '4', '2018-05-02 10:24:02');
INSERT INTO `review` VALUES ('3', '比较轻薄，质量蛮好的，穿起来还是比较舒适，很合身，价格也实惠！', '1', '4', '2018-05-02 10:42:07');
INSERT INTO `review` VALUES ('6', '上身效果很好', '3', '6', '2018-05-07 10:49:09');
INSERT INTO `review` VALUES ('7', '评价一个', '4', '6', '2018-05-07 11:01:06');
INSERT INTO `review` VALUES ('8', 'qw54e5qwe4qw6eq4eqewq', '1', '4', '2018-05-07 18:05:09');
INSERT INTO `review` VALUES ('9', '当评价完成之后，可以看到其他用户的评价信息', '1', '4', '2018-05-07 20:59:49');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) NOT NULL COMMENT '用户名称',
  `password` varchar(255) NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '我没有三颗心脏', '123');
INSERT INTO `user` VALUES ('2', '我没有三颗心脏1', '123');
INSERT INTO `user` VALUES ('3', '测试账号', '123');
INSERT INTO `user` VALUES ('4', '我没有三颗心脏123', '123');
