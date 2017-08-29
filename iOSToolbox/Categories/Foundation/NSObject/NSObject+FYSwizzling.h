//
//  NSObject+FYSwizzling.h
//  CarLife
//
//  Created by HeFengyang on 2017/5/2.
//  Copyright © 2017年 hihfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FYSwizzling)

+ (void)exchangeClassMethodsWithOriginalSelector:(SEL)originalSelector andSwizzledSelector:(SEL)swizzledSelector;

+ (void)exchangeInstanceMethodsWithOriginalSelector:(SEL)originalSelector andSwizzledSelector:(SEL)swizzledSelector;

+ (IMP)replaceMethodWithSelector:(SEL)originalSelector block:(id)block;
@end
