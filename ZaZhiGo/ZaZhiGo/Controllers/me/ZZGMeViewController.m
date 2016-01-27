//
//  ZZGMeViewController.m
//  ZaZhiGo
//
//  Created by 陈辉 on 16/1/13.
//  Copyright © 2016年 com.zhuocheng. All rights reserved.
//

#import "ZZGMeViewController.h"
#import "ZZGHead.h"
#import "ZZGLoginViewController.h"//登录
#import "ZZGOrderViewController.h"//订单
#import "ZZGPropertyViewController.h"//财产
#import "ZZGAddressViewController.h"//地址
#import "ZZGMYsetViewController.h"//设置

#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height
@interface ZZGMeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView * tableView;
@property(nonatomic,weak)ZZGHead *meView;
@end

@implementation ZZGMeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //隐藏系统导航栏
    self.navigationController.navigationBarHidden = YES;
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {self.automaticallyAdjustsScrollViewInsets = NO;}
    if ([UIImage imageWithContentsOfFile:[[NSString alloc]initWithFormat:@"%@%@",[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"],  @"/image.png"]]==nil) {
        [self.meView.iconButton  setBackgroundImage:[UIImage imageNamed:@"default_touxiang"]  forState:UIControlStateNormal];
        
    }else{
        [self.meView.iconButton  setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSString alloc]initWithFormat:@"%@%@",[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"],  @"/image.png"]]  forState:UIControlStateNormal];
    }
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"name"]) {
        self.meView.nameLabel.text = @"未登录";
        
    }else{
        self.meView.nameLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    // Do any additional setup after loading the view.
}


- (void)createTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ID"];
    [self.view addSubview:_tableView];
    ZZGHead * head = [[ZZGHead alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
    _tableView.tableHeaderView = head;
    head.iconButtonTouch = ^{
        ZZGLoginViewController * login = [[ZZGLoginViewController alloc] init];
        [self.navigationController pushViewController:login animated:YES];
    };
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        return 40;
    }else{
        if(indexPath.row == 0){
            return 40;
        }else{
            return 60;
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 10;

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ID" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        if (indexPath.row ==0) {
            //cell.imageView.image = [UIImage imageNamed:@"mc_01_b"];
            //cell.textLabel.text = @"我的订单";
            UIImageView * headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
            headImageView.image = [UIImage imageNamed:@"mc_01"];
            [cell.contentView addSubview:headImageView];
            UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(32, 10, 100, 20)];
            label1.font = [UIFont systemFontOfSize:14];
            label1.text = @"我的订单";
            [cell.contentView addSubview:label1];
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 100, 12, 100, 15)];
            label.text = @"查看所有订单";
            label.font = [UIFont systemFontOfSize:11];
            [cell.contentView addSubview:label];
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else{
            NSArray * array = @[@"待付款",@"待收货",@"待自提",@"待评价",@"退款/退货"];
            NSArray * imageArray = @[@"mcc_01",@"mcc_02",@"mcc_03",@"mcc_04",@"mcc_05"];
            for (int i = 0; i < 5; i++) {
                UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                button.frame = CGRectMake(0+WIDTH/5*i, 0, WIDTH/5, 70);
                // [button setTitle:array[i] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
                button.tag = 100+i;
                UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/5/2-20, 10, 20, 20)];
                image.image = [UIImage imageNamed:imageArray[i]];
                [button addSubview:image];
                UILabel * label = [[UILabel alloc] init];
                label.frame = CGRectMake(WIDTH/5/2-25, 35, WIDTH/5/2, 15);
                label.text = array[i];
                label.font = [UIFont systemFontOfSize:10];
                label.textAlignment = NSTextAlignmentCenter;
                [button addSubview:label];
                
                [cell.contentView addSubview:button];
        }
        }
        
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            UIImageView * headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
            headImageView.image = [UIImage imageNamed:@"mc_02"];
            [cell.contentView addSubview:headImageView];
            UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(32, 10, 100, 20)];
            label1.text = @"我的财产";
            label1.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:label1];
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 100, 12, 100, 15)];
            label.text = @"查看全部财产";
            label.font = [UIFont systemFontOfSize:11];
            [cell.contentView addSubview:label];
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else{
            NSArray * array = @[@"预付款",@"充值卡",@"代金券",@"红包",@"积分"];
            NSArray * imageArray = @[@"mcc_06_b",@"mcc_07_b",@"mcc_08_b",@"mcc_09_b",@"mcc_10_b"];
            for (int i = 0; i < 5; i++) {
                UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                button.frame = CGRectMake(0+WIDTH/5*i, 0, WIDTH/5, 70);
                //[button setTitle:array[i] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
                button.tag = 100+i;
                UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/5/2-20, 10, 20, 20)];
                image.image = [UIImage imageNamed:imageArray[i]];
                [button addSubview:image];
                UILabel * label = [[UILabel alloc] init];
                label.frame = CGRectMake(WIDTH/5/2-25, 35, WIDTH/5/2, 15);
                label.text = array[i];
                label.font = [UIFont systemFontOfSize:10];
                label.textAlignment = NSTextAlignmentCenter;
                [button addSubview:label];
                [cell.contentView addSubview:button];
            }

        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            UIImageView * headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
            headImageView.image = [UIImage imageNamed:@"mc_03"];
            [cell.contentView addSubview:headImageView];
            UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(32, 10, 100, 20)];
            label1.text = @"收货地址管理";
            label1.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:label1];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else{
            UIImageView * headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
            headImageView.image = [UIImage imageNamed:@"mc_04"];
            [cell.contentView addSubview:headImageView];
            UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(32, 10, 100, 20)];
            label1.text = @"用户设置";
            label1.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:label1];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    return cell;
}
- (void)buttonClick:(UIButton *)button{
    ZZGLoginViewController * login = [[ZZGLoginViewController alloc] init];
    [self.navigationController pushViewController:login animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            ZZGOrderViewController * order = [[ZZGOrderViewController alloc]init];

            [self.navigationController pushViewController:order animated:YES];
        }
    }else if (indexPath.section == 1){
        if (indexPath.row ==0) {
            ZZGPropertyViewController * pro = [[ZZGPropertyViewController alloc] init];
            [self.navigationController pushViewController:pro animated:YES];
        }
    }else if (indexPath.section == 2){
        if (indexPath.row ==0) {
            ZZGAddressViewController * address = [[ZZGAddressViewController alloc] init];
            address.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:address animated:YES];
        }else if (indexPath.row == 1){
            ZZGMYsetViewController * mySet = [[ZZGMYsetViewController alloc] init];
             mySet.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:mySet animated:YES];
        }
    }

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
