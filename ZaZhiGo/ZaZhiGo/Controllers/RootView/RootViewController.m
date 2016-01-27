//
//  RootViewController.m
//  ZaZhiGo
//
//  Created by 陈辉 on 16/1/13.
//  Copyright © 2016年 com.zhuocheng. All rights reserved.
//

#import "RootViewController.h"
#import "ZZGHomeViewController.h"
#import "ZZGCartViewController.h"
#import "ZZGShopViewController.h"
#import "ZZGMeViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabBarControllers];
    // Do any additional setup after loading the view.
}


- (void)createTabBarControllers{
    ZZGHomeViewController * home = [[ZZGHomeViewController alloc] init];
    ZZGShopViewController * shop = [[ZZGShopViewController alloc] init];
    ZZGCartViewController * cart = [[ZZGCartViewController alloc] init];
    ZZGMeViewController   * me   = [[ZZGMeViewController alloc] init];
    
    NSArray * titleArr = @[@"首页",@"商店",@"购物车",@"我的"];
    NSMutableArray * array = [[NSMutableArray alloc] initWithObjects:home,shop,cart,me, nil];
    
    for (int i = 0; i < 4; i++) {
        
        UIViewController * vc = array[i];
        
        vc.title = titleArr[i];
        
        UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:vc];
        
        [array replaceObjectAtIndex:i withObject:navi];
    }
    
    self.viewControllers = array;
    
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
