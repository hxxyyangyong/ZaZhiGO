//
//  ZZGAddressViewController.m
//  ZaZhiGo
//
//  Created by 陈辉 on 16/1/14.
//  Copyright © 2016年 com.zhuocheng. All rights reserved.
//

#import "ZZGAddressViewController.h"

@interface ZZGAddressViewController ()//<UITableViewDataSource,UITableViewDelegate>
//@property (nonatomic,strong)UITableView * tableView;
@end

@implementation ZZGAddressViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //隐藏系统导航栏
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"地址管理";
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view.
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
