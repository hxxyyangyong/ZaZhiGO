//
//  StorageUtility.h
//  Common
//
//  Created by yongyang on 13-12-16.
//  Copyright (c) 2013年 yipinapp.ibrand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSFileManager+BRAddition.h"
@interface StorageUtility : NSObject

+ (NSString *)combinePath1:(NSString *)path1 path2:(NSString *)path2;
+ (NSString *)cacheFolderCreateIfNotExistedWithPath:(NSString *)path;
+ (NSString *)storageFolderCreateIfNotExistedWithPath:(NSString *)path name:(NSString *)name;
+ (unsigned long long)fileSizeAtPath:(NSString*)filePath;
@end
