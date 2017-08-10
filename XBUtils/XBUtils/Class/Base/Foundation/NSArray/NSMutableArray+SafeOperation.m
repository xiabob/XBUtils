//
//  NSMutableArray+SafeOperation.m
//  XBUtils
//
//  Created by xiabob on 2017/5/5.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import "NSMutableArray+SafeOperation.h"

@implementation NSMutableArray (SafeOperation)

- (void)xb_addObject:(id)anObject {
    if (anObject) {
        [self addObject:anObject];
    }
}

- (void)xb_insertObject:(id)anObject atIndex:(NSUInteger)index {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wtautological-compare"
    if (anObject && index >= 0 && index <= self.count) {
        [self insertObject:anObject atIndex:index];
    }
#pragma clang diagnostic pop
}

- (void)xb_addObjectsFromArray:(NSArray *)otherArray {
    if (otherArray) {
        [self addObjectsFromArray:otherArray];
    }
}

- (void)xb_removeObject:(id)anObject {
    if (anObject) {
        [self removeObject:anObject];
    }
}

- (void)xb_removeObjectAtIndex:(NSUInteger)index {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wtautological-compare"
    if (index >= 0 && index < self.count) {
        [self removeObjectAtIndex:index];
    }
#pragma clang diagnostic pop
}

@end
