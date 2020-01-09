SET NAMES UTF8;
DROP DATABASE IF EXISTS gjw;
CREATE DATABASE gjw CHARSET=UTF8;
USE gjw;

/*用户信息表*/
CREATE TABLE gjw_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(32),
    upwd VARCHAR(32),
    email VARCHAR(64),
    phone VARCHAR(16),
    avatar VARCHAR(128),
    user_name VARCHAR(32),
    gender INT
);

/*用户地址表*/
CREATE TABLE gjw_receiver_address(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT, #用户编号
    receiver VARCHAR(16), #接收人姓名
    province VARCHAR(16), #省
    city VARCHAR(16), #市
    county VARCHAR(16), #县
    address VARCHAR(128), #详细地址
    cellphone VARCHAR(16), #手机
    fixedphone VARCHAR(16), #固定电话
    postcode CHAR(6), #邮编
    tag VARCHAR(16), #标签名
    is_default BOOLEAN #是否为当前用户的默认收货地址
);

/*用户购物车表*/
CREATE TABLE gjw_shopping_cart(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT, #用户编号
    product_id INT, #商品编号
    count INT #购买数量
);

/*用户订单表*/
CREATE TABLE gjw_order(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT, #用户编号
    address_id INT, 
    status INT, #订单状态 1-等待付款 2-等待发货 3-运输中 4-已签收 5-已取消
    order_time BIGINT, #下单时间
    pay_time BIGINT, #付款时间
    deliver_time BIGINT, #发货时间
    received_time BIGINT #签收时间
);

/*用户订单详情表*/
CREATE TABLE gjw_order_detail(
    did INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT, #订单编号
    product_id INT, #产品编号
    count INT #购买数量
);

/*商品类别表*/
CREATE TABLE gjw_laptop_family(
    fid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) #类别名称
);

/*商品类别详细表*/
CREATE TABLE gjw_laptop_family_detail(
    did INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32), #详细类别名称
    fid INT #商品类别ID
);

/*商品表*/
CREATE TABLE gjw_laptop(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    family_id INT, #所属型号家族编号
    product_id VARCHAR(128), #产品编号
    title VARCHAR(128), #主标题
    subtitle VARCHAR(128), #副标题
    price DECIMAL(10,2), #价格
    ticket VARCHAR(64), #领券
    brand VARCHAR(32), #商品品牌
    netContent VARCHAR(32), #净含量
    degress VARCHAR(32), #度数
    reticule VARCHAR(32), #手提袋
    aromaType VARCHAR(32), #香型
    boxGauge VARCHAR(32), #箱规
    specs VARCHAR(32), #规格
    details VARCHAR(1024), #产品详细说明
    shelf_time BIGINT, #上架时间
    sold_count INT, #产品数量
    is_onsale BOOLEAN #是否促销中
);

/*商品详情图表*/
CREATE TABLE gjw_laptop_pic(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    laptop_id INT, #商品编号
    one VARCHAR(128), 
    two VARCHAR(128), 
    three VARCHAR(128), 
    four VARCHAR(128),
    five VARCHAR(128)
);

/*首页轮播图表*/
CREATE TABLE gjw_index_carousel(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128), #图片路径
    title VARCHAR(64), #图片描述
    href VARCHAR(128) #图片链接
);

/*首页商品栏目表*/
CREATE TABLE gjw_index_product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(64), #商品标题
    details VARCHAR(128), #详细描述
    pic VARCHAR(128), #图片
    price DECIMAL(10,2) #商品价格
);

/*评价表*/
CREATE TABLE gjw_comment(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT, #用户编号
    laptop_id INT, #商品编号
    com_content VARCHAR(1024), #评价文字
    com_img VARCHAR(128), #评价图片
    star INT, #满意度
    com_date VARCHAR(30) #留言日期
);
/*采购表*/
CREATE TABLE gjw_caigou(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(128),
    contact_name VARCHAR(32),
    phone VARCHAR(11),
    caigou_type VARCHAR(10),
    remark VARCHAR(200)
);


