//
//  GlobalNetWork.m
//  WeiBo
//
//  Created by chen on 14/10/20.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "GlobalNetWork.h"
#import "AFNetworking.h"
@implementation GlobalNetWork

- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSURLRequest *request = [self requestWithMethod:@"GET" path:path parameters:parameters];
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:success failure:failure];
    [self enqueueHTTPRequestOperation:operation];
}


@end
