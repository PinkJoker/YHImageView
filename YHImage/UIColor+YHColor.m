//
//  UIColor+YHColor.m
//  Protocol
//
//  Created by SYH on 16/7/7.
//  Copyright © 2016年 SYH523364. All rights reserved.
//

#import "UIColor+YHColor.h"

@implementation UIColor (YHColor)


+(UIColor *)YHWithRedColor:(CGFloat)R GreenColor:(CGFloat)G BlueColor:(CGFloat)B alpha:(CGFloat)P
{
    return [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:P];

}

@end
