//
//  GLHTTPFetching.h
//  Base
//
//  Created by Apple on 14-2-17.
//  Copyright (c) 2014年 Gaialine. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GLHTTPFetcherDelegate;

@protocol GLHTTPFetching <NSObject>

@property (nonatomic, strong) NSObject *delegate;

@property (nonatomic, strong) NSDictionary *userInfo;

// default is 60s
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

// default is GET
@property (nonatomic, copy) NSString *HTTPMethod;

// body data for HTTP POST, set this will also set Content-Length automatically
@property (nonatomic, strong) NSData *HTTPBody;

// HTTP header fields
@property (nonatomic, copy) NSMutableDictionary *requestHTTPHeaders;

@property (nonatomic, strong, readonly) NSError *error;

/**
 *	@brief	Set value for HTTP header field
 *
 *	@param 	value 	header value
 *	@param 	header 	header name
 */
- (void)setValue:(NSString *)value forHTTPHeader:(NSString *)header;

// default is @selector(fetcherDidFinish:)
@property (nonatomic, assign) SEL finishSelector;

// default is @selector(fetcherDidFail:)
@property (nonatomic, assign) SEL failSelector;

// default is @selector(fetcherDidTimeout:)
@property (nonatomic, assign) SEL timeoutSelector;

/**
 *	@brief	Convenience constructor for object adopted GLHTTPFetching protocol
 *
 *	@param 	urlString 	url in a NSString
 *
 *	@return	Object adopted GLHTTPFetching protocol
 */
+ (NSOperation <GLHTTPFetching>*)fetcherWithURLString:(NSString *)urlString;

//上传媒体流请求（图片）
+ (NSOperation <GLHTTPFetching> *)multipartRequestWithURLString:(NSString *)urlString multipartData:(NSData *)uploadData parameters:(NSDictionary *)parameters;
/**
 *	@brief	URL string of this fetcher
 *
 *	@return	URL string
 */
- (NSString *)urlString;

/**
 *	@brief	start GLHTTPFetcher operation asynchronously
 */
- (void)startAsync;

/**
 *	@brief	clear delegate and then cancel operation
 */
- (void)cancelAndClearDelegate;

/**
 *	@brief	get response data
 *
 *	@return	NSData object
 */
- (NSData *)responseData;

/**
 *	@brief	get response HTTP Headers
 *
 *	@return	response HTTP Headers in a dictionary
 */
- (NSDictionary *)responseHTTPHeaders;

/**
 *	@brief	get HTTP status code
 *
 *	@return	status code
 */
- (NSUInteger)statusCode;


@end


@protocol GLHTTPFetcherDelegate <NSObject>
@optional

- (void)fetcherDidFinish:(NSOperation <GLHTTPFetching>*)fetcher;
- (void)fetcherDidFail:(NSOperation <GLHTTPFetching>*)fetcher;
- (void)fetcherDidTimeout:(NSOperation <GLHTTPFetching>*)fetcher;

@end
