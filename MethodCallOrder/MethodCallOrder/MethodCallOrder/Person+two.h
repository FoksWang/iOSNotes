//
//  Person+two.h
//  MethodCallOrder
//
//  Created by Hui Wang on 2019-04-27.
//  Copyright © 2019 Hui Wang. All rights reserved.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (two)

+ (void)commonClassMethod;

- (void)commonInstanceMethod;

@end

NS_ASSUME_NONNULL_END
