//
//  NSDictionary+MutableDeepCopy.m
//  TCTravel_IPhone
//
//  Created by Tracy－jun on 14/11/11.
//
//

#import "NSDictionary+MutableDeepCopy.h"

@implementation NSDictionary (MutableDeepCopy)

-(NSMutableDictionary *)mutableDeepCopy
{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] initWithCapacity:[self count]];
    
    [[self allKeys] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id value = [self objectForKey:obj];
        id copyValue;
        if ([value respondsToSelector:@selector(mutableDeepCopy)]) {
            copyValue = [value mutableCopy];
        }else if([value respondsToSelector:@selector(mutableCopy)]){
            copyValue = [value mutableCopy];
        }
        
        if (copyValue == nil) {
            copyValue = [value copy];
        }
        
        [dict setObject:copyValue forKey:obj];
    }];
    
    return dict;
}

- (id)objectForKeyByText:(NSString*)sKey
{
    id param = [[self objectForKey:@"param"] objectForKey:sKey];
    if ([param isKindOfClass:[NSMutableDictionary class]]) {
        NSMutableDictionary *dic = (NSMutableDictionary*)param;
        NSString *str = [dic objectForKey:@"text"];
        return str;
    }
    else if ([param isKindOfClass:[NSArray class]]) {
        //这边主要是XML数组里面每个dict 还包含 text 在此去除text
        NSMutableArray *temParam = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in param) {
            NSEnumerator *enumer = [dict keyEnumerator];
            NSMutableDictionary *mutDict = [[NSMutableDictionary alloc] init];
            
            for (NSString *key in enumer) {
                if ([key isEqualToString:@"text"]) {
                    continue;
                }
                if ([dict objectForKey:key]) {
                    NSDictionary *tmpDict = [dict objectForKey:key];
                    if ([tmpDict count] > 0) {
                        [mutDict setObject:[[dict objectForKey:key] objectForKey:@"text"] forKey:key];
                    }
                }
            }
            
            [temParam addObject:mutDict];
        }
        return temParam;
    }
    return @"";
    
}

@end
