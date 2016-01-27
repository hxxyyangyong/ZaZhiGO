//
//  store_info.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface store_info : NSObject
@property (nonatomic, strong) NSString *store_id;     // 店铺ID
@property (nonatomic, strong) NSString *store_name;     // 店铺名称
@property (nonatomic, strong) NSString *member_id;     // 店主ID
@property (nonatomic, strong) NSString *member_name;     // 店主名称
@property (nonatomic, strong) NSString *avatar;     // 头像
@property (nonatomic, strong) NSString *goods_count;     // 店铺商品数
@property (nonatomic, strong) NSString *store_credit;     // 店铺动态评价
@end
