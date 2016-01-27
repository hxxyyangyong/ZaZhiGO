//
//  ZZGHead.h
//  ZaZhiGo
//
//  Created by 陈辉 on 16/1/14.
//  Copyright © 2016年 com.zhuocheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZGHead : UIView
//登录
@property (nonatomic,strong)void(^iconButtonTouch)();

@property (nonatomic,strong)UIImageView * headerView;
@property (nonatomic ,weak)UILabel * nameLabel;
@property (nonatomic,weak)UIButton * iconButton;
@end
