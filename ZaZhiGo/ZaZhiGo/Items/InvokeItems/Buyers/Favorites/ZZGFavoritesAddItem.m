//
//  ZZGFavoritesAddItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGFavoritesAddItem.h"

@implementation ZZGFavoritesAddItem

- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:BuyersRelativeUrl_favorites_add];
}

@end
