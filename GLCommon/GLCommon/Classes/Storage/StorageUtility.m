//
//  StorageUtility.m
//  Common
//
//  Created by yongyang on 13-12-16.
//  Copyright (c) 2013年 yipinapp.ibrand. All rights reserved.
//

#import "StorageUtility.h"

@implementation StorageUtility

+(NSString *)combinePath1:(NSString *)path1 path2:(NSString *)path2
{
    if ([path1 length] <= 0 ) {
        return path2;
    }
    if ([path2 length] <= 0) {
        return  path1;
    }
    BOOL path1EndSlash = [path1 hasSuffix:@"/"];
    BOOL path2StartSlash = [path2 hasPrefix:@"/"];
    if ((path1EndSlash && !path2StartSlash) || (!path1EndSlash && path2StartSlash)) {
        return [NSString stringWithFormat:@"%@%@",path1,path2];
    }
    
    if (path1EndSlash && path2StartSlash) {
        return [NSString stringWithFormat:@"%@%@",path1,[path2 substringFromIndex:1]];
    }
    
    return [NSString stringWithFormat:@"%@/%@",path1,path2];
}


+ (NSString *)cacheFolderCreateIfNotExistedWithPath:(NSString *)path
{
    NSString *ret = path;
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir = NO;
    if (fm && [fm fileExistsAtPath:ret isDirectory:&isDir]) {
        if (!isDir) {
            //BCLOG_D_AREA(E_LOGAREA_Cache, @"cacheFolder %@ is a File, not a Dir", ret);
            ret = nil;
        } else {
           // BCLOG_D_AREA(E_LOGAREA_Cache, @"cache folder existed: %@", ret);
        }
    } else {
        // not existed
        if (![fm createDirectoryAtPath:ret withIntermediateDirectories:YES attributes:nil error:nil])
        {
           // BCLOG_D_AREA(E_LOGAREA_Cache, @"Failed to create cache folder: %@", ret);
            ret = nil;
        } else {
           // BCLOG_D_AREA(E_LOGAREA_Cache, @"Success to create cache folder: %@", ret);
        }
    }
    return ret;
}




+ (NSString *)storageFolderCreateIfNotExistedWithPath:(NSString *)path name:(NSString *)name
{
    NSString *ret = path;
    if (ret != nil) {
        NSFileManager * fm = [NSFileManager defaultManager];
        if (![fm fileExistsAtPath:path]) {
            if (![fm createDirectoryAtPath:ret withIntermediateDirectories:YES attributes:nil error:nil])
            {
               // BCLOG_D_AREA(E_LOGAREA_Cache, @"Failed to create cache folder: %@", ret);
                ret = nil;
            } else {
               // BCLOG_D_AREA(E_LOGAREA_Cache, @"Success to create cache folder: %@", ret);
            }
        }
    }
    
    NSString *cachePath = [path stringByAppendingPathComponent:name];
    if ([NSFileManager fileExisted:cachePath createIfNot:YES]) {
        ret = cachePath;
    }
    [NSFileManager addSkipBackupAttributeToItemAtURL:[NSURL fileURLWithPath:path isDirectory:NO]];
    return ret;
}



+ (unsigned long long)fileSizeAtPath:(NSString*)filePath
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]){
        return [[fileManager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

@end
