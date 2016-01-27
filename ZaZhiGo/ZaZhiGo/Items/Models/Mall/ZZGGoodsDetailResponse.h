//
//  ZZGGoodsDetailResponse.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBaseResponse.h"
#import "store_info.h"
#import "goods_commend_list.h"
#import "mansong_info.h"
@interface ZZGGoodsDetailResponse : ZZGBaseResponse
@property (nonatomic, strong) NSString *goods_info;     //商品信息
@property (nonatomic, strong) store_info *store_info;
@property (nonatomic, strong) NSString *spec_list;     // 规格列表
@property (nonatomic, strong) NSString *gift_array;     // 赠品数组
@property (nonatomic, strong) NSString *spec_image;     // 规格图片
@property (nonatomic, strong) NSString *goods_image;     // 商品图片
@property (nonatomic, strong) NSMutableArray *goods_commend_list;     // 推荐商品列表
@property (nonatomic, strong) mansong_info *mansong_info;     // 满即送信息
@property (nonatomic, strong) NSString *is_favorate;     // 是否已经收藏(请求时需提交key)
@property (nonatomic, strong) NSString *cart_count;     // 购物车数量(请求时需提交key)
@end
