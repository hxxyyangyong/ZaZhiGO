//
//  UINavigationBar+Action.m
//  TCTravel_IPhone
//
//  Created by Tracy－jun on 14/11/13.
//
//

#import "NSObject+Action.h"
#import "NSDictionary+MutableDeepCopy.h"
@implementation NSObject (Action)


- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects {
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    if (signature) {
        NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:selector];
        for(int i = 0; i < [objects count]; i++){
            id object = [objects objectAtIndex:i];
            [invocation setArgument:&object atIndex: (i + 2)];
        }
        [invocation invoke];
        if (signature.methodReturnLength) {
            id anObject;
            [invocation getReturnValue:&anObject];
            return anObject;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

- (id)initwithTextObj:(id) dict className:(NSString*)classname {
    @synchronized (self) {
        if (!dict)
            return self;
        unsigned int propCount=0;
        Class c = objc_getClass([classname cStringUsingEncoding:NSUTF8StringEncoding]);
        objc_property_t *properties = class_copyPropertyList([c class], &propCount);
        for (int j =0 ; j < propCount ;j++) {
            objc_property_t property = properties[j];
            if (property==NULL) {
                break;
            }
            const char *propType = getPropertyType(property);
            const char *propName = property_getName(property);
            NSString *name =[NSString stringWithCString:propName encoding:NSUTF8StringEncoding];
            NSString *type =[NSString stringWithCString:propType encoding:NSUTF8StringEncoding];
            if (type==nil) {
                type=[NSString stringWithCString:propType encoding:NSASCIIStringEncoding];
            }
            if(type==nil)
                type=name;
            if(propName) {
                id obj = [dict objectForKeyByText:name];
                if (!obj)
                    continue;
                if ([type isEqualToString:@"i"] || [type isEqualToString:@"l"] || [type isEqualToString:@"s"]) {
                    [self setValue:[NSNumber numberWithInteger:[obj integerValue]] forKey:name];
                } else if ([type isEqualToString:@"I"] || [type isEqualToString:@"L"] || [type isEqualToString:@"S"]) {
                    [self setValue:[NSNumber numberWithLongLong:[obj longLongValue]] forKey:name];
                } else if ([type isEqualToString:@"f"] || [type isEqualToString:@"d"]) {
                    [self setValue:[NSNumber numberWithDouble:[obj doubleValue]] forKey:name];
                } else if ([type isEqualToString:@"NSString"]||[type hasPrefix:@"NSString"]) {
                    [self setValue:[NSString stringWithString:obj] forKey:name];
                } else if ([type isEqualToString:@"c"]) {
                    [self setValue:[NSNumber numberWithChar:[obj charValue]] forKey:name];
                } else if ([type isEqualToString:@"NSMutableArray"] || [type isEqualToString:@"NSArray"]){
                    NSMutableArray *array=[[NSMutableArray alloc] init];
                    if ([(NSMutableArray*)obj count]>0) {
                        for (id adic in obj) {
                            if ([adic  isKindOfClass:[NSString class]]) {
                                [array addObject:adic];
                            }else {
                                id item=[[NSClassFromString(name) alloc] initWithDict:adic className:name];
                                [array addObject:item];
                            }
                        }
                    }
                    [self setValue:array forKey:name];
                }else {
                    if ([obj isKindOfClass:[NSString class]]) {
                        [self setValue:[NSString stringWithString:obj] forKey:name];
                    }else{
                        id item=[[NSClassFromString(type) alloc] initWithDict:obj className:type];
                        [self setValue:item forKey:name];
                    }
                }
            }
        }
        free(properties);
    }
    return self;
}

static const char * getPropertyType(objc_property_t property) {
    const char *attributes = property_getAttributes(property);
    
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T' && attribute[1] != '@') {
            char *attributeTemp=(char *)[[NSData dataWithBytes:(attribute + 1) length:strlen(attribute)] bytes];
            char *p = strtok(attributeTemp, "\"");
            if(p)
            {
                return (const char*)p;
            }
            p = strtok(NULL, "\"");
            if(p)
                return  (const char*)p;
        }
        else if (attribute[0] == 'T' && attribute[1] == '@' && strlen(attribute) == 2) {
            // it's an ObjC id type:
            return "id";
        }
        else if (attribute[0] == 'T' && attribute[1] == '@') {
            // it's another ObjC object type:
            char *attributeTemp=(char *)[[NSData dataWithBytes:(attribute + 3) length:strlen(attribute)] bytes];
            char *p = strtok(attributeTemp, "\"");
            if(p)
            {
                return (const char*)p;
            }
            p = strtok(NULL, "\"");
            if(p)
                return  (const char*)p;
        }
        return nil;
    }
    return nil;
}

