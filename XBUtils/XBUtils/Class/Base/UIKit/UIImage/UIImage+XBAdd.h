//
//  UIImage+XBAdd.h
//  XBUtils
//
//  Created by xiabob on 2017/8/2.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XBAdd)


/**
 按照图片原始尺寸进行缩放

 @param name 图片名，适用于xcassets中的图片
 @param scale 缩放的比例
 @return 处理后的图片
 */
+ (UIImage *)xb_imageNamed:(NSString *)name scale:(CGFloat)scale;

+ (UIImage *)xb_imageNamed:(NSString *)name size:(CGSize)size;

- (UIImage *)xb_imageByResizeToSize:(CGSize)size;

- (UIImage *)xb_imageByRescaleToScale:(CGFloat)scale;


/**
 图片(边缘不是透明像素)做旋转、缩放动画时会出现锯齿现象。本方法可以给图片边缘额外添加一个物理点的透明像素，你也可以使用CALayer的allowsEdgeAntialiasing属性来开启抗锯齿（有一定的性能消耗）

 @return 处理过的图片
 */
- (UIImage *)xb_antialiasingImage;

@end