/*************************************************/
/*********************数据导入*********************/
/*************************************************/
/*评价表*/
INSERT INTO gjw_comment VALUES(NULL,1,3,'特地注明包装完整，但收到的货㡳座磨损严重，内垫全部断裂。无语',NULL,1,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,2,3,'非常喜欢下手来了一对先收藏着，在购酒网已N多次购酒，品质是有保障的',NULL,3,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,3,3,'购酒网，值得信赖，质量可靠，商品与描述一致，包装仔细，严谨，物流快，服务好，商品搞活动价格特别实惠，现在每天都，有优惠就下单，有时一天下几单。希望购酒网多搞促销活动，我还是一如既往多多下单',NULL,5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,4,3,'这么一箱这个价格挺划算的，本想着价格便宜，胡乱试试好不好，正符合我的口感，以后还会来的',NULL,4,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,5,3,'酒收到了，包装完好，性价比高，卖家服务态度很好，买来送亲戚朋友的，很有档次，物流给力，棒棒哒！',NULL,5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,6,3,'收藏系列','img/comment/comment1.png',5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,1,1,'特地注明包装完整，但收到的货㡳座磨损严重，内垫全部断裂。无语',NULL,1,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,2,1,'非常喜欢下手来了一对先收藏着，在购酒网已N多次购酒，品质是有保障的',NULL,3,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,3,1,'购酒网，值得信赖，质量可靠，商品与描述一致，包装仔细，严谨，物流快，服务好，商品搞活动价格特别实惠，现在每天都，有优惠就下单，有时一天下几单。希望购酒网多搞促销活动，我还是一如既往多多下单',NULL,5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,4,1,'这么一箱这个价格挺划算的，本想着价格便宜，胡乱试试好不好，正符合我的口感，以后还会来的',NULL,4,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,5,1,'酒收到了，包装完好，性价比高，卖家服务态度很好，买来送亲戚朋友的，很有档次，物流给力，棒棒哒！',NULL,5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,6,1,'收藏系列','img/comment/comment1.png',5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,1,2,'特地注明包装完整，但收到的货㡳座磨损严重，内垫全部断裂。无语',NULL,1,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,2,2,'非常喜欢下手来了一对先收藏着，在购酒网已N多次购酒，品质是有保障的',NULL,3,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,3,2,'购酒网，值得信赖，质量可靠，商品与描述一致，包装仔细，严谨，物流快，服务好，商品搞活动价格特别实惠，现在每天都，有优惠就下单，有时一天下几单。希望购酒网多搞促销活动，我还是一如既往多多下单',NULL,5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,4,2,'这么一箱这个价格挺划算的，本想着价格便宜，胡乱试试好不好，正符合我的口感，以后还会来的',NULL,4,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,5,2,'酒收到了，包装完好，性价比高，卖家服务态度很好，买来送亲戚朋友的，很有档次，物流给力，棒棒哒！',NULL,5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,6,2,'收藏系列','img/comment/comment1.png',5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,1,4,'收藏系列','img/comment/comment1.png',5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,2,4,'收藏系列','img/comment/comment1.png',5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,3,4,'收藏系列','img/comment/comment1.png',5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,4,4,'收藏系列','img/comment/comment1.png',5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,5,4,'收藏系列','img/comment/comment1.png',5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,1,30,'收藏系列','img/comment/comment1.png',5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,2,30,'收藏系列','img/comment/comment1.png',5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,3,30,'收藏系列','img/comment/comment1.png',5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,4,30,'收藏系列','img/comment/comment1.png',5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,5,30,'收藏系列','img/comment/comment1.png',5,'2018-11-12');
INSERT INTO gjw_comment VALUES(NULL,6,30,'收藏系列','img/comment/comment1.png',5,'2018-11-12');

/*用户信息*/
INSERT INTO gjw_user VALUES(NULL,'cqy','123456','cqy@qq.com','15210105833','img/avatar/default.png','陈秋羽',0);
INSERT INTO gjw_user VALUES(NULL,'fwl','654321','fwl@qq.com','18201095255','img/avatar/default.png','冯万礼',1);
INSERT INTO gjw_user VALUES(NULL,'lhy','111111','lhy@qq.com','13111111111','img/avatar/default.png','刘海燕',0);
INSERT INTO gjw_user VALUES(NULL,'qyj','121212','qyj@qq.com','18611111111','img/avatar/default.png','秦雨洁',0);
INSERT INTO gjw_user VALUES(NULL,'czh','111111','czh@qq.com','15211111222','img/avatar/default.png','陈泽昊',1);
INSERT INTO gjw_user VALUES(NULL,'mq','555555','mq@qq.com','13444445556','img/avatar/default.png','梦乔',0);

/*首页轮播广告商品*/
INSERT INTO gjw_index_carousel VALUES(NULL,'img/banner1.jpg','轮播广告商品1','');
INSERT INTO gjw_index_carousel VALUES(NULL,'img/banner2.jpg','轮播广告商品2','');
INSERT INTO gjw_index_carousel VALUES(NULL,'img/banner3.jpg','轮播广告商品3','');
INSERT INTO gjw_index_carousel VALUES(NULL,'img/banner4.jpg','轮播广告商品4','');
INSERT INTO gjw_index_carousel VALUES(NULL,'img/banner5.jpg','轮播广告商品4','');
INSERT INTO gjw_index_carousel VALUES(NULL,'img/banner6.jpg','轮播广告商品4','');

/*商品类型表 gjw_laptop_family*/
INSERT INTO gjw_laptop_family VALUES(NULL,'白酒');
INSERT INTO gjw_laptop_family VALUES(NULL,'葡萄酒');
INSERT INTO gjw_laptop_family VALUES(NULL,'洋酒');
INSERT INTO gjw_laptop_family VALUES(NULL,'黄酒');
INSERT INTO gjw_laptop_family VALUES(NULL,'清酒');
INSERT INTO gjw_laptop_family VALUES(NULL,'啤酒');

