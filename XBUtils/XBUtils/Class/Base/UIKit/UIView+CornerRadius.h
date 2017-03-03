//
//  UIView+CornerRadius.h
//  XBUtils
//
//  Created by xiabob on 17/3/3.
//  Copyright © 2017年 xiabob. All rights reserved.
//
//  用于高效地设置圆角：可以设置border，圆角的位置（UIRectCorner）
//

#import <UIKit/UIKit.h>


@interface UIView (CornerRadius)

- (void)xb_setRoundedCorner:(CGFloat)radius;

- (void)xb_setRoundedCorner:(CGFloat)radius
            backgroundColor:(nonnull UIColor *)backgroundColor;

- (void)xb_setRoundedCorner:(CGFloat)radius
            backgroundColor:(nonnull UIColor *)backgroundColor
                    corners:(UIRectCorner)corners;

- (void)xb_setRoundedCorner:(CGSize)cornerRadii
            backgroundColor:(nonnull UIColor *)backgroundColor
                    corners:(UIRectCorner)corners
                borderColor:(nullable UIColor *)borderColor
                borderWidth:(CGFloat)borderWidth;

@end
