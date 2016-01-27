//
//  ZZGCartEditQuantityItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGCartEditQuantityItem.h"

@implementation ZZGCartEditQuantityItem

- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:BuyersRelativeUrl_cart_edit_quantity];
}

@end
