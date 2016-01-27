//
//  ZZGGoodsListResponse.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBaseResponse.h"

@interface ZZGGoodsListResponse : ZZGBaseResponse
@property (nonatomic, strong) NSString *goods_id;   //商品编号
@property (nonatomic, strong) NSString *goods_name;   // 商品名称
@property (nonatomic, strong) NSString *goods_price;   // 商品价格
@property (nonatomic, strong) NSString *goods_marketprice;   // 商品市场价
@property (nonatomic, strong) NSString *goods_salenum;   // 销量
@property (nonatomic, strong) NSString *evaluation_good_star;   // 评价星级
@property (nonatomic, strong) NSString *evaluation_count;   // 评价数
@property (nonatomic, strong) NSString *sole_flag;   // 是否手机专享
@property (nonatomic, strong) NSString *group_flag;   // 是否团购
@property (nonatomic, strong) NSString *xianshi_flag;   // 是否限时折扣
@property (nonatomic, strong) NSString *goods_image;   // 图片名称
@property (nonatomic, strong) NSString *goods_image_url;   // 图片地址
@property (nonatomic, strong) NSString *is_fcode;   // 是否为F码商品 1-是 0-否
@property (nonatomic, strong) NSString *is_appoint;   // 是否是预约商品 1-是 0-否
@property (nonatomic, strong) NSString *is_presell;   // 是否是预售商品 1-是 0-否
@property (nonatomic, strong) NSString *have_gift;   // 是否拥有赠品 1-是 0-否
@end
