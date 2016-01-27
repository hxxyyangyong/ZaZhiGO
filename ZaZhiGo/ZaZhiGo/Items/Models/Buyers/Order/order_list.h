//
//  order_list.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

//订单状态
//0-已取消
//10-未支付
//20-已支付
//30-已发货
//40-交易成功

@interface order_list : NSObject
@property (nonatomic, strong) NSString *order_id;   //订单id
@property (nonatomic, strong) NSString *order_sn;   // 订单sn
@property (nonatomic, strong) NSString *store_name;   // 店铺名称
@property (nonatomic, strong) NSString *goods_amount;   // 商品总价
@property (nonatomic, strong) NSString *order_amount;   // 订单总价
@property (nonatomic, strong) NSString *pd_amount;   // 预存款支付总价
@property (nonatomic, strong) NSString *shipping_fee;   // 运费
@property (nonatomic, strong) NSString *state_desc;   // 状态文字
@property (nonatomic, strong) NSString *payment_name;   // 支付方式文字
@property (nonatomic, strong) NSString *if_cancel;   // 是否显示取消按钮 true/false
@property (nonatomic, strong) NSString *if_receive;   // 是否显示确认收货按钮 true/false
@property (nonatomic, strong) NSString *if_lock;   // 是否显示锁定中状态 true/false
@property (nonatomic, strong) NSString *if_deliver;   // 是否显示查看物流按钮 true/false
@property (nonatomic, strong) NSMutableArray *extend_order_goods;   // 订单商品列表
@end
