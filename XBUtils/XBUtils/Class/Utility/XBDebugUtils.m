//
//  XBDebugUtils.m
//  XBUtils
//
//  Created by xiabob on 2018/10/8.
//  Copyright © 2018 xiabob. All rights reserved.
//

#import "XBDebugUtils.h"

@implementation XBDebugUtils

+ (void)debugOnly:(void(^)(void))body {
    NSAssert([self assertConditionForDebug:body], @"");
}

+ (BOOL)assertConditionForDebug:(void(^)(void))body {
    if (body != nil) body();
    return true;
}

@end
