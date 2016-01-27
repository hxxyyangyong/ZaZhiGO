//
//  MyUtils.m
//  Youyou
//
//  Created by Apple on 13-1-30.
//  Copyright (c) 2013年 Gaialine. All rights reserved.
//

#import "MyUtils.h"
//#import <sys/utsname.h>  
//#import <CommonCrypto/CommonDigest.h> //MD5加密
//#import "ImageZoomAndMove.h"
@implementation MyUtils
//#pragma mark - IN: @"yyyy-MM-dd"/@"yyyyMMdd" , NSdate   OUT: @"2011-11-11"/@"20111111"
//+ (NSString *)stringFromDateWithFormatString:(NSString *)stringFormat withDate:(NSDate *)date{
//    if (!date)
//        return nil;
//        
//    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
//    NSLocale *local = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
//    [fmt setLocale:local];
//
//    [fmt setDateFormat:stringFormat];
//    NSString *strFromDate = [fmt stringFromDate:date];
//    return strFromDate;
//}
//
//#pragma mark - IN: @"yyyy-MM-dd"/@"yyyyMMdd" , @"2011-11-11"/@"20111111"  OUT: NSDate
//+ (NSDate *)dateFromStringWithFormatString:(NSString *)stringFormat withString:(NSString *)dateString{
//    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
//    NSLocale *local = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
//    [fmt setLocale:local];
//
//    [fmt setDateFormat:stringFormat];
//    NSDate *dateFromStr = [fmt dateFromString:dateString];
//
//    return dateFromStr;
//}
//
//#pragma mark - java 字符串时间处理 转 NSDate
//+ (NSString *)dateStringFormat:(NSString *) formatStr fromJavaDateString:(NSString *)string{
//    if (!string)
//        return nil;
//    
//    NSDateFormatter* fmt1 = nil;
//    NSDate *datt = nil;
//    @try {
//        fmt1 = [[NSDateFormatter alloc] init];
//        [fmt1 setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
//        [fmt1 setDateFormat:@"MMM d, yyyy hh:mm:ss a"];
//        datt = [fmt1 dateFromString:string];
//        [fmt1 setDateFormat:formatStr];
//    }
//    @catch (NSException *exception) {
//        return nil;
//    }
//    
//    return [fmt1 stringFromDate:datt];
//}
//
//#pragma mark - NSDate 转 java 字符串时间
//+ (NSString *)JavaDateStringFromDate:(NSDate *)aDate
//{
//    if (!aDate)
//        return nil;
//    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
//    NSLocale *local = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
//    [fmt setLocale:local];
//
//    [fmt setDateFormat:@"MMM d, yyyy hh:mm:ss a"];
//    NSString *strFromDate = [fmt stringFromDate:aDate];
//
//    return strFromDate;
//}
//
#pragma mark - 获得Document下的目录 , subPath为空，返回Document根目录
+ (NSString *)documentPath:(NSString *)subPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if (!subPath || [subPath isEqualToString:@""]) {
        return [paths objectAtIndex:0];
    }else{
        return [[paths objectAtIndex:0] stringByAppendingPathComponent:subPath];
    }
}

