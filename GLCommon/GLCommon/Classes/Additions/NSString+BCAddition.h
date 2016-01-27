//
//  NSString+BCAddition.h
//  BCCoreLibrary
//
//  Created by Ji Will on 11/26/12.
//  Copyright (c) 2012 iBrand. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSString (BCAddition)

@property (nonatomic, readonly) NSString* md5Hash;
@property (nonatomic, readonly) NSString* sha1Hash;


- (BOOL)isEmpty;

//- (BOOL)isBundleUrl;
//- (BOOL)isDocumentsUrl;


- (NSString *)urlEncodedString;
- (NSString *)urlDecodedString;

- (NSDictionary*)queryContentsUsingEncoding:(NSStringEncoding)encoding;
- (NSString*)stringByAddingQueryDictionary:(NSDictionary*)query;
- (NSString*)stringByAddingURLEncodedQueryDictionary:(NSDictionary*)query;
- (NSString*)stringByRemovingHTMLTags;

+ (NSString *)pathForBundleResource:(NSString *)relativePath;
+ (NSString *)pathForDocumentsResource:(NSString *)relativePath;
+ (NSString *)pathForLibraryResource:(NSString *)relativePath;

+ (NSString *)notEmptyStringFrom:(NSString *)string;
@end
