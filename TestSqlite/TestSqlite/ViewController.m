//
//  ViewController.m
//  TestSqlite
//
//  Created by chen on 15/1/14.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "ViewController.h"
#import "SqliteData.h"
#import "APIpackageNewTitleQueryBackHeader_item.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *dataArr = [[NSMutableArray alloc] init];
    for (int i = 0 ; i <10; ++i) {
        APIpackageNewTitleQueryBackHeader_item *model = [[APIpackageNewTitleQueryBackHeader_item alloc] init];
        model.articleId = i ;
        model.categoryId = i;
        model.contentTitle = @"标题";
        model.uploadDate = @"createTime";
        [dataArr addObject:model];
    }
    [[SqliteData shareManager] insertDb:dataArr];
//    [[SqliteData shareManager] setNewsReadTypeByNewId:2];
//    [[SqliteData shareManager] setNewsSavedType:YES newId:1];
//    
//    [dataArr removeAllObjects];
//    [[SqliteData shareManager] dataGetNewsIsFirstGet:NO];
    NSMutableArray *arr = [[SqliteData shareManager]dataGetDefault];
    [[SqliteData shareManager] dataGetHeadArticle];
//    [[SqliteData shareManager] dataGetSavedArticleByPage:1 size:2];
//    [[SqliteData shareManager] dataGetSavedArticleByPage:2 size:2];
//    [[SqliteData shareManager] dataGetSavedArticleByBycategoryId:1 Page:0 size:2];
//    [[SqliteData shareManager] dataGetSavedArticleByBycategoryId:1 Page:2 size:2];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
