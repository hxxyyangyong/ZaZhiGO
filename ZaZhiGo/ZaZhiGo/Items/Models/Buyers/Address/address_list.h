//
//  address_list.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface address_list : NSObject

@property (nonatomic, strong) NSString *city_id;    // 城市编号
@property (nonatomic, strong) NSString *area_id;    // 地区编号
@property (nonatomic, strong) NSString *area_info;    // 地址
@property (nonatomic, strong) NSString *address;    // 详细地址
@property (nonatomic, strong) NSString *tel_phone;    // 固定电话机
@property (nonatomic, strong) NSString *mob_phone;    // 手机

@end
