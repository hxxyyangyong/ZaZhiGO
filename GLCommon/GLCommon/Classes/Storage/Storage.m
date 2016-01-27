//
//  Storage.m
//  Common
//
//  Created by yongyang on 13-12-12.
//  Copyright (c) 2013年 yipinapp.ibrand. All rights reserved.
//


#import "Storage.h"

@interface Storage()
- (id)initStorageWithlibraryRoot:(NSString *)libraryRoot;
@end


static NSString  *libraryRootPath;
static Storage   *appStorage;
static Storage   *currentOtherStorage;
static Storage   *currentUserStorage;

@implementation Storage

//- (id)initWithRootPath:(NSString *)rootPath
//{
//    if (self = [super init]) {
//        if (rootPath.length > 0) {
//            self.rootPath = rootPath;
//        }else{
//            self.rootPath = [NSString pathForLibraryResource:nil];;
//        }
//    }
//    return self;
//}
//
//
//- (id)initWithLibraryRelativePath:(NSString  *)relativepath
//{
//    
//    self = [super init];
//    if (self) {
//        //library的根目录
//        NSString *libraryRoot = [NSString pathForLibraryResource:nil];
//        NSString *relativePath = [StorageUtility combinePath1:libraryRoot path2:relativepath];
//        NSFileManager *fm = [NSFileManager defaultManager];
//        if (![fm fileExistsAtPath:relativePath]) {
//            [fm createDirectoryAtPath:relativePath withIntermediateDirectories:YES attributes:nil error:nil];
//        }
//    }
//    return self;
//}



- (id)initStorageWithlibraryRoot:(NSString *)libraryRoot
{
    self = [super init];
    if (self) {
        _libraryStorageRoot = libraryRoot;
        NSFileManager *fm = [NSFileManager defaultManager];
        if (![fm fileExistsAtPath:_libraryStorageRoot]) {
            [fm createDirectoryAtPath:_libraryStorageRoot withIntermediateDirectories:YES attributes:nil error:nil];
        }
    }
    return self;
}

- (NSString *)libraryPathWithRelativePath:(NSString  *)relativepath
{
    NSString *retPath = nil;
    retPath = [StorageUtility combinePath1:_libraryStorageRoot path2:relativepath];
    return retPath;
}

- (Storage *)createSubStorageWithRelativePath:(NSString *)relativePath
{
    Storage *subStorage = [[Storage alloc] initStorageWithlibraryRoot:[StorageUtility combinePath1:_libraryStorageRoot path2:relativePath]];
    return subStorage;
}


+(BOOL)initialize
{
    libraryRootPath = [NSString pathForLibraryResource:nil];
    appStorage = [[Storage alloc] initStorageWithlibraryRoot:[StorageUtility combinePath1:libraryRootPath path2:@"AppStorage"]];
    return NO;
}


+(Storage *)sharedAppStorage
{
    return appStorage;
}

+(Storage *)sharedCurrentOtherStorage
{
    return currentOtherStorage;
}

+(Storage *)sharedCurrentUserStorage
{
    return currentUserStorage;
}

+(void)setAppStorage:(Storage *)storage
{
    if (appStorage) {
        appStorage = nil;
    }
    appStorage = storage;
}

+(void)setCurrentOtherStorage:(Storage *)OtherStorage
{
    if (currentOtherStorage) {
        currentOtherStorage = nil;
    }
    currentOtherStorage = OtherStorage;
}

+(void)setCurrentUserStorage:(Storage *)userStorage
{
    if (currentUserStorage) {
        currentUserStorage = nil;
    }
    currentUserStorage = userStorage;
}


+(Storage *)createOtherStorage:(NSString *)OtherId
{
    NSString *OtherIdString = [NSString stringWithFormat:@"Cor/%@",OtherId];
    Storage *retStorage = [[Storage alloc] initStorageWithlibraryRoot:
                           [StorageUtility combinePath1:libraryRootPath path2:OtherIdString]];
    return retStorage;
}

+(Storage *)createUserStorage:(NSString *)userId
{
    NSString *userIdString = [NSString stringWithFormat:@"Usr/%@",userId];
    Storage *retStorage = [[Storage alloc] initStorageWithlibraryRoot:
                           [StorageUtility combinePath1:libraryRootPath path2:userIdString]];
    return retStorage;
}

+ (Storage *) setupCurrentUserStorage: (NSString *) useId
{
    if (useId)
    {
        currentUserStorage = nil;
        
        Storage *storage = [self createUserStorage:useId];
        [self setCurrentUserStorage: storage];
    }
    return [self sharedCurrentUserStorage];
}


/*---------


//- (id)init
//{
//    if (self = [super init]) {
//        self.path = [NSString pathForLibraryResource:nil];
//    }
//    return self;
//}

- (id)initLibraryStorageWithRelativePath:(NSString *)relativePath
{
    if (self = [super init]){
        if (self.path.length <= 0) {
            self.path = [NSString pathForLibraryResource:nil];
        }
        self.path = [StorageUtility combinePath1:self.path path2:relativePath];
        NSFileManager *fm = [NSFileManager defaultManager];
        if (![fm fileExistsAtPath:self.path ]) {
            [fm createDirectoryAtPath:self.path  withIntermediateDirectories:YES attributes:nil error:nil];
        }
    }
    return self;
}


+ (Storage *)createStorageWithPath:(NSString *)path
{
    Storage *retStorage = [[Storage alloc] init];
    retStorage.path = path;
    NSFileManager *fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:path]) {
        [fm createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return retStorage;
}


- (Storage *)createSubStorageWithSubPath:(NSString *)subPath
{
    NSString *oldPath = nil;
    if (self.path.length > 0) {
        oldPath = self.path;
    }else{
        oldPath = [NSString pathForLibraryResource:nil];
    }
    NSString *newPath = [StorageUtility combinePath1:oldPath path2:subPath];
    Storage *ret = [Storage createStorageWithPath:newPath];
    return ret;
}

- (Storage *)appendSubStorageWithSubPath:(NSString *)subPath
{
    Storage *ret = [self initLibraryStorageWithRelativePath:subPath];
    return ret;
}

 */
@end
