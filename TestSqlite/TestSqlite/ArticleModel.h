//
//  NewsModel.h
//  TestSqlite
//
//  Created by chen on 15/1/14.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleModel : NSObject

@property (nonatomic) NSInteger articleId;//文章id
@property (nonatomic,strong) NSString *title;//文章标题
@property (nonatomic) NSInteger categoryId;//分类id
@property (nonatomic,strong) NSString *category;//分类名称
@property (nonatomic,strong) NSArray *imageArr;//图片数组
@property (nonatomic,strong) NSString *articleUrl;//文章链接
@property (strong,nonatomic) NSString *createTime;//创建时间

@property (nonatomic) BOOL isRead;//已读未读
@property (nonatomic) BOOL isSaved;//是否收藏
@property (nonatomic) BOOL isHeadArticle;//是否是头条



@end
