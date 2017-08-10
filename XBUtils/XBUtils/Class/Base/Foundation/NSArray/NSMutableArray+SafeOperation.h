//
//  NSMutableArray+SafeOperation.h
//  XBUtils
//
//  Created by xiabob on 2017/5/5.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray<ObjectType> (SafeOperation)

- (void)xb_addObject:(ObjectType)anObject;

- (void)xb_insertObject:(ObjectType)anObject atIndex:(NSUInteger)index;

- (void)xb_addObjectsFromArray:(NSArray *)otherArray;

- (void)xb_removeObject:(id)anObject;

- (void)xb_removeObjectAtIndex:(NSUInteger)index;

@end
