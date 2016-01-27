//
//  GLHTTPFetcherImplAfn.h
//  Tuotuo
//
//  Created by Holyen Zou on 13-7-11.
//  Copyright (c) 2013年 cn.gaialine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "GLHTTPFetching.h"

@interface GLHTTPFetcherImplAfn : AFHTTPRequestOperation <GLHTTPFetching>

- (id)initWithRequest:(NSURLRequest *)urlRequest;

@end
