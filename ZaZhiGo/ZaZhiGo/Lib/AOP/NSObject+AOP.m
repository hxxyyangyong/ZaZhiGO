//
//  NSObject+AOP.m
//  ZaZhiGo
//
//  Created by 陈辉 on 16/1/13.
//  Copyright © 2016年 com.zhuocheng. All rights reserved.
//


#import "NSObject+AOP.h"
#import <objc/runtime.h>

@implementation NSObject (AOP)

+(void)aop_ExchangeSelector:(SEL)oldSel andNewSelector:(SEL)newSel
{
    Method oldMethod =  class_getInstanceMethod([self class], oldSel);
    Method newMethod  = class_getInstanceMethod([self class], newSel);
    
    //改变两个方法的具体指针指向
    method_exchangeImplementations(oldMethod, newMethod);
}

@end
