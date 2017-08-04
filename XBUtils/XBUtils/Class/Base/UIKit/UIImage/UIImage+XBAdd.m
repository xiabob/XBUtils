//
//  UIImage+XBAdd.m
//  XBUtils
//
//  Created by xiabob on 2017/8/2.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import "UIImage+XBAdd.h"

@implementation UIImage (XBAdd)

+ (UIImage *)xb_imageNamed:(NSString *)name scale:(CGFloat)scale {
    UIImage *image = [UIImage imageNamed:name];
    return [image xb_imageByRescaleToScale:scale];
}

+ (UIImage *)xb_imageNamed:(NSString *)name size:(CGSize)size {
    UIImage *image = [UIImage imageNamed:name];
    return [image xb_imageByResizeToSize:size];
}

- (UIImage *)xb_imageByResizeToSize:(CGSize)size {
    if (size.width <= 0 || size.height <= 0) return self;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)xb_imageByRescaleToScale:(CGFloat)scale {
    if (scale <= 0.01) return self;
    CGSize newSize = CGSizeMake(self.size.width * scale, self.size.height * scale);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)xb_antialiasingImage {
    CGFloat border   = 1.0;
    CGSize imageSize = CGSizeMake(self.size.width + border * 2, self.size.height + border * 2);
    CGRect drawRect  = CGRectMake(border, border, self.size.width, self.size.height);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    [self drawInRect:drawRect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
