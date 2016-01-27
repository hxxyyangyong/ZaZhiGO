//
//  goods_info.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface goods_info : NSObject
@property (nonatomic, strong) NSString *goods_name;     // 商品名称
@property (nonatomic, strong) NSString *goods_jingle;     // 商品说明
@property (nonatomic, strong) NSString *spec_name;     // 规格名称
@property (nonatomic, strong) NSString *spec_value;     // 规格名
@property (nonatomic, strong) NSString *goods_price;     // 商品价格
@property (nonatomic, strong) NSString *goods_marketprice;     // 商品市场价
@property (nonatomic, strong) NSString *goods_id;     // 商品编号
@property (nonatomic, strong) NSString *goods_click;     // 商品点击数
@property (nonatomic, strong) NSString *goods_commentnum;     // 商品评论数
@property (nonatomic, strong) NSString *goods_salenum;     // 商品销量
@property (nonatomic, strong) NSString *goods_spec;     // 商品规格
@property (nonatomic, strong) NSString *goods_storage;     // 商品库存
@property (nonatomic, strong) NSString *evaluation_good_star;     // 评价等级
@property (nonatomic, strong) NSString *evaluation_count;     // 评价数
@property (nonatomic, strong) NSString *promotion_type;     // 促销类型 groupbuy-团购 xianshi-限时折扣 sole-手机专享
@property (nonatomic, strong) NSString *promotion_price;     // 促销价格
@property (nonatomic, strong) NSString *upper_limit;     // 最多购买数
@property (nonatomic, strong) NSString *is_virtual;     // 是否为虚拟商品 1-是 0-否
@property (nonatomic, strong) NSString *virtual_indate;     // 虚拟商品有效期
@property (nonatomic, strong) NSString *virtual_limit;     // 虚拟商品购买上限
@property (nonatomic, strong) NSString *is_fcode;     // 是否为F码商品 1-是 0-否
@property (nonatomic, strong) NSString *is_appoint;     // 是否是预约商品 1-是 0-否
@property (nonatomic, strong) NSString *is_presell;     // 是否是预售商品 1-是 0-否
@property (nonatomic, strong) NSString *have_gift;     // 是否拥有赠品 1-是 0-否
@property (nonatomic, strong) NSString *goods_url;     // Web端商品url
@end
