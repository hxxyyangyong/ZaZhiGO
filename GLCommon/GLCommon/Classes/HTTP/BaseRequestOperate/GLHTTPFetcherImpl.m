//
//  GLHTTPFetcherImpl.m
//  Base
//
//  Created by Apple on 14-2-17.
//  Copyright (c) 2014年 Gaialine. All rights reserved.
//

#import "GLHTTPFetcherImpl.h"
#import "AFHTTPClient.h"
#import "GLOperationQueue.h"

@interface GLHTTPFetcherImpl ()
@property (nonatomic, retain, readonly) NSMutableURLRequest *request;
@end

@implementation GLHTTPFetcherImpl
@synthesize delegate = _delegate;
@synthesize userInfo = _userInfo;
@synthesize finishSelector = _finishSelector;
@synthesize failSelector = _failSelector;
@synthesize timeoutSelector = _timeoutSelector;

- (id)initWithRequest:(NSURLRequest *)urlRequest
{
    if (self = [super initWithRequest:urlRequest]) {
        
        _finishSelector = @selector(fetcherDidFinish:);
        _failSelector = @selector(fetcherDidFail:);
        _timeoutSelector = @selector(fetcherDidTimeout:);
        self.request.timeoutInterval = 15;
        GLHTTPFetcherImpl * __unsafe_unretained myself = self;
        
        [self setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, NSData *responseObject) {
//            NSLog(@"%@ finished", [myself description]);
            if (myself.delegate && [myself.delegate respondsToSelector:[myself finishSelector]]) {
                [myself.delegate performSelector:[myself finishSelector] withObject:myself];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (myself.delegate) {
                switch (error.code) {
                    case NSURLErrorCancelled:
//                        NSLog(@"%@ cancelled", [myself description]);
                        break;
                        
                    case NSURLErrorTimedOut:
//                        NSLog(@"%@ timeout", [myself description]);
                        if ([myself.delegate respondsToSelector:[myself timeoutSelector]]) {
                            [myself.delegate performSelector:[myself timeoutSelector] withObject:myself];
                        }
                        break;
                        
                    default:
//                        NSLog(@"%@ error: %@", [myself description], [error localizedDescription]);
                        if ([myself.delegate respondsToSelector:[myself failSelector]]) {
                            [myself.delegate performSelector:[myself failSelector] withObject:myself];
                        }
                        break;
                }
            }
        }];
    }
    
    return self;
}

+ (NSOperation <GLHTTPFetching> *)fetcherWithURLString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    if (!urlString) {
        NSAssert1(0, @"bad url string: %@", urlString);
        return nil;
    }
    NSURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    return [[[self class] alloc] initWithRequest:urlRequest];
}

+ (NSOperation <GLHTTPFetching> *)multipartRequestWithURLString:(NSString *)urlString multipartData:(NSData *)uploadData parameters:(NSDictionary *)parameters
{
    if (!urlString) {
        NSAssert1(0, @"bad url string: %@", urlString);
        return nil;
    }
    
    AFHTTPClient *client= [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:urlString]];
    NSMutableURLRequest *request = [client multipartFormRequestWithMethod:@"POST" path:@"" parameters:parameters constructingBodyWithBlock: ^(id <AFMultipartFormData>formData) {
        [formData appendPartWithFileData:uploadData name:@"file" fileName:@"file" mimeType:@"image/png"];
    }];
    
    return [[[self class] alloc] initWithRequest:request];
}

+ (NSOperationQueue *)sharedQueue
{
    return [GLOperationQueue sharedQueue];
}

- (void)dealloc
{
    _delegate = nil;
}

- (NSString *)urlString
{
    return self.request.URL.absoluteString;
}

- (NSTimeInterval)timeoutInterval
{
    return self.request.timeoutInterval;
}

- (void)setTimeoutInterval:(NSTimeInterval)timeoutInterval
{
    self.request.timeoutInterval = timeoutInterval;
}

- (NSString *)HTTPMethod
{
    return self.request.HTTPMethod;
}

- (void)setHTTPMethod:(NSString *)HTTPMethod
{
    self.request.HTTPMethod = HTTPMethod;
}

- (NSData *)HTTPBody
{
    return self.request.HTTPBody;
}

- (void)setHTTPBody:(NSData *)HTTPBody
{
    self.request.HTTPBody = HTTPBody;
}

- (NSMutableDictionary *)requestHTTPHeaders
{
    return [NSMutableDictionary dictionaryWithDictionary:[self.request allHTTPHeaderFields]];
}

- (void)setRequestHTTPHeaders:(NSMutableDictionary *)requestHTTPHeaders
{
    [self.request setAllHTTPHeaderFields:requestHTTPHeaders];
}

- (void)setValue:(NSString *)value forHTTPHeader:(NSString *)header
{
    [self.request setValue:value forHTTPHeaderField:header];
}

- (NSDictionary *)responseHTTPHeaders
{
    return [self.response allHeaderFields];
}

- (NSUInteger)statusCode
{
    return [self.response statusCode];
}

- (void)startAsync
{
    [[[self class] sharedQueue] addOperation:self];
}

- (void)cancelAndClearDelegate
{
    _delegate = nil;
    [self cancel];
}
@end
