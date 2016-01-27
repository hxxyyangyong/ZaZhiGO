//
//  ZZGPropertyViewController.m
//  ZaZhiGo
//
//  Created by 陈辉 on 16/1/14.
//  Copyright © 2016年 com.zhuocheng. All rights reserved.
//

#import "ZZGPropertyViewController.h"
#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height
@interface ZZGPropertyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView * tableView;
@end

@implementation ZZGPropertyViewController
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //隐藏系统导航栏
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的财产";
    [self createUI];
    // Do any additional setup after loading the view.
}
- (void)createUI{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -35, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource  = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ID"];
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell  * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    if (indexPath.row == 0) {
        UIImageView * headImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 15, 15)];
        headImage.image = [UIImage imageNamed:@"mcc_06_b"];
        [cell.contentView addSubview:headImage];
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(35, 15, 100, 15)];
        label1.text = @"账户余额";
        [cell.contentView addSubview:label1];
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 400, 15)];
        label2.font = [UIFont systemFontOfSize:13];
        label2.text = @"预存款账户余额、充值及提现明细";
        [cell.contentView addSubview:label2];
    }else if (indexPath.row ==1){
        UIImageView * headImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 15, 15)];
        headImage.image = [UIImage imageNamed:@"mcc_06_b"];
        [cell.contentView addSubview:headImage];
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(35, 15, 100, 15)];
        label1.text = @"充值卡余额";
        [cell.contentView addSubview:label1];
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 400, 15)];
        label2.font = [UIFont systemFontOfSize:13];
        label2.text = @"充值卡充值余额以及卡密充值操作";
        [cell.contentView addSubview:label2];
    }else if (indexPath.row == 2){
        UIImageView * headImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 15, 15)];
        headImage.image = [UIImage imageNamed:@"mcc_06_b"];
        [cell.contentView addSubview:headImage];
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(35, 15, 100, 15)];
        label1.text = @"店铺代金券";
        [cell.contentView addSubview:label1];
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 400, 15)];
        label2.font = [UIFont systemFontOfSize:13];
        label2.text = @"店铺代金券使用情况以及卡密兑换代金券操作";
        [cell.contentView addSubview:label2];
    }else if (indexPath.row == 3){
        UIImageView * headImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 15, 15)];
        headImage.image = [UIImage imageNamed:@"mcc_06_b"];
        [cell.contentView addSubview:headImage];
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(35, 15, 100, 15)];
        label1.text = @"平台红包";
        [cell.contentView addSubview:label1];
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 400, 15)];
        label2.font = [UIFont systemFontOfSize:13];
        label2.text = @"平台红包使用情况以及卡密领取红包操作";
        [cell.contentView addSubview:label2];
    }else if (indexPath.row == 4){
        UIImageView * headImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 15, 15)];
        headImage.image = [UIImage imageNamed:@"mcc_06_b"];
        [cell.contentView addSubview:headImage];
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(35, 15, 100, 15)];
        label1.text = @"会员积分";
        [cell.contentView addSubview:label1];
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 400, 15)];
        label2.font = [UIFont systemFontOfSize:13];
        label2.text = @"会员积分获取及消费日志";
        [cell.contentView addSubview:label2];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
