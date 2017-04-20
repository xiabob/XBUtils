//
//  NSString+DeviceHelper.h
//  XBUtils
//
//  Created by xiabob on 2017/4/20.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DeviceHelper)

/** WiFi名称 */
+ (NSString *)wifiName;

/** WiFi对应的mac地址，并不是手机的mac地址 */
+ (NSString *)wifiMacAddress;

+ (NSString *)ipv4Address;

/** IDFA,广告标示符 */
+ (NSString *)idfaString;

/** IDFV */
+ (NSString *)idfvString;

+ (NSString *)applicationVersion;

+ (NSString *)applicationBuild;

+ (NSString *)systemVersion;

+ (NSString *)systemUserName;

+ (NSString *)systemName;

+ (NSString *)cpuUsage;


@end
