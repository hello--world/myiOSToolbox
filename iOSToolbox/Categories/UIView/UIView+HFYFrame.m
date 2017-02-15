//
//  UIView+HFYFrame.m
//  iOSToolbox
//
//  Created by HeFengyang on 2017/1/4.
//  Copyright © 2017年 HeFengyang. All rights reserved.
//

#import "UIView+HFYFrame.h"

@implementation UIView (HFYFrame)


- (CGFloat)hfy_top
{
    return CGRectGetMidY(self.frame);
}

- (void)setHfy_top:(CGFloat)hfy_top
{
    CGRect frame = self.frame;
    frame.origin.y = hfy_top;
    self.frame = frame;
}

- (CGFloat)hfy_right
{
    return CGRectGetMaxX(self.frame);
}

- (void)setHfy_right:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)hfy_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setHfy_bottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)hfy_left
{
    return self.frame.origin.x;
}

- (void)setHfy_left:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)hfy_width
{
    return self.frame.size.width;
}

- (void)setHfy_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)hfy_height
{
    return self.frame.size.height;
}

- (void)setHfy_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - Shortcuts for frame properties

- (CGPoint)hfy_origin {
    return self.frame.origin;
}

- (void)setHfy_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)hfy_size {
    return self.frame.size;
}

- (void)setHfy_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
#pragma mark - Shortcuts for positions

- (CGFloat)hfy_centerX {
    return self.center.x;
}

- (void)setHfy_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)hfy_centerY {
    return self.center.y;
}

- (void)setHfy_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

@end
