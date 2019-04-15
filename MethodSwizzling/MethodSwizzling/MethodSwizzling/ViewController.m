//
//  ViewController.m
//  MethodSwizzling
//
//  Created by Hui Wang on 2019-04-09.
//  Copyright © 2019 Hui Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"www.apple.com/äta"];
    
    
    NSLog(@"%@", url);
    
    
    // send request...
}


@end
