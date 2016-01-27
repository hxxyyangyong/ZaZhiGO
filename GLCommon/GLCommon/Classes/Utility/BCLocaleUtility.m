//
//  BCLocalizedString.m
//  GPlus
//
//  Created by BlackApple on 11-12-9.
//  Copyright 2011年 iUU. All rights reserved.
//

#import "BCLocaleUtility.h"
//#import "NSArray+BCAddition.h"
//#import "NSString+BCAddition.h"

@implementation BCLocaleUtilityBase

@synthesize bundle = _bundle;
@synthesize table = _table;
@synthesize currentLanguage = _currentLanguage;
@synthesize bcCommonBundle = _bcCommonBundle;

- (id)init
{
    self = [super init];
    if (self) {
        _bundle = [NSBundle mainBundle];
        _table = nil;
        _currentLanguage = E_LanguageType_None;
    }
    return self;
}

- (id)initWithBundle:(NSBundle *)bundle Table:(NSString *)table
{
    self = [super init];
    if (self) {
        _bundle = bundle;
        _table = table;
        _currentLanguage = E_LanguageType_None;
    }
    return self;
}

- (NSBundle *)bcCommonBundle
{
    if (!_bcCommonBundle) {
//        NSString *path = [NSString pathForBundleResource:@"BCCommon.bundle"];
//        _bcCommonBundle = [NSBundle bundleWithPath:path];
    }
    return _bcCommonBundle;
}
@end


@implementation BCLocaleUtility
DEF_SINGLETON(BCLocaleUtility)

- (NSString *)localizedStringKey:(NSString *)key Comment:(NSString *)comment
{
    NSString *retString = nil;
    retString = [self.bundle localizedStringForKey:key value:key table:self.table];
    if (!retString) {
        retString = [self.bcCommonBundle localizedStringForKey:key value:key table:nil];
    }
    if (!retString) {
        retString = key;
    }
    return retString;
}


+ (NSLocale *)currentLocale
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defaults objectForKey:@"AppleLanguages"];
    if (!(languages.count > 0)) {
        NSString* currentLanguage = [languages objectAtIndex:0];
        return [[NSLocale alloc] initWithLocaleIdentifier:currentLanguage];
        
    } else {
        return [NSLocale currentLocale];
    }
}
@end
