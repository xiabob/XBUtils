//
//  XBMacrosHeader.h
//  XBUtils
//
//  Created by xiabob on 2017/9/15.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#ifndef XBMacrosHeader_h
#define XBMacrosHeader_h

#define WEAK_SELF __weak typeof(self)weakSelf = self
#define STRONG_SELF __strong typeof(weakSelf)self = weakSelf

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define DesignBaseWidth 375.0
#define DesignBaseHeight 667.0
#define ScreenWidthRatio (SCREEN_WIDTH / DesignBaseWidth)
#define ScreenHeightRatio (SCREEN_HEIGHT / DesignBaseHeight)

#define kColorWithRGBValue(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define kColorWithRGBAValue(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define kLocalString(x) NSLocalizedString(x, nil)

#endif /* XBMacrosHeader_h */
