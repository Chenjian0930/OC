//
//  NewsModel.h
//  TestSqlite
//
//  Created by chen on 15/1/14.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic) NSInteger idNew;
@property (nonatomic) NSInteger categoryId;
@property (nonatomic) NSString * categoryName;//分类名称
@property (strong,nonatomic) NSString *titleNew;
@property (strong,nonatomic) NSString *urlNew; //新闻链接
@property (strong,nonatomic) NSArray *imageUrl;//图片
@property (strong,nonatomic) NSString *createTime;
@property (nonatomic)BOOL isReadNew; //标记 已读未读
@property (nonatomic)bool isSaved;// 标记 是否收藏



@end
