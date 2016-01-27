//
//  advtype.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface advtype : NSObject
@property (nonatomic, strong) NSString *keyword;  // 搜索关键字
@property (nonatomic, strong) NSString *special;  // 专题编号
@property (nonatomic, strong) NSString *goods;  // 商品编号
@property (nonatomic, strong) NSString *url;  // 地址
@end
