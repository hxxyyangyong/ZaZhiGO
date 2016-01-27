//
//  UIView+Helper.m
//  OBDClient
//
//  Created by Holyen Zou on 13-5-2.
//  Copyright (c) 2013年 AnyData.com. All rights reserved.
//

#import "UIView+Helper.h"

@implementation UIView (Helper)

- (void)resizeTo:(CGSize)newSize
{
    CGPoint center = self.center;
    CGRect frame = self.frame;
    frame.size = newSize;
    self.frame = frame;
    self.center = center;
}

- (void)resizeTo:(CGSize)newSize onEdge:(CGRectEdge)edge
{
    CGRect frame = self.frame;
    CGPoint origin = frame.origin;
    CGSize size = frame.size;
    
    [self resizeTo:newSize];
    
    switch (edge) {
        case CGRectMinXEdge:
            frame = self.frame;
            frame.origin.x = origin.x;
            break;
            
        case CGRectMinYEdge:
            frame = self.frame;
            frame.origin.y = origin.y;
            break;
            
        case CGRectMaxXEdge:
            frame = self.frame;
            origin = frame.origin;
            origin.x += (size.width - frame.size.width) / 2;
            frame.origin = origin;
            break;
            
        case CGRectMaxYEdge:
            frame = self.frame;
            origin = frame.origin;
            origin.y += (size.height - frame.size.height) / 2;
            frame.origin = origin;
            break;
            
        default:
            NSAssert(0, @"invalid CGRectEdge value");
            return;
    }
    
    self.frame = frame;
}

+ (void)borderView:(UIView *)view borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius
{
    if (view.layer.cornerRadius == cornerRadius && cornerRadius != 0)
        return;

//    view.layer.borderColor = [UIColor clearColor].CGColor;
//    view.layer.borderWidth = 0;
    view.layer.cornerRadius = cornerRadius;
//    view.layer.allowsEdgeAntialiasing = YES;
//    view.layer.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
    view.layer.masksToBounds = YES;
//    [view.layer setShouldRasterize:YES];
    
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = cornerRadius;
    CALayer *imageLayer = [CALayer layer];
    
    CGRect rect = view.layer.bounds;
    rect.size.width += 4;
    rect.size.height += 4;
    rect.origin.x = -2;
    rect.origin.y = -2;
    imageLayer.frame = rect;
    imageLayer.cornerRadius = cornerRadius + 2;
    imageLayer.borderColor = borderColor.CGColor;
    imageLayer.borderWidth = borderWidth + 2;
//    imageLayer.masksToBounds = YES;
    [view.layer addSublayer:imageLayer];
}
@end
