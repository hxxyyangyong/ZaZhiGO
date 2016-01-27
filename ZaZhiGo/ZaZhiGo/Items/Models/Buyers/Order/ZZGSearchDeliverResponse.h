//
//  ZZGSearchDeliverResponse.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGBaseResponse.h"

@interface ZZGSearchDeliverResponse : ZZGBaseResponse
@property (nonatomic, strong) NSString *express_name;   //  物流公司名称
@property (nonatomic, strong) NSString *shipping_code;   //  物流编号
@property (nonatomic, strong) NSString *deliver_info;   //  物流信息
@end
