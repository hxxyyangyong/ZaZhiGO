//
//  ZZGInvoiceListItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGInvoiceListItem.h"

@implementation ZZGInvoiceListItem
- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:BuyersRelativeUrl_invoice_list];
}
@end
