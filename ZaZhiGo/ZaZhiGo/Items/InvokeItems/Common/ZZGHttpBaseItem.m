//
//  ZZGHttpBaseItem.m
//  ZaZhiGo
//
//  Created by yangyong on 15/12/15.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import "ZZGHttpBaseItem.h"

#define D_PHP_Prefix @"app/index.php?"

@interface ZZGHttpBaseItem()

@end

@implementation ZZGHttpBaseItem


- (void)setZZGSuccessCallback:(void (^) (ZZGBaseResponse *item))success
           failureCallback:(void (^) (ZZGHttpBaseItem *item))failure

{
    ZZGHttpDataCallback = [success copy];
    ZZGHttpFailureCallback = [failure copy];

}

- (void)successCallbackWithData:(ZZGHttpBaseItem *)successitem
{
    NSString *className = NSStringFromClass([self class]);
    NSString *responseClassName = [className stringByReplacingOccurrencesOfString:@"Item" withString:@"Response"];
    NSString *resultStr = [successitem resultStrWithResponseData];
    if ([resultStr.lowercaseString rangeOfString:@"\\u"].location != NSNotFound) {
        NSString *tempStr1 = [resultStr stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
        NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
        NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2]stringByAppendingString:@"\""];
        NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
        NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                               mutabilityOption:NSPropertyListImmutable
                                                                         format:NULL
                                                               errorDescription:NULL];
        successitem.responseData = [returnStr JSONData];
    }
    
    
    
    ZZGBaseResponse *successitemResponse  = [[NSClassFromString(responseClassName) alloc] initWithDict:[successitem.responseData objectFromJSONData] className:responseClassName];
    ZZGHttpDataCallback(successitemResponse);
}

- (void)failureCallBackWithData:(ZZGHttpBaseItem *)failureitem
{
    ZZGHttpFailureCallback(failureitem);
}

- (void)serializeHTTPRequest
{
    [super serializeHTTPRequest];
    self.method = E_Http_Method_POST;
    self.parameters = [[NSMutableDictionary alloc] init];
    self.releativeUrlString = [[NSMutableString alloc] initWithString:D_PHP_Prefix];
    [self displayCurrentModlePropertyToParameters];
}



- (void) displayCurrentModlePropertyToParameters
{
    //获取实体类的属性名
    NSArray *array = [self allPropertyNames];
    //拼接参数
    for (int i = 0; i < array.count; i ++) {
        //获取get方法
        SEL getSel = [self creatGetterWithPropertyName:array[i]];
        if ([self respondsToSelector:getSel]) {
            //获得类和方法的签名
            NSMethodSignature *signature = [self methodSignatureForSelector:getSel];
            //从签名获得调用对象
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            //设置target
            [invocation setTarget:self];
            //设置selector
            [invocation setSelector:getSel];
            //接收返回的值
            NSObject *__unsafe_unretained returnValue = nil;
            //调用
            [invocation invoke];
            //接收返回值
            [invocation getReturnValue:&returnValue];
            if (returnValue) {
                [self.parameters setObject:returnValue forKey:array[i]];
            }
        }
    }
    
    
}

///通过运行时获取当前对象的所有属性的名称，以数组的形式返回
- (NSArray *) allPropertyNames{
    ///存储所有的属性名称
    NSMutableArray *allNames = [[NSMutableArray alloc] init];
    
    ///存储属性的个数
    unsigned int propertyCount = 0;
    
    ///通过运行时获取当前类的属性
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
    
    //把属性放到数组中
    for (int i = 0; i < propertyCount; i ++) {
        ///取出第一个属性
        objc_property_t property = propertys[i];
        
        const char * propertyName = property_getName(property);
        
        [allNames addObject:[NSString stringWithUTF8String:propertyName]];
    }
    
    ///释放
    free(propertys);
    
    return allNames;
}

#pragma mark -- 通过字符串来创建该字符串的Setter方法，并返回
- (SEL) creatGetterWithPropertyName: (NSString *) propertyName{
    
    //1.返回get方法: oc中的get方法就是属性的本身
    return NSSelectorFromString(propertyName);
}

@end
