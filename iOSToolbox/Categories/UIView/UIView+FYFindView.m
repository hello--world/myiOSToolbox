//
//  UIView+FYFindView.m
//  iOSToolbox
//
//  Created by HeFengyang on 2017/1/3.
//  Copyright © 2017年 HeFengyang. All rights reserved.
//

#import "UIView+FYFindView.h"

@implementation UIView (FYFindView)

- (UIView *)fy_fromSubviewFindSuperviewWith:(Class)viewClass {
    UIView *view = self.superview;
    if ([view isKindOfClass:viewClass]) {
        return view;
    }
    return [view fy_fromSubviewFindSuperviewWith:viewClass];
}

- (void)fy_findSuberViewWithSuperView:(FindViewBlock)callBackBlock conditionBlock:(ConditionBlock)conditionBlock allView:(BOOL)allView {
    
    NSParameterAssert(conditionBlock);
    
    NSArray *suberViews = self.subviews;
    [suberViews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL * _Nonnull stop) {
       
        if (conditionBlock(subView)) {
            if (callBackBlock) {
                callBackBlock(subView);
            }
            if (!allView) {
                * stop = YES;
            }
        }
        // 如果需要查找
        if (allView) {
            [subView fy_findSuberViewWithSuperView:callBackBlock conditionBlock:conditionBlock allView:allView];
        }
    }];
}

- (void)fy_findSuberViewWithSuperView:(NSString *)viewClassName callBackBlock:(FindViewBlock)callBackBlock allView:(BOOL)allView {
    [self fy_findSuberViewWithSuperView:callBackBlock conditionBlock:^BOOL(UIView *view) {
        return [viewClassName isEqualToString:NSStringFromClass([view class])];
    } allView:allView];
}

@end
