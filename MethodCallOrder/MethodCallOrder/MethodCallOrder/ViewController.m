//
//  ViewController.m
//  MethodCallOrder
//
//  Created by Hui Wang on 2019-04-27.
//  Copyright © 2019 Hui Wang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Child.h"
#import "Person+one.h"
#import "Person+two.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [Person commonClassMethod];
//    [[Person new] commonInstanceMethod];
    
//    [Child commonClassMethod];
    [[Child new] commonInstanceMethod];
}


@end
