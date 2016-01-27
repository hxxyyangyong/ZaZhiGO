//
//  ZZGSearchDeliverItem.m
//  
//
//  Created by yangyong on 15/12/15.
//
//

#import "ZZGSearchDeliverItem.h"

@implementation ZZGSearchDeliverItem


- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:BuyersRelativeUrl_search_deliver];
}

@end
