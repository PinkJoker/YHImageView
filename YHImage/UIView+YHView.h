//
//  UIView+YHView.h
//  Protocol
//
//  Created by SYH on 16/7/7.
//  Copyright © 2016年 SYH523364. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YHView)
@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat bottom;
@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;
@property(nonatomic)CGFloat centerX;
@property(nonatomic)CGFloat centerY;

+(void) YHShakeToShow:(UIView*)aView;

@end
