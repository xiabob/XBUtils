//
//  XBCountdownTimer.h
//  XBUtils
//
//  Created by xiabob on 2017/9/15.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XBCountdownTimer;

@interface NSObject(XBCountdownTimer)

- (void)xb_startObserverTimer;
- (void)xb_stopObserverTimer;

@end

@protocol XBCountdownTimerDelegate <NSObject>

- (void)timerDidTickDown:(XBCountdownTimer *)timer;

@end

@interface XBCountdownTimer : NSObject

+ (instancetype)sharedInstance;

- (void)addObserver:(id<XBCountdownTimerDelegate>)observer;
- (void)removeObserver:(id<XBCountdownTimerDelegate>)observer;
- (void)invilidateTimer;

@end
