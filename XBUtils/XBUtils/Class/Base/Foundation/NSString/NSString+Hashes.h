//
//  NSString+Hashes.h
//  XBUtils
//
//  Created by xiabob on 2017/4/20.
//  Copyright © 2017年 xiabob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hashes)

- (NSString *)md5;
- (NSString *)sha1;
- (NSString *)sha224;
- (NSString *)sha256;
- (NSString *)sha384;
- (NSString *)sha512;

@end
