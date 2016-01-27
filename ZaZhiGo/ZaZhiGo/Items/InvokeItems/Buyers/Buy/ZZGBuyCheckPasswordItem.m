//
//  ZZGBuyCheckPasswordItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBuyCheckPasswordItem.h"

@implementation ZZGBuyCheckPasswordItem

- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:BuyersRelativeUrl_buy_check_password];
}


@end
