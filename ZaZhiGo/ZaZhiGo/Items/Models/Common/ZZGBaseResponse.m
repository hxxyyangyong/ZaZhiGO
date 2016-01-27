//
//  ZZGBaseResponse.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBaseResponse.h"
#import <GLCommon/GLCommon.h>
#import <objc/runtime.h>
#import "NSObject+Action.h"
@interface ZZGBaseResponse()
@property (nonatomic, strong) NSDictionary *dict;
@end
@implementation ZZGBaseResponse

- (id)initWithDict:(id)dict className:(NSString *)classname
{
    self = [super initWithDict:dict className:classname];
    self.dict = dict;
    return self;
}


- (NSDictionary *)getDictValue
{
    return _dict;
}
@end
