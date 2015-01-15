//
//  APIpackageNewTitleQueryBackHeader_item.h
//  TestSqlite
//
//  Created by chen on 15/1/15.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIpackageNewTitleQueryBackHeader_item : NSObject
@property (nonatomic) NSInteger articleId;
@property (nonatomic) NSInteger categoryId;
@property (nonatomic,strong) NSString *uploadDate;//上传日期
@property (nonatomic,assign) BOOL collect;//是否被收藏(该字段保留)
@property (nonatomic,strong) NSString *contentTitle;//内容标题
@property (nonatomic,strong) NSArray *contentPictureSrc;//标题图片地址集
@property (nonatomic,strong) NSString *contentSrc;//内容连接地址
@property (nonatomic,strong) NSString *cmsCatalogInfoVO;
@property (nonatomic,strong) NSString *type;

@end
