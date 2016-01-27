//
//  ZZGInvoiceAddItem.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGHttpBaseItem.h"

@interface ZZGInvoiceAddItem : ZZGHttpBaseItem

@property (nonatomic, strong) NSString *inv_title_select;   //发票类型，可选值：person(个人) company(单位)
@property (nonatomic, strong) NSString *inv_title;   // 发票抬头(inv_title_select为company时需要提交)
@property (nonatomic, strong) NSString *inv_content;   // 发票内容，可通过invoice_content_list接口获取可选值列表

@end
