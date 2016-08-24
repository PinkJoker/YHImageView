//
//  NSString+YHString.m
//  YHImage
//
//  Created by SYH on 16/7/9.
//  Copyright © 2016年 SYH523364. All rights reserved.
//

#import "NSString+YHString.h"

@implementation NSString (YHString)

+(NSString *)YHGetCurrentTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *datetime = [formatter stringFromDate:[NSDate date]];
    return datetime;
}


@end
