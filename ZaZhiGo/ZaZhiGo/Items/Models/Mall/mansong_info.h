//
//  mansong_info.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mansong_info : NSObject
@property (nonatomic, strong) NSString *mansong_name;     // 活动名称
@property (nonatomic, strong) NSString *start_time;     // 开始时间
@property (nonatomic, strong) NSString *end_time;     // 结束时间
@property (nonatomic, strong) NSString *price;     // 活动金额
@property (nonatomic, strong) NSString *discount;     // 减现金
@property (nonatomic, strong) NSString *mansong_goods_name;     // 赠送商品名称
@property (nonatomic, strong) NSString *goods_id;     // 赠送商品编号，goods_id为0时为无赠品
@property (nonatomic, strong) NSString *goods_image_url;     // 赠送商品图片地址
@end
