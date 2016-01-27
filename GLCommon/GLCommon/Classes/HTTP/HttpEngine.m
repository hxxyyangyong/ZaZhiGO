//
//  HttpEngine.m
//  Tuotuo
//
//  Created by yangyong on 14-4-10.
//  Copyright (c) 2014年 gainline. All rights reserved.
//

#import "HttpEngine.h"
#import "GLHTTPFetcherImplAfn.h"
#import "JSONKit.h"
@implementation HttpEngine
- (id)initWithBaseUrlStr:(NSString *)url
{
    if (self = [super init])
    {
        self.baseUrl = [NSURL URLWithString:url];
        self.baseUrlString = url;
    }
    return self;
}


- (id)initWithBaseUrl:(NSURL *)url
{
    if (self = [super init]) {
        self.baseUrl = url;
    }
    return self;
}
- (id)sharedInstance
{
    return self;
}



- (NSOperation <GLHTTPFetching> *)httpFetchingWithItem:(HttpBaseItem *)item
{
    [item serializeHTTPRequest];
    self.requestUrlString = [[NSString urlcombineWithBefore:self.baseUrl.absoluteString after:self.requestItem.releativeUrlString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:self.requestUrlString];
    if (!self.requestUrlString) {
        NSAssert1(0, @"bad url string: %@", self.requestUrlString);
        return nil;
    }
    NSLog(@"--%@-requestUrlString--%@",[item class],self.requestUrlString);
    NSLog(@"--%@-parameters---%@",[item class],[item.parameters JSONString]);
    
    NSURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    NSOperation <GLHTTPFetching> *fetcher = [[GLHTTPFetcherImplAfn alloc] initWithRequest:urlRequest];
    //[GLHTTPFetcherImplAfn fetcherWithURLString:self.requestUrlString];
    fetcher.HTTPMethod = item.methodStr;
    @try {
        NSMutableDictionary *finalParameter = [NSMutableDictionary dictionary];
        if (item.needAccessToken)
        {
//            LoginInfo *loginInfo = [GLSingletonUtility sharedInstance].loginInfo;
//            NSString *sig = [self finalSigWithParameter:item.parameters];
//            [finalParameter setObject:[NSString stringWithFormat:@"%lld",loginInfo.userID] forKey:@"userInfoId"];
//            [finalParameter setObject:loginInfo.tempToken forKey:@"tempToken"];
//            [finalParameter setObject:sig forKey:@"sig"];
        }
        [finalParameter addEntriesFromDictionary:item.parameters];
        NSString *charset = (__bridge NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
        [fetcher setValue:[NSString stringWithFormat:@"application/x-www-form-urlencoded; charset=%@", charset] forHTTPHeader:@"Content-Type"];
        fetcher.HTTPBody = [AFQueryStringFromParametersWithEncoding(finalParameter, NSUTF8StringEncoding) dataUsingEncoding:NSUTF8StringEncoding];
    }
    @catch (NSException *exception) {
        NSLog(@"=====%@", exception.reason);
    }
    return fetcher;
}


- (NSOperation <GLHTTPFetching> *)httpFetchingUploadWithItem:(HttpBaseItem *)item
{
    [item serializeHTTPRequest];
    self.requestUrlString = [[NSString urlcombineWithBefore:self.baseUrl.absoluteString after:item.releativeUrlString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL *url = [NSURL URLWithString:self.requestUrlString];
    if (!self.requestUrlString) {
        NSAssert1(0, @"bad url string: %@", self.requestUrlString);
        NSLog(@"bad url string: %@", self.requestUrlString);
        return nil;
    }
//    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:fileType, @"fileType", nil];
//    NSString *parametersStr = [self _parameters:parameters needToken:YES];
//    NSMutableDictionary *parameters1 = [NSMutableDictionary dictionary];
//    NSArray *keyAndValue = nil;
//    for (NSString *keyValue in [parametersStr componentsSeparatedByString:@"&"])
//    {
//        keyAndValue = [keyValue componentsSeparatedByString:@"="];
//        [parameters1 setObject:[keyAndValue objectAtIndex:1] forKey:[keyAndValue objectAtIndex:0]];
//    }

    NSOperation <GLHTTPFetching> *fetcher = [GLHTTPFetcherImplAfn multipartRequestWithURLString:self.requestUrlString multipartData:item.uploadData parameters:item.parameters];
    fetcher.HTTPMethod = @"POST";
    return fetcher;
}




#define SECRETTOKEN @"FJWIENVNIQPO123JKJFCOSN"
- (NSString *)finalSigWithParameter:(NSDictionary *)parameters
{
//    LoginInfo *loginInfo = [GLSingletonUtility sharedInstance].loginInfo;;
//    NSMutableString *parametersStr = [NSMutableString string];
//    
//    NSMutableArray *parametersForSig = [NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%lld",loginInfo.userID], loginInfo.tempToken, SECRETTOKEN, nil];
//    for (NSString *key in [parameters allKeys]) {
//        [parametersForSig addObject:[parameters objectForKey:key]];
//        [parametersStr appendString:[NSString stringWithFormat:@"&%@=%@",key,[parameters objectForKey:key]]];
//    }
    NSMutableArray *parametersForSig = nil;
    
    return [self generateSignatureToken:parametersForSig];
}


- (NSString *)generateSignatureToken:(NSArray *)array
{
    NSMutableArray *needSortArray = [[NSMutableArray alloc] initWithCapacity:2];
    for (NSObject *obj in array) {
        if (![obj isKindOfClass:[NSString class]])
        {
            if ([obj isKindOfClass:[NSNumber class]]) {
                [needSortArray addObject:[(NSNumber *)obj stringValue]];
            }
            else
            {
                [needSortArray addObject:[obj description]];
            }
            continue;
        }
        [needSortArray addObject:obj];
    }
  //  NSLog(@"\n字符串原序：%@", needSortArray);
    NSStringCompareOptions comparisonOptions = NSLiteralSearch;
    NSComparator sort = ^(NSString *obj1,NSString *obj2){
        NSRange range = NSMakeRange(0,obj1.length);
        return [obj1 compare:obj2 options:comparisonOptions range:range];
    };
    NSArray *resultArray2 = [needSortArray sortedArrayUsingComparator:sort];
//    NSLog(@"\n字符串数组排序结果%@",resultArray2);
    
    NSMutableString *mutStr = [[NSMutableString alloc]init];
    for ( NSString *str in resultArray2)
        [mutStr appendString:str];
    
    NSString *md5Str = [MyUtils md5:mutStr];
//    NSLog(@"\n客户端生成的接口签名:%@", mutStr);
//    NSLog(@"\n客户端生成的接口签名(MD5加密):%@", md5Str);
    return md5Str;
}


- (BOOL)isPreviousHttpRequestDone:(id <GLHTTPFetching>)fetch
{
    if (fetch) {
        NSLog(@"上次请求：%@ 还没有完成。", fetch.urlString);
        return NO;
    }
    else
    {
        NSLog(@"上次请求已经完成。");
        return YES;
    }
}

- (void)invokeItem:(HttpBaseItem *)item
{
    self.requestItem = item;
    self.requestFetcher = [self httpFetchingWithItem:self.requestItem];
    if (item.cacheType ==  E_Cache_Type_CacheOrServer) {
        NSString *urlString = [NSString urlcombineWithBefore:self.baseUrl.absoluteString after:self.requestItem.releativeUrlString];
        NSString *cachekey = [self responseCacheKeyWithUrl:urlString
                                                parameters:item.parameters];
        NSLog(@"before request %@ == %@", urlString, cachekey);
        if ([[HttpCache sharedHttpCache].cache hasDataForKey:cachekey]) {
            self.requestItem.responseData = [[HttpCache sharedHttpCache].cache getDataForkey:cachekey];
            self.requestItem.httpStatusCode = [NSNumber numberWithInteger:111];
            SEL successSel = NSSelectorFromString(@"successCallbackWithData:");
            if ([self.requestItem respondsToSelector:successSel]) {
                [self.requestItem performSelector:successSel withObject:self.requestItem afterDelay:0];
            }
            _requestFetcher = nil;
            return;
        }
    }
    self.requestFetcher.delegate = self;
    _requestFetcher.finishSelector     = @selector(httpRequestFinished:);
    _requestFetcher.failSelector       = @selector(httpRequestFailed:);
    _requestFetcher.timeoutSelector    = @selector(httpRequestTimeout:);
    [_requestFetcher startAsync];
}


- (NSString *)responseCacheKeyWithUrl:(NSString *)url parameters:(NSDictionary *)parameters
{
    NSString *parametersStr = [parameters JSONString];
    NSString *cacheKey = [[NSString stringWithFormat:@"%@%@",url,parametersStr] md5Hash];    
//    if ([url rangeOfString:@"getResourcesByType"].location != NSNotFound) {
//        NSLog(@"+++=%@",url);
//        NSLog(@"========%@",parametersStr);
//        NSLog(@"$$$$$$$$%@",cacheKey);
//    }
    return cacheKey;
}


- (void)invokeUploadItem:(HttpBaseItem *)item
{
    self.requestItem = item;
    self.requestFetcher = [self httpFetchingUploadWithItem:self.requestItem];
    self.requestFetcher.delegate = self;
    _requestFetcher.finishSelector     = @selector(httpRequestFinished:);
    _requestFetcher.failSelector       = @selector(httpRequestFailed:);
    _requestFetcher.timeoutSelector    = @selector(httpRequestTimeout:);
    [_requestFetcher startAsync];
}


- (void)httpRequestFailed:(NSOperation <GLHTTPFetching>*)fetcher
{
    [self httpRquestLog:fetcher state:@"httpRequestFailed"];
    self.requestItem.httpStatusCode = [NSNumber numberWithInteger:fetcher.statusCode];
//    [self.requestItem failureCallBackWithData:self.requestItem];
    SEL failureSel = NSSelectorFromString(@"failureCallBackWithData:");
    if ([self.requestItem respondsToSelector:failureSel]) {
        [self.requestItem performSelector:failureSel withObject:self.requestItem afterDelay:0];
    }
    [self clearFetcher:fetcher];
}


- (void)httpRequestTimeout:(NSOperation <GLHTTPFetching>*)fetcher
{
   
    
    [self httpRquestLog:fetcher state:@"httpRequestFailed"];
    self.requestItem.httpStatusCode = [NSNumber numberWithInteger:fetcher.statusCode];
//    [self.requestItem failureCallBackWithData:_requestItem];
    SEL failureSel = NSSelectorFromString(@"failureCallBackWithData:");
    if ([self.requestItem respondsToSelector:failureSel]) {
        [self.requestItem performSelector:failureSel withObject:self.requestItem afterDelay:0];
    }
    [self clearFetcher:fetcher];
}


- (void)clearFetcher:(NSOperation <GLHTTPFetching>*)fetcher
{
    if (fetcher == _requestFetcher)
        _requestFetcher = nil;
}

- (void)httpRquestLog:(NSOperation <GLHTTPFetching>*)fetcher state:(NSString *)state
{
//    NSLog(@"\n----http状态:%@\n----请求地址:%@\n----请求参数:%@\n----返回结果:%@", state, fetcher.urlString, [[NSString alloc] initWithData:fetcher.HTTPBody encoding:NSUTF8StringEncoding], [[NSString alloc] initWithData:fetcher.responseData encoding:NSUTF8StringEncoding]);
}


- (void)httpRequestFinished:(NSOperation <GLHTTPFetching>*)fetcher
{
    [self httpRquestLog:fetcher state:@"httpRequestFinished"];
    self.requestItem.responseData = fetcher.responseData;
    self.requestItem.httpStatusCode = [NSNumber numberWithInteger:fetcher.statusCode];
    
    NSString *urlString = [NSString urlcombineWithBefore:self.baseUrl.absoluteString after:self.requestItem.releativeUrlString];
    
    NSString *cachekey = [self responseCacheKeyWithUrl:urlString
                                            parameters:self.requestItem.parameters];
//    NSLog(@"after request %@ == %@", urlString, cachekey);
    [[HttpCache sharedHttpCache].cache addOrUpdateData:fetcher.responseData forKey:cachekey];
//    [self.requestItem successCallbackWithData:self.requestItem];
    SEL successSel = NSSelectorFromString(@"successCallbackWithData:");
    if ([self.requestItem respondsToSelector:successSel]) {
        [self.requestItem performSelector:successSel withObject:self.requestItem afterDelay:0];
    }
    _requestFetcher = nil;
}

- (NSString *)resultOfRequest:(NSOperation <GLHTTPFetching> *)fetcher
{
    [self httpRquestLog:fetcher state:@"httpRequestFinished"];
    NSString *result = [[NSString alloc] initWithData:fetcher.responseData encoding:NSUTF8StringEncoding];
    return result;
}

- (NSString *)validateResultStepOne:(NSString *)result
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"backCode" ofType:@"plist"];
    NSDictionary *mapDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return [mapDic objectForKey:result];
}

@end
