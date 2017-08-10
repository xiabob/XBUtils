//
//  NSArray+SafeOperation.m
//  XBUtils
//
//  Created by xiabob on 2017/8/10.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import "NSArray+SafeOperation.h"

@implementation NSArray (SafeOperation)

- (id)xb_objectAtIndex:(NSUInteger)index {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wtautological-compare"
    if (index >= 0 && index < self.count) {
        return [self objectAtIndex:index];
    }
#pragma clang diagnostic pop
    
    return nil;
}

@end
