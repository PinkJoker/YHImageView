//
//  UIView+YHView.m
//  Protocol
//
//  Created by SYH on 16/7/7.
//  Copyright © 2016年 SYH523364. All rights reserved.
//

#import "UIView+YHView.h"

@implementation UIView (YHView)

+ (void)YHShakeToShow:(UIView*)aView{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}

-(CGFloat)left
{
    return self.frame.origin.x;
}
-(void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

-(void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

-(CGFloat)top
{
    return self.frame.origin.y;
}
-(void)setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
-(CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

-(void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
-(CGFloat)width
{
    return self.frame.size.width;
}
-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)height
{
    return self.frame.size.height;
}
-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(CGFloat)centerX
{
    return (self.frame.origin.x+self.frame.size.width)/2;
}

-(void)setCenterX:(CGFloat)centerX
{
    CGRect frame = self.frame;
    frame.origin.x = centerX;
    self.frame = frame;
    
}
-(CGFloat)centerY
{
    return (self.frame.origin.y+self.frame.size.height)/2;
}
-(void)setCenterY:(CGFloat)centerY
{
    CGRect frame = self.frame;
    frame.origin.y = centerY;
    self.frame = frame;
}

@end
