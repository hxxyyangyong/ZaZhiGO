//
//  Storage.h
//  Common
//
//  Created by yongyang on 13-12-12.
//  Copyright (c) 2013年 yipinapp.ibrand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StorageUtility.h"
#import "NSString+BCAddition.h"
#import "NSFileManager+BRAddition.h"
@interface Storage : NSObject

@property (nonatomic, strong) NSString  *libraryStorageRoot;


- (NSString *)libraryPathWithRelativePath:(NSString  *)relativepath;
- (Storage *)createSubStorageWithRelativePath:(NSString *)relativePath;

- (id)initStorageWithlibraryRoot:(NSString *)libraryRoot;


+(BOOL)initialize;
+(Storage *)sharedAppStorage;
+(Storage *)sharedCurrentCorporationStorage;
+(Storage *)sharedCurrentUserStorage;

+(void)setCurrentCorporationStorage:(Storage *)corporationStorage;
+(void)setCurrentUserStorage:(Storage *)userStorage;

+(Storage *)createCorporationStorage:(NSString *)corporationId;
+(Storage *)createUserStorage:(NSString *)userId;

+ (Storage *) setupCurrentUserStorage: (NSString *) useId;

//
//@property (nonatomic, strong) NSString  *path;
//- (id)initLibraryStorageWithRelativePath:(NSString *)relativePath;
//+ (Storage *)createStorageWithPath:(NSString *)path;
//- (Storage *)createSubStorageWithSubPath:(NSString *)subPath;
//- (Storage *)appendSubStorageWithSubPath:(NSString *)subPath;
//

@end
