//
//  UIView+FYFindView.h
//  iOSToolbox
//
//  Created by HeFengyang on 2017/1/3.
//  Copyright © 2017年 HeFengyang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FindViewBlock)(UIView *view);
typedef BOOL(^ConditionBlock)(UIView *view);

@interface UIView (FYFindView)

/**
 根据指定类型从子试图查找父视图(当前view为子试图，向上查找当前view的父视图)
 
 @param viewClass 需要查找的类型
 @return 查找到的结果，没有则为nil
 */
- (UIView *)fy_fromSubviewFindSuperviewWith:(Class)viewClass;

/**
 从父视图查找子视图，指定类名，查找不到不会回调
 
 @param viewClassName 需要查找的类名
 @param callBackBlock 回调block
 @param allView 是否需要查找所有满足条件的View,YES所有，NO第一个
 */
- (void)fy_findSuberViewWithSuperView:(NSString *)viewClassName callBackBlock:(FindViewBlock)callBackBlock allView:(BOOL)allView;
/**
 从父视图查找子视图，指定条件，查找不到不会回调
 
 @param callBackBlock 回调block
 @param conditionBlock 查找条件
 @param allView 是否需要查找所有满足条件的View,YES所有，NO第一个
 */
- (void)fy_findSuberViewWithSuperView:(FindViewBlock)callBackBlock conditionBlock:(ConditionBlock)conditionBlock allView:(BOOL)allView;

@end
