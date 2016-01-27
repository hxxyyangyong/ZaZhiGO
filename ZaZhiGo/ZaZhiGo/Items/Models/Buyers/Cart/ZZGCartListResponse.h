//
//  ZZGCartListResponse.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBaseResponse.h"
#import "cart_list.h"
@interface ZZGCartListResponse : ZZGBaseResponse

@property (nonatomic, strong) NSMutableArray *cart_list;
@property (nonatomic, strong) NSString       *sum; //购物车总价

@end
