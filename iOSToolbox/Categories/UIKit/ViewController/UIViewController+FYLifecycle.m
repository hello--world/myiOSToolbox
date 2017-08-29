//
//  UIViewController+FYLifecycle.m
//  iOSToolbox
//
//  Created by HeFengyang on 2017/1/4.
//  Copyright © 2017年 HeFengyang. All rights reserved.
//

#import "UIViewController+FYLifecycle.h"
#import "NSObject+FYSwizzling.h"

@implementation UIViewController (FYLifecycle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeInstanceMethodsWithOriginalSelector:NSSelectorFromString(@"dealloc")
                                      andSwizzledSelector:@selector(swizzlingDealloc)];
    });
    
}

- (void)swizzlingDealloc {
    NSLog(@"👏👏👏%@-->>释放啦！👏👏👏",self);
    if ([self respondsToSelector:NSSelectorFromString(@"dealloc")]) {
        [self swizzlingDealloc];
    }
}

@end
