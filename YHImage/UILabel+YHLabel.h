//
//  UILabel+YHLabel.h
//  YHImage
//
//  Created by 我叫MT on 16/8/9.
//  Copyright © 2016年 SYH523364. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YHLabel)
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

@end
