//
//  ViewController.m
//  XBUtils
//
//  Created by xiabob on 16/8/23.
//  Copyright © 2016年 xiabob. All rights reserved.
//

#import "ViewController.h"
#import "XBUtils.h"

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
    
    NSDictionary *test2 = @{@"name": @"haha", @"age": [NSNull null], @"date":@[@"2015", @"12"]};
    NSLog(@"test2:\n%@", [test2 jsonRepresentation]);
    
    NSString *test3 = [test2 jsonRepresentation];
    NSLog(@"test3:\n%@", [test3 jsonValue]);
    
    NSData *test4 = [test3 dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"test4:\n%@", [test4 jsonValue]);
    
    
    //******** XBAppVersion ************//
    NSString *currentAppVersion = [XBAppVersion appVersion];
    NSLog(@"current app version: %@", currentAppVersion);
    
    NSLog(@"current app version greaterThan 0.11.1: %@", @([XBAppVersion greaterThan:@"0.11.1"]));
    NSLog(@"current app version lessThan 1.10.0: %@", @([XBAppVersion lessThan:@"1.10.0"]));
    NSLog(@"current app version same 1.0: %@", @([XBAppVersion same:@"1.0"]));
    NSLog(@"current app version lessThan 1.a: %@", @([currentAppVersion xb_lessThan:@"1.a"]));
    NSLog(@"current app version greaterThan '': %@", @([XBAppVersion greaterThan:@""]));
    NSLog(@"current app version lessThan ' ': %@", @([currentAppVersion xb_lessThan:@" "]));
    
    NSString *infoPath = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSString *md5 = [XBFileHash md5HashOfFileAtPath:infoPath];
    NSString *sha1Hash = [XBFileHash sha1HashOfFileAtPath:infoPath];
    NSString *sha512Hash = [XBFileHash sha512HashOfFileAtPath:infoPath];
    NSLog(@"md5:%@\nsha1Hash:%@\nsha512Hash:%@", md5, sha1Hash, sha512Hash);
    
    id object = [NSNull null];
    [object length]; // not crash
    
    NSNumber *age1 = [[test3 jsonValue] objectForKey:@"age"];
    NSLog(@"age1 is null:%@", @([age1 isKindOfClass:[NSNull class]]));
    
    NSNumber *age2 = Macro_RemoveNull([[test3 jsonValue] objectForKey:@"age"]);
    NSLog(@"age2 is nil:%@", @(age2 == nil));
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
