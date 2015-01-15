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


// 获取本地默认 5条新闻
- (NSMutableArray*)dataGetDefault;
// 根据categoryId 本地默认  5条新闻
- (NSMutableArray*)dataGetDefaultBycategoryId:(NSInteger)categoryId;

- (NSMutableArray*)dataGetNews;

//设置标签收藏
- (BOOL)setArticleSavedType:(BOOL)isSaved articleId:(NSInteger)articleId;
//设置标签已读未读
- (BOOL)setNewsReadTypeByArticleId:(NSInteger)articleId;

@end
