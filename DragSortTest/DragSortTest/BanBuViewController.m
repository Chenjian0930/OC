/**
 * BanBuViewController
 * @description 本文件提供拖动排序的初始界面
 * @package
 * @author 		yinlinlin
 * @copyright 	Copyright (c) 2012-2020
 * @version 		1.0
 * @description 本文件提供拖动排序的初始界面
 */

#import "BanBuViewController.h"
#import "editViewController.h"
@interface BanBuViewController ()
{
    //拖动排序的数组，拖动完成之后会发生改变
    NSMutableArray * _dragArr;
    UIScrollView * _scrollV;
}
@end

@implementation BanBuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton * editBu = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [editBu setFrame:CGRectMake(0, 0, 45, 35)];
    [editBu setTitle:@"编辑" forState:UIControlStateNormal];
    [editBu addTarget:self action:@selector(pushToeditView) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * editItem = [[UIBarButtonItem alloc]initWithCustomView:editBu];
    self.navigationItem.rightBarButtonItem = editItem;
    _dragArr = [[NSMutableArray alloc]initWithObjects:@"000",@"001",@"002",@"003",@"004",@"005",@"006", nil];
    _scrollV = [[UIScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_scrollV];
    [self updateDragScrollerView];

}

/**
 * @函数名称：pushToeditView
 * @函数描述：跳转到编辑界面
 * @输入参数：void
 * @输出参数：void
 * @返回值：void
 */
- (void)pushToeditView
{
    editViewController * editV = [[editViewController alloc]init];
    editV.albumlist = _dragArr;
    __block NSMutableArray * bdragArr = _dragArr;
    __block id bself = self;
    [editV setSortCompleteCallBack:^(NSArray *dragArr)
    {
        [bdragArr removeAllObjects];
        [bdragArr addObjectsFromArray:dragArr];
        [bself updateDragScrollerView];
    }];
    [self.navigationController pushViewController:editV animated:YES];
    editV = nil;
}

/**
 * @函数名称：updateDragScrollerView
 * @函数描述：初始化界面
 * @输入参数：void
 * @输出参数：void
 * @返回值：void
 */
- (void)updateDragScrollerView
{
    //移除之前的数据
    for (UIView * views in _scrollV.subviews)
    {
        [views removeFromSuperview];
    }
    for (int i = 0 ; i < _dragArr.count; i ++)
    {
        CGFloat x = i % 3 * 107 + 10;
        CGFloat y = i/3 * 125;
        UIButton * dragBu = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [dragBu setFrame:CGRectMake(x, y, 83, 81)];
        [dragBu setTitle:[_dragArr objectAtIndex:i] forState:UIControlStateNormal];
        [_scrollV addSubview:dragBu];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
