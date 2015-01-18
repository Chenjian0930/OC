//
//  ViewController.m
//  TestSqlite
//
//  Created by chen on 15/1/14.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "ViewController.h"
#import "ArticleSqliteData.h"
#import "ArticleModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *dataArr = [[NSMutableArray alloc] init];
    for (int i = 0 ; i <10; ++i) {
        ArticleModel *model = [[ArticleModel alloc] init];
        model.articleId = i ;
        model.categoryId = i;
        model.title = @"标题";
        model.createTime = @"createTime";
        [dataArr addObject:model];
    }
//    [[ArticleSqliteData shareManager] insertDb:dataArr];
    NSMutableArray *arr =  [[ArticleSqliteData shareManager] dataGetHeadArticle];
    [self printArr:arr];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//@property (nonatomic) NSInteger articleId;//文章id
//@property (nonatomic,strong) NSString *title;//文章标题
//@property (nonatomic) NSInteger categoryId;//分类id
//@property (nonatomic,strong) NSString *category;//分类名称
//@property (nonatomic,strong) NSArray *imageArr;//图片数组
//@property (nonatomic,strong) NSString *articleUrl;//文章链接
//@property (strong,nonatomic) NSString *createTime;//创建时间
//
//@property (nonatomic) BOOL isRead;//已读未读
//@property (nonatomic) BOOL isSaved;//是否收藏
//@property (nonatomic) BOOL isHeadArticle;//是否是头条
- (void)printArr:(NSMutableArray *)arr{
    for (ArticleModel *model in arr){
        NSLog(@"文章id =  %ld",(long)model.articleId);
        NSLog(@"文章标题 = %@",model.title);
        NSLog(@"分类id = %ld",(long)model.categoryId);
        NSLog(@"分类名称 = %@",model.category);
        NSLog(@"图片数组 = %@",model.imageArr);
        NSLog(@"文章链接 = %@",model.articleUrl);
        NSLog(@"创建时间 = %@",model.createTime);
        NSLog(@"已读未读 = %d",model.isRead);
        NSLog(@"是否收藏 = %d",model.isSaved);
        NSLog(@"是否是头条 = %d",model.isHeadArticle);
    }
}
@end
