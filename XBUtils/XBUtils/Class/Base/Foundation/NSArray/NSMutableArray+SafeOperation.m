//
//  NSMutableArray+SafeOperation.m
//  XBUtils
//
//  Created by xiabob on 2017/5/5.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import "NSMutableArray+SafeOperation.h"

@implementation NSMutableArray (SafeOperation)

- (void)xb_safeAddObject:(id)object {
    if (object) {
        [self addObject:object];
    }
}

- (void)xb_safeInsertObject:(id)anObject atIndex:(NSUInteger)index {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wtautological-compare"
    if (anObject && index >= 0 && index <= self.count) {
        [self insertObject:anObject atIndex:index];
    }
#pragma clang diagnostic pop
}

- (void)xb_safeAddObjectsFromArray:(NSArray *)otherArray {
    if (otherArray) {
        [self addObjectsFromArray:otherArray];
    }
}

@end
