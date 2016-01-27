//
//  UINavigationBar+Action.h
//  TCTravel_IPhone
//
//  Created by Tracy－jun on 14/11/13.
//
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Action)

- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects;

//这个方法是以前行程助手解析附带xml所用，
- (id)initwithTextObj:(id) dict className:(NSString*)classname;

-(id) initWithDict:(id) dict className:(NSString*)classname;

@end

