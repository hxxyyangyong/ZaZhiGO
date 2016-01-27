//
//  NSObject+BCAddition.m
//  BCCoreLibrary
//
//  Created by Ji Will on 11/26/12.
//  Copyright (c) 2012 iBrand. All rights reserved.
//

#import "NSObject+BCAddition.h"

@implementation NSObject (BCAddition)

- (BOOL)isDict
{
    return [self isKindOfClass:[NSDictionary class]];
}

- (BOOL)isArray
{
    return [self isKindOfClass:[NSArray class]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3
{
    NSMethodSignature *sig = [self methodSignatureForSelector:selector];
    if (sig) {
        NSInvocation* invo = [NSInvocation invocationWithMethodSignature:sig];
        [invo setTarget:self];
        [invo setSelector:selector];
        [invo setArgument:&p1 atIndex:2];
        [invo setArgument:&p2 atIndex:3];
        [invo setArgument:&p3 atIndex:4];
        [invo invoke];
        if (sig.methodReturnLength) {
            id anObject;
            [invo getReturnValue:&anObject];
            return anObject;
            
        } else {
            return nil;
        }
        
    } else {
        return nil;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3
           withObject:(id)p4
{
    NSMethodSignature *sig = [self methodSignatureForSelector:selector];
    if (sig) {
        NSInvocation* invo = [NSInvocation invocationWithMethodSignature:sig];
        [invo setTarget:self];
        [invo setSelector:selector];
        [invo setArgument:&p1 atIndex:2];
        [invo setArgument:&p2 atIndex:3];
        [invo setArgument:&p3 atIndex:4];
        [invo setArgument:&p4 atIndex:5];
        [invo invoke];
        if (sig.methodReturnLength) {
            id anObject;
            [invo getReturnValue:&anObject];
            return anObject;
            
        } else {
            return nil;
        }
        
    } else {
        return nil;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3
           withObject:(id)p4 withObject:(id)p5
{
    NSMethodSignature *sig = [self methodSignatureForSelector:selector];
    if (sig) {
        NSInvocation* invo = [NSInvocation invocationWithMethodSignature:sig];
        [invo setTarget:self];
        [invo setSelector:selector];
        [invo setArgument:&p1 atIndex:2];
        [invo setArgument:&p2 atIndex:3];
        [invo setArgument:&p3 atIndex:4];
        [invo setArgument:&p4 atIndex:5];
        [invo setArgument:&p5 atIndex:6];
        [invo invoke];
        if (sig.methodReturnLength) {
            id anObject;
            [invo getReturnValue:&anObject];
            return anObject;
            
        } else {
            return nil;
        }
        
    } else {
        return nil;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3
           withObject:(id)p4 withObject:(id)p5 withObject:(id)p6
{
    NSMethodSignature *sig = [self methodSignatureForSelector:selector];
    if (sig) {
        NSInvocation* invo = [NSInvocation invocationWithMethodSignature:sig];
        [invo setTarget:self];
        [invo setSelector:selector];
        [invo setArgument:&p1 atIndex:2];
        [invo setArgument:&p2 atIndex:3];
        [invo setArgument:&p3 atIndex:4];
        [invo setArgument:&p4 atIndex:5];
        [invo setArgument:&p5 atIndex:6];
        [invo setArgument:&p6 atIndex:7];
        [invo invoke];
        if (sig.methodReturnLength) {
            id anObject;
            [invo getReturnValue:&anObject];
            return anObject;
            
        } else {
            return nil;
        }
        
    } else {
        return nil;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3
           withObject:(id)p4 withObject:(id)p5 withObject:(id)p6 withObject:(id)p7
{
    NSMethodSignature *sig = [self methodSignatureForSelector:selector];
    if (sig) {
        NSInvocation* invo = [NSInvocation invocationWithMethodSignature:sig];
        [invo setTarget:self];
        [invo setSelector:selector];
        [invo setArgument:&p1 atIndex:2];
        [invo setArgument:&p2 atIndex:3];
        [invo setArgument:&p3 atIndex:4];
        [invo setArgument:&p4 atIndex:5];
        [invo setArgument:&p5 atIndex:6];
        [invo setArgument:&p6 atIndex:7];
        [invo setArgument:&p7 atIndex:8];
        [invo invoke];
        if (sig.methodReturnLength) {
            id anObject;
            [invo getReturnValue:&anObject];
            return anObject;
            
        } else {
            return nil;
        }
        
    } else {
        return nil;
    }
}

@end
