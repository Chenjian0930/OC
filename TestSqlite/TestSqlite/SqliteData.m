//
//  SqliteData.m
//  TestSqlite
//
//  Created by chen on 15/1/14.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "SqliteData.h"
#import <sqlite3.h>
#import "NewsModel.h"
#define DBNAME    @"data.sqlite"
@interface SqliteData()
@property(nonatomic) sqlite3 *db;
@property(nonatomic,strong) NSString *filePath;
@end

@implementation SqliteData


+ (SqliteData *)shareManager
{
    static SqliteData *manager =  nil;
    static dispatch_once_t dispatchOnece;
    
    dispatch_once(&dispatchOnece, ^{
        manager = [[SqliteData alloc]init];
    });
    return manager;
}


- (id)init{
    @synchronized(self) {
        self = [super init];
        [self checkDataBase];
        return self;
    }
}

#pragma mark - 检查数据库文件是否存在
- (void)checkDataBase{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    self.filePath = [documents stringByAppendingPathComponent:DBNAME];
    if (![[NSFileManager defaultManager] fileExistsAtPath:_filePath] ) {
        NSLog(@"建表");
        if (sqlite3_open([_filePath UTF8String], &_db) == SQLITE_OK) {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS NEWS(idNew INTEGER PRIMARY KEY AUTOINCREMENT, categoryId INTEGER,titleNew TEXT, urlNew TEXT,imageUrl TEXT , isRead INTEGER , isSaved INTEGER , createTime TEXT)";
            if (sqlite3_exec(_db, sql_stmt, NULL, NULL, &errMsg)!=SQLITE_OK)
            {
                NSLog(@"建表失败");
            }else{
                NSLog(@"建表成功");
            }
        }else{
            NSLog(@"数据库打开失败");
        }
        sqlite3_close(_db);
        
    }else{
        NSLog(@"表存在");
    }
}

#pragma mark - 插入数据
- (void)insertDb:(NSMutableArray*)arr{
    if (sqlite3_open([_filePath UTF8String], &_db) == SQLITE_OK){
        for (NewsModel *news in arr) {
            
            NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO NEWS (idNew,categoryId,titleNew,urlNew,imageUrl,isRead,isSaved,createTime,categoryName) VALUES(\"%ld\",\"%ld\",\"%@\",\"%@\",\"%@\",0,0,\"%@\",\"%@\")",(long)news.idNew,(long)news.categoryId,news.titleNew,news.urlNew,@"",news.createTime,news.categoryName];
            const char *insert_stmt = [insertSQL UTF8String];
            char *errorMsg;
            if (sqlite3_exec(_db, insert_stmt, NULL, NULL, &errorMsg)==SQLITE_OK)
            {
                NSLog(@"");
            }
        }
    }
    sqlite3_close(_db);
}

#pragma mark- 获取数据
- (NSMutableArray*)getDataFromIndex:(NSInteger)index getNumber:(NSInteger)number{
    return nil;
}
@end
