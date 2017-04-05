//
//  UIView+FYFrame.h
//  iOSToolbox
//
//  Created by HeFengyang on 2017/1/4.
//  Copyright © 2017年 HeFengyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FYFrame)
@property (nonatomic, assign) CGPoint fy_origin;
@property (nonatomic, assign) CGSize fy_size;

@property (nonatomic) CGFloat fy_centerX;
@property (nonatomic) CGFloat fy_centerY;


@property (nonatomic) CGFloat fy_top;
@property (nonatomic) CGFloat fy_bottom;
@property (nonatomic) CGFloat fy_right;
@property (nonatomic) CGFloat fy_left;

@property (nonatomic) CGFloat fy_width;
@property (nonatomic) CGFloat fy_height;
@end
