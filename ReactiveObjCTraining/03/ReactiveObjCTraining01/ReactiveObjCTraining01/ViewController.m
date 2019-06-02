//
//  ViewController.m
//  ReactiveObjCTraining01
//
//  Created by Hui Wang on 2019-04-30.
//  Copyright © 2019 Hui Wang. All rights reserved.
//


/* Higher-Order Functions
 
 Signal mapping:                map, flattenMap
 Signal filtering:              filter, ignore, distinctUntilChanged
 Signal combination:            combineLatest, reduce, merge, zipWith
 Signal connection:             concat, then
 Signal operation time:         timeout, interval, delay
 Signal value:                  take, takeLast, takeUntil
 Signal skip:                   skip
 Signal sending order:          doNext, completed
 Get the signal in the signal:  switchToLatest
 signal error retry:            retry
 
 */



#import "ViewController.h"
#import <ReactiveObjC.h>
#import "RACReturnSignal.h"

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
    
    RACSignal *signalA = self.textField.rac_textSignal;
    RACSignal *signalB = [self.button rac_signalForControlEvents:UIControlEventTouchUpInside];
    RACSignal *signalCombine = [signalA combineLatestWith:signalB];
//    [signalCombine subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@", x);
//    }];
    [[RACSignal combineLatest:@[signalA, signalB] reduce:^id (id valueA, id valueB) {
        // filter -- valueA's value.length > 6 ...
        
        return [NSString stringWithFormat:@"%@ --- %@", valueA, valueB];
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
}












- (void)demo5 {
    
    //    [[self.textField.rac_textSignal flattenMap:^__kindof RACSignal * _Nullable(NSString * _Nullable value) {
    //        NSLog(@"%@", value);
    //
    //        return [RACReturnSignal return:[NSString stringWithFormat:@"+46%@", value]];
    //    }] subscribeNext:^(id  _Nullable x) {
    //        NSLog(@"our logic: %@", x);
    //    }];
    
    [[self.textField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        if (self.textField.text.length > 6) {
            self.textField.text = [self.textField.text substringToIndex:6];
        }
        return value.length < 6;
    }] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"filter string: %@", x);
    }];
}

-(void)demo4 {
    // sequence
    NSArray *array = @[@"Apple", @"Orange", @"Pear", @"Banana"];
    [array.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    NSDictionary *dict = @{@"name": @"Foks", @"age": @18};
    [dict.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
}

- (void)demo3 {
    [[self.button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    [self.textField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    self.label.userInteractionEnabled = YES;
    [self.label addGestureRecognizer:tap];
    [[tap rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        NSLog(@"%@", x);
    }];
}


- (void)demo2 {
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardDidShowNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    // Delegate
    [[self rac_signalForSelector:@selector(textFieldDidBeginEditing:) fromProtocol:@protocol(UITextFieldDelegate)] subscribeNext:^(RACTuple * _Nullable x) {
        NSLog(@"fromProtocol %@", x);
    }];
    self.textField.delegate = self;
}

- (void)demo1 {
    //    [self addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:NULL];
    //    self.name = @"Foks";
    
    
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




//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.name = [NSString stringWithFormat:@"%@ +", self.name];
//}
//
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    NSLog(@"%@", change);
//}
//
//- (void)dealloc
//{
//    [self removeObserver:self forKeyPath:@"name"];
//}

@end
