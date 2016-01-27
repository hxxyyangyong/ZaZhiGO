//
//  GLHTTPFetcherImpl.h
//  Base
//
//  Created by Apple on 14-2-17.
//  Copyright (c) 2014年 Gaialine. All rights reserved.
//

#import "AFHTTPRequestOperation.h"
#import "GLHTTPFetching.h"

@interface GLHTTPFetcherImpl : AFHTTPRequestOperation <GLHTTPFetching>

- (id)initWithRequest:(NSURLRequest *)urlRequest;

@end
