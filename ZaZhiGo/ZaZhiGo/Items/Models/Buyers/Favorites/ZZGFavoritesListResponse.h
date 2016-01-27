//
//  ZZGFavoritesListResponse.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBaseResponse.h"

@interface ZZGFavoritesListResponse : ZZGBaseResponse

@property (nonatomic, strong) NSMutableArray    *favorites_list;   //店铺ID

@end
