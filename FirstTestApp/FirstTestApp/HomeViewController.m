//
//  ViewController.m
//  FirstTestApp
//
//  Created by chen on 15/8/13.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setTitle:@"首页"];
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
