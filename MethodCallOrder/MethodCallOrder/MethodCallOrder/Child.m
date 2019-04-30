//
//  Child.m
//  MethodCallOrder
//
//  Created by Hui Wang on 2019-04-27.
//  Copyright © 2019 Hui Wang. All rights reserved.
//

#import "Child.h"

@implementation Child

+ (void)load {
    FWLog();
}

+ (void)commonClassMethod {
    FWLog();
}

- (void)commonInstanceMethod {
    FWLog();
}

+ (void)initialize {
    FWLog();
}

@end
