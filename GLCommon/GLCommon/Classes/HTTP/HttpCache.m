//
//  HttpCache.m
//  GLCommon
//
//  Created by yangyong on 14-6-16.
//  Copyright (c) 2014年 gainline. All rights reserved.
//

#import "HttpCache.h"
static HttpCache *sharedHttpCache;

@implementation HttpCache

- (id)init
{
    if (self = [super init]) {
        [Storage initialize];
        self.cachePath = [[Storage createUserStorage:@"User1"] createSubStorageWithRelativePath:@"TuoTuo3.0"];
        self.cache = [[GLDBCache alloc] initWithStorage:self.cachePath name:@"TuoTuoHttp"];
    }
    return self;
}


+ (HttpCache *)sharedHttpCache
{
    @synchronized(sharedHttpCache){
        if (sharedHttpCache == nil) {
            sharedHttpCache = [[HttpCache alloc] init];
        }
    
    }
    return sharedHttpCache;
}

@end
