//
//  headerView.m
//  网易滚动视图
//
//  Created by 陈辉 on 15/10/16.
//  Copyright © 2015年 陈辉. All rights reserved.
//

#import "headerView.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenBounds [UIScreen mainScreen].bounds
@interface headerView()


@property (nonatomic, strong) UIView * indicatorView;


@property (nonatomic) BOOL modify;


@end
@implementation headerView
+ (id)creatHeaderView{
    
    return [[self alloc]init];
    
}
- (instancetype)init{
    
    if (self  =   [super init]) {
        
        [self creatUI];
        
    }
    return  self;
}
- (void)creatUI{
    
    self.indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 42, ScreenWidth/4, 2)];
    self.indicatorView.backgroundColor = [UIColor colorWithRed:12/255.0 green:199/255.0 blue:180/255.0 alpha:1];
    self.indicatorView.layer.cornerRadius = 20;
    self.indicatorView.clipsToBounds = YES;
    [self addSubview:self.indicatorView];
    self.bounces = YES;
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 43, ScreenWidth, 0.3)];
    image.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:image];
}
- (UIButton *)selectedButton
{
    return self.buttonArray[self.selectedIndex];
}

- (void)setHeaderArray:(NSArray *)headerArray{
    
    NSMutableArray * buttonArray = [NSMutableArray arrayWithCapacity:headerArray.count];
    
    _headerArray = headerArray;
    float x = 0;
    for (NSString * title in headerArray) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.backgroundColor = [UIColor clearColor];
        button.frame= CGRectMake(x, 0, ScreenWidth/4, 44);
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:12/255.0 green:199/255.0 blue:180/255.0 alpha:1] forState:UIControlStateSelected];
        [self addSubview:button];
        [buttonArray addObject:button];
        if (x == 0) {
            button.selected = YES;

        }
        [button addTarget:self action:@selector(sectionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        x += ScreenWidth/4;
    }
    
    self.buttonArray = buttonArray;
    self.contentSize = CGSizeMake(x, 1);
    
}
- (void)sectionButtonClicked:(UIButton *)button{
    
    
    NSUInteger newIndex = [self.buttonArray indexOfObject:button];
    if (newIndex==self.selectedIndex) {
        return;
    }
    self.selectedIndex = newIndex;
    [self setSelectedIndexAnimated:newIndex];

    
}
- (void) setSelectedIndexAnimated:(NSUInteger)selectedIndex
{
    self.selectedIndex = selectedIndex;
    for (UIButton * button in self.buttonArray) {
        button.selected = NO;
    }
    self.selectedButton.selected = YES;
    [UIView animateWithDuration:0.2 animations:^{

        self.indicatorView.frame = CGRectMake(self.selectedButton.frame.origin.x, self.selectedButton.frame.origin.y +42, self.selectedButton.frame.size.width, 2) ;

    } completion:^(BOOL finished) {

        CGRect  rect = [self  convertRect: CGRectMake(self.selectedButton.frame.origin.x-self.frame.size.width/2, self.selectedButton.frame.origin.y, self.frame.size.width, self.selectedButton.frame.size.height) toView:self];
        [self scrollRectToVisible:rect  animated:YES];
        

      
    }];
    if (self.delegates && [self.delegates respondsToSelector:@selector(selectedIndexChanged:)]) {

        [self.delegates  selectedIndexChanged:selectedIndex];

    }


}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    
    self.frame = CGRectMake(0, 64, ScreenWidth, 44);
    
}

@end
