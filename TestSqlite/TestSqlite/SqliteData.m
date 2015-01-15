//
//  SqliteData.m
//  TestSqlite
//
//  Created by chen on 15/1/14.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "SqliteData.h"
#import <sqlite3.h>
#import "APIpackageNewTitleQueryBackHeader_item.h"
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
        if (sqlite3_open([_filePath UTF8String], &_db) == SQLITE_OK) {
            char *errMsg;
            const char *sql_stmt = "create table if not exists article(articleId integer primary key, categoryId integer,contentTitle text, contentSrc text,imageUrl text , isRead integer default 0 , isSaved integer default 0, uploadDate text,categoryName text, isRecent integer)";
            if (sqlite3_exec(_db, sql_stmt, NULL, NULL, &errMsg)!=SQLITE_OK)
            {
                NSLog(@"建表失败");
            }
        }else{
            NSLog(@"数据库打开失败");
        }
        sqlite3_close(_db);
    }
}

#pragma mark - 插入数据
- (void)insertDb:(NSMutableArray*)arr{
    if (sqlite3_open([_filePath UTF8String], &_db) == SQLITE_OK){
        [self refreshDataBase];
        for (APIpackageNewTitleQueryBackHeader_item *item in arr) {
            NSString *insertSQL = [NSString stringWithFormat:@"insert or replace into article (articleId,categoryId,contentTitle,contentSrc,imageUrl,uploadDate,categoryName,isRecent) values(\"%ld\",\"%ld\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",1)",(long)item.articleId,(long)item.categoryId,item.contentTitle,@"",@"",item.uploadDate,item.cmsCatalogInfoVO];
            const char *insert_stmt = [insertSQL UTF8String];
            char *errorMsg;
            if (sqlite3_exec(_db, insert_stmt, NULL, NULL, &errorMsg)==SQLITE_OK)
            {
                NSLog(@"1111");
            }
        }
    }
    sqlite3_close(_db);
}



#pragma mark- 设置标签已读未读
- (BOOL)setNewsReadTypeByArticleId:(NSInteger)articleId{
    if (sqlite3_open([_filePath UTF8String], &_db) == SQLITE_OK){        
        NSString *updateSQL = [NSString stringWithFormat:@"update article set isRead = 1 where articleId = %ld",(long)articleId];
        const char *update_stmt = [updateSQL UTF8String];
        char *errorMsg;
        int result = sqlite3_exec(_db, update_stmt, NULL, NULL, &errorMsg);
        sqlite3_close(_db);
        if (result!=SQLITE_OK){
            return  NO;
        }
    }else{
        return NO;
    }
    return YES;
}

#pragma mark- 设置文章 收藏与否
- (BOOL)setArticleSavedType:(BOOL)isSaved articleId:(NSInteger)articleId{
    if (sqlite3_open([_filePath UTF8String], &_db) == SQLITE_OK){
        NSString *updateSQL = [NSString stringWithFormat:@"update article set isSaved = %d where articleId = %ld",isSaved?1:0,(long)articleId];
        const char *update_stmt = [updateSQL UTF8String];
        char *errorMsg;
        int result = sqlite3_exec(_db, update_stmt, NULL, NULL, &errorMsg);
        sqlite3_close(_db);
        if (result!=SQLITE_OK){
            return  NO;
        }
    }else{
        return NO;
    }
    return YES;
}


#pragma mark- 获取数据
- (NSMutableArray*)dataGetNews{
    if (sqlite3_open([_filePath UTF8String], &_db) == SQLITE_OK){
        NSString *sqlQuery = @"select * from article where isRecent = 1";
        NSMutableArray *arr = [self dataFormat:sqlQuery];
        sqlite3_close(_db);
        return arr;
    }
    return nil;
}

#pragma mark- 获取本地默认 5条新闻
- (NSMutableArray *)dataGetDefault{
    if (sqlite3_open([_filePath UTF8String], &_db) == SQLITE_OK){
        NSString *sqlQuery = @"select * from article order by - articleId limit 5";
        NSMutableArray *arr = [self dataFormat:sqlQuery];
        sqlite3_close(_db);
        return arr;
    }
    return nil;
}

#pragma mark- 根据categoryId 本地默认  5条新闻
- (NSMutableArray *)dataGetDefaultBycategoryId:(NSInteger)categoryId{
    if (sqlite3_open([_filePath UTF8String], &_db) == SQLITE_OK){
        NSString *sqlQuery =  [NSString stringWithFormat:@"select * from article order by - articleId limit 5 where categoryId = %d",categoryId];
        NSMutableArray *arr = [self dataFormat:sqlQuery];
        sqlite3_close(_db);
        return arr;}
    return nil;
}

- (NSMutableArray *)dataFormat:(NSString *)sqlQuery{
    sqlite3_stmt * statement;
    if (sqlite3_prepare_v2(_db, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW){
            int idNew = sqlite3_column_int(statement, 1);
            char *address = (char*)sqlite3_column_text(statement, 3);
            NSString *titleNew = [[NSString alloc]initWithUTF8String:address];
            
            NSLog(@"idNew:%d  titleNew:%@",idNew, titleNew);
        }
        sqlite3_finalize(statement);
    }
    return nil;
}

- (BOOL)refreshDataBase{
    NSString *updateSQL = [NSString stringWithFormat:@"update news set isRecent = 0"];
    const char *update_stmt = [updateSQL UTF8String];
    char *errorMsg;
    return (sqlite3_exec(_db, update_stmt, NULL, NULL, &errorMsg) == SQLITE_OK);
}
@end
