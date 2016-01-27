//
//  ZZGHttpBaseItem.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <GLCommon/GLCommon.h>
#import "BuyersRelativeUrlCenter.h"
#import "ZZGBaseResponse.h"


@interface ZZGHttpBaseItem : HttpBaseItem
{
    void (^ZZGHttpDataCallback) (ZZGBaseResponse *response);
    void (^ZZGHttpFailureCallback) (ZZGHttpBaseItem *item);
}

@property (nonatomic, strong) NSString *key; //当前登录令牌;

- (void)setZZGSuccessCallback:(void (^) (ZZGBaseResponse *response))success
              failureCallback:(void (^) (ZZGHttpBaseItem *item))failure;

@end
