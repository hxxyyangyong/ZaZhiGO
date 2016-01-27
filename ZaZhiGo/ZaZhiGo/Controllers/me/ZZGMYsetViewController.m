//
//  ZZGMYsetViewController.m
//  ZaZhiGo
//
//  Created by 陈辉 on 16/1/14.
//  Copyright © 2016年 com.zhuocheng. All rights reserved.
//

#import "ZZGMYsetViewController.h"
#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height
@interface ZZGMYsetViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView * tableView;
@end

@implementation ZZGMYsetViewController
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //隐藏系统导航栏
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self createUI];
    // Do any additional setup after loading the view.
}
- (void)createUI{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -10, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CID"];
    [self createButton];
}

- (void)createButton{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20, HEIGHT - 200, 270, 30);
    [button setTitle:@"登出" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor grayColor];
    button.layer.cornerRadius  =  5;
    button.clipsToBounds = YES;
   // button.center = CGPointMake(ScreenWidth/2, 70);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)buttonClick{
    NSLog(@"111");
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CID" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 100, 25)];
            label1.text = @"登陆密码";
            [cell.contentView addSubview:label1];
            UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 300, 15)];
            label2.font = [UIFont systemFontOfSize:14];
            label2.text = @"建议您定期更改密码以保护账户安全";
            [cell.contentView addSubview:label2];
        }if (indexPath.row == 1) {
            UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 100, 25)];
            label1.text = @"手机验证";
            [cell.contentView addSubview:label1];
            UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 300, 15)];
            label2.font = [UIFont systemFontOfSize:14];
            label2.text = @"若您的手机已丢失或停用,请立即修改更换";
            [cell.contentView addSubview:label2];
        }if (indexPath.row == 2) {
            UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 100, 25)];
            label1.text = @"支付密码";
            [cell.contentView addSubview:label1];
            UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 300, 15)];
            label2.font = [UIFont systemFontOfSize:14];
            label2.text = @"建议您设置复杂的支付密码保护账户金额安全";
            [cell.contentView addSubview:label2];
        }
    }else if (indexPath.section == 1){
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 100, 25)];
        label1.text = @"用户反馈";
        [cell.contentView addSubview:label1];
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 300, 15)];
        label2.font = [UIFont systemFontOfSize:14];
        label2.text = @"您在使用中遇到的问题与建议可向我们反馈";
        [cell.contentView addSubview:label2];
    }else{
        cell.textLabel.text = @"安全退出";
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
