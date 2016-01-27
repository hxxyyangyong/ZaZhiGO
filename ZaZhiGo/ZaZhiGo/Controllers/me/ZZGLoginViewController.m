//
//  ZZGLoginViewController.m
//  ZaZhiGo
//
//  Created by 陈辉 on 16/1/14.
//  Copyright © 2016年 com.zhuocheng. All rights reserved.
//

#import "ZZGLoginViewController.h"

@interface ZZGLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userText;
@property (weak, nonatomic) IBOutlet UITextField *passWordText;
@property (weak, nonatomic) IBOutlet UIButton *loginOnButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *forgetButton;
- (IBAction)loginOnButton:(UIButton *)sender;
- (IBAction)registerButton:(UIButton *)sender;
- (IBAction)forgotButton:(UIButton *)sender;

@end

@implementation ZZGLoginViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //隐藏系统导航栏
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self creatNav];
    [self createUI];
    // Do any additional setup after loading the view from its nib.
}
- (void)creatNav{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 30);
    [button setTitle:@"关闭"  forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = buttonItem;
}
- (void)buttonClick:(UIButton*)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)createUI{
    self.loginOnButton.enabled = NO;
    self.userText.delegate = self;
    self.passWordText.delegate = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
    [self.view addGestureRecognizer:tap];
}
-(void)dealTap:(UITapGestureRecognizer *)tap
{
    //回收键盘
    [self.passWordText resignFirstResponder];
    [self.userText resignFirstResponder];
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.userText.text.length < 1||self.passWordText.text.length < 1 ){
        
        self.loginOnButton.enabled = NO;
        
    }else{
        self.loginOnButton.enabled = YES;
        
    }
}

-(NSString *)dirDoc{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths[0] stringByAppendingPathComponent:@"password.plist"];
    ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginOnButton:(UIButton *)sender {
    NSString * name = self.userText.text;
    NSString * pwd = self.passWordText.text;
    NSMutableDictionary * passwordDict =  passwordDict = [NSMutableDictionary dictionaryWithContentsOfFile:[self dirDoc]];;
    if (![[passwordDict objectForKey:name] isEqualToString:pwd]) {
        
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"账号或密码错误" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        //通过这种方式添加
        [alert show];
        return;
    }else{
        [self dismissViewControllerAnimated:YES completion:^{
            
            
        }];
        
    }
    //系统提供的一个键值存储plist文件工具类
    //使用方法就是与可变字典对象相同
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    
    [ud setObject:name forKey:@"name"];
    [ud setObject:pwd forKey:@"pwd"];
    
    //立即执行存储到plist文件中
    [ud synchronize];
    

}

- (IBAction)registerButton:(UIButton *)sender {
}

- (IBAction)forgotButton:(UIButton *)sender {
}
@end
