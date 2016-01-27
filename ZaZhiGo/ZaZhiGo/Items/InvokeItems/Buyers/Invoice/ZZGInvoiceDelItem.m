//
//  ZZGInvoiceDelItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGInvoiceDelItem.h"

@implementation ZZGInvoiceDelItem

- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:BuyersRelativeUrl_invoice_del];
}
@end
