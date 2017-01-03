//
//  UIView+HFYFindView.m
//  iOSToolbox
//
//  Created by HeFengyang on 2017/1/3.
//  Copyright © 2017年 HeFengyang. All rights reserved.
//

#import "UIView+HFYFindView.h"

@implementation UIView (HFYFindView)

- (UIView *)hfy_fromSubviewFindSuperviewWith:(Class)viewClass {
    UIView *view = self.superview;
    if ([view isKindOfClass:viewClass]) {
        return view;
    }
    return [view hfy_fromSubviewFindSuperviewWith:viewClass];
}

@end
