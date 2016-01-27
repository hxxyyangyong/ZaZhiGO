//
//  HttpCache.h
//  GLCommon
//
//  Created by yangyong on 14-6-16.
//  Copyright (c) 2014年 gainline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLBaseCache.h"
#import "GLDBCache.h"
@interface HttpCache : NSObject

@property (nonatomic, strong) GLBaseCache *cache;
@property (nonatomic, strong) Storage     *cachePath;



+ (HttpCache *)sharedHttpCache;
@end
