//
//  UIUint.h
//  FirstTestApp
//
//  Created by chen on 15/8/17.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#ifndef FirstTestApp_UIUint_h
#define FirstTestApp_UIUint_h

//屏幕相关

#define  SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define  SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define STATUSBARHEIGHT        [UIApplication sharedApplication].statusBarFrame.size.height
//系统版本

#define IS_OS_6 ([[[UIDevice currentDevice] systemVersion] doubleValue]>=6.0 && \
[[[UIDevice currentDevice] systemVersion] doubleValue]<7.0)

#define IS_OS_7 ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0 && \
[[[UIDevice currentDevice] systemVersion] doubleValue]<8.0)


#define IS_OS_8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define IS_OS_7_Later ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)

//颜色

#define LCRGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define LCRGBAColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define LCHexColor(a) [UIColor colorWithRed:(a>>16)/255.0 green:(a>>8&0xff)/255.0 blue:(a&0xff)/255.0 alpha:1]
#define LCHexAColor(c,a) [UIColor colorWithRed:(c>>16)/255.0 green:(c>>8&0xff)/255.0 blue:(c&0xff)/255.0 alpha:a]


#endif
