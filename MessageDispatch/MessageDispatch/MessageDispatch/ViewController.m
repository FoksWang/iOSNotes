//
//  ViewController.m
//  MessageDispatch
//
//  Created by Hui Wang on 2019-04-06.
//  Copyright © 2019 Hui Wang. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // [object methodname]
    
//    Person *p = [[Person alloc] init];
    
//    Person *p = [Person alloc];
//    objc_getClass("Person");
//    Person *p = objc_msgSend(objc_getClass("Person"), @selector(alloc));
    
//    p = [p init];
//    Person *p = objc_msgSend(objc_msgSend(objc_getClass("Person"), @selector(alloc)), @selector(init));
    
    //[p eat];
//    [p performSelector:@selector(eat)];
    
    // message dispatch
    // c language
//    objc_msgSend(p, @selector(eat));
    objc_msgSend(objc_msgSend(objc_msgSend(objc_getClass("Person"), @selector(alloc)), @selector(init)), @selector(eat));
}


@end
