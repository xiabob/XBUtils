//
//  XBDebugUtils.h
//  XBUtils
//
//  Created by xiabob on 2018/10/8.
//  Copyright © 2018 xiabob. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBDebugUtils : NSObject

+ (void)debugOnly:(void(^)(void))body;

@end

NS_ASSUME_NONNULL_END
