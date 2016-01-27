//
//  ZZGGoodsClassByIdItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGGoodsClassByIdItem.h"

@implementation ZZGGoodsClassByIdItem


- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:MallRelativeUrl_goods_class_gcid];
}



@end
