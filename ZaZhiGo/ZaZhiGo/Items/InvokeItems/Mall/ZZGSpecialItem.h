//
//  ZZGSpecialItem.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGHttpBaseItem.h"

@interface ZZGSpecialItem : ZZGHttpBaseItem

@property (nonatomic, strong) NSString *special_id;     //专题编号
@property (nonatomic, strong) NSString *type;     // json/html json格式或者html页面

@end
