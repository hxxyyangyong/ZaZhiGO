//
//  ZZGBuyStep_2_Item.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBuyStep_2_Item.h"

@implementation ZZGBuyStep_2_Item

- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:BuyersRelativeUrl_buy_step2];
}


@end
