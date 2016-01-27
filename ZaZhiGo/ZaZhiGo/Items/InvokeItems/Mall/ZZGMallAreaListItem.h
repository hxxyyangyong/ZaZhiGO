//
//  ZZGMallAreaListItem.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGHttpBaseItem.h"

@interface ZZGMallAreaListItem : ZZGHttpBaseItem
@property (nonatomic, strong) NSString *area_id;    //地区编号(为空时默认返回一级分类)
@end
