//
//  HttpBaseItem.m
//  Tuotuo
//
//  Created by yangyong on 14-4-9.
//  Copyright (c) 2014年 gainline. All rights reserved.
//

#import "HttpBaseItem.h"
#define  D_HTTp_METHOD_GET @"GET"
#define  D_HTTp_METHOD_POST @"POST"
#define  D_HTTp_METHOD_PUT @"PUT"

@implementation HttpBaseItem

- (id)init
{
    if (self = [super init]) {
        self.httpStatusCode = [NSNumber numberWithInt:-100];
        self.method = E_Http_Method_POST;
    }
    return self;
}


- (void)serializeHTTPRequest
{
    ////------------子类必须实现--------------////
}


- (void)setSuccessCallback:(void (^) (HttpBaseItem *item))success
           failureCallback:(void (^) (HttpBaseItem *item))failure
{
    HttpSuccessCallback = [success copy];
    HttpFailureCallback = [failure copy];
}

- (void)successCallbackWithData:(HttpBaseItem *)successitem
{
//    NSLog(@"[%@ ] :%@",[successitem class],successitem.resultStrWithResponseData);
//    NSString *result = [[NSString alloc] initWithData:successitem.responseData encoding:NSUTF8StringEncoding];
    HttpSuccessCallback(successitem);
}

- (void)failureCallBackWithData:(HttpBaseItem *)failureitem
{
//    NSLog(@"[%@ ] :%@",[failureitem class],[failureitem.httpStatusCode stringValue]);
    HttpFailureCallback(failureitem);
}

- (void)setMethod:(E_Http_Method)method
{
    _method = method;
    _methodStr = [self httpMethodWith:method];
}



- (NSString  *)httpMethodWith:(E_Http_Method)method
{
    
    switch (method) {
        case E_Http_Method_GET:
            return D_HTTp_METHOD_GET;
            break;
        case E_Http_Method_POST:
            return D_HTTp_METHOD_POST;
            break;
        case E_Http_Method_PUT:
            return D_HTTp_METHOD_PUT;
            break;
        default:
        return D_HTTp_METHOD_GET;
            break;
    }
}

- (NSString *)resultStrWithResponseData
{
    if (self.responseData) {
        NSString *resultStr = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
        return resultStr;
    }
    return nil;
}

+ (NSString *)resultStrWithResponseData:(NSData *)responseData
{
    NSString *resultStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    return resultStr;
}



@end
