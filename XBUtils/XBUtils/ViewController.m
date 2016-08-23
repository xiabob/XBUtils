//
//  ViewController.m
//  XBUtils
//
//  Created by xiabob on 16/8/23.
//  Copyright © 2016年 xiabob. All rights reserved.
//

#import "ViewController.h"
#import "XBWeakProxy.h"

@protocol testProtocal <NSObject>

- (void)test;

@end

@interface TestView : UIView

@property (nonatomic, weak) id<testProtocal> delegate;

@end

@implementation TestView

- (instancetype)initWithDelegate:(id)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hello) userInfo:nil repeats:NO];
    }
    return self;
}

- (void)hello {
    if ([self.delegate respondsToSelector:@selector(test)]) {
        [self.delegate test];
    }
}

@end

@interface ViewController ()<testProtocal>

@property (nonatomic, strong) TestView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"begin……");
    
    //delegate是weak，不起作用
    _myView = [[TestView alloc] initWithDelegate:[XBWeakProxy proxyWithTarget:self]];
//    _myView = [[TestView alloc] initWithDelegate:self];
    
}

- (void)test {
    NSLog(@"test");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
