//
//  SqliteData.h
//  TestSqlite
//
//  Created by chen on 15/1/14.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SqliteData : NSObject

+ (SqliteData *)shareManager;


- (void)insertDb:(NSMutableArray*)arr;
@end
