//
//  headerView.h
//  网易滚动视图
//
//  Created by 陈辉 on 15/10/16.
//  Copyright © 2015年 陈辉. All rights reserved.
//

#import <UIKit/UIKit.h>
@class headerView;

@protocol headerViewDelegate <NSObject>

- (void)selectedIndexChanged: (NSUInteger) index;

@end

@interface headerView : UIScrollView
@property (nonatomic) NSArray * buttonArray;

@property (nonatomic, weak) UIButton * selectedButton;
@property (nonatomic, strong) NSArray * sectionArray;
@property (nonatomic) NSUInteger selectedIndex;

@property (nonatomic, weak) id<headerViewDelegate> delegates;
@property (nonatomic,strong)NSArray * headerArray;

+ (headerView *)creatHeaderView;
- (void) setSelectedIndexAnimated:(NSUInteger)selectedIndex;
- (void)sectionButtonClicked:(UIButton *)button;

@end


