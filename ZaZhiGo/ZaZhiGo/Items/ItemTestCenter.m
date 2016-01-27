//
//  ItemTestCenter.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ItemTestCenter.h"

@implementation ItemTestCenter


- (void)startTest
{
    HttpEngine *engine = [[HttpEngine alloc] initWithBaseUrlStr:@"http://www.zazhigo.com/"];//
    
    int radomNum = arc4random()%10 + 1;
    __block NSString *userName = [NSString stringWithFormat:@"yong.yang%d",radomNum];
    __block NSString *password = @"123456";
    NSString *client = @"ios";
    
    NSString *email = [NSString stringWithFormat:@"zazhigou_%d@126.com",radomNum];
    __block NSString *key = @"";
    
    ZZGRegisterItem *registerItem = [[ZZGRegisterItem alloc] init];
    registerItem.username = userName;
    registerItem.password = password;
    
    registerItem.password_confirm = password;
    registerItem.email = email;
    registerItem.client = client;
    [registerItem setZZGSuccessCallback:^(ZZGBaseResponse *response) {
        ZZGRegisterResponse *result = (ZZGRegisterResponse *)response;
        userName = result.username;
        if (result.code == 400) {
            NSLog(@"ZZGRegisterResponse -- %@",[[result getDictValue] objectForKey:@"error"]);
        }else{
            NSLog(@"ZZGRegisterResponse -- %@",result.key);
        }
    } failureCallback:^(ZZGHttpBaseItem *item) {
        NSLog(@"ZZGRegisterResponse failureCallback%@",item.class);
    }];
    [engine invokeItem:registerItem];
    
    
    engine = [[HttpEngine alloc] initWithBaseUrlStr:@"http://www.zazhigo.com/"];
    ZZGLoginItem *loginItem = [[ZZGLoginItem alloc] init];
    loginItem.username = userName;
    loginItem.password = password;
    loginItem.client = client;
    [loginItem setZZGSuccessCallback:^(ZZGBaseResponse *response) {
        ZZGLoginResponse *result = (ZZGLoginResponse *)response;
        if (result.code == 400) {
             NSLog(@"code -- %@",[result getDictValue]);
        }else{
            NSLog(@"code -- %@",result.key);
        }
        
    } failureCallback:^(HttpBaseItem *item) {
        NSLog(@"failureCallback%@",item.class);
    }];
    [engine invokeItem:loginItem];
    
    engine = [[HttpEngine alloc] initWithBaseUrlStr:@"http://www.zazhigo.com/"];//
    ZZGGoodsClassItem *goodsClassItem = [[ZZGGoodsClassItem alloc] init];
    [goodsClassItem setZZGSuccessCallback:^(ZZGBaseResponse *response) {
        ZZGGoodsClassResponse *result = (ZZGGoodsClassResponse *)response;
        NSLog(@"--%@",((class_list *)[result.class_list objectAtIndex:0]).gc_name);
    } failureCallback:^(HttpBaseItem *item) {
        NSLog(@"failureCallback%@",item.class);
    }];
    [engine invokeItem:goodsClassItem];
    
    
    
    
}





@end
