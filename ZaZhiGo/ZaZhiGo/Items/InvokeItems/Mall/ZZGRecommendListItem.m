//
//  ZZGRecommendListItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGRecommendListItem.h"

@implementation ZZGRecommendListItem

- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:MallRelativeUrl_recommend_list];
}



@end
