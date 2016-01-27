//
//  ZZGGoodsListItem.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGHttpBaseItem.h"

@interface ZZGGoodsListItem : ZZGHttpBaseItem
@property (nonatomic, strong) NSString *order;  //排序方式 1-升序 2-降序
@property (nonatomic, strong) NSString *page;  // 每页数量
@property (nonatomic, strong) NSString *curpage;  // 当前页码
@property (nonatomic, strong) NSString *gc_id;  // 分类编号
@property (nonatomic, strong) NSString *keyword;  // 搜索关键字
@property (nonatomic, strong) NSString *barcode;  // 商品条形码
@property (nonatomic, strong) NSString *b_id;  // 品牌id
//gc_id、keyword、barcode、b_id 四选一不能同时出现

@end