/*商品类别详细表gjw_laptop_family_detail*/
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'茅台',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'五粮液',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'剑南春',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'汾酒',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'郎酒',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'古井贡酒',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'舍得',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'酒鬼',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'习酒',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'董酒',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'珍酒',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'水井坊',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'西凤',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'杜康',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'四特',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'金门高粱酒',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'泸州老窖',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'全兴',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'国台',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'小糊涂仙',1);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'奔富',2);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'拉菲',2);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'中级庄',2);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'黄尾袋鼠',2);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'列级庄',2);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'红魔鬼',2);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'王朝',2);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'长城',2);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'张裕',2);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'法比纳古堡',2);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'杰克丹尼',3);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'人头马',3);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'马爹利',3);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'轩尼诗',3);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'芝华士',3);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'帝摩',3);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'尊尼获加',3);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'格兰菲迪',3);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'百龄坛',3);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'三得利',3);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'同里红',4);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'塔牌',4);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'沙洲优黄',4);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'会稽山',4);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'古越龙山',4);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'女儿红',4);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'菊正宗',5);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'日本盛',5);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'天下平和鬼',5);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'一本义',5);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'福佳',6);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'科罗娜',6);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'1664',6);
INSERT INTO gjw_laptop_family_detail VALUES(NULL,'督威',6);

