//
//  ViewController.m
//  WeiBo
//
//  Created by chen on 14-10-15.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "SQLITE.h"
#import "Download.h"
@interface ViewController ()

@property (strong,nonatomic) NSString *test1;
@property (strong,nonatomic) NSString *test2;
@property (strong,nonatomic) NSString *test3;
//@property (nonatomic) NSInteger test4;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",NSLocalizedString(@"loading",@""));

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dic = @{@"source":@"iphone",@"sign":@"ios",@"password":@"111111",@"loginName":@"18625160299",@"versionNo":@"1"};
    [manager POST:@"http://172.16.128.165:80/user/rest/login" parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"NSDictionary") ;
        }else if([responseObject isKindOfClass:[NSArray class]]){
            NSLog(@"NSArray") ;
        }
        
        NSLog(@"%@ \n %@",[responseObject allKeys],[responseObject allValues]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    [SQLITE  createSalite];
    
    _test1 = @"test1";
    _test2 = @"test2";
    _test3 = @"test3";
//    _test4 = 4;
    NSLog( @"%@", [self getPropertyList:self]);
    
    
    [self downloadFile:@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableDictionary *)getPropertyList: (id)tempClass{
    unsigned int outCount;
    objc_property_t *properties =       class_copyPropertyList([tempClass class], &outCount);
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    for (int i = 0; i < outCount ; i++)
    {
//        const char* propertyName = property_getName(properties[i]);
//        [propertyArray addObject: [NSString stringWithUTF8String: propertyName]];
        
        objc_property_t property = properties[i];
        NSString * key = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        id value = objc_msgSend(tempClass,NSSelectorFromString(key));
        [dic setObject:value ? value : @"" forKey:key];
    }
    free(properties); 
    return dic;
}


- (void)downloadFile:(NSString *)filePath{
    NSURL *url  = [NSURL URLWithString:@"http://f.hiphotos.baidu.com/image/w%3D1366%3Bcrop%3D0%2C0%2C1366%2C768/sign=26bb25034836acaf59e092ff4aefb673/0df3d7ca7bcb0a461f4bed036863f6246b60af9b.jpg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:@"" append:YES];
    
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        //下载进度
        float progress = ((float)totalBytesRead) / (totalBytesExpectedToRead);
        _progresslabel.text = [NSString stringWithFormat:@"%f",progress];
        NSLog(@"%f",progress);
    }];
    
    //成功和失败回调
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"ok");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    [operation start];
    
}

@end
