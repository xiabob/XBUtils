//
//  XBDispatchHelper.h
//  XBUtils
//
//  Created by xiabob on 2017/5/17.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBDispatchHelper : NSObject


#pragma mark - dispatch delay

/**
 延迟执行

 @param delay 延迟的时间，单位是s
 @param queue 执行block时所在的队列
 @param block 具体执行的代码
 */
void xb_dispatch_after(NSTimeInterval delay,
                       dispatch_queue_t queue,
                       dispatch_block_t block);

/**
 主队列中延迟执行

 @param delay 延迟的时间，单位是s
 @param block 具体执行的代码
 */
void xb_main_dispatch_after(NSTimeInterval delay,
                            dispatch_block_t block);

/**
 异步延迟执行

 @param delay 延迟的时间，单位是s
 @param block 具体执行的代码
 */
void xb_async_dispatch_after(NSTimeInterval delay,
                             dispatch_block_t block);


#pragma mark - dispatch main queue

/**
 确保代码在主线程中执行

 @param block 要执行的代码
 */
void xb_dispatch_on_main_thread(dispatch_block_t block);

@end
