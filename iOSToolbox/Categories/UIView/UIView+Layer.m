//
//  UIView+Layer.m
//  iOSToolbox
//
//  Created by HeFengyang on 2017/2/15.
//  Copyright © 2017年 HeFengyang. All rights reserved.
//

#import "UIView+Layer.h"
#import <objc/runtime.h>

@implementation UIView (Layer)

static char layerBorderColorKey;

- (void)setLayerBorderWidth:(CGFloat)layerBorderWidth {
    self.layer.borderWidth = layerBorderWidth;
}

- (CGFloat)layerBorderWidth {
    return self.layer.borderWidth;
}

- (void)setLayerBorderColor:(UIColor *)layerBorderColor {
    self.layer.borderColor = layerBorderColor.CGColor;
    objc_setAssociatedObject(self, &layerBorderColorKey, layerBorderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)layerBorderColor {
//    return [UIColor colorWithCGColor:self.layer.borderColor];
    return objc_getAssociatedObject(self, &layerBorderColorKey);
}

- (void)setLayerCornerRadius:(CGFloat)layerCornerRadius {
    self.layer.cornerRadius = layerCornerRadius;
}

- (CGFloat)layerCornerRadius {
    return self.layer.cornerRadius;
}

- (void)setLayerMasksToBounds:(BOOL)layerMasksToBounds {
    self.layer.masksToBounds = layerMasksToBounds;
}

- (BOOL)layerMasksToBounds {
    return self.layer.masksToBounds;
}

@end
