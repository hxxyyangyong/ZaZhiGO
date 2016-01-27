//
//  MyUtils.h
//  Youyou
//
//  Created by Apple on 13-1-30.
//  Copyright (c) 2013年 Gaialine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/utsname.h>  
#import <CommonCrypto/CommonDigest.h> //MD5加密
#import "NSFileManager+BRAddition.h"
//@class ImageZoomAndMove;
//
//
//#define COLOR_RGBA(r, g, b, a)  [UIColor colorWithRed:(CGFloat)r / 255 \
//green:(CGFloat)g / 255 \
//blue:(CGFloat)b / 255 \
//alpha:(CGFloat)a]
//
//#define COLOR_RGB(r, g, b)      COLOR_RGBA(r, g, b, 1)
//
//#define DEFAULT_BG_COLOR        COLOR_RGB(42, 42, 42)
//
//#define CELL_SELECTED_COLOR     COLOR_RGB(29, 29, 29)
//
//#define DEFAULT_LABEL_COLOR     COLOR_RGB(84, 145, 190)



#define DIR_IMTEMP_PIC                      @"IMTEMP"

#define SIZE_COMMAND                        @"0"

#define SIZE_MIN_IMCHAT_IMAGE               @"98"
#define SIZE_MAX_IMCHAT_IMAGE               @"640"

#define SIZE_MIN_FACEIMAGE                  @"66"
#define SIZE_MIDDLE_FACEIMAGE               @"144"
#define SIZE_MAX_FACEIMAGE                  @"300"

#define SIZE_MIN_BACKGROUNDIMAGE            @"208"
#define SIZE_MAX_BACKGROUNDIMAGE            @"640"

#define SIZE_MIN_COMMODITYLOGO              @"106"
#define SIZE_MIDDLE_COMMODITYLOGO           @"146"
#define SIZE_MAX_COMMODITYLOGO              @"550"

#define SIZE_COMMODITY_PICTURE              @"550"

#define SIZE_MIN_FRESH_PICTURE              @"144"
#define SIZE_MAX_FRESH_PICTURE              @"550"

#define SIZE_MIN_PUSH_PICTURE               @"126"
#define SIZE_MAX_PUSH_PICTURE               @"550"




@interface MyUtils : NSObject

//+(NSString *) stringFromDateWithFormatString:(NSString *)stringFormat withDate:(NSDate *) date;
//+(NSDate *) dateFromStringWithFormatString:(NSString *)stringFormat withString:(NSString *) dateString;
//+(NSString *)dateStringFormat:(NSString *) formatStr fromJavaDateString:(NSString *)string;
+(NSString *)documentPath:(NSString *) subPath;
//+ (NSString *)JavaDateStringFromDate:(NSDate *)aDate;
+(BOOL) createDictionaryAtPath:(NSString *) dirPath;
//+(BOOL) deleteFileWIthFullName:(NSString *) fullName;
+(NSString *) applicationVersion;

//+(NSDate *)dateZonelocal:(NSDate *) timeZone0Date;
//+(NSString *) getSessionId;
+(NSString *)md5:(NSString *)str ;
////+(NSString *)formatedPhoneNumber:(NSString *)phone;
//+(UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;
//+ (UIImage *)stretchableImage:(UIImage *)img edgeInsets:(UIEdgeInsets)edgeInsets;
//+ (UIImage *)addTwoImageToOne:(UIImage *) oneImg twoImage:(UIImage *) twoImg;
//+(UIColor *) colorWithHexString: (NSString *) stringToConvert;
//+ (BOOL)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
+ (NSString *)createUUID;
//
//+ (void)showBigerImage:(long long)imageId
//               ownerId:(long long)ownerId
//           currentSize:(NSString *)currentSize
//             smallSize:(NSString *)smallSize
//         deafaultImage:(NSString *)deafaultImage
//             imageType:(ImageType)aImageType
//           showLoading:(BOOL)showLoading;
//
+ (BOOL)checkPhoneNumCanUse:(NSString *)phoneNum;
+ (BOOL)checkPasswordCanUse:(NSString *)password;
//+ (UIImage *)imageOfCacheWithSize:(NSString *)imageSize imageId:(long long)imageOd;
//+ (NSString *)imageRequestPathOfSize:(NSString *)imageSize imageId:(long long)imageOd;
+ (NSString *)encodePassword:(NSString *)password;
//+ (NSString *)qrcodeContent:(long long)seccode tno:(NSString *)tno;
//
//+ (float)heightOfPushPicture:(long long)pictureId size:(NSString *)size;
//+ (CGSize)sizeWithMax:(float)max originalSize:(CGSize)originalSize;
//+ (UIImage *)imageByMiddelCropImage:(UIImage *)originalImage;
//+ (BOOL)isRetina;
//+ (NSString *)distanceStrOfDistince:(double)distance;
//+ (void)notifyDownloadImage:(long long)imageId imageSize:(NSString *)imageSize ownerId:(long long)ownerId;
//+ (BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2;
@end
