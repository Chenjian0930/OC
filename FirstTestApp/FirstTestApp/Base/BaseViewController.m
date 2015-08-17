//
//  BaseViewController.m
//  FirstTestApp
//
//  Created by chen on 15/8/17.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImage+Addtions.h"

@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (IS_OS_6){
        UIImage* image = [UIImage imageWithColor:LCHexColor(0xffffff) size:CGSizeMake(SCREEN_WIDTH, 44)];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    if (IS_OS_7_Later){
        UIImage* image = [UIImage imageWithColor:LCHexColor(0xffffff) size:CGSizeMake(1, 64)];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        
        UIImage* lineImage = [UIImage imageWithColor:LCRGBColor(211, 211, 211) size:CGSizeMake(1, 0.5)];
        [self.navigationController.navigationBar setShadowImage:lineImage];
        
        if ([self respondsToSelector:@selector(edgesForExtendedLayout)]){
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
    }
    
}




@end
