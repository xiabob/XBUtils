//
//  XBCountdownTimer.m
//  XBUtils
//
//  Created by xiabob on 2017/9/15.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import "XBCountdownTimer.h"
#import <UIKit/UIKit.h>

@implementation NSObject(XBCountdownTimer)

- (void)xb_startObserverTimer {
    if ([self conformsToProtocol:@protocol(XBCountdownTimerDelegate)]) {
        [[XBCountdownTimer sharedInstance] addObserver:(id<XBCountdownTimerDelegate>)self];
    } else {
        NSAssert(NO, @"observer MUST conform XBCountdownTimerDelegate protocol");
    }
}

- (void)xb_stopObserverTimer {
    if ([self conformsToProtocol:@protocol(XBCountdownTimerDelegate)]) {
        [[XBCountdownTimer sharedInstance] removeObserver:(id<XBCountdownTimerDelegate>)self];
    } else {
        NSAssert(NO, @"observer MUST conform XBCountdownTimerDelegate protocol");
    }
}

@end

@interface XBCountdownTimer()

@property (nonatomic, strong) NSHashTable *observers;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation XBCountdownTimer

+ (instancetype)sharedInstance {
    static XBCountdownTimer *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[XBCountdownTimer alloc] init];
    });
    
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        [self addNotification];
        [self restartTimer];
    }
    
    return self;
}

- (void)dealloc {
    [self removeNotification];
    [self invilidateTimer];
}

#pragma mark - notification

- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidBecomeActive:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
}

- (void)removeNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)applicationWillEnterForeground:(NSNotification *)notification {
    [self restartTimer];
}


#pragma mark - observer add, remove

- (void)addObserver:(id<XBCountdownTimerDelegate>)observer {
    if ([observer conformsToProtocol:@protocol(XBCountdownTimerDelegate)]) {
        [self.observers addObject:observer];
    } else {
        NSAssert(NO, @"observer MUST conform XBCountdownTimerDelegate protocol");
    }
}

- (void)removeObserver:(id<XBCountdownTimerDelegate>)observer {
    if ([observer conformsToProtocol:@protocol(XBCountdownTimerDelegate)]) {
        [self.observers removeObject:observer];
    } else {
        NSAssert(NO, @"observer MUST conform XBCountdownTimerDelegate protocol");
    }
}

#pragma mark - timer

- (void)restartTimer {
    [self.timer invalidate];
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf tickDown];
    }];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)invilidateTimer {
    [self.timer invalidate];
    self.timer = nil;
    [self.observers removeAllObjects];
}

- (void)tickDown {
    NSHashTable *observers = [self.observers copy];
    for (id<XBCountdownTimerDelegate> observer in observers) {
        if ([observer respondsToSelector:@selector(timerDidTickDown:)]) {
            [observer timerDidTickDown:self];
        }
    }
}

#pragma mark - Getter

- (NSHashTable *)observers {
    if (!_observers) {
        _observers = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
    }
    
    return _observers;
}

@end
