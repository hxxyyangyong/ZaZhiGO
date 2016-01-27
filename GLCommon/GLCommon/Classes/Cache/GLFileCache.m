//
//  GLFileCache.m
//  GLCommon
//
//  Created by yangyong on 14-6-16.
//  Copyright (c) 2014年 gainline. All rights reserved.
//

#import "GLFileCache.h"

@interface GLFileCache () {

}

- (NSString *)fileNameForKey:(NSString *)key;
@end



@implementation GLFileCache


- (NSString *)cachePath
{
//    if (_cachePath == nil) {
    _cachePath = [StorageUtility cacheFolderCreateIfNotExistedWithPath:[self.storage libraryPathWithRelativePath:self.name]];
//    }
    return _cachePath;
}

- (BOOL)hasDataForKey:(NSString *)key
{
    NSString* filePath = [self fileNameForKey:key];
    NSFileManager* fm = [NSFileManager defaultManager];
    return [fm fileExistsAtPath:filePath];
}

- (BOOL)addData:(NSData *)data forKey:(NSString *)key
{
    NSString* filePath = [self fileNameForKey:key];
    NSFileManager* fm = [NSFileManager defaultManager];
    // Modify by Arthur
    BOOL ret = [fm createFileAtPath:filePath contents:data attributes:nil];
    if (ret) {
        [NSFileManager addSkipBackupAttributeToItemAtURL:[NSURL fileURLWithPath:filePath]];
    }
    return ret;
}

#pragma mark - private
- (NSString *)fileNameForKey:(NSString *)key
{
    return [self.cachePath stringByAppendingPathComponent:key];
}


- (BOOL)addOrUpdateString:(NSString *)string
                   forKey:(NSString *)key
{
    return  [self addOrUpdateData:[string dataUsingEncoding:NSUTF8StringEncoding] forKey:key];
}

- (BOOL)addOrUpdateData:(NSData *)data
                 forKey:(NSString *)key
{
    return [self addData:data forKey:key];
}



- (NSString *)getStringForKey:(NSString *)key
{
    NSString *string = [[NSString alloc] initWithData:[self getDataForkey:key] encoding:NSUTF8StringEncoding];
    return string;
}
- (NSData *)getDataForkey:(NSString *)key
{
    NSString* filePath = [self fileNameForKey:key];
    NSFileManager* fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:filePath]) {
        return [NSData dataWithContentsOfFile:filePath];
    }
    return nil;
}

- (BOOL)removeForKey:(NSString*)key
{
    BOOL ret = NO;
    NSString* filePath = [self fileNameForKey:key];
    NSFileManager* fm = [NSFileManager defaultManager];
    if (filePath && [fm fileExistsAtPath:filePath]) {
        ret = [fm removeItemAtPath:filePath error:nil];
    }
    return ret;
}
- (BOOL)clear
{
    BOOL ret = NO;
    NSFileManager* fm = [NSFileManager defaultManager];
    ret =  [fm removeItemAtPath:self.cachePath error:nil];
    _cachePath = nil;
    return ret;
}

- (unsigned long long)cacheSize
{
    NSString *cachePath = self.cachePath;
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:cachePath])
    {
        return 0;
    }
    NSEnumerator *childFilesEnumerator = [[fileManager subpathsAtPath:cachePath] objectEnumerator];
    NSString* fileName = nil;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [cachePath stringByAppendingPathComponent:fileName];
        folderSize += [StorageUtility fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize ? folderSize : 0;
}
@end