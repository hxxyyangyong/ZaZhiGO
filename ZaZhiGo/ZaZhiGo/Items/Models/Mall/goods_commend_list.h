//
//  goods_commend_list.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface goods_commend_list : NSObject
@property (nonatomic, strong) NSString *goods_id;     // 商品编号
@property (nonatomic, strong) NSString *goods_name;     // 商品名称
@property (nonatomic, strong) NSString *goods_price;     // 商品价格
@property (nonatomic, strong) NSString *goods_promotion_price;     // 促销价格
@property (nonatomic, strong) NSString *goods_image_url;     // 商品图片
@end
