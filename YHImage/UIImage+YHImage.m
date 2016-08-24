//
//  UIImage+YHImage.m
//  Protocol
//
//  Created by SYH on 16/7/7.
//  Copyright © 2016年 SYH523364. All rights reserved.
//

#import "UIImage+YHImage.h"

@implementation UIImage (YHImage)

+(UIImage *)YHimageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+(UIImage *)YHWaterMarkImage:(UIImage *)img withName:(NSString *)name

{
    
    NSString* mark = name;
    
    int w = img.size.width;
    
    int h = img.size.height;
    
    UIGraphicsBeginImageContext(img.size);
    
    [img drawInRect:CGRectMake(0, 0, w, h)];
    
    NSDictionary *attr = @{
                           
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:13],  //设置字体
                           
                           NSForegroundColorAttributeName : [UIColor cyanColor]   //设置字体颜色
                           
                           };
    
    [mark drawInRect:CGRectMake(0, img.size.height-20,img.size.width  ,20) withAttributes:attr];
    
    UIImage *aimg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return aimg;
    
}

+ (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size   YHDrawInRectX:(CGRect )X
                            InRectY:(CGRect)Y
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(CGRectGetMinX(X) ,CGRectGetMinY(Y),size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end

