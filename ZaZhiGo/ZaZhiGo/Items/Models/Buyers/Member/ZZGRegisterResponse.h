//
//  ZZGRegisterResponse.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBaseResponse.h"
//返回数据
//
//username 用户名
//userid 用户编号
//key 登录令牌
@interface ZZGRegisterResponse : ZZGBaseResponse

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSString *key;

@end
