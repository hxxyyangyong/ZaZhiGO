//
//  cart_list.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface cart_list : NSObject
@property (nonatomic, strong) NSString       *cart_id; // 购物车编号
@property (nonatomic, strong) NSString       *buyer_id; // 买家member_id
@property (nonatomic, strong) NSString       *store_id; // 店铺编号
@property (nonatomic, strong) NSString       *store_name; // 店铺名称
@property (nonatomic, strong) NSString       *goods_id; // 商品编号
@property (nonatomic, strong) NSString       *goods_name; // 商品名称
@property (nonatomic, strong) NSString       *goods_price; // 商品价格
@property (nonatomic, strong) NSString       *goods_num; // 购买数量
@property (nonatomic, strong) NSString       *goods_image_url; // 图片地址
@property (nonatomic, strong) NSString       *goods_sum; // 商品总价
@end
