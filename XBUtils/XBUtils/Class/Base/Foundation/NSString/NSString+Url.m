//
//  NSString+Url.m
//  XBUtils
//
//  Created by xiabob on 2018/9/15.
//  Copyright © 2018年 xiabob. All rights reserved.
//

#import "NSString+Url.h"

@implementation NSString (Url)

/*
 对字符串进行URL编码转义
 对整个url而言，直接这样编码是不太合适的，显然"/?#"等字符是有特殊含义的，不能直接转义，更好调用方式是针对URL每个部分单独编码
 */
- (NSString *)URLEncodedString {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"!*'\"();:@&=+$,/?%#[]% "].invertedSet];
}

- (NSString *)FullURLEncodedString {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"!*'\"();:@+$%[]% "].invertedSet];
}

- (NSString *)URLDecodedString {
    return [self stringByRemovingPercentEncoding];
}

@end
