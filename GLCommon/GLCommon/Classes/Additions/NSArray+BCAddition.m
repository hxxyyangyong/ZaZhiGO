//
//  NSArray+BCAddition.m
//  BCCoreLibrary
//
//  Created by Ji Will on 11/26/12.
//  Copyright (c) 2012 iBrand. All rights reserved.
//

#import "NSArray+BCAddition.h"
#import "NSString+BCAddition.h"

@implementation NSArray (BCAddition)

- (BOOL)isEmpty
{
    return !(self.count > 0);
}

//- (id)firstObject
//{
//    id ret = nil;
//    if (!self.isEmpty) {
//        ret = [self objectAtIndex:0];
//    }
//    return ret;
//}

- (NSString *)stringAtIndex:(NSUInteger)index
{
    NSString *ret = nil;
    NSObject *obj = [self objectAtIndex:index];
    if ([obj isKindOfClass:[NSString class]]) {
        ret = (NSString *)obj;
    } else {
        //BCLOG_E_AREA(E_LOGAREA_Core, @"Expected NSString, but got %@", NSStringFromClass([obj class]));
    }
    return ret;
}

- (NSNumber *)numberAtIndex:(NSUInteger)index
{
    NSNumber *ret = nil;
    NSObject *obj = [self objectAtIndex:index];
    if ([obj isKindOfClass:[NSNumber class]]) {
        ret = (NSNumber *)obj;
    } else {
        //BCLOG_E_AREA(E_LOGAREA_Core, @"Expected NSNumber, but got %@", NSStringFromClass([obj class]));
    }
    return ret;
}

- (NSDictionary *)dictionaryAtIndex:(NSUInteger)index
{
    NSDictionary *ret = nil;
    NSObject *obj = [self objectAtIndex:index];
    if ([obj isKindOfClass:[NSDictionary class]]) {
        ret = (NSDictionary *)obj;
    } else {
        //BCLOG_E_AREA(E_LOGAREA_Core, @"Expected NSDictionart, but got %@", NSStringFromClass([obj class]));
    }
    return ret;
}

- (NSMutableDictionary *)mutableDictionaryAtIndex:(NSUInteger)index
{
    NSMutableDictionary *ret = nil;
    NSObject *obj = [self objectAtIndex:index];
    if ([obj isKindOfClass:[NSMutableDictionary class]]) {
        ret = (NSMutableDictionary *)obj;
    } else {
        //BCLOG_E_AREA(E_LOGAREA_Core, @"Expected NSMutableDictionary, but got %@", NSStringFromClass([obj class]));
    }
    return ret;
}


- (NSArray *)arrayAtIndex:(NSUInteger)index
{
    NSArray *ret = nil;
    NSObject *obj = [self objectAtIndex:index];
    if ([obj isKindOfClass:[NSArray class]]) {
        ret = (NSArray *)obj;
    } else {
        //BCLOG_E_AREA(E_LOGAREA_Core, @"Expected NSArray, but got %@", NSStringFromClass([obj class]));
    }
    return ret;
}

- (NSMutableArray *)mutableArrayAtIndex:(NSUInteger)index
{
    NSMutableArray *ret = nil;
    NSObject *obj = [self objectAtIndex:index];
    if ([obj isKindOfClass:[NSMutableArray class]]) {
        ret = (NSMutableArray *)obj;
    } else {
    //    //BCLOG_E_AREA(E_LOGAREA_Core, @"Expected NSMutableArray, but got %@", NSStringFromClass([obj class]));
    }
    return ret;
}


- (CGFloat)floatAtIndex:(NSUInteger)index
{
    CGFloat ret = 0.0;
    NSObject *obj = [self objectAtIndex:index];
    if ([obj isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)obj;
        ret = [number floatValue];
    } else if ([obj isKindOfClass:[NSString class]]) {
        NSString *string = (NSString *)obj;
        if (!string.isEmpty) {
            ret = [string floatValue];
        }
    } else {
        //BCLOG_E_AREA(E_LOGAREA_Core, @"Expected NSString/NSNumber, but got %@", NSStringFromClass([obj class]));
    }
    return ret;
}

- (double)doubleAtIndex:(NSUInteger)index
{
    double ret = 0.0;
    NSObject *obj = [self objectAtIndex:index];
    if ([obj isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)obj;
        ret = [number doubleValue];
    } else if ([obj isKindOfClass:[NSString class]]) {
        NSString *string = (NSString *)obj;
        if (!string.isEmpty) {
            ret = [string doubleValue];
        }
    } else {
        //BCLOG_E_AREA(E_LOGAREA_Core, @"Expected NSString/NSNumber, but got %@", NSStringFromClass([obj class]));
    }
    return ret;
}

- (NSInteger)integerAtIndex:(NSUInteger)index
{
    NSInteger ret = 0;
    NSObject *obj = [self objectAtIndex:index];
    if ([obj isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)obj;
        ret = [number integerValue];
    } else if ([obj isKindOfClass:[NSString class]]) {
        NSString *string = (NSString *)obj;
        if (!string.isEmpty) {
            ret = [string integerValue];
        }
    } else {
        //BCLOG_E_AREA(E_LOGAREA_Core, @"Expected NSString/NSNumber, but got %@", NSStringFromClass([obj class]));
    }
    return ret;
}

- (NSUInteger)uIntegerAtIndex:(NSUInteger)index
{
    NSUInteger ret = 0;
    NSObject *obj = [self objectAtIndex:index];
    if ([obj isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)obj;
        ret = [number unsignedIntegerValue];
    } else if ([obj isKindOfClass:[NSString class]]) {
        NSString *string = (NSString *)obj;
        if (!string.isEmpty) {
            ret = [string integerValue];
        }
    } else {
        //BCLOG_E_AREA(E_LOGAREA_Core, @"Expected NSString/NSNumber, but got %@", NSStringFromClass([obj class]));
    }
    return ret;
}

- (long long)longLongAtIndex:(NSUInteger)index
{
    long long ret = 0;
    NSObject *obj = [self objectAtIndex:index];
    if ([obj isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)obj;
        ret = [number longLongValue];
    } else if ([obj isKindOfClass:[NSString class]]) {
        NSString *string = (NSString *)obj;
        if (!string.isEmpty) {
            ret = [string longLongValue];
        }
    } else {
        //BCLOG_E_AREA(E_LOGAREA_Core, @"Expected NSString/NSNumber, but got %@", NSStringFromClass([obj class]));
    }
    return ret;
}

- (BOOL)BOOLAtIndex:(NSUInteger)index;
{
    BOOL ret = NO;
    NSObject *object = [self objectAtIndex:index];
    if ([object isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)object ;
        ret = [number boolValue];
    } else if ([object isKindOfClass:[NSString class]]) {
        NSString *number = (NSString *)object;
        ret = [number boolValue];
    } else {
        //BCLOG_E_AREA(E_LOGAREA_Core, @"Expected NSString/NSNumber, but got %@", NSStringFromClass([object class]));
    }
    return ret;
}

// stack
- (NSArray *)head:(NSUInteger)count
{
	if ( [self count] < count ) {
		return self;
	} else {
		NSMutableArray * tempFeeds = [NSMutableArray array];
		for ( NSObject * elem in self ) {
			[tempFeeds addObject:elem];
			if ( [tempFeeds count] >= count )
				break;
		}
		return tempFeeds;
	}
}

- (NSArray *)tail:(NSUInteger)count
{
	return self;
}

@end
