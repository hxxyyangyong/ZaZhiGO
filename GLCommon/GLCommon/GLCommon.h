//
//  GLCommon.h
//  GLCommon
//
//  Created by yangyong on 14-5-22.
//  Copyright (c) 2014年 gainline. All rights reserved.
//

#ifndef GLCommon_GLCommon_h
#define GLCommon_GLCommon_h

#define IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
#define iOS7AddStatusHeight     (IOS7?20:0)


//-------Addtions
#import "NSDate+Help.h"
#import "NSString+Help.h"
#import "UIView+Helper.h"
#import "UIColor+Help.h"
#import "UIImage+Help.h"
#import "MKMapView+ZoomLevel.h"
#import "NSDate+BCAddition.h"
#import "BCLocaleUtility.h"
#import "BCLocaleUtilityConst.h"
#import "BCSingleton.h"
#import "NSDate-Helper.h"

//append by 14 06 16
#import "NSFileManager+BRAddition.h"
#import "NSObject+BCAddition.h"
#import "NSArray+BCAddition.h"
#import "NSBundle+BCAddition.h"
#import "NSFileManager+BRAddition.h"
#import "NSData+BCAddition.h"
#import "NSString+BCAddition.h"
#import "GLImageCache.h"

//storage
#import "Storage.h"
#import "StorageUtility.h"

//cache
#import "GLBaseCache.h"
#import "GLDBCache.h"
#import "GLFileCache.h"
#import "HttpCache.h"


#import "DependenceInclude.h"
#import "HttpEngine.h"
#import "HttpBaseItem.h"
#import "MyUtils.h"

#import "UIButton+Help.h"

#import "UIImageView+AFNetworking.h"

//socket
#import "AsyncSocket.h"
#import "AsyncUdpSocket.h"



#endif
