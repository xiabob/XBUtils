//
//  NSAttributedString+Size.h
//  XBUtils
//
//  Created by xiabob on 2017/8/22.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (Size)

- (CGFloat)heightWithConstrainedWidth:(CGFloat)width;
- (CGFloat)widthWithConstrainedHeight:(CGFloat)height;

@end
