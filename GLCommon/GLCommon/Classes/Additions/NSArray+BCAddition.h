//
//  NSArray+BCAddition.h
//  BCCoreLibrary
//
//  Created by Ji Will on 11/26/12.
//  Copyright (c) 2012 iBrand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "NSObject+BCAddition.h"

@interface NSArray (BCAddition)

- (BOOL)isEmpty;

// get
//- (id)firstObject;

- (NSString *)stringAtIndex:(NSUInteger)index;
- (NSNumber *)numberAtIndex:(NSUInteger)index;
- (NSDictionary *)dictionaryAtIndex:(NSUInteger)index;
- (NSMutableDictionary *)mutableDictionaryAtIndex:(NSUInteger)index;
- (NSArray *)arrayAtIndex:(NSUInteger)index;
- (NSMutableArray *)mutableArrayAtIndex:(NSUInteger)index;

- (CGFloat)floatAtIndex:(NSUInteger)index;
- (double)doubleAtIndex:(NSUInteger)index;
- (NSInteger)integerAtIndex:(NSUInteger)index;
- (NSUInteger)uIntegerAtIndex:(NSUInteger)index;
- (long long)longLongAtIndex:(NSUInteger)index;
- (BOOL)BOOLAtIndex:(NSUInteger)index;

// stack
- (NSArray *)head:(NSUInteger)count;
- (NSArray *)tail:(NSUInteger)count;

@end
