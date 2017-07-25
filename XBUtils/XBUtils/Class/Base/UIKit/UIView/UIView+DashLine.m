//
//  UIView+DashLine.m
//  XBUtils
//
//  Created by xiabob on 2017/7/25.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import "UIView+DashLine.h"

@implementation UIView (DashLine)

- (void)drawDashLineWithDashLength:(CGFloat)dashLength dashSpacing:(CGFloat)dashSpacing dashColor:(UIColor *)dashColor {
    [self drawDashLineWithDashLength:dashLength dashSpacing:dashSpacing dashColor:dashColor lineCap:kCALineCapRound];
}

- (void)drawDashLineWithDashLength:(CGFloat)dashLength dashSpacing:(CGFloat)dashSpacing dashColor:(UIColor *)dashColor lineCap:(NSString *)lineCap {
    if ([[self layer] sublayers].count > 0) {
        for (CALayer *layer in [[self layer] sublayers]) {
            [layer removeFromSuperlayer];
        }
    }
    
    CGFloat lineWidth = MIN(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:self.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2)];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setStrokeColor:dashColor.CGColor];
    [shapeLayer setLineWidth:lineWidth];
    [shapeLayer setLineCap:lineCap];
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:dashLength], [NSNumber numberWithInt:dashSpacing], nil]];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    if (CGRectGetWidth(self.frame) > CGRectGetHeight(self.frame)) {
        //水平虚线
        CGPathAddLineToPoint(path, NULL, CGRectGetWidth(self.frame), 0);
    } else {
        //垂直虚线
        CGPathAddLineToPoint(path, NULL, 0, CGRectGetHeight(self.frame));
    }
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    [self.layer addSublayer:shapeLayer];
}

@end
