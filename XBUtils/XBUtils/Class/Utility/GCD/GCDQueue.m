//
//  GCDQueue.m
//  XBUtils
//
//  Created by xiabob on 2017/12/4.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import "GCDQueue.h"

static GCDQueue *mainQueue;
static GCDQueue *globalQueue;
static GCDQueue *highPriorityGlobalQueue;
static GCDQueue *lowPriorityGlobalQueue;
static GCDQueue *backgroundPriorityGlobalQueue;

@interface GCDQueue ()

@property (nonatomic, strong, readwrite) dispatch_queue_t dispatchQueue;

@end

@implementation GCDQueue


+ (void)initialize {
    /**
     The runtime sends initialize to each class in a program just before the class, or any class that inherits from it, is sent its first message from within the program.
     
     1. The runtime sends the initialize message to classes in a thread-safe manner.
     
     2. initialize is invoked only once per class. If you want to perform independent initialization for the class and for categories of the class, you should implement load methods.
     
     3. The superclass implementation may be called multiple times if subclasses do not implement initialize. f you want to protect yourself from being run multiple times, you can structure your implementation along these lines:
     
     + (void)initialize {
     if (self == [ClassName self]) {
     // ... do the initialization ...
     }
     }
     
     */
    
    if (self == [GCDQueue self]) {
        mainQueue                                   = [GCDQueue new];
        globalQueue                                 = [GCDQueue new];
        highPriorityGlobalQueue                     = [GCDQueue new];
        lowPriorityGlobalQueue                      = [GCDQueue new];
        backgroundPriorityGlobalQueue               = [GCDQueue new];
        
        mainQueue.dispatchQueue                     = dispatch_get_main_queue();
        globalQueue.dispatchQueue                   = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
        highPriorityGlobalQueue.dispatchQueue       = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
        lowPriorityGlobalQueue.dispatchQueue        = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
        backgroundPriorityGlobalQueue.dispatchQueue = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
    }
}

#pragma mark - Class Methods

+ (GCDQueue *)mainQueue {
    return mainQueue;
}

+ (GCDQueue *)globalQueue {
    return globalQueue;
}

+ (GCDQueue *)highPriorityGlobalQueue {
    return highPriorityGlobalQueue;
}

+ (GCDQueue *)lowPriorityGlobalQueue {
    return lowPriorityGlobalQueue;
}

+ (GCDQueue *)backgroundPriorityGlobalQueue {
    return backgroundPriorityGlobalQueue;
}

+ (void)_executeInQueue:(dispatch_queue_t)queue block:(dispatch_block_t)block after:(NSTimeInterval)sec {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), queue, block);
}

+ (void)executeInMainQueue:(dispatch_block_t)block afterDelay:(NSTimeInterval)sec {
    NSParameterAssert(block);
    [self _executeInQueue:mainQueue.dispatchQueue block:block after:sec];
}

+ (void)executeInMainQueue:(dispatch_block_t)block {
    NSParameterAssert(block);
    dispatch_async(mainQueue.dispatchQueue, block);
}

+ (void)executeInGlobalQueue:(dispatch_block_t)block afterDelay:(NSTimeInterval)sec {
    NSParameterAssert(block);
    [self _executeInQueue:globalQueue.dispatchQueue block:block after:sec];
}

+ (void)executeInGlobalQueue:(dispatch_block_t)block {
    NSParameterAssert(block);
    dispatch_async(globalQueue.dispatchQueue, block);
}

+ (void)executeInHighPriorityGlobalQueue:(dispatch_block_t)block afterDelay:(NSTimeInterval)sec {
    NSParameterAssert(block);
    [self _executeInQueue:highPriorityGlobalQueue.dispatchQueue block:block after:sec];
}

+ (void)executeInHighPriorityGlobalQueue:(dispatch_block_t)block {
    NSParameterAssert(block);
    dispatch_async(highPriorityGlobalQueue.dispatchQueue, block);
}

+ (void)executeInLowPriorityGlobalQueue:(dispatch_block_t)block afterDelay:(NSTimeInterval)sec {
    NSParameterAssert(block);
    [self _executeInQueue:lowPriorityGlobalQueue.dispatchQueue block:block after:sec];
}

+ (void)executeInLowPriorityGlobalQueue:(dispatch_block_t)block {
    NSParameterAssert(block);
    dispatch_async(lowPriorityGlobalQueue.dispatchQueue, block);
}

+ (void)executeInBackgroundPriorityGlobalQueue:(dispatch_block_t)block afterDelay:(NSTimeInterval)sec {
    NSParameterAssert(block);
    [self _executeInQueue:backgroundPriorityGlobalQueue.dispatchQueue block:block after:sec];
}

+ (void)executeInBackgroundPriorityGlobalQueue:(dispatch_block_t)block {
    NSParameterAssert(block);
    dispatch_async(backgroundPriorityGlobalQueue.dispatchQueue, block);
}

#pragma mark - Init

- (instancetype)init {
    return [self initSerial];
}

- (instancetype)initSerial {
    return [self initSerialWithLabel:@"com.gcd.queue"];
}

- (instancetype)initSerialWithLabel:(NSString *)label {
    if (self = [super init]) {
        self.dispatchQueue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_SERIAL);
    }
    
    return self;
}

- (instancetype)initConcurrent {
    return [self initConcurrentWithLabel:@"com.gcd.queue"];
}

- (instancetype)initConcurrentWithLabel:(NSString *)label {
    if (self = [super init]) {
        self.dispatchQueue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_CONCURRENT);
    }
    
    return self;
}

#pragma mark - Execute

- (void)execute:(dispatch_block_t)block {
    NSParameterAssert(block);
    dispatch_async(self.dispatchQueue, block);
}

- (void)execute:(dispatch_block_t)block afterDelay:(NSTimeInterval)sec {
    NSParameterAssert(block);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), self.dispatchQueue, block);
}

@end

