//
//  ZZGVoucherListResponse.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBaseResponse.h"
#import "voucher_list.h"
@interface ZZGVoucherListResponse : ZZGBaseResponse
@property (nonatomic, strong) NSMutableArray *voucher_list;
@end
