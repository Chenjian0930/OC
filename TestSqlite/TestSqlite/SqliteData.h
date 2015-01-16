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

//插入数据
- (void)insertDb:(NSMutableArray*)arr;

//获取头条
- (NSMutableArray *)dataGetHeadArticle;

// 获取本地默认 5条新闻
- (NSMutableArray*)dataGetDefault;
// 根据categoryId 本地默认  5条新闻
- (NSMutableArray*)dataGetDefaultBycategoryId:(NSInteger)categoryId;
- (NSMutableArray*)dataGetNews;


//获取收藏的文章
- (NSMutableArray *)dataGetSavedArticleByPage:(NSInteger)page size:(NSInteger)size;
- (NSMutableArray *)dataGetSavedArticleByBycategoryId:(NSInteger)categoryId Page:(NSInteger)page size:(NSInteger)size;

//设置标签收藏
- (BOOL)setArticleSavedType:(BOOL)isSaved articleId:(NSInteger)articleId;
//设置标签已读未读
- (BOOL)setNewsReadTypeByArticleId:(NSInteger)articleId;

@end
