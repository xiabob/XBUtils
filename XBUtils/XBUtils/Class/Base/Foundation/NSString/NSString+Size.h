//
//  NSString+Size.h
//  XBUtils
//
//  Created by xiabob on 2017/4/21.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)

- (CGFloat)heightWithConstrainedWidth:(CGFloat)width font:(UIFont *)font;
- (CGFloat)widthWithConstrainedHeight:(CGFloat)height font:(UIFont *)font;

@end
