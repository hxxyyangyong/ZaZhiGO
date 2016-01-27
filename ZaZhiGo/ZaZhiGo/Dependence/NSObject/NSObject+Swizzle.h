//
//  NSObject+Swizzle.h
//  TCTravel_IPhone
//
//  Created by maxfong.
//
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Swizzle)

+ (void)swizzleInstanceSelector:(SEL)originalSelector
                withNewSelector:(SEL)newSelector;

@end
