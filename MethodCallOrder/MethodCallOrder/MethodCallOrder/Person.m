//
//  Person.m
//  MethodCallOrder
//
//  Created by Hui Wang on 2019-04-27.
//  Copyright © 2019 Hui Wang. All rights reserved.
//

#import "Person.h"

@implementation Person

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
