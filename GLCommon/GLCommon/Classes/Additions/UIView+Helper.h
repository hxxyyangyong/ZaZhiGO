//
//  UIView+Helper.h
//  OBDClient
//
//  Created by Holyen Zou on 13-5-2.
//  Copyright (c) 2013年 AnyData.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GLViewDelegate <NSObject>

- (void)pageJump;
- (void)pageJump:(UIViewController *)viewController selfObject:(UIView *)selfObject;
@end

@interface UIView (Helper)

- (void)resizeTo:(CGSize)newSize;
- (void)resizeTo:(CGSize)newSize onEdge:(CGRectEdge)edge;
+ (void)borderView:(UIView *)view borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius;
@end
