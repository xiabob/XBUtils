//
//  NSString+HexColor.m
//  XBUtils
//
//  Created by xiabob on 2017/12/21.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import "NSString+HexColor.h"

@implementation NSString (HexColor)

- (UIColor *)xb_hexColor {
    UIColor *color = nil;
    NSString *colorCode = [self copy];
    
    if ([colorCode hasPrefix:@"#"]) {
        colorCode = [colorCode substringFromIndex:1];
    }
    
    NSUInteger length = colorCode.length;
    if (length == 3) { //for 0x000
        color = [colorCode _shortRgbHexCodeColor];
    } else if (length == 4) { //for 0x000f
        color = [colorCode _shortRgbaHexCodeColor];
    } else if (length == 6) { //for 0x0f0f0f
        color = [colorCode _rgbHexCodeColor];
    } else if (length == 8) { //for 0x0f0f0fff
        color = [colorCode _rgbaHexCodeColor];
    }
    
    return color;
}

- (UIColor *)_shortRgbHexCodeColor {
    UInt32 hexCode = 0;
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner scanHexInt:&hexCode];
    
    CGFloat divisor = 15;
    CGFloat r = (hexCode >> 8)              / divisor;
    CGFloat g = ((hexCode >> 4) & 0x0F)     / divisor;
    CGFloat b = (hexCode        & 0x00F)    / divisor;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (UIColor *)_shortRgbaHexCodeColor {
    UInt32 hexCode = 0;
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner scanHexInt:&hexCode];
    
    CGFloat divisor = 15;
    CGFloat r = (hexCode  >> 12)           / divisor;
    CGFloat g = ((hexCode >>  8) & 0x0F)   / divisor;
    CGFloat b = ((hexCode >>  4) & 0x00F)  / divisor;
    CGFloat a = (hexCode         & 0x000F) / divisor;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

- (UIColor *)_rgbHexCodeColor {
    UInt32 hexCode = 0;
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner scanHexInt:&hexCode];
    
    CGFloat divisor = 255;
    CGFloat r = (hexCode  >> 16)             / divisor;
    CGFloat g = ((hexCode >>  8) & 0x00FF)   / divisor;
    CGFloat b = (hexCode         & 0x0000FF) / divisor;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (UIColor *)_rgbaHexCodeColor {
    UInt32 hexCode = 0;
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner scanHexInt:&hexCode];
    
    CGFloat divisor = 255;
    CGFloat r = (hexCode  >> 24)               / divisor;
    CGFloat g = ((hexCode >> 16) & 0x00FF)     / divisor;
    CGFloat b = ((hexCode >>  8) & 0x0000FF)   / divisor;
    CGFloat a = (hexCode         & 0x000000FF) / divisor;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

@end

