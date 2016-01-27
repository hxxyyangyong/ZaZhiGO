//
//  ZZGVoucherListItem.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGHttpBaseItem.h"

@interface ZZGVoucherListItem : ZZGHttpBaseItem
@property (nonatomic, strong) NSString *key;    //当前登录令牌
@property (nonatomic, strong) NSString *voucher_state;  //代金券状态(1-未使用 2-已使用 3-已过期)
@end
