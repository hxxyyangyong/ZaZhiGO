//
//  ZZGFavoritesListItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGFavoritesListItem.h"

@implementation ZZGFavoritesListItem

- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:BuyersRelativeUrl_favorites_list];
}

@end
