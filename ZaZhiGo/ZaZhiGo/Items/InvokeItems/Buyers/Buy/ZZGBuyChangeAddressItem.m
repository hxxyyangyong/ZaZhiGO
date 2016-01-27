//
//  ZZGBuyChangeAddressItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBuyChangeAddressItem.h"

@implementation ZZGBuyChangeAddressItem
- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:BuyersRelativeUrl_buy_change_address];
}

@end
