//
//  UIImage+YHImage.h
//  Protocol
//
//  Created by SYH on 16/7/7.
//  Copyright © 2016年 SYH523364. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YHImage)
+ (UIImage *)YHimageWithColor:(UIColor *)color;
+(UIImage *)YHWaterMarkImage:(UIImage *)img withName:(NSString *)name;

+ (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size   YHDrawInRectX:(CGRect )X
                            InRectY:(CGRect)Y;
@end
