//
//  SQLITE.m
//  WeiBo
//
//  Created by chen on 14/12/1.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "SQLITE.h"
#import <sqlite3.h>
@implementation SQLITE


+ (void)createSalite{
    sqlite3 *sqlite = nil;
    
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/data.sqlite"];
    int result = sqlite3_open([filePath UTF8String], &sqlite);
    if (result != SQLITE_OK ) {
        NSLog(@"error");
    }
    
    NSString *orlc = @"CREATE TABLE IF NOT EXISTS user(username TEXT primary key, password TEXT)";
    
    result = sqlite3_exec(sqlite , [orlc UTF8String], nil, nil, nil);
    
    if (result != SQLITE_OK) {
        NSLog(@"error");
        return;
    }
    sqlite3_close(sqlite);
}
@end
