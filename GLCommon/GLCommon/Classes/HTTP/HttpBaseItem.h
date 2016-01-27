//
//  HttpBaseItem.h
//  Tuotuo
//
//  Created by yangyong on 14-4-9.
//  Copyright (c) 2014年 gainline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLHTTPFetching.h"
#import "MyUtils.h"
#define SYSTYPE             @"2"
#define SYSVERSION          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]




//http method
typedef enum e_http_method{
    E_Http_Method_GET = 0,
    E_Http_Method_POST = 1,
    E_Http_Method_PUT = 2
}E_Http_Method;


//cache type
typedef enum e_cache_type{
    E_Cache_Type_CacheAndServer = 0,
    E_Cache_Type_CacheOrServer = 1,
    E_Cache_Type_CacheOrServerSameOneCall = 2,
    E_Cache_Type_ServerOnly= 3,
    E_Cache_Type_CacheOnly= 4
}E_Cache_Type;


@class HttpBaseItem;
@protocol GLBaseModelDelegate <NSObject>
@optional

- (void)requestDidFinished:(NSObject *)obj;
- (void)requestDidFailed:(NSObject *)obj;
- (void)requestDidTimeout:(NSObject *)obj;

@end



@interface HttpBaseItem : NSObject
{
    void (^HttpSuccessCallback) (HttpBaseItem *item);
    void (^HttpFailureCallback) (HttpBaseItem *item);
}

@property (nonatomic, strong) NSMutableString       *releativeUrlString;
@property (nonatomic, strong) NSMutableDictionary   *parameters;
@property (nonatomic, strong) NSString              *httpMethod;
@property (nonatomic, strong) NSData                *responseData;
@property (nonatomic, strong) NSNumber              *httpStatusCode;
@property (nonatomic, strong) NSString              *methodStr;
@property (nonatomic, assign) E_Http_Method         method;
@property (nonatomic, assign) BOOL                  needAccessToken;
@property (nonatomic, assign) E_Cache_Type          cacheType;
@property (nonatomic, strong) NSData                *uploadData;


- (void)serializeHTTPRequest;

- (void)setSuccessCallback:(void (^) (HttpBaseItem *item))success
           failureCallback:(void (^) (HttpBaseItem *item))failure;

- (NSString *)resultStrWithResponseData;
+ (NSString *)resultStrWithResponseData:(NSData *)responseData;


@end
