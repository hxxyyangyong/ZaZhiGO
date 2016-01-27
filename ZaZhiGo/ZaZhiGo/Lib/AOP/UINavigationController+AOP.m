//
//  UINavigationController+AOP.m
//  ZaZhiGo
//
//  Created by 陈辉 on 16/1/13.
//  Copyright © 2016年 com.zhuocheng. All rights reserved.
//

#import "UINavigationController+AOP.h"
#import "NSObject+AOP.h"
#import "ZZGLoginViewController.h"

@implementation UINavigationController (AOP)

+(void)load
{
    [self aop_ExchangeSelector:@selector(pushViewController:animated:) andNewSelector:@selector(aop_pushViewController:animated:)];
}


- (void)aop_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    //配置明确,那些页面需要权限控制
    //plist 文件来进行配置填写
//    NSArray * tmp = @[@"ZZGOrderViewController",@"ZZGPropertyViewController",@"BLMeMassageController",@"BLMeMoneyController",@"BLMeTicketController"];
    NSArray * tmp = @[@"BLMeMassageController",@"BLMeMassageController",@"BLMeMassageController",@"BLMeMoneyController",@"BLMeTicketController"];

    
    NSString * className = NSStringFromClass([viewController class]);
   
    for (NSString * name in tmp)
    {
        if ([name isEqualToString:className])
        {
            NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];

            //如果没有去到用户名,说名没有登录过
            //那么就跳转到登录页面
            if (![ud objectForKey:@"name"])
            {
                //跳转到登录页面
                ZZGLoginViewController * login = [[ZZGLoginViewController alloc] init];
                UINavigationController * navLogin = [[UINavigationController alloc] initWithRootViewController:login];
                [self presentViewController:navLogin animated:YES completion:nil];
                
                return ;
            }
 
        }
        
    }
    
    
    [self aop_pushViewController:viewController animated:animated];

}
@end
