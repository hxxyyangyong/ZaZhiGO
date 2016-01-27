//
//  HttpEngine.h
//  Tuotuo
//
//  Created by yangyong on 14-4-10.
//  Copyright (c) 2014年 gainline. All rights reserved.
//

#import "HttpBaseItem.h"
#import <Foundation/Foundation.h>
#import "NSString+Help.h"
#import "HttpCache.h"
#define API_WEATHER                 @"http://api.k780.com:88/"
@interface HttpEngine : NSObject<GLHTTPFetcherDelegate>
@property (nonatomic, strong) NSString  *baseUrlString;
@property (nonatomic, strong) NSURL     *baseUrl;
@property (nonatomic, strong) HttpBaseItem  *requestItem;
@property (nonatomic, strong) NSString  *requestUrlString;
@property (nonatomic, strong) NSOperation <GLHTTPFetching> *requestFetcher;

- (id)initWithBaseUrlStr:(NSString *)url;
//- (id)initWithBaseUrl:(NSURL *)url;
- (void)invokeItem:(HttpBaseItem *)item;
- (void)invokeUploadItem:(HttpBaseItem *)item;
- (id)sharedInstance;

- (NSString *)validateResultStepOne:(NSString *)result;
@end
