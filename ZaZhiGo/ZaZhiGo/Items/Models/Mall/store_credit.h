//
//  store_credit.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface store_credit : NSObject

@property (nonatomic, strong) NSString *text;     // 评价文字
@property (nonatomic, strong) NSString *credit;     // 评价值
@property (nonatomic, strong) NSString *percent;     // 百分比
@property (nonatomic, strong) NSString *percent_class;     // 百分比样式
@property (nonatomic, strong) NSString *percent_text;     // 百分比文字
@end
