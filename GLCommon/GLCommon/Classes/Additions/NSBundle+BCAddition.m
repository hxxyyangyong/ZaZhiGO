//
//  NSBundle+BCAddition.m
//  YPCommon
//
//  Created by Ji Will on 12/12/12.
//  Copyright (c) 2012 iBrand. All rights reserved.
//

#import "NSBundle+BCAddition.h"

static NSBundle* globalBundle = nil;

@implementation NSBundle (BCAddition)
///////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)setDefaultBundle:(NSBundle *)bundle
{
    globalBundle = bundle;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSBundle *)defaultBundle
{
    return (globalBundle != nil) ? globalBundle : [NSBundle mainBundle];
}
@end
