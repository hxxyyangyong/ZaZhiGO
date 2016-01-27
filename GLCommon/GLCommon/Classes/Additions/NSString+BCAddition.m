//
//  NSString+BCAddition.m
//  BCCoreLibrary
//
//  Created by Ji Will on 11/26/12.
//  Copyright (c) 2012 iBrand. All rights reserved.
//

#import "NSString+BCAddition.h"

// Core
//#import "BCCommon.h"
//#import "BCXHTMLMarkupStripper.h"
#import "NSData+BCAddition.h"
#import "NSBundle+BCAddition.h"
#import "NSArray+BCAddition.h"

@implementation NSString (BCAddition)

- (NSString*)md5Hash
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md5Hash];
}


- (NSString*)sha1Hash
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha1Hash];
}


- (BOOL)isEmpty
{
    return !(self.length > 0);
}

//- (BOOL)isBundleUrl
//{
//    return [self hasPrefix:@"bundle://"];
//}
//
//- (BOOL)isDocumentsUrl
//{
//    return [self hasPrefix:@"documents://"];
//}
//

- (NSString *)urlEncodedString
{
    NSString *result = (NSString *)
	CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              NULL,
                                                              CFSTR("!*'();:@&amp;=+$,/?%#[] "),
                                                              kCFStringEncodingUTF8));
    return result;
}

- (NSString*)urlDecodedString
{
    NSString *result = (NSString *)
	CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                              (CFStringRef)self,
                                                                              CFSTR(""),
                                                                              kCFStringEncodingUTF8));
    return result;
}


//- (NSString*)stringByRemovingHTMLTags
//{
//    BCXHTMLMarkupStripper* stripper = [[BCXHTMLMarkupStripper alloc] init];
//    return [stripper parse:self];
//}


- (NSDictionary*)queryContentsUsingEncoding:(NSStringEncoding)encoding
{
    NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];
    NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
    NSScanner* scanner = [[NSScanner alloc] initWithString:self];// autorelease];
    while (![scanner isAtEnd]) {
        NSString* pairString = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
        if (kvPair.count == 1 || kvPair.count == 2) {
            NSString* key = [[kvPair objectAtIndex:0]
                             stringByReplacingPercentEscapesUsingEncoding:encoding];
            NSMutableArray* values = [pairs objectForKey:key];
            if (nil == values) {
                values = [NSMutableArray array];
                [pairs setObject:values forKey:key];
            }
            if (kvPair.count == 1) {
                [values addObject:[NSNull null]];
                
            } else if (kvPair.count == 2) {
                NSString* value = [[kvPair objectAtIndex:1]
                                   stringByReplacingPercentEscapesUsingEncoding:encoding];
                [values addObject:value];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:pairs];
}

- (NSString*)stringByAddingQueryDictionary:(NSDictionary*)query
{
    NSMutableArray* pairs = [NSMutableArray array];
    for (NSString* key in [query keyEnumerator]) {
        NSString* value = [query objectForKey:key];
        value = [value stringByReplacingOccurrencesOfString:@"?" withString:@"%3F"];
        value = [value stringByReplacingOccurrencesOfString:@"=" withString:@"%3D"];
        NSString* pair = [NSString stringWithFormat:@"%@=%@", key, value];
        [pairs addObject:pair];
    }
    
    NSString* params = [pairs componentsJoinedByString:@"&"];
    if ([self rangeOfString:@"?"].location == NSNotFound) {
        return [self stringByAppendingFormat:@"?%@", params];
        
    } else {
        return [self stringByAppendingFormat:@"&%@", params];
    }
}

- (NSString*)stringByAddingURLEncodedQueryDictionary:(NSDictionary*)query
{
    NSMutableDictionary* encodedQuery = [NSMutableDictionary dictionaryWithCapacity:[query count]];
    
    for (NSString* key in [query keyEnumerator]) {
        NSParameterAssert([key respondsToSelector:@selector(urlEncodedString)]);
        NSString* value = [query objectForKey:key];
        NSParameterAssert([value respondsToSelector:@selector(urlEncodedString)]);
        value = [value urlEncodedString];
        NSString *urlEncodedKey = [key urlEncodedString];
        [encodedQuery setValue:value forKey:urlEncodedKey];
    }
    
    return [self stringByAddingQueryDictionary:encodedQuery];
}


+ (NSString *)pathForBundleResource:(NSString *)relativePath
{
    NSString* resourcePath = [[NSBundle defaultBundle] resourcePath];
    return [resourcePath stringByAppendingPathComponent:relativePath];
}


+ (NSString *)pathForLibraryResource:(NSString *)relativePath
{
    static NSString* documentsPath = nil;
    if (nil == documentsPath) {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        documentsPath = [dirs stringAtIndex:0];
    }
    return [documentsPath stringByAppendingPathComponent:relativePath];
}

+ (NSString *)pathForDocumentsResource:(NSString *)relativePath
{
    static NSString* documentsPath = nil;
    if (nil == documentsPath) {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        documentsPath = [dirs stringAtIndex:0];
    }
    return [documentsPath stringByAppendingPathComponent:relativePath];
}

+ (NSString *)notEmptyStringFrom:(NSString *)string
{
    NSString *ret = @"";
    if (string) {
        ret = string;
    }
    return ret;
}
@end
