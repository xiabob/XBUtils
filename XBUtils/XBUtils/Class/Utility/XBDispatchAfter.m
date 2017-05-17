//
//  XBDispatchAfter.m
//  XBUtils
//
//  Created by xiabob on 2017/5/17.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import "XBDispatchAfter.h"

@implementation XBDispatchAfter

void xb_dispatch_after(NSTimeInterval delay,
                       dispatch_queue_t queue,
                       dispatch_block_t block) {
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW,
                                              (int64_t)(delay * NSEC_PER_SEC));
    dispatch_after(delayTime, queue, block);
}

void xb_main_dispatch_after(NSTimeInterval delay, dispatch_block_t block) {
    xb_dispatch_after(delay, dispatch_get_main_queue(), block);
}

void xb_async_dispatch_after(NSTimeInterval delay, dispatch_block_t block) {
    dispatch_queue_t queue = dispatch_queue_create("xb.async.dispatch.queue", DISPATCH_QUEUE_CONCURRENT);
    xb_dispatch_after(delay, queue, block);
}

@end
