//
//  ViewController.m
//  WeiBo
//
//  Created by chen on 14-10-15.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",NSLocalizedString(@"loading",@""));
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://httpbin.org/robots.txt"]];

//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"Success: %@", operation.responseString);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Failure: %@", error);
//    }];
//    [operation start];
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dic = @{@"source":@"iphone",@"sign":@"ios",@"password":@"111111",@"loginName":@"18625160299",@"versionNo":@"1"};
    [manager POST:@"http://172.16.128.165:80/user/rest/login" parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"NSDictionary") ;
        }else if([responseObject isKindOfClass:[NSArray class]]){
            NSLog(@"NSArray") ;
        }
        if ([NSJSONSerialization isValidJSONObject:responseObject]){
            NSObject *obj  = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"%@",obj);
        }
        NSLog(@"");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"");
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
