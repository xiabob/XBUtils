//
//  NSMutableArray+SafeOperation.h
//  XBUtils
//
//  Created by xiabob on 2017/5/5.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (SafeOperation)

- (void)xb_safeAddObject:(id)object;

- (void)xb_safeInsertObject:(id)anObject atIndex:(NSUInteger)index;

- (void)xb_safeAddObjectsFromArray:(NSArray *)otherArray;

@end
