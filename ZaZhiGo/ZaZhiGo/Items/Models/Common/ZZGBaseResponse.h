//
//  ZZGBaseResponse.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Action.h"

@interface ZZGBaseResponse : NSObject
@property (nonatomic, assign) NSInteger code;
- (NSDictionary *)getDictValue;
@end