#pragma mark - 创建文件夹 , 存在则不创建
+ (BOOL)createDictionaryAtPath:(NSString *)dirPath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dirPath]) {
        //创建一个目录
        [NSFileManager addSkipBackupAttributeToItemAtURL:[NSURL URLWithString:dirPath]];
        return [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return NO;
}
//
//#pragma mark - 删除文件
//+ (BOOL)deleteFileWIthFullName:(NSString *)fullName{
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    if ([fileManager fileExistsAtPath:fullName]) {
//        return [fileManager removeItemAtPath:fullName error:nil];
//    }
//    return NO;
//}

#pragma mark - 应用版本号
+(NSString *) applicationVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}
//
//#pragma mark - 东八区时间
//+(NSDate *)dateZonelocal:(NSDate *) timeZone0Date{
//    NSTimeZone *zone = [NSTimeZone localTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate: timeZone0Date];
//    NSDate *localeDate = [timeZone0Date  dateByAddingTimeInterval: interval];
//    //    NSLog(@"当前时间=====%@",localeDate);
//    return localeDate;
//}
//
//#pragma mark - 登录成功后，后去sessionid
//+(NSString *) getSessionId{
//    
//    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//    NSMutableString *sessionid = nil;
//    for (NSHTTPCookie *cookie in [cookieJar cookies]) {
//        NSDictionary *dic = [cookie properties];
//        LOG(@"[cookie properties] ===== %@",dic);
//        if ([[dic objectForKey:@"Name"]isEqualToString:SESSIONNAME]) {
//            sessionid = [dic objectForKey:@"Value"];break;
//        }
//    }
//    LOG(@"登录成功后sessionid========%@",sessionid);
//    return sessionid;
//}
//
#pragma mark - 密码MD5加密 16位
+(NSString *)md5:(NSString *)str {
    const char *cStr = [str UTF8String];//转换成utf-8
    unsigned char result[16];//开辟一个16字节（128位：md5加密出来就是128位/bit）的空间（一个字节=8字位=8个二进制数）
    CC_MD5( cStr, strlen(cStr), result);
    /*
     extern unsigned char *CC_MD5(const void *data, CC_LONG len, unsigned char *md)官方封装好的加密方法
     把cStr字符串转换成了32位的16进制数列（这个过程不可逆转） 存储到了result这个空间中
     */
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
    /*
     x表示十六进制，%02X  意思是不足两位将用0补齐，如果多余两位则不影响
     NSLog("%02X", 0x888);  //888
     NSLog("%02X", 0x4); //04
     */
}
//
//#pragma mark - 将图片大小转换成新尺寸
//+ (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
//{
//    UIGraphicsBeginImageContext(newSize);//根据当前大小创建一个基于位图图形的环境
//    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];//根据新的尺寸画出传过来的图片
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();//从当前环境当中得到重绘的图片
//    UIGraphicsEndImageContext();//关闭当前环境
//    return newImage;
//}
//
//+ (UIImage *)stretchableImage:(UIImage *)img edgeInsets:(UIEdgeInsets)edgeInsets{
//    edgeInsets.top < 1 ? edgeInsets.top = 12 : 0;
//    edgeInsets.left  < 1 ? edgeInsets.left = 12 : 0;
//    edgeInsets.bottom < 1 ? edgeInsets.bottom = 12 : 0;
//    edgeInsets.right  < 1 ? edgeInsets.right = 12 : 0;
//#if defined __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_5_0
//    return [img resizableImageWithCapInsets:edgeInsets];                          
//#else
//    return [img stretchableImageWithLeftCapWidth:edgeInsets.top topCapHeight:edgeInsets.left];
//#endif
//}
//
//#pragma mark - 两张图片合成一张     twoImg small
//+ (UIImage *)addTwoImageToOne:(UIImage *)oneImg twoImage:(UIImage *)twoImg
//{
//    float width = 36;
//    float height = 36;
//    UIGraphicsBeginImageContext(oneImg.size);
//    [oneImg drawInRect:CGRectMake(0, 0, oneImg.size.width, oneImg.size.height)];
//    [twoImg drawInRect:CGRectMake((oneImg.size.width - width)/2, (oneImg.size.height - height)/2, width, height)];
//    UIImage *resultImg = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return resultImg;
//}
//
//#pragma mark - 字符串转颜色   #666666 转 UIColor
//+(UIColor *) colorWithHexString: (NSString *) stringToConvert
//{
//    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
//    
//    
//    if ([cString length] < 6)
//        return [UIColor blackColor];
//    if ([cString hasPrefix:@"#"])
//        cString = [cString substringFromIndex:1];
//    if ([cString length] != 6)
//        return [UIColor blackColor];
//    
//    NSRange range;
//    range.location = 0;
//    range.length = 2;
//    NSString *rString = [cString substringWithRange:range];
//    
//    range.location = 2;
//    NSString *gString = [cString substringWithRange:range];
//    
//    range.location = 4;
//    NSString *bString = [cString substringWithRange:range];
//    
//    
//    unsigned int r, g, b;
//    [[NSScanner scannerWithString:rString] scanHexInt:&r];
//    [[NSScanner scannerWithString:gString] scanHexInt:&g];
//    [[NSScanner scannerWithString:bString] scanHexInt:&b];
//    
//    return [UIColor colorWithRed:((float) r / 255.0f)
//                           green:((float) g / 255.0f)
//                            blue:((float) b / 255.0f)
//                           alpha:1.0f];
//}
//
////oneDay VS anotherDay is the oneDay near future.
//+ (BOOL)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
//{
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:STANDARD_DATE_FORMAT];
//    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
//    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
//    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
//    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
//    NSComparisonResult result = [dateA compare:dateB];
//    NSAssert(oneDay, @"oneDay is nil");
//    NSAssert(anotherDay, @"anotherDay is nil");
//    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
//    if (result == NSOrderedDescending) {
//        //NSLog(@"Date1  is in the future");
//        return YES;
//    }
//    else if (result == NSOrderedAscending){
//        //NSLog(@"Date1 is in the past");
//        return NO;
//    }
//    //NSLog(@"Both dates are the same");
//    return NO;
//    
//}
//
#pragma mark - 创建UUID
+ (NSString *)createUUID
{
    // Create universally unique identifier (object)
    CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
    
    // Get the string representation of CFUUID object.
    NSString *uuidStr = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuidObject);
    
    // If needed, here is how to get a representation in bytes, returned as a structure
    // typedef struct {
    //   UInt8 byte0;
    //   UInt8 byte1;
    //   ...
    //   UInt8 byte15;
    // } CFUUIDBytes;
    // CFUUIDBytes bytes = CFUUIDGetUUIDBytes(uuidObject);
    CFRelease(uuidObject);
    return uuidStr;
}
//
//#pragma mark - 单击图片显示大图
//+ (void)showBigerImage:(long long)imageId
//               ownerId:(long long)ownerId
//           currentSize:(NSString *)currentSize
//             smallSize:(NSString *)smallSize
//         deafaultImage:(NSString *)deafaultImage
//             imageType:(ImageType)aImageType
//           showLoading:(BOOL)showLoading
//{
//    CGRect rect = CGRectMake(0, 0, 320, SCREENHEIGHT);
//    CustomImageView *imageView = [[CustomImageView alloc]init];
//    imageView.frame = rect;
//   
//    [imageView setImageWithImageId:imageId
//                           ownerId:ownerId
//                       currentSize:currentSize
//                         smallSize:smallSize
//                      defaultImage:deafaultImage
//                         imageType:aImageType
//                       showLoading:showLoading];
//    
//    ImageZoomAndMove *scro = [[ImageZoomAndMove alloc]init];
//    scro.frame = rect;
//    [scro setImageView:imageView];
//    
//    [[UIApplication sharedApplication].keyWindow addSubview:scro];
//    [[UIApplication sharedApplication] setStatusBarHidden:TRUE];
//}
//
//#pragma mark - 缓存图片
//+ (UIImage *)imageOfCacheWithSize:(NSString *)imageSize imageId:(long long)imageOd
//{
//    NSString *imageName = [NSString stringWithFormat:@"%@/%@/%@.png",[MyUtils documentPath:@"images"],imageSize,[NSString stringWithFormat:@"%lld",imageOd]];
//    return [UIImage imageWithContentsOfFile:imageName];
//}
//
//#pragma mark - 图片网络请求地址
//+ (NSString *)imageRequestPathOfSize:(NSString *)imageSize imageId:(long long)imageOd
//{
//    return [NSString stringWithFormat:@"%@downloadFile?fileId=%lld&picSize=%@",API_IMAGE_DOMAIN_DEFAULT,imageOd,imageSize];
//}
//
#pragma mark - 检测手机号是否合法
+ (BOOL)checkPhoneNumCanUse:(NSString *)phoneNum
{
//    if ([phoneNum length] != 11 && [phoneNum length] != 10)
//        return FALSE;
    if ([phoneNum length] < 2 || [phoneNum length] > 15)
        return FALSE;
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"11"
                          ,@"1",@"12"
                          ,@"1",@"16"
                          ,@"1",@"17"
                          ,@"1",@"19"
                          ,nil];
    return  [dic objectForKey:[phoneNum substringToIndex:2]] ? FALSE : TRUE;
}

