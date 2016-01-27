//
//  ZZGLogoutItem.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGHttpBaseItem.h"

@interface ZZGLogoutItem : ZZGHttpBaseItem
@property (nonatomic, strong) NSString *username;   // 用户名
@property (nonatomic, strong) NSString *key;        // 当前登录令牌
@property (nonatomic, strong) NSString *client;     // 客户端类型(android wap ios wechat)
@end
