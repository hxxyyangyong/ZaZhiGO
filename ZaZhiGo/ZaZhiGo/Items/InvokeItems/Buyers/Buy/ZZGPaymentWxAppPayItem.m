//
//  ZZGPaymentWxAppPayItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGPaymentWxAppPayItem.h"

@implementation ZZGPaymentWxAppPayItem

- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:BuyersRelativeUrl_payment_wx_app_pay];
}


@end
