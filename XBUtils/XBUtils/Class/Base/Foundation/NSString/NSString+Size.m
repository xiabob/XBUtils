//
//  NSString+Size.m
//  XBUtils
//
//  Created by xiabob on 2017/4/21.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

//线程安全的方法，用于计算UILabel的高度
- (CGFloat)heightWithConstrainedWidth:(CGFloat)width font:(UIFont *)font {
    CGSize constraintRect = CGSizeMake(width, CGFLOAT_MAX);
    CGRect boundingBox = [self boundingRectWithSize:constraintRect options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil];
    //In iOS 7 and later, this method returns fractional sizes (in the size component of the returned CGRect); to use a returned size to size views, you must use raise its value to the nearest higher integer using the ceil function.
    return ceil(CGRectGetHeight(boundingBox));
}

//线程安全的方法，用于计算UILabel的高度
- (CGFloat)widthWithConstrainedHeight:(CGFloat)height font:(UIFont *)font {
    CGSize constraintRect = CGSizeMake(CGFLOAT_MAX, height);
    CGRect boundingBox = [self boundingRectWithSize:constraintRect options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil];
    //In iOS 7 and later, this method returns fractional sizes (in the size component of the returned CGRect); to use a returned size to size views, you must use raise its value to the nearest higher integer using the ceil function.
    return ceil(CGRectGetWidth(boundingBox));
}

@end
