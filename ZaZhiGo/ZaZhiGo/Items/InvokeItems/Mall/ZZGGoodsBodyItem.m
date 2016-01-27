//
//  ZZGGoodsBodyItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGGoodsBodyItem.h"

@implementation ZZGGoodsBodyItem

- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:MallRelativeUrl_goods_body];
}


@end
