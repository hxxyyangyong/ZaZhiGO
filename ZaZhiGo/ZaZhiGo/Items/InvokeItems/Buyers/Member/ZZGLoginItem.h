//
//  ZZGLoginItem.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGHttpBaseItem.h"



@interface ZZGLoginItem : ZZGHttpBaseItem

@property (nonatomic, strong) NSString *username;   //用户名/手机/邮箱
@property (nonatomic, strong) NSString *password;   //密码
@property (nonatomic, strong) NSString *client;     //client 客户端类型(android wap ios wechat)



@end
