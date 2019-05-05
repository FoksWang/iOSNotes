//
//  ViewController.m
//  ReactiveObjCTraining01
//
//  Created by Hui Wang on 2019-04-30.
//  Copyright © 2019 Hui Wang. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC.h>

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (nonatomic, copy) NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:NULL];
    self.name = @"Foks";
    
    
    // Advantages:
    // convenient hints
    // one line code
    // logic code and function code in the same place
    
    // Disadvantages:
    // required abilities
    // communication costs
    
    
    
    [RACObserve(self, name) subscribeNext:^(id  _Nullable x) {
        NSLog(@"RAC %@", x);
    }];
}







- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.name = [NSString stringWithFormat:@"%@ +", self.name];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@", change);
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"name"];
}

@end
