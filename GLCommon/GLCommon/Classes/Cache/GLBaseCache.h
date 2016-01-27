//
//  GLBaseCache.h
//  GLCommon
//
//  Created by yangyong on 14-5-23.
//  Copyright (c) 2014年 gainline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Storage.h"
//typedef enum e_cache_type{
//    E_CacheType_DB = 1,
//    E_CacheType_FileSystem = 2,
//    E_CacheType_Memory = 3
//}E_CacheType;


@interface GLBaseCache : NSObject


@property (nonatomic, strong) NSString  *name;
@property (nonatomic, strong) NSString  *suffix;
@property (nonatomic, strong) Storage   *storage;


- (id)initWithStorage:(Storage *)storage
                 name:(NSString *)name;


- (BOOL)hasDataForKey:(NSString *)key;

- (BOOL)addOrUpdateString:(NSString *)string
                   forKey:(NSString *)key;

- (BOOL)addOrUpdateData:(NSData *)data
                 forKey:(NSString *)key;

- (NSString *)getStringForKey:(NSString *)key;
- (NSData *)getDataForkey:(NSString *)key;

- (BOOL)removeForKey:(NSString*)key;
- (BOOL)clear;
- (unsigned long long)cacheSize;


@end