/*商品表 gjw_laptop*/
INSERT INTO gjw_laptop VALUES(null,1,'6902952880294','53度 茅台 飞天带杯（ 2019年产 ）500ml','茅台飞天 自营保真',2530,'购酒特惠','茅台','500ml','50度以上','每购买2瓶，即赠送原厂手提袋1个','酱香型','1*6','双瓶','img/product/d_bj_1_1.jpg,img/product/d_bj_1_2.jpg,img/product/d_bj_1_3.jpg,img/product/d_bj_1_4.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,1,'6901382103355','52度 五粮液（第七代） 500ml','.',1199,'购酒特惠','五粮液','500ml','50度以上','每购买2瓶，即赠送原厂手提袋1个','浓香型','1*6','单瓶','img/product/d_bj_2_1.jpg,img/product/d_bj_2_2.jpg,img/product/d_bj_2_3.jpg,img/product/d_bj_2_4.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,1,'6901434382882','52度 剑南春 500ml','唐时宫廷酒 盛世剑南春',429,'购酒特惠','剑南春','500ml','50度以上','每购买2瓶，即赠送原厂手提袋1个','浓香型','其他','单瓶','img/product/d_bj_3_1.jpg,img/product/d_bj_3_2.jpg,img/product/d_bj_3_3.jpg,img/product/d_bj_3_4.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,1,'6901798104595','52度 国窖1573 500ml','.',1099,'购酒特惠','泸州老窖','500ml','50度以上','每购买2瓶，即赠送原厂手提袋1个','浓香型','1*6','单瓶','img/product/d_bj_4_1.jpg,img/product/d_bj_4_2.jpg,img/product/d_bj_4_3.jpg,img/product/d_bj_4_4.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,1,'6901676527355','52度 水井坊 臻酿八號 （臻酿八号） 500ml','（只有购酒网会员 才能买到超低的会员价 会员可以去看看）',378,'购酒特惠','水井坊','500ml','50度以上','每购买2瓶，即赠送原厂手提袋1个','浓香型','1*6','单瓶','img/product/d_bj_5_1.jpg,img/product/d_bj_5_2.jpg,img/product/d_bj_5_3.jpg,img/product/d_bj_5_4.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,1,'6901683800045','53度 郎酒 10年 红花郎 500ml','神采飞扬 酱香典范..',358,'限时抢购','郎酒','500ml','50度以上','每购买2瓶，即赠送原厂手提袋1个','酱香型','其他','单瓶','img/product/d_bj_6_1.jpg,img/product/d_bj_6_2.jpg,img/product/d_bj_6_3.jpg,img/product/d_bj_6_4.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,1,'6932599212219','52度 洋河 天之蓝 蓝色经典 480ml','.',359,'购酒特惠','洋河','500ml','50度以上','每购买2瓶，即赠送原厂手提袋1个','绵柔型','1*6','单瓶','img/product/d_bj_7_1.jpg,img/product/d_bj_7_2.jpg,img/product/d_bj_7_3.jpg,img/product/d_bj_7_4.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,1,'6903431138981','53度 汾酒 青花30年 500ml','买一送一 送老白汾酒..',888,'53度 汾酒 老白汾酒 10 475ml*1','汾酒','500ml','50度以上','无手提袋说明','清香型','1*6','单瓶','img/product/d_bj_8_2.jpg,img/product/d_bj_8_3.jpg,img/product/d_bj_8_4.jpg,img/product/d_bj_8_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,1,'6901382089666','52度 五粮液 金色 土豪金色瓶 500ml','线下团购产品，网上形象宣传',1599,'购酒特惠','五粮液','500ml','50度以上','无手提袋说明','浓香型','1*6','单瓶','img/product/d_bj_9_1.jpg,img/product/d_bj_9_2.jpg,img/product/d_bj_9_3.jpg,img/product/d_bj_9_4.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,1,'6901798810137','52度 泸州老窖 特曲 老字号 500ml','买一送一',358,'购酒特惠','泸州老窖','500ml','50度以上','无手提袋说明','浓香型','1*6','单瓶','img/product/d_bj_10_1.jpg,img/product/d_bj_10_2.jpg,img/product/d_bj_10_3.jpg,img/product/d_bj_10_4.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,2,'9310297646258','澳大利亚 奔富 洛神山庄 设拉子赤霞珠 红葡萄酒 750ml','酒友醉爱，澳洲奔富',78,'购酒特惠','奔富','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_pt_1_1.jpg,img/product/d_pt_1_2.jpg,img/product/d_pt_1_3.jpg,img/product/d_pt_1_4.jpg,img/product/d_pt_1_5.jpg,img/product/d_pt_1_6.jpg,img/product/d_pt_1_7.jpg,img/product/d_pt_1_8.jpg,img/product/d_pt_1_9.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,2,'55556666056','澳大利亚 奔富 洛神山庄 红葡萄酒 750ml*6瓶【整箱装】','澳洲佳酿 整箱218元.葡萄品种 随机发货',218,'限时抢购','奔富','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_pt_2_1.jpg,img/product/d_pt_2_2.jpg,img/product/d_pt_2_3.jpg,img/product/d_pt_2_4.jpg,img/product/d_pt_2_5.jpg,img/product/d_pt_2_6.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,2,'55556666009','法国 拉菲 传奇波尔多AOC 红葡萄酒 750ml*6瓶【整箱装】','品拉菲 享品质生活..',368,'限时抢购','奔富','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_pt_3_1.jpg,img/product/d_pt_3_2.jpg,img/product/d_pt_3_3.jpg,img/product/d_pt_3_4.jpg,img/product/d_pt_3_5.jpg,img/product/d_pt_3_6.jpg,img/product/d_pt_3_7.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,2,'3296324216105','法国 拉菲 传奇波尔多AOC 红葡萄酒 750ml',null,79,'限时抢购','奔富','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_pt_4_1.jpg,img/product/d_pt_4_2.jpg,img/product/d_pt_4_3.jpg,img/product/d_pt_4_4.jpg,img/product/d_pt_4_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,2,'9322214007400','澳大利亚 黄尾袋鼠 西拉红葡萄酒 750ml','.',59,'限时抢购','奔富','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_pt_5_1.jpg,img/product/d_pt_5_2.jpg,img/product/d_pt_5_3.jpg,img/product/d_pt_5_4.jpg,img/product/d_pt_5_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,2,'55556666014','澳大利亚 黄尾袋鼠 西拉红葡萄酒 750ml*6瓶【整箱装】','.',299,'限时抢购','奔富','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_pt_6_2.jpg,img/product/d_pt_6_3.jpg,img/product/d_pt_6_4.jpg,img/product/d_pt_6_5.jpg,img/product/d_pt_6_6.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,2,'7804320985633','智利 干露 红魔鬼 梅洛红葡萄 750ml
','.',69,'限时抢购','奔富','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_pt_7_1.jpg,img/product/d_pt_7_2.jpg,img/product/d_pt_7_3.jpg,img/product/d_pt_7_4.jpg,img/product/d_pt_7_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,2,'7804320985633','法国 法比纳古堡 朗格多克红葡萄酒750ml*2 【精美礼袋装】','.',199,'限时抢购','奔富','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_pt_8_2.jpeg,img/product/d_pt_8_3.jpg,img/product/d_pt_8_4.jpg,img/product/d_pt_8_5.jpg,img/product/d_pt_8_6.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,2,'7804320985633','法国 拉菲 尚品波尔多 红葡萄酒750ml【带ASC防伪码】','.',109,'限时抢购','奔富','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_pt_9_1.jpg,img/product/d_pt_9_2.jpg,img/product/d_pt_9_3.jpg,img/product/d_pt_9_4.jpg,img/product/d_pt_9_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,2,'7804320985633','法国 拉菲 尚品波尔多 红葡萄酒750ml【带ASC防伪码】','.',109,'限时抢购','奔富','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_pt_10_1.jpg,img/product/d_pt_10_2.jpg,img/product/d_pt_10_3.jpg,img/product/d_pt_10_4.jpg,img/product/d_pt_10_5.jpg,img/product/d_pt_10_6.jpg,img/product/d_pt_10_7.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,3,'7804320985633','英国 尊尼获加Johnnie Walker 红牌威士忌 700ml','尊尼获加 绅士之选..',99,'限时抢购','尊尼获加','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_yj_1_1.jpg,img/product/d_yj_1_2.jpg,img/product/d_yj_1_3.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,3,'7804320985633','英国 尊尼获加Johnnie Walker 黑牌威士忌黑方 700ml 带盒带码','尊尼获加 绅士之选..',188,'限时抢购','尊尼获加','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_yj_2_1.jpg,img/product/d_yj_2_2.jpg,img/product/d_yj_2_3.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,3,'7804320985633','英国 芝华士 12年威士忌 700ml','尊尼获加 绅士之选..',172,'限时抢购','尊尼获加','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_yj_3_1.jpg,img/product/d_yj_3_2.jpg,img/product/d_yj_3_3.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,3,'7804320985633','美国 杰克丹尼 NO.27金标田纳西州威士忌 700ml','尊尼获加 绅士之选..',628,'限时抢购','尊尼获加','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_yj_4_1.jpg,img/product/d_yj_4_2.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,3,'7804320985633','美国 活福 珍藏波本 威士忌 750ml','尊尼获加 绅士之选..',328,'限时抢购','尊尼获加','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_yj_5_1.jpg,img/product/d_yj_5_2.jpg,img/product/d_yj_5_3.jpg,img/product/d_yj_5_4.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,3,'7804320985633','美国 杰克丹尼 田纳西州威士忌 700ml','尊尼获加 绅士之选..',158,'限时抢购','尊尼获加','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_yj_6_1.jpg,img/product/d_yj_6_2.jpg,img/product/d_yj_6_3.jpg,img/product/d_yj_6_4.jpg,img/product/d_yj_6_5.jpg,img/product/d_yj_6_6.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,3,'7804320985633','美国 杰克丹尼 田纳西州威士忌 150周年纪念酒 700ml','尊尼获加 绅士之选..',338,'限时抢购','尊尼获加','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_yj_6_1.jpg,img/product/d_yj_6_2.jpg,img/product/d_yj_6_3.jpg,img/product/d_yj_6_4.jpg,img/product/d_yj_6_5.jpg,img/product/d_yj_6_6.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,3,'7804320985633','英国 帝摩 大摩 雪茄三桶苏格兰 单一麦芽威士忌 700ml','尊尼获加 绅士之选..',1288,'限时抢购','尊尼获加','澳大利亚','10-15度','无手提袋说明','红葡萄酒','1*6','单瓶','img/product/d_yj_6_1.jpg,img/product/d_yj_6_2.jpg,img/product/d_yj_6_3.jpg,img/product/d_yj_6_4.jpg,img/product/d_yj_6_5.jpg,img/product/d_yj_6_6.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,4,'7804320985633','同里红 清鉴黄酒 冬酿八年花雕酒 2500ml','尊尼获加 绅士之选..',98,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_hj_1_1.jpg,img/product/d_hj_1_2.jpg,img/product/d_hj_1_3.jpg,img/product/d_hj_1_4.jpg,img/product/d_hj_1_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,4,'7804320985633','同里红 清鉴黄酒 花雕八年陈 桶装 5000ml','尊尼获加 绅士之选..',39.8,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_hj_2_1.jpg,img/product/d_hj_2_2.jpg,img/product/d_hj_2_3.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,4,'7804320985633','16度 茅山 1985 500ml','尊尼获加 绅士之选..',109,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_hj_3_1.jpg,img/product/d_hj_3_2.jpg,img/product/d_hj_3_3.jpg,img/product/d_hj_3_4.jpg,img/product/d_hj_3_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,4,'7804320985633','沙洲优黄 紫金6年陈青梅黄酒 500ml*9瓶 【整箱装】','尊尼获加 绅士之选..',135,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_hj_4_1.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,4,'7804320985633','16度 茅山 公元309 500ml','尊尼获加 绅士之选..',109,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_hj_5_1.jpg,img/product/d_hj_5_2.jpg,img/product/d_hj_5_3.jpg,img/product/d_hj_5_4.jpg,img/product/d_hj_5_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,4,'7804320985633','会稽山 绍兴花雕酒 1500ml','尊尼获加 绅士之选..',39,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_hj_6_1.jpg,img/product/d_hj_6_2.jpg,img/product/d_hj_6_3.jpg,img/product/d_hj_6_4.jpg,img/product/d_hj_6_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,4,'7804320985633','会稽山 绍兴花雕酒 1500ml','尊尼获加 绅士之选..',39,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_hj_6_1.jpg,img/product/d_hj_6_2.jpg,img/product/d_hj_6_3.jpg,img/product/d_hj_6_4.jpg,img/product/d_hj_6_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,4,'7804320985633','会稽山 绍兴花雕酒 1500ml','尊尼获加 绅士之选..',39,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_hj_6_1.jpg,img/product/d_hj_6_2.jpg,img/product/d_hj_6_3.jpg,img/product/d_hj_6_4.jpg,img/product/d_hj_6_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,5,'7804320985633','15度 日本 菊正宗牌 上选清酒 1800ml','自然醇香 怡人惬意.自然醇香 怡人惬意',139,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_qj_1_1.jpg,img/product/d_qj_1_2.jpg,img/product/d_qj_1_3.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,5,'7804320985633','日本盛（特撰）本釀造1800ml','自然醇香 怡人惬意.自然醇香 怡人惬意',198,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_qj_2_1.jpg,img/product/d_qj_2_2.jpg,img/product/d_qj_2_3.jpg,img/product/d_qj_2_4.jpg,img/product/d_qj_2_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,5,'7804320985633','天下平和鬼 （鬼酒） 1800m','自然醇香 怡人惬意.自然醇香 怡人惬意',139,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_qj_3_1.jpg,img/product/d_qj_3_2.jpg,img/product/d_qj_3_3.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,5,'7804320985633','菊正宗 庆祝 本酿造1800ml','自然醇香 怡人惬意.自然醇香 怡人惬意',198,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_qj_3_1.jpg,img/product/d_qj_3_2.jpg,img/product/d_qj_3_3.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,5,'7804320985633','菊正宗 庆祝 本酿造1800ml','自然醇香 怡人惬意.自然醇香 怡人惬意',146,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_qj_5_1.jpg,img/product/d_qj_5_2.jpg,img/product/d_qj_5_3.jpg,img/product/d_qj_5_4.jpg,img/product/d_qj_5_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,5,'7804320985633','菊正宗 庆祝 本酿造1800ml','自然醇香 怡人惬意.自然醇香 怡人惬意',146,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_qj_5_1.jpg,img/product/d_qj_5_2.jpg,img/product/d_qj_5_3.jpg,img/product/d_qj_5_4.jpg,img/product/d_qj_5_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,5,'7804320985633','菊正宗 庆祝 本酿造1800ml','自然醇香 怡人惬意.自然醇香 怡人惬意',146,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_qj_5_1.jpg,img/product/d_qj_5_2.jpg,img/product/d_qj_5_3.jpg,img/product/d_qj_5_4.jpg,img/product/d_qj_5_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,5,'7804320985633','菊正宗 庆祝 本酿造1800ml','自然醇香 怡人惬意.自然醇香 怡人惬意',146,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_qj_5_1.jpg,img/product/d_qj_5_2.jpg,img/product/d_qj_5_3.jpg,img/product/d_qj_5_4.jpg,img/product/d_qj_5_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,5,'7804320985633','菊正宗 庆祝 本酿造1800ml','自然醇香 怡人惬意.自然醇香 怡人惬意',146,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_qj_5_1.jpg,img/product/d_qj_5_2.jpg,img/product/d_qj_5_3.jpg,img/product/d_qj_5_4.jpg,img/product/d_qj_5_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,5,'7804320985633','菊正宗 庆祝 本酿造1800ml','自然醇香 怡人惬意.自然醇香 怡人惬意',146,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_qj_5_1.jpg,img/product/d_qj_5_2.jpg,img/product/d_qj_5_3.jpg,img/product/d_qj_5_4.jpg,img/product/d_qj_5_5.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,6,'7804320985633','青岛啤酒 纯生 500ml*12【整箱装】','.',99,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_pj_1_1.jpg,img/product/d_pj_1_2.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,6,'7804320985633','青岛啤酒 冰纯 330ml*24【整箱装】','.',99,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_pj_2_1.jpg,img/product/d_pj_2_2.jpg,img/product/d_pj_2_3.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,6,'7804320985633','青岛啤酒 经典 500ml*12【整箱装】','.',88,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_pj_3_1.jpg,img/product/d_gy.jpg',null,1,true);
INSERT INTO gjw_laptop VALUES(null,6,'7804320985633','青岛 啤酒 纯生 600ml','.',7,'限时抢购','同里红','江苏','其他','无手提袋说明','黄酒','1*6','单瓶','img/product/d_pj_3_1.jpg,img/product/d_gy.jpg',null,1,true);
/*商品图片*/
INSERT INTO gjw_laptop_pic VALUES(null,1,'img/detail/bj_1.jpg','img/detail/b1-1.jpg','img/detail/b1-2.jpg','img/detail/b1-3.jpg','img/detail/b1-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,2,'img/detail/bj_2.jpg','img/detail/b2-1.jpg','img/detail/b2-2.jpg','img/detail/b2-3.jpg','img/detail/b2-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,3,'img/detail/bj_3.jpg','img/detail/b3-1.jpg','img/detail/b3-2.jpg','img/detail/b3-3.jpg','img/detail/b3-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,4,'img/detail/bj_4.jpg','img/detail/b4-1.jpg','img/detail/b4-2.jpg','img/detail/b4-3.jpg','img/detail/b4-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,5,'img/detail/bj_5.jpg','img/detail/b5-1.jpg','img/detail/b5-2.jpg','img/detail/b5-3.jpg','img/detail/b5-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,6,'img/detail/bj_6.jpg','img/detail/b6-1.jpg','img/detail/b6-2.jpg','img/detail/b6-3.jpg','img/detail/b6-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,7,'img/detail/bj_7.jpg','img/detail/b7-1.jpg','img/detail/b7-2.jpg','img/detail/b7-3.jpg','img/detail/b7-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,8,'img/detail/bj_8.jpg','img/detail/b8-1.jpg','img/detail/b8-2.jpg','img/detail/b8-3.jpg','img/detail/b8-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,9,'img/detail/bj_9.jpg','img/detail/b9-1.jpg','img/detail/b9-2.jpg','img/detail/b9-3.jpg','img/detail/b9-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,10,'img/detail/bj_10.jpg','img/detail/b10-1.jpg','img/detail/b10-2.jpg','img/detail/b10-3.jpg','img/detail/b10-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,11,'img/detail/hj_1.jpg','img/detail/h1-1.jpg','img/detail/h1-2.jpg','img/detail/h1-3.jpg','img/detail/h1-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,12,'img/detail/hj_2.jpg','img/detail/h2-1.jpg','img/detail/h2-2.jpg','img/detail/h2-3.jpg','img/detail/h2-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,13,'img/detail/hj_3.jpg','img/detail/h3-1.jpg','img/detail/h3-2.jpg','img/detail/h3-3.jpg','img/detail/h3-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,14,'img/detail/hj_4.jpg','img/detail/h4-1.jpg','img/detail/h4-2.jpg','img/detail/h4-3.jpg','img/detail/h4-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,15,'img/detail/hj_5.jpg','img/detail/h5-1.jpg','img/detail/h5-2.jpg','img/detail/h5-3.jpg','img/detail/h5-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,16,'img/detail/hj_6.jpg','img/detail/h6-1.jpg','img/detail/h6-2.jpg','img/detail/h6-3.jpg','img/detail/h6-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,17,'img/detail/hj_7.jpg','img/detail/h7-1.jpg','img/detail/h7-2.jpg','img/detail/h7-3.jpg','img/detail/h7-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,18,'img/detail/hj_8.jpg','img/detail/h8-1.jpg','img/detail/h8-2.jpg','img/detail/h8-3.jpg','img/detail/h8-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,19,'img/detail/hj_9.jpg','img/detail/h9-1.jpg','img/detail/h9-2.jpg','img/detail/h9-3.jpg','img/detail/h9-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,20,'img/detail/hj_10.jpg','img/detail/h10-1.jpg','img/detail/h10-2.jpg','img/detail/h10-3.jpg','img/detail/h10-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,21,'img/detail/yj_1.jpg','img/detail/y1-1.jpg','img/detail/y1-2.jpg','img/detail/y1-3.jpg','img/detail/y1-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,22,'img/detail/yj_2.jpg','img/detail/y2-1.jpg','img/detail/y2-2.jpg','img/detail/y2-3.jpg','img/detail/y2-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,23,'img/detail/yj_3.jpg','img/detail/y3-1.jpg','img/detail/y3-2.jpg','img/detail/y3-3.jpg','img/detail/y3-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,24,'img/detail/yj_4.jpg','img/detail/y4-1.jpg','img/detail/y4-2.jpg','','');
INSERT INTO gjw_laptop_pic VALUES(null,25,'img/detail/yj_5.jpg','img/detail/y5-1.jpg','img/detail/y5-2.jpg','img/detail/y5-3.jpg','img/detail/y5-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,26,'img/detail/yj_6.jpg','img/detail/y6-1.jpg','img/detail/y6-2.jpg','img/detail/y6-3.jpg','img/detail/y6-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,27,'img/detail/yj_7.jpg','img/detail/y7-1.jpg','img/detail/y7-2.jpg','img/detail/y7-3.jpg','img/detail/y7-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,28,'img/detail/yj_8.jpg','img/detail/y8-1.jpg','','','');
INSERT INTO gjw_laptop_pic VALUES(null,29,'img/detail/ha_1.jpg','img/detail/ha1-1.jpg','img/detail/ha1-2.jpg','img/detail/ha1-3.jpg','img/detail/ha1-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,30,'img/detail/ha_2.jpg','img/detail/ha2-1.jpg','img/detail/ha2-2.jpg','img/detail/ha2-3.jpg','');
INSERT INTO gjw_laptop_pic VALUES(null,31,'img/detail/ha_3.jpg','img/detail/ha3-1.jpg','img/detail/ha3-2.jpg','img/detail/ha3-3.jpg','img/detail/ha3-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,32,'img/detail/ha_4.jpg','img/detail/ha4-1.jpg','img/detail/ha4-2.jpg','img/detail/ha4-3.jpg','img/detail/ha4-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,33,'img/detail/ha_5.jpg','img/detail/ha5-1.jpg','img/detail/ha5-2.jpg','img/detail/ha5-3.jpg','img/detail/ha5-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,34,'img/detail/ha_6.jpg','img/detail/ha6-1.jpg','img/detail/ha6-2.jpg','img/detail/ha6-3.jpg','img/detail/ha6-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,35,'img/detail/ha_7.jpg','img/detail/ha7-1.jpg','img/detail/ha7-2.jpg','img/detail/ha7-3.jpg','img/detail/ha7-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,36,'img/detail/ha_8.jpg','img/detail/ha8-1.jpg','img/detail/ha8-2.jpg','img/detail/ha8-3.jpg','img/detail/ha8-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,37,'img/detail/qj_1.jpg','img/detail/qj1-1.jpg','img/detail/qj1-2.jpg','img/detail/qj1-3.jpg','img/detail/qj1-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,38,'img/detail/qj_2.jpg','img/detail/qj2-1.jpg','img/detail/qj2-2.jpg','img/detail/qj2-3.jpg','img/detail/qj2-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,39,'img/detail/qj_3.jpg','img/detail/qj3-1.jpg','img/detail/qj3-2.jpg','img/detail/qj3-3.jpg','img/detail/qj3-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,40,'img/detail/qj_4.jpg','img/detail/qj4-1.jpg','img/detail/qj4-2.jpg','img/detail/qj4-3.jpg','img/detail/qj4-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,41,'img/detail/qj_5.jpg','img/detail/qj5-1.jpg','img/detail/qj5-2.jpg','img/detail/qj5-3.jpg','img/detail/qj5-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,42,'img/detail/qj_6.jpg','img/detail/qj6-1.jpg','img/detail/qj6-2.jpg','img/detail/qj6-3.jpg','img/detail/qj6-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,43,'img/detail/qj_7.jpg','img/detail/qj7-1.jpg','img/detail/qj7-2.jpg','img/detail/qj7-3.jpg','img/detail/qj7-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,44,'img/detail/qj_8.jpg','img/detail/qj8-1.jpg','img/detail/qj8-2.jpg','img/detail/qj8-3.jpg','img/detail/qj8-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,45,'img/detail/qj_9.jpg','img/detail/qj9-1.jpg','img/detail/qj9-2.jpg','img/detail/qj9-3.jpg','img/detail/qj9-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,46,'img/detail/qj_10.jpg','img/detail/qj10-1.jpg','img/detail/qj10-2.jpg','img/detail/qj10-3.jpg','img/detail/qj10-4.jpg');
INSERT INTO gjw_laptop_pic VALUES(null,47,'img/detail/pj_1.jpg','img/detail/q1-1.jpg','','','');
INSERT INTO gjw_laptop_pic VALUES(null,48,'img/detail/pj_2.jpg','img/detail/q2-1.jpg','img/detail/q2-2.jpg','img/detail/q2-3.jpg','');
INSERT INTO gjw_laptop_pic VALUES(null,49,'img/detail/pj_3.jpg','img/detail/q3-1.jpg','img/detail/q3-2.jpg','','');
INSERT INTO gjw_laptop_pic VALUES(null,50,'img/detail/pj_4.jpg','','','','');

/*首页商品*/
INSERT INTO gjw_index_product VALUES(NULL,'53度 茅台 遵义1935酒 （ 2019年产 ）500ml','遵义会议 以酒纪念.','img/index/img1.jpg',518);
INSERT INTO gjw_index_product VALUES(NULL,'52度 五粮液 丁酉鸡年纪念酒 500ml','下单立减100...','img/index/img2.jpg',1099);
INSERT INTO gjw_index_product VALUES(NULL,'中国 长城 桑干酒庄 珍藏级 赤霞珠梅洛 红葡萄酒750ml','珍藏美酒 大放价.','img/index/img3.jpg',318);
INSERT INTO gjw_index_product VALUES(NULL,'53度 茅台 贵州大曲 己亥猪年酒 （ 2019年产 ） 2500ml','己亥猪年 生肖纪念.5天内发货','img/index/img4.jpg',1199);
INSERT INTO gjw_index_product VALUES(NULL,'53度 郎酒 2019年纪念版 500ml',NULL,'img/index/img5.jpg',258);
INSERT INTO gjw_index_product VALUES(NULL,'智利 拉菲 华诗歌 红葡萄酒 750ml*6瓶【整箱装】','整箱好酒囤起来.','img/index/img6.jpg',468);
INSERT INTO gjw_index_product VALUES(NULL,'53度 习酒 窖藏1998 500ml','买就送酱色王子酒..','img/index/img7.jpg',498);
INSERT INTO gjw_index_product VALUES(NULL,'【两瓶装】53度茅台王子丁酉鸡年酒500ml 53度茅台王子酒戊戌狗年500ml','王子生肖纪念组合.','img/index/img8.jpg',639);
INSERT INTO gjw_index_product VALUES(NULL,'52度 茅台集团 白金酒公司 白金原浆酒（VIP品鉴 精彩四礼）（ 2018年产 ）500ml*4','满199-100.正在热销，收藏送礼必备！','img/index/img9.jpg',298);
INSERT INTO gjw_index_product VALUES(NULL,'53度 茅台 蓝色迎宾酒 ( 2017年产 ) 425ml','限时抢购.','img/index/img10.jpg',88);
INSERT INTO gjw_index_product VALUES(NULL,'53度 茅台 王子传承2000 （ 2017年产 ）500ml','买一送一 送原品.','img/index/img11.jpg',375);
INSERT INTO gjw_index_product VALUES(NULL,'53度 茅台 贵州大曲酒 80年代 金酱 （ 2018年产 ）500ml','韵味悠长 一脉传承..','img/index/img12.jpg',149);
INSERT INTO gjw_index_product VALUES(NULL,'53度 茅台 高尔夫酒 绅士级 ( 2017年产 ) 500ml','韵味悠长 一脉传承..','img/index/img13.jpg',558);
INSERT INTO gjw_index_product VALUES(NULL,'43度 茅台飞天酒（带杯）（ 2019年产）500ml','低度飞天 品质依旧..','img/index/img14.jpg',899);
INSERT INTO gjw_index_product VALUES(NULL,'43度 茅台喜宴酒 中国红 （ 2019年产 ）500ml','喜宴酒 中国红..','img/index/img15.jpg',835);
INSERT INTO gjw_index_product VALUES(NULL,'53度 茅台 珍品王子酒 （ 2019年产 ）500ml','买一送一 送原品.','img/index/img16.jpg',459);
INSERT INTO gjw_index_product VALUES(NULL,'53度 茅台王子 丁酉 鸡年酒 （ 2017年产 ）500ml','丁酉鸡年 生肖纪念.','img/index/img17.jpg',379);
