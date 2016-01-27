//
//  ZZGCartEditQuantityResponse.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBaseResponse.h"

@interface ZZGCartEditQuantityResponse : ZZGBaseResponse

@property (nonatomic, strong) NSString       *quantity;     // 购买数量
@property (nonatomic, strong) NSString       *goods_price;     // 商品价格
@property (nonatomic, strong) NSString       *total_price;     // 商品总价

@end
