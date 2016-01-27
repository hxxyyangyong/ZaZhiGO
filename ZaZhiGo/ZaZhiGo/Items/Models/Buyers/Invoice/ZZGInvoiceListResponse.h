//
//  ZZGInvoiceListResponse.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBaseResponse.h"
#import "invoice_list.h"
@interface ZZGInvoiceListResponse : ZZGBaseResponse
@property (nonatomic, strong) NSMutableArray       *invoice_list;
@end
