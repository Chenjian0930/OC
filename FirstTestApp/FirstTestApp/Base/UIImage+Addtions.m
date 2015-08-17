//
//  UIImage+Addtions.m
//  FirstTestApp
//
//  Created by chen on 15/8/17.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "UIImage+Addtions.h"

@implementation UIImage(Addtions)

+ (UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
