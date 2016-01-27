//
//  ZZGOrderListResponse.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBaseResponse.h"
#import "order_group_list.h"
@interface ZZGOrderListResponse : ZZGBaseResponse
@property (nonatomic, strong) NSMutableArray *order_group_list;

@end
