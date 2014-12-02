//
//  Download.m
//  WeiBo
//
//  Created by chen on 14/12/2.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "Download.h"

@implementation Download
+ (void)downloadFile:(NSString *)filePath{
    NSURL *url  = [NSURL URLWithString:@"http://f.hiphotos.baidu.com/image/w%3D1366%3Bcrop%3D0%2C0%2C1366%2C768/sign=26bb25034836acaf59e092ff4aefb673/0df3d7ca7bcb0a461f4bed036863f6246b60af9b.jpg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:@"" append:YES];
    
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        //下载进度
        float progress = ((float)totalBytesRead) / (totalBytesExpectedToRead);
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
