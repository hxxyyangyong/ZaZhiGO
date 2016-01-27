//
//  GLImageCache.m
//  GLCommon
//
//  Created by yangyong on 14-6-16.
//  Copyright (c) 2014年 gainline. All rights reserved.
//

#import "GLImageCache.h"
#import "NSString+Help.h"

static GLImageCache *sharedImageCache;

static GLFileCache *sharedCommonImageCache;
static GLFileCache *sharedUsersImageCache;
static GLFileCache *sharedOtherImageCache;

@implementation GLImageCache

//- (id)init
//{
//    if (self = [super init]) {
//        [Storage initialize];
//        self.filePath = [[Storage createUserStorage:@"User1"] createSubStorageWithRelativePath:@"TuoTuo3.0"];
//        self.fileCache = [[GLFileCache alloc] initWithStorage:self.filePath name:@"TuoTuoImage"];
//    }
//    return self;
//}
//
//
//+ (GLImageCache *)imageCache
//{
//    if (sharedImageCache == nil) {
//        sharedImageCache = [[GLImageCache alloc] init];
//    }
//    return sharedImageCache;
//}
//

+ (GLFileCache *)sharedCommonImageCache
{
    if (sharedCommonImageCache == nil) {
        Storage *commonStorage = [[Storage alloc] initStorageWithlibraryRoot:[StorageUtility combinePath1:[NSString pathForLibraryResource:nil] path2:@"Common"]];
        sharedCommonImageCache = [[GLFileCache alloc] initWithStorage:commonStorage name:@"Image"];
    }
    return sharedCommonImageCache;
}

+ (GLFileCache *)sharedUsersImageCache
{
    if (sharedUsersImageCache == nil) {
        Storage *usersStorage = [Storage createUserStorage:@"User1"];
        sharedUsersImageCache = [[GLFileCache alloc] initWithStorage:usersStorage name:@"Image"];
    }
    return sharedUsersImageCache;
}


+ (GLFileCache *)sharedOtherImageCache
{
    if (sharedOtherImageCache == nil) {
        Storage *otherStorage = [[Storage alloc] initStorageWithlibraryRoot:[StorageUtility combinePath1:[NSString pathForLibraryResource:nil] path2:@"Other"]];
        sharedOtherImageCache = [[GLFileCache alloc] initWithStorage:otherStorage name:@"Image"];
    }
    return sharedOtherImageCache;
}


+ (UIImage *)cacheImageWithCache:(GLBaseCache *)imagecache
                         imageId:(long long)imageId
                     currentSize:(CGSize )currentSize
                       smallSize:(CGSize )smallSize
                       imageType:(NSString *)imageType
                  andImageBseUrl:(NSString *)baseurl
{
    NSString *after = @"";
    after = [NSString stringWithFormat:@"%@?%@=%lld&picSize=%d",@"downloadFile",@"fileId",imageId,0,nil];
    NSString *retUrl  = [NSString urlcombineWithBefore:baseurl after:after];
    
    
    NSString  *imageCacheKey = [NSString stringWithFormat:@"%@_%d_%d%@%@",
                                [retUrl md5Hash],
                                (int)currentSize.width,
                                (int)currentSize.height,
                               (imageType.length > 0 ? @".":@""),imageType];
    if ([imagecache hasDataForKey:imageCacheKey]) {
        return [UIImage imageWithData:[imagecache getDataForkey:imageCacheKey]];
    }else{
        return nil;
    }
}





@end
