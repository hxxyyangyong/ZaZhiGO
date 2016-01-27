//
//  GLOperationQueue.m
//  Base
//
//  Created by Apple on 14-2-17.
//  Copyright (c) 2014年 Gaialine. All rights reserved.
//

#import "GLOperationQueue.h"

@implementation GLOperationQueue
static GLOperationQueue *_sharedQueue;

+ (void)initialize
{
    if (self == [GLOperationQueue class]) {
        _sharedQueue = [[self alloc] init];
        [_sharedQueue setMaxConcurrentOperationCount:NSOperationQueueDefaultMaxConcurrentOperationCount];
        [_sharedQueue setName:@"cn.gaialine.tuotuo.shared-opqueue"];
    }
}

+ (GLOperationQueue *)sharedQueue
{
    return _sharedQueue;
}

- (id)init
{
    if (self = [super init]) {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(enterBackground:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        [nc addObserver:self
               selector:@selector(enterForeground:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
    }
    return self;
}

- (void)dealloc
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self
                  name:UIApplicationDidEnterBackgroundNotification
                object:nil];
    [nc removeObserver:self
                  name:UIApplicationWillEnterForegroundNotification
                object:nil];
    
}

- (void)enterBackground:(NSNotification *)aNoti
{
    [self setSuspended:YES];
}

- (void)enterForeground:(NSNotification *)aNoti
{
    [self setSuspended:NO];
}
@end
