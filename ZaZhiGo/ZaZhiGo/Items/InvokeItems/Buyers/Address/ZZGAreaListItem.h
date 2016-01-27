//
//  ZZGAreaListItem.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGHttpBaseItem.h"

@interface ZZGAreaListItem : ZZGHttpBaseItem

@property (nonatomic, strong) NSString *area_id;    // 地址编号 地区编号(为空时默认返回一级分类)

@end
