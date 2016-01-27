//
//  invoice_list.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface invoice_list : NSObject

@property (nonatomic, strong) NSString       *inv_id;   //发票编号
@property (nonatomic, strong) NSString       *inv_title;   // 发票抬头
@property (nonatomic, strong) NSString       *inv_content;   // 发票内容

@end
