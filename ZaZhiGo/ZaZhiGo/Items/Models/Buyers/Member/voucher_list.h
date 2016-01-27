//
//  voucher_list.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface voucher_list : NSObject
@property (nonatomic, strong) NSString *voucher_id; //代金券编号
@property (nonatomic, strong) NSString *voucher_code; // 代金券编码
@property (nonatomic, strong) NSString *voucher_title; // 代金券标题
@property (nonatomic, strong) NSString *voucher_desc; // 代金券描述
@property (nonatomic, strong) NSString *voucher_start_date; // 代金券开始时间
@property (nonatomic, strong) NSString *voucher_end_date; // 代金券过期时间
@property (nonatomic, strong) NSString *voucher_price; // 代金券面额
@property (nonatomic, strong) NSString *voucher_limit; // 代金券使用限额
@property (nonatomic, strong) NSString *voucher_state; // 代金券状态编号
@property (nonatomic, strong) NSString *voucher_order_id; // 使用代金券的订单编号
@property (nonatomic, strong) NSString *voucher_store_id; // 店铺编号
@property (nonatomic, strong) NSString *store_name; // 店铺名称
@property (nonatomic, strong) NSString *store_id; // 店铺编号
@property (nonatomic, strong) NSString *store_domain; // 店铺域名
@property (nonatomic, strong) NSString *voucher_t_customimg; // 代金券图片
@property (nonatomic, strong) NSString *voucher_state_text; // 代金券状态文字
@end
