//
//  UIColor+FYHEX.h
//  iOSToolbox
//
//  Created by HeFengyang on 2017/1/3.
//  Copyright © 2017年 HeFengyang. All rights reserved.
//
// 搬运
#import <UIKit/UIKit.h>

@interface UIColor (FYHEX)
+ (UIColor *)fy_colorWithHex:(UInt32)hex;
+ (UIColor *)fy_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)fy_colorWithHexString:(NSString *)hexString;
- (NSString *)fy_HEXString;
///值不需要除以255.0
+ (UIColor *)fy_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue
                            alpha:(CGFloat)alpha;
///值不需要除以255.0
+ (UIColor *)fy_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue;
@end
