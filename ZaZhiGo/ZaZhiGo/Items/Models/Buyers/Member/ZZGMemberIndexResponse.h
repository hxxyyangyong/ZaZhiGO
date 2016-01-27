//
//  ZZGMemberIndexResponse.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBaseResponse.h"

@interface ZZGMemberIndexResponse : ZZGBaseResponse
@property (nonatomic, strong) NSString *username;   //用户名
@property (nonatomic, strong) NSString *avator;   // 用户头像
@property (nonatomic, strong) NSString *point;   // 积分
@property (nonatomic, strong) NSString *predepoit;   // 预存款
@property (nonatomic, strong) NSString *available_rc_balance;   // 充值卡余额
@end
