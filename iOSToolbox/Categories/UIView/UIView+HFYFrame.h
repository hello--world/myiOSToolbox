//
//  UIView+HFYFrame.h
//  iOSToolbox
//
//  Created by HeFengyang on 2017/1/4.
//  Copyright © 2017年 HeFengyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HFYFrame)
@property (nonatomic, assign) CGPoint hfy_origin;
@property (nonatomic, assign) CGSize hfy_size;

@property (nonatomic) CGFloat hfy_centerX;
@property (nonatomic) CGFloat hfy_centerY;


@property (nonatomic) CGFloat hfy_top;
@property (nonatomic) CGFloat hfy_bottom;
@property (nonatomic) CGFloat hfy_right;
@property (nonatomic) CGFloat hfy_left;

@property (nonatomic) CGFloat hfy_width;
@property (nonatomic) CGFloat hfy_height;
@end
