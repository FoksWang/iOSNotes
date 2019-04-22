//
//  Person.m
//  Lazy Loading Method
//
//  Created by Hui Wang on 2019-04-12.
//  Copyright © 2019 Hui Wang. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

// come to this method if there is an unimplemented object method is called.
+(BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"This guy is coming!");
    
    // add method to here
    /**
     -cls: class type
     -SEL: method name
     -imp: method implementation (c language, it's the address of the function)
     -types: ""
     */
    class_addMethod([Person class], sel, (IMP)eat, "v@:");
    
    return [super resolveInstanceMethod:sel];
}

void eat(id self, SEL _cmd) {
    NSLog(@"This guy is called!");
}

@end
