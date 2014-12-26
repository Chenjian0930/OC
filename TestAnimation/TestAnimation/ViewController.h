//
//  ViewController.h
//  TestAnimation
//
//  Created by chen on 14/12/26.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push = 2,                       //推挤
    Reveal = 3,                     //揭开
    MoveIn = 4,                     //覆盖
    Cube = 5,                       //立方体
    SuckEffect = 6,                 //吮吸
    OglFlip = 7,                    //翻转
    RippleEffect = 8,               //波纹
    PageCurl = 9,                   //翻页
    PageUnCurl = 10,                 //反翻页
    CameraIrisHollowOpen = 11,       //开镜头
    CameraIrisHollowClose = 12,      //关镜头
    CurlDown = 13,                   //下翻页
    CurlUp = 14,                     //上翻页
    FlipFromLeft = 15,               //左翻转
    FlipFromRight = 16,              //右翻转
    
} AnimationType;

@interface ViewController : UIViewController
- (IBAction)animation:(id)sender;


@end

