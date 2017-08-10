//
//  NSArray+SafeOperation.h
//  XBUtils
//
//  Created by xiabob on 2017/8/10.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray<ObjectType> (SafeOperation)

- (nullable ObjectType)xb_objectAtIndex:(NSUInteger)index;

@end
