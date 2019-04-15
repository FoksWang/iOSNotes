//
//  NSURL+url.m
//  MethodSwizzling
//
//  Created by Hui Wang on 2019-04-09.
//  Copyright © 2019 Hui Wang. All rights reserved.
//

#import "NSURL+url.h"
#import <objc/message.h>

@implementation NSURL (url)

// runtime method exchange

+ (void)load {
    // implement method exchange here.
    Method URLWithStr = class_getClassMethod([NSURL class], @selector(URLWithString:));
    Method FWURLWithStr = class_getClassMethod([NSURL class], @selector(FW_URLWithString:));
    method_exchangeImplementations(URLWithStr, FWURLWithStr);
    
}


// important!!
+ (instancetype)FW_URLWithString:(NSString *)string {
    
    
    NSURL *url = [NSURL FW_URLWithString:string];
    
    if (url == nil) {
        NSLog(@"This guy is empty!");
    }
    return url;
}

@end
