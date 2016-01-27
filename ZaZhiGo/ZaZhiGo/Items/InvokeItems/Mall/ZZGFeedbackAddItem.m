//
//  ZZGFeedbackAddItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGFeedbackAddItem.h"

@implementation ZZGFeedbackAddItem
- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    [self.releativeUrlString appendFormat:MallRelativeUrl_feedback_add];
}


@end
