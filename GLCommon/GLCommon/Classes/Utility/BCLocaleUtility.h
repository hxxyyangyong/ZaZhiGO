//
//  BCLocalizedString.h
//  GPlus
//
//  Created by BlackApple on 11-12-9.
//  Copyright 2011年 iUU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCLocaleUtilityConst.h"
#import "BCSingleton.h"
#define D_Method_LocalizedString(x) [[BCLocaleUtility sharedInstance] localizedStringKey:(x) Comment:nil]
typedef enum e_languagetype {
    E_LanguageType_None,
    E_LanguageType_en = 1033,
    E_LanguageType_zh_tw = 1028,
    E_LanguageType_zh_cn = 2052,
    E_LanguageType_Max
} E_LanguageType;

@interface BCLocaleUtilityBase : NSObject
@property (nonatomic, strong) NSBundle *bundle;
@property (nonatomic, strong) NSBundle *bcCommonBundle;
@property (nonatomic, strong) NSString *table;
@property (nonatomic, assign) E_LanguageType currentLanguage;

- (id)initWithBundle:(NSBundle *)bundle Table:(NSString *)table;
@end



@interface BCLocaleUtility : BCLocaleUtilityBase
BC_SINGLETON(BCLocaleUtility)

- (NSString *)localizedStringKey:(NSString *)key Comment:(NSString *)comment;
+ (NSLocale *)currentLocale;
@end

