//
//  ZZGHead.m
//  ZaZhiGo
//
//  Created by 陈辉 on 16/1/14.
//  Copyright © 2016年 com.zhuocheng. All rights reserved.
//

#import "ZZGHead.h"
#import "ZZGLoginViewController.h"
#define ScreenWidth self.bounds.size.width
#define ScreenHeight self.bounds.size.height
@implementation ZZGHead
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建ScrollView
        //创建保持与父视图(self 坐标保持一致)
        _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _headerView.image = [UIImage imageNamed:@"IMG_0820.jpg"];
        [self addSubview:_headerView];
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    //    登录按钮
    UIButton * iconButton = [UIButton buttonWithType:UIButtonTypeCustom];
    iconButton.frame = CGRectMake(0, 0, ScreenWidth/4, ScreenWidth/4);
    iconButton.layer.cornerRadius  =  ScreenWidth/4/2;
    iconButton.clipsToBounds = YES;
    iconButton.center = CGPointMake(ScreenWidth/2, 70);
    
    [self addSubview:iconButton];
    self.iconButton = iconButton;
    [self.iconButton setBackgroundImage:[UIImage imageNamed:@"default_touxiang"] forState:UIControlStateNormal];
    [[NSNotificationCenter defaultCenter ]addObserver:self selector:@selector(creatIcon:) name:@"creatIcon" object:nil];
    
    [iconButton addTarget:self action:@selector(logInButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 30)];
    label.center = CGPointMake(ScreenWidth/2,162);
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.textColor = [UIColor greenColor];
    [self addSubview:label];
    self.nameLabel = label;
    
    [self creatButton];
}
- (void)creatButton{
    NSArray * titleArr = @[@"商品收藏",@"店铺收藏",@"我的足迹"];
    for (int i = 0; i <3; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0+ScreenWidth/3*i,ScreenHeight - 50, ScreenWidth/3, 50);
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor ] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setBackgroundColor:[UIColor clearColor]];
        button.tag = 1000+i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}
- (void)buttonClick:(UIButton *)button{
    
}
- (void)creatIcon:(NSString * )filemanager
{
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"name"]) {
        
    }else{
        
        [self.iconButton  setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSString alloc]initWithFormat:@"%@%@",[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"],  @"/image.png"]]  forState:UIControlStateNormal];
    }
}
//登录按钮
- (void)logInButtonClick{
    
    if (self.iconButtonTouch) {
        self.iconButtonTouch();
    }

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
