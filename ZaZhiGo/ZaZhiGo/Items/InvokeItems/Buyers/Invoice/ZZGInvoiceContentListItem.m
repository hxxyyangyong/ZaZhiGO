//
//  ZZGInvoiceContentListItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGInvoiceContentListItem.h"

@implementation ZZGInvoiceContentListItem
- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:BuyersRelativeUrl_invoice_content_list];
}
@end
