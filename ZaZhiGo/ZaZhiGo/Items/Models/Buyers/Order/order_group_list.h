//
//  order_group_list.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface order_group_list : NSObject
@property (nonatomic, strong) NSMutableArray *order_list;   //订单列表
@property (nonatomic, strong) NSString *pay_amount;   // 支付总额，该字段存在且大于0时显示支付按钮
@property (nonatomic, strong) NSString *add_time;   // 订单提交时间
@property (nonatomic, strong) NSString *pay_sn;   // 支付编号

@end
