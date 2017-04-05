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

@end
