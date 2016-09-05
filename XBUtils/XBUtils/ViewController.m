//
//  ViewController.m
//  XBUtils
//
//  Created by xiabob on 16/8/23.
//  Copyright © 2016年 xiabob. All rights reserved.
//

#import "ViewController.h"
#import "XBWeakProxy.h"
#import "XBJsonKit.h"

@protocol TestProtocal <NSObject>

- (void)test;

@end

@interface TestView : UIView

@property (nonatomic, weak) id<TestProtocal> delegate;

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

@interface ViewController ()<TestProtocal>

@property (nonatomic, strong) TestView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"begin……");
    
    //******** XBWeakProxy ***********//
    //delegate是weak，不起作用
    //_myView = [[TestView alloc] initWithDelegate:[XBWeakProxy proxyWithTarget:self]];
    _myView = [[TestView alloc] initWithDelegate:self];
    
    
    
    //******** XBJsonKit ************//
    NSArray *test1 = @[@"1", @"haha", @"天"];
    NSLog(@"test1:\n%@", [test1 jsonRepresentation]);
    
    NSDictionary *test2 = @{@"name": @"haha", @"age": @"12", @"date":@[@"2015", @"12"]};
    NSLog(@"test2:\n%@", [test2 jsonRepresentation]);
    
    NSString *test3 = [test2 jsonRepresentation];
    NSLog(@"test3:\n%@", [test3 jsonValue]);
    
    NSData *test4 = [test3 dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"test4:\n%@", [test4 jsonValue]);
    
}


//MARK: - TestProtocal
- (void)test {
    NSLog(@"TestProtocal:test");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