- (NSMutableArray *)objc_property_t_WithClassName:(NSString*)classname
{
    NSMutableArray *array = [NSMutableArray array];
    Class c = objc_getClass([classname cStringUsingEncoding:NSUTF8StringEncoding]);
    unsigned int propCount=0;
    objc_property_t *properties = class_copyPropertyList([c class], &propCount);
    for (int j =0 ; j < propCount ;j++) {
        objc_property_t property = properties[j];
        if (property==NULL) {
            break;
        }
        const char *propType = getPropertyType(property);
        const char *propName = property_getName(property);
        NSString *name =[NSString stringWithCString:propName encoding:NSUTF8StringEncoding];
        NSString *type =[NSString stringWithCString:propType encoding:NSUTF8StringEncoding];
        if (type==nil) {
            type=[NSString stringWithCString:propType encoding:NSASCIIStringEncoding];
        }
        if(type==nil)
            type=name;
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        if (name && type) {
            [dict setObject:name forKey:@"name"];
            [dict setObject:type forKey:@"type"];
        }
        [array addObject:dict];
    }
    if ([c superclass] != [NSObject class]) {
        [array addObjectsFromArray:[self objc_property_t_WithClassName:NSStringFromClass([c superclass])]];
    }
     free(properties);
    
    return array;
}

-(id) initWithDict:(id) dict className:(NSString*)classname{
    @synchronized (self) {
        if (!dict)
            return self;
        NSMutableArray *properties = [self objc_property_t_WithClassName:classname];
        for (int j =0 ; j < properties.count ;j++) {
            NSDictionary *propertyDict = [properties objectAtIndex:j];
            if (propertyDict == nil) {
                break;
            }
            NSString *name = [propertyDict objectForKey:@"name"];
            NSString *type = [propertyDict objectForKey:@"type"];
            if(name) {
                id obj = [dict objectForKey:name];
                if (!obj)
                    continue;
                if ([type isEqualToString:@"i"] || [type isEqualToString:@"l"] || [type isEqualToString:@"s"]) {
                    [self setValue:[NSNumber numberWithInteger:[obj integerValue]] forKey:name];
                } else if ([type isEqualToString:@"I"] || [type isEqualToString:@"L"] || [type isEqualToString:@"S"]) {
                    [self setValue:[NSNumber numberWithLongLong:[obj longLongValue]] forKey:name];
                } else if ([type isEqualToString:@"f"] || [type isEqualToString:@"d"]) {
                    [self setValue:[NSNumber numberWithDouble:[obj doubleValue]] forKey:name];
                } else if ([type isEqualToString:@"NSString"]||[type hasPrefix:@"NSString"]) {
                    [self setValue:[NSString stringWithString:obj] forKey:name];
                } else if ([type isEqualToString:@"c"]) {
                    [self setValue:[NSNumber numberWithChar:[obj charValue]] forKey:name];
                } else if ([type isEqualToString:@"NSMutableArray"] || [type isEqualToString:@"NSArray"]){
                    NSMutableArray *array=[[NSMutableArray alloc] init];
                    if ([(NSMutableArray*)obj count]>0) {
                        for (id adic in obj) {
                            if ([adic  isKindOfClass:[NSString class]]) {
                                [array addObject:adic];
                            }else {
                                id item=[[NSClassFromString(name) alloc] initWithDict:adic className:name];
                                [array addObject:item];
                            }
                        }
                    }
                    [self setValue:array forKey:name];
                }else {
                    if ([obj isKindOfClass:[NSString class]]) {
                        [self setValue:[NSString stringWithString:obj] forKey:name];
                    }else{
                        id item=[[NSClassFromString(type) alloc] initWithDict:obj className:type];
                        [self setValue:item forKey:name];
                    }
                }
            }
        }
//        free(properties);
    }
    return self;
}

@end
