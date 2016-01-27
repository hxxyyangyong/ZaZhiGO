//
//  favorites_list.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface favorites_list : NSObject

@property (nonatomic, strong) NSString    *store_id;    //店铺ID
@property (nonatomic, strong) NSString    *store_name;    // 店铺名称
@property (nonatomic, strong) NSString    *fav_time;    // 收藏时间戳
@property (nonatomic, strong) NSString    *fav_time_text;    // 收藏时间
@property (nonatomic, strong) NSString    *goods_count;    // 商品数
@property (nonatomic, strong) NSString    *store_collect;    // 收藏数
@property (nonatomic, strong) NSString    *store_avatar;    // 店铺头像文件名
@property (nonatomic, strong) NSString    *store_avatar_url;    // 店铺头像文件URL

@end
