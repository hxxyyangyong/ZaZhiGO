//
//  ZZGAddressEditItem.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGHttpBaseItem.h"

@interface ZZGAddressEditItem : ZZGHttpBaseItem

@property (nonatomic, strong) NSString *address_id;     // 地址编号
@property (nonatomic, strong) NSString *true_name;     // 姓名
@property (nonatomic, strong) NSString *area_id;     // 地区编号
@property (nonatomic, strong) NSString *city_id;     // 城市编号
@property (nonatomic, strong) NSString *area_info;     // 地区信息，例：天津 天津市 红桥区
@property (nonatomic, strong) NSString *address;     // 地址信息，例：水游城8层
@property (nonatomic, strong) NSString *tel_phone;     // 电话号码
@property (nonatomic, strong) NSString *mob_phone;     // 手机

@end
