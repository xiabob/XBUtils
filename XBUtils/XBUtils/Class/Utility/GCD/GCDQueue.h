//
//  GCDQueue.h
//  XBUtils
//
//  Created by xiabob on 2017/12/4.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDQueue : NSObject

@property (nonatomic, strong, readonly) dispatch_queue_t dispatchQueue;


+ (void)executeInMainQueue:(dispatch_block_t)block afterDelay:(NSTimeInterval)sec;
+ (void)executeInMainQueue:(dispatch_block_t)block;

+ (void)executeInGlobalQueue:(dispatch_block_t)block afterDelay:(NSTimeInterval)sec;
+ (void)executeInGlobalQueue:(dispatch_block_t)block;

+ (void)executeInHighPriorityGlobalQueue:(dispatch_block_t)block afterDelay:(NSTimeInterval)sec;
+ (void)executeInHighPriorityGlobalQueue:(dispatch_block_t)block;

+ (void)executeInLowPriorityGlobalQueue:(dispatch_block_t)block afterDelay:(NSTimeInterval)sec;
+ (void)executeInLowPriorityGlobalQueue:(dispatch_block_t)block;

+ (void)executeInBackgroundPriorityGlobalQueue:(dispatch_block_t)block afterDelay:(NSTimeInterval)sec;
+ (void)executeInBackgroundPriorityGlobalQueue:(dispatch_block_t)block;

- (instancetype)initSerial;
- (instancetype)initSerialWithLabel:(NSString *)label;
- (instancetype)initConcurrent;
- (instancetype)initConcurrentWithLabel:(NSString *)label;

- (void)execute:(dispatch_block_t)block;
- (void)execute:(dispatch_block_t)block afterDelay:(NSTimeInterval)sec;

@end

