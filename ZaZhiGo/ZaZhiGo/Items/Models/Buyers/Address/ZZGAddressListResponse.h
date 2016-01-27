//
//  ZZGAddressListResponse.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBaseResponse.h"
#import "address_list.h"
@interface ZZGAddressListResponse : ZZGBaseResponse

@property (nonatomic, strong) NSMutableArray *address_list;

@end
