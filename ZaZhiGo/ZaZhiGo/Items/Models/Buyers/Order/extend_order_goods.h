//
//  extend_order_goods.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface extend_order_goods : NSObject
@property (nonatomic, strong) NSString *goods_name;   // 商品名称
@property (nonatomic, strong) NSString *goods_price;   // 商品价格
@property (nonatomic, strong) NSString *goods_num;   // 商品购买数量
@property (nonatomic, strong) NSString *goods_image_url;   // 商品图片地址
@end
