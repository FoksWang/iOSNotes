//
//  NSURL+url.h
//  MethodSwizzling
//
//  Created by Hui Wang on 2019-04-09.
//  Copyright © 2019 Hui Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (url)

+ (instancetype)FW_URLWithString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
