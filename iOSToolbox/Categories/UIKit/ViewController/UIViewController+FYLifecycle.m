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
// kvo 监听视图view？
@implementation UINavigationController (FYLifecycle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        [self exchangeInstanceMethodsWithOriginalSelector:NSSelectorFromString(@"dealloc")
//                                      andSwizzledSelector:@selector(swizzlingDealloc)];
    });
    
}

- (nullable UIViewController *)fy_popViewControllerAnimated:(BOOL)animated {
    UIViewController *vc = [self fy_popViewControllerAnimated:animated];
    [self review:vc];
        return vc;
}



- (void)review:(UIViewController *)vc {
    __weak UIViewController *weakVC = vc;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakVC) {
            NSLog(@"%@：没有被释放掉",weakVC);
        }
    });
}

@end