#pragma mark - 密码是否合法
+ (BOOL)checkPasswordCanUse:(NSString *)password
{
    if ([password length]<6 || [password length]>18)
        return FALSE;
    return TRUE;
}

#pragma mark - 加密后的密码
+ (NSString *)encodePassword:(NSString *)password
{
    if (!password || [@"" isEqualToString:password])
        return password;
    return [MyUtils md5:[MyUtils md5:[NSString stringWithFormat:@"gaia%@line",password]]];
}
//
//+ (NSString *)qrcodeContent:(long long)seccode tno:(NSString *)tno
//{
//    return [NSString stringWithFormat:@"http://%@/mobile/%@/%lld",QRCODEIP, tno, seccode];
//}
//
//#pragma mark - 图片的高度
//+ (float)heightOfPushPicture:(long long)pictureId size:(NSString *)size
//{
//    UIImage *image = [MyUtils imageOfCacheWithSize:size imageId:pictureId];
//    if (image) {
//        return image.size.height;
//    }
//    return [size floatValue];
//}
//
//#pragma mark - 根据最大边值 ， 等比缩放size
//+ (CGSize)sizeWithMax:(float)max originalSize:(CGSize)originalSize
//{
//    CGSize size = CGSizeZero;
//    if (CGSizeEqualToSize(size, originalSize))
//        return CGSizeMake(max, max);
//        
//    if ((originalSize.width/originalSize.height) > 1) {
//        size = CGSizeMake(max,max*(originalSize.height/originalSize.width));
//    }else{
//        size = CGSizeMake(max*(originalSize.width/originalSize.height),max);
//    }
//    return size;
//}
//
//+ (UIImage *)imageByMiddelCropImage:(UIImage *)originalImage
//{
//    CGSize imageSize = originalImage.size;
//    float length = MIN(imageSize.width, imageSize.height);
//    float X = (imageSize.width - length) / 2;
//    float Y = (imageSize.height - length) / 2;
//    
//    CGRect rect = CGRectMake(X, Y, length, length);
//    CGImageRef imageRef = CGImageCreateWithImageInRect(originalImage.CGImage, rect);
//    UIImage *image = [UIImage imageWithCGImage:imageRef];
//    CGImageRelease(imageRef);
//    return image;
//}
//
//+ (BOOL)isRetina
//
//{
//    
//    struct utsname systemInfo;
//    
//    uname(&systemInfo);
//    
//    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
//    
//    if ([deviceString isEqualToString:@"iPhone1,1"])    return NO;// return @"iPhone 1G";
//    if ([deviceString isEqualToString:@"iPhone1,2"])    return NO;// return @"iPhone 3G";
//    if ([deviceString isEqualToString:@"iPhone2,1"])    return NO;// return @"iPhone 3GS";
//    if ([deviceString isEqualToString:@"iPhone3,1"])    return YES;// return @"iPhone 4";
//    if ([deviceString isEqualToString:@"iPhone4,1"])    return YES;// return @"iPhone 4S";
//    if ([deviceString isEqualToString:@"iPhone5,2"])    return YES;// return @"iPhone 5";
//    if ([deviceString isEqualToString:@"iPhone3,2"])    return YES;// return @"Verizon iPhone 4";
//    if ([deviceString isEqualToString:@"iPod1,1"])      return NO;// return @"iPod Touch 1G";
//    if ([deviceString isEqualToString:@"iPod2,1"])      return NO;// return @"iPod Touch 2G";
//    if ([deviceString isEqualToString:@"iPod3,1"])      return NO;// return @"iPod Touch 3G";
//    if ([deviceString isEqualToString:@"iPod4,1"])      return YES;// return @"iPod Touch 4G";
//    if ([deviceString isEqualToString:@"iPad1,1"])      return YES;// return @"iPad";
//    if ([deviceString isEqualToString:@"iPad2,1"])      return YES;// return @"iPad 2 (WiFi)";
//    if ([deviceString isEqualToString:@"iPad2,2"])      return YES;// return @"iPad 2 (GSM)";
//    if ([deviceString isEqualToString:@"iPad2,3"])      return YES;// return @"iPad 2 (CDMA)";
//    if ([deviceString isEqualToString:@"i386"])         return YES;// return @"Simulator";
//    if ([deviceString isEqualToString:@"x86_64"])       return YES;// return @"Simulator";
//    
//    return YES;
//}
//
///**
// * 把距离转友好的显示
// * @param distance 单位为m的距离
// * @return
// */
//#pragma mark - 距离显示
//+ (NSString *)distanceStrOfDistince:(double)distance
//{
//    if (distance <= 0) {
//        return @"10米内";
//    }
//    //  距离显示方式：100——900米内、1公里内、2公里内、20——100公里内（10公里一个间隔）、100——1000公里内（100公里一个间隔）、1000公里外（此数据为运营确认数据，请尽量实现）
//    if (distance > 100) {
//        if (distance < 900) {
//            return [NSString stringWithFormat:@"%d米内", ((NSInteger)distance/100)*100 + 100];
//        }else if (distance < 20*1000) {
//            return [NSString stringWithFormat:@"%d公里内", (NSInteger)distance/1000 + 1];
//        }else if (distance < 100*1000) {//10公里一个间隔
//            return [NSString stringWithFormat:@"%d0公里内", (NSInteger)distance/(1000*10) + 1];
//        }else if (distance < 1000*1000) {//10公里一个间隔
//            return [NSString stringWithFormat:@"%d00公里内", (NSInteger)distance/(1000*100) + 1];
//        }else {
//            return @"1000公里外";
//        }
//    }else {
//        return @"100米内";
//    }
//}
//
//+ (void)notifyDownloadImage:(long long)imageId imageSize:(NSString *)imageSize ownerId:(long long)ownerId
//{
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:imageSize, @"imageSize", [NSNumber numberWithLongLong:imageId], @"imageId", [NSNumber numberWithLongLong:ownerId], @"ownerId", nil];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"downloadImageNotify" object:dic];
//}
//
//#pragma mark - 判断是否是同一天
//+ (BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2
//{
//    NSCalendar* calendar = [NSCalendar currentCalendar];
//    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
//    
//    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
//    
//    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
//    return [comp1 day] == [comp2 day] && [comp1 month] == [comp2 month] && [comp1 year] == [comp2 year];
//}


@end
