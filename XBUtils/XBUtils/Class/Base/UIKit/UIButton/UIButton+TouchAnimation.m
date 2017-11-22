//
//  UIButton+TouchAnimation.m
//  XBUtils
//
//  Created by xiabob on 2017/11/22.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import "UIButton+TouchAnimation.h"
#import <objc/runtime.h>

@implementation UIButton (TouchAnimation)

- (void)enableTouchAnimation {
    [self addTarget:self action:@selector(didTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(didTouchUpOutSide:) forControlEvents:UIControlEventTouchUpOutside];
    [self addTarget:self action:@selector(didTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(didTouchCancel:) forControlEvents:UIControlEventTouchCancel];
    
    [self addTarget:self action:@selector(didDragOutside:) forControlEvents:UIControlEventTouchDragOutside];
    [self addTarget:self action:@selector(didDragExit:) forControlEvents:UIControlEventTouchDragExit];
}

- (void)disableTouchAnimation {
    [self removeTarget:self action:@selector(didTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self removeTarget:self action:@selector(didTouchUpOutSide:) forControlEvents:UIControlEventTouchUpOutside];
    [self removeTarget:self action:@selector(didTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self removeTarget:self action:@selector(didTouchCancel:) forControlEvents:UIControlEventTouchCancel];
    
    [self removeTarget:self action:@selector(didDragOutside:) forControlEvents:UIControlEventTouchDragOutside];
    [self removeTarget:self action:@selector(didDragExit:) forControlEvents:UIControlEventTouchDragExit];
}

- (void)didTouchDown:(UIButton *)button {
    [self zoomOut:button];
}

- (void)didTouchUpOutSide:(UIButton *)button {
    [self resetScale:button];
}

- (void)didTouchUpInside:(UIButton *)button {
    [self resetScale:button];
}

- (void)didTouchCancel:(UIButton *)button {
    [self resetScale:button];
}

- (void)didDragOutside:(UIButton *)button {
    [self resetScale:button];
}

- (void)didDragExit:(UIButton *)button {
    [self resetScale:button];
}

- (void)resetScale:(UIButton *)button {
    NSTimeInterval lastTime = [self getZoomOutTime];
    NSTimeInterval offset = [[NSDate date] timeIntervalSince1970] - lastTime;
    NSTimeInterval delay = offset >= 0.1 ? 0 : 0.1 - offset;
    
    [UIView animateWithDuration:0.5 delay:delay usingSpringWithDamping:0.5 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
        button.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)zoomOut:(UIButton *)button {
    [self recordZoomOutTime];
    
    [UIView animateWithDuration:0.1 animations:^{
        button.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)recordZoomOutTime {
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    objc_setAssociatedObject(self, @selector(recordZoomOutTime), @(now), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)getZoomOutTime {
    NSNumber *date = objc_getAssociatedObject(self, @selector(recordZoomOutTime));
    return date.doubleValue;
}

@end

