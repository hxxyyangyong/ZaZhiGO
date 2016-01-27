//
//  GLBaseCache.m
//  GLCommon
//
//  Created by yangyong on 14-5-23.
//  Copyright (c) 2014年 gainline. All rights reserved.
//

#import "GLBaseCache.h"

@implementation GLBaseCache

- (id)initWithStorage:(Storage *)storage
                 name:(NSString *)name
{
    
    self = [super init];
    if (self) {
        self.name = name;
        self.storage = storage;
    }
    return self;
}



@end
