//
//  GLImageCache.h
//  GLCommon
//
//  Created by yangyong on 14-6-16.
//  Copyright (c) 2014年 gainline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLFileCache.h"
#import "Storage.h"
#import "StorageUtility.h"
@interface GLImageCache : NSObject

@property (nonatomic, strong) GLFileCache *fileCache;
@property (nonatomic, strong) Storage     *filePath;


+ (GLFileCache *)sharedCommonImageCache;
+ (GLFileCache *)sharedUsersImageCache;
+ (GLFileCache *)sharedOtherImageCache;

+ (UIImage *)cacheImageWithCache:(GLBaseCache *)imagecache
                         imageId:(long long)imageId
                     currentSize:(CGSize )currentSize
                       smallSize:(CGSize )smallSize
                       imageType:(NSString *)imageType
                  andImageBseUrl:(NSString *)baseurl;
@end
