//
//  UINavigationController+AOP.h
//  ZaZhiGo
//
//  Created by 陈辉 on 16/1/13.
//  Copyright © 2016年 com.zhuocheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (AOP)



- (void)aop_pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
