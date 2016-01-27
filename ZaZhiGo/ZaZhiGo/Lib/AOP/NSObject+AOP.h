//
//  NSObject+AOP.h
//  ZaZhiGo
//
//  Created by 陈辉 on 16/1/13.
//  Copyright © 2016年 com.zhuocheng. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSObject (AOP)

+(void)aop_ExchangeSelector:(SEL)oldSel andNewSelector:(SEL)newSel;

@end
