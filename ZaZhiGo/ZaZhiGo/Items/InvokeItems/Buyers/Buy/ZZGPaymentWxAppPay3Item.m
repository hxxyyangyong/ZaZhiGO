//
//  ZZGPaymentWxAppPay3Item.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGPaymentWxAppPay3Item.h"

@implementation ZZGPaymentWxAppPay3Item

- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:BuyersRelativeUrl_payment_wx_app_pay3];
}


@end
