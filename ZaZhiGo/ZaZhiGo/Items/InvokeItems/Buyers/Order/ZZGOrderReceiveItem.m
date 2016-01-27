//
//  ZZGOrderReceiveItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGOrderReceiveItem.h"

@implementation ZZGOrderReceiveItem


- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:BuyersRelativeUrl_order_receive];
}

@end
