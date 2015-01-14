//
//  ViewController.m
//  TestSqlite
//
//  Created by chen on 15/1/14.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "ViewController.h"
#import "SqliteData.h"
#import "NewsModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *dataArr = [[NSMutableArray alloc] init];
    for (int i = 0 ; i <2; ++i) {
        NewsModel *model = [[NewsModel alloc] init];
        model.idNew = i +1;
        model.categoryId = i;
        model.titleNew = @"标题";
        model.urlNew = @"urlNew";
        model.imageUrl = nil;//图片
        model.createTime = @"createTime";
        model.isReadNew = (i == 0); //标记 已读未读
        model.isSaved= (i == 0);// 标记 是否收藏
        [dataArr addObject:model];
    }
    [[SqliteData shareManager] insertDb:dataArr];;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
