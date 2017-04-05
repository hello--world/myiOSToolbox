//
//  UIView+FYFindView.h
//  iOSToolbox
//
//  Created by HeFengyang on 2017/1/3.
//  Copyright © 2017年 HeFengyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FYFindView)

/**
 根据指定类型从子试图查找父视图(当前view为子试图，向上查找当前view的父视图)

 @param viewClass 需要查找的类型
 @return 查找到的结果，没有则为nil
 */
- (UIView *)fy_fromSubviewFindSuperviewWith:(Class)viewClass;

@end
