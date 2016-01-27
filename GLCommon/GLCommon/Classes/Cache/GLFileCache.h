//
//  GLFileCache.h
//  GLCommon
//
//  Created by yangyong on 14-6-16.
//  Copyright (c) 2014年 gainline. All rights reserved.
//

#import "GLBaseCache.h"

@interface GLFileCache : GLBaseCache
{
    NSString *_cachePath;
}
//@property (nonatomic, strong) NSString *cachePath;
@property (nonatomic, strong, readonly) NSString *cachePath;
@end
