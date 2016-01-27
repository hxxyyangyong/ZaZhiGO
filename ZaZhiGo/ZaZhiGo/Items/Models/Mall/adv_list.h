//
//  adv_list.h
//  ZaZhiGo
//
//  Created by yangyong on 15/12/20.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "advtype.h"
@interface adv_list : NSObject
@property (nonatomic, strong) NSString *image;  //图片地址
@property (nonatomic, strong) advtype *type;  // 操作类型
@property (nonatomic, strong) NSString *data;  //  与操作类型对应的数据内容
@end
