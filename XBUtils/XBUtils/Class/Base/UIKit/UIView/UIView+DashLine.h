//
//  UIView+DashLine.h
//  XBUtils
//
//  Created by xiabob on 2017/7/25.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DashLine)

/**
 绘制虚线，如果view的width大于height，绘制水平虚线；如果view的height大于width，绘制垂直虚线。
 默认的lineCap类型是kCALineCapRound，圆形。

 @param dashLength 虚线的长度
 @param dashSpacing 虚线间的间距
 @param lineColor 绘制虚线使用的颜色
 */
- (void)drawDashLineWithDashLength:(CGFloat)dashLength dashSpacing:(CGFloat)dashSpacing dashColor:(UIColor *)lineColor;



/**
 绘制虚线，如果view的width大于height，绘制水平虚线；如果view的height大于width，绘制垂直虚线。

 @param dashLength 虚线的长度
 @param dashSpacing 虚线间的间距
 @param dashColor 绘制虚线使用的颜色
 @param lineCap 线条结尾的形状
 */
- (void)drawDashLineWithDashLength:(CGFloat)dashLength dashSpacing:(CGFloat)dashSpacing dashColor:(UIColor *)dashColor lineCap:(NSString *)lineCap;

@end
