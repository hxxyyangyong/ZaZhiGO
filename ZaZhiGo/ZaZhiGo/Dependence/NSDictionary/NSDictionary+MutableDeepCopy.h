//
//  NSDictionary+MutableDeepCopy.h
//  TCTravel_IPhone
//
//  Created by Tracy－jun on 14/11/11.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MutableDeepCopy)

- (NSMutableDictionary *)mutableDeepCopy;

- (id)objectForKeyByText:(NSString*)sKey;

@end
