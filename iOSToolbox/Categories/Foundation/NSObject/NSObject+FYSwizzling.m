//
//  NSObject+FYSwizzling.m
//  CarLife
//
//  Created by HeFengyang on 2017/5/2.
//  Copyright © 2017年 hihfy. All rights reserved.
//

#import "NSObject+FYSwizzling.h"
#import <objc/runtime.h>

@implementation NSObject (FYSwizzling)
+ (void)exchangeClassMethodsWithOriginalSelector:(SEL)originalSelector andSwizzledSelector:(SEL)swizzledSelector {
    [self exchangeMethodsWithOriginalSelector:originalSelector
                             swizzledSelector:swizzledSelector
                                 classMethods:YES];
}

+ (void)exchangeInstanceMethodsWithOriginalSelector:(SEL)originalSelector andSwizzledSelector:(SEL)swizzledSelector {
    [self exchangeMethodsWithOriginalSelector:originalSelector
                             swizzledSelector:swizzledSelector
                                 classMethods:NO];
}

+ (IMP)replaceMethodWithSelector:(SEL)originalSelector block:(id)block {
    NSCParameterAssert(block);
    
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    NSCParameterAssert(originalMethod);
    
    IMP newIMP = imp_implementationWithBlock(block);
    
    if (!class_addMethod(class, originalSelector, newIMP, method_getTypeEncoding(originalMethod))) {
        return method_setImplementation(originalMethod, newIMP);
    } else {
        return method_getImplementation(originalMethod);
    }
}

#pragma mark - Private

+ (void)exchangeMethodsWithOriginalSelector:(SEL)originalSelector
                           swizzledSelector:(SEL)swizzledSelector
                               classMethods:(BOOL)classMethods {
    Class class = classMethods ? object_getClass((id)self) : [self class];
    Method originalMethod = classMethods ? class_getClassMethod(class, originalSelector) : class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = classMethods ? class_getClassMethod(class, swizzledSelector) : class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end
