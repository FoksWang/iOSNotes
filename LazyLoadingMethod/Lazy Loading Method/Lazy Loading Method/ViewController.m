//
//  ViewController.m
//  Lazy Loading Method
//
//  Created by Hui Wang on 2019-04-12.
//  Copyright © 2019 Hui Wang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *p = [[Person alloc] init];
    
    [p performSelector:@selector(eat)];
    
}


@end
