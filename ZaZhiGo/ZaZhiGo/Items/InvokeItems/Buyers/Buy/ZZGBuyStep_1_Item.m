//
//  ZZGBuyStep_1_Item.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBuyStep_1_Item.h"

@implementation ZZGBuyStep_1_Item

- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:BuyersRelativeUrl_buy_step1];
}


@end
