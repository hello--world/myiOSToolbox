//
//  UIView+Layer.h
//  iOSToolbox
//
//  Created by HeFengyang on 2017/2/15.
//  Copyright © 2017年 HeFengyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Layer)

@property (nonatomic, assign) IBInspectable CGFloat layerBorderWidth;

@property (nonatomic, strong) IBInspectable UIColor *layerBorderColor;

@property (nonatomic, assign) IBInspectable CGFloat layerCornerRadius;

@property (nonatomic, assign) IBInspectable BOOL layerMasksToBounds;

@end
