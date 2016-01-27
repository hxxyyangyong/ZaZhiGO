//
//  ZZGRegisterItem.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGHttpBaseItem.h"

//请求参数
//
//username 用户名
//password 密码
//password_confirm 密码确认
//email 邮箱
//client 客户端类型(android wap ios wechat)

@interface ZZGRegisterItem : ZZGHttpBaseItem

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *password_confirm;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *client;

@end
