//
//  NSAttributedString+Size.m
//  XBUtils
//
//  Created by xiabob on 2017/8/22.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import "NSAttributedString+Size.h"

@implementation NSAttributedString (Size)

//线程安全的方法，用于计算UILabel的高度
- (CGFloat)heightWithConstrainedWidth:(CGFloat)width {
    CGSize constraintRect = CGSizeMake(width, CGFLOAT_MAX);
    CGRect boundingBox = [self boundingRectWithSize:constraintRect options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return ceil(CGRectGetHeight(boundingBox));
}

//线程安全的方法，用于计算UILabel的高度
- (CGFloat)widthWithConstrainedHeight:(CGFloat)height {
    CGSize constraintRect = CGSizeMake(CGFLOAT_MAX, height);
    CGRect boundingBox = [self boundingRectWithSize:constraintRect options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return ceil(CGRectGetWidth(boundingBox));
}

@end
