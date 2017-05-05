//
//  NSArray+ImageNames.h
//  XBUtils
//
//  Created by xiabob on 2017/5/5.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (ImageNames)

+ (NSArray<UIImage *> *)safeImagesArray:(NSArray<NSString *> *)imageNames;

@end
