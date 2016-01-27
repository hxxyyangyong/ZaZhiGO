//
//  ZZGCartAddItem.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGHttpBaseItem.h"

@interface ZZGCartAddItem : ZZGHttpBaseItem
@property (nonatomic, strong) NSString       *goods_id;     //商品编号
@property (nonatomic, strong) NSString       *quantity;     // 购买数量

@end
