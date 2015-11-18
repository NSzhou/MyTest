//
//  FaceLookViewController.m
//  WeChat
//
//  Created by Sure on 15-8-28.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "FaceLookViewController.h"

@interface FaceLookViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation FaceLookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UISegmentedControl * seg = [[UISegmentedControl alloc]initWithItems:@[@"精选表情",@"投稿表情"]];
    
    seg.frame = CGRectMake(0, 0, 200, 30);
    
    seg.selectedSegmentIndex = 0;
    
    //赋予给导航控制器的titleView
    self.navigationItem.titleView = seg;
    
    //更改导航控制器的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //书写假数据
    NSArray * arr = @[@"我们爱学习",@"韩雷和李梅梅",@"长草颜文字校园篇",@"有三人校园篇"];
    
    NSArray * arr2 = @[@"微信气泡狗",@"蛙马股票篇",@"邓超",@"米奇米妮恋爱记",@"疯狂兔子"];
    
    //将两段数据统一放入一个数组中
    self.dataArray = [NSMutableArray arrayWithArray:@[arr,arr2]];
    
    [self createTableView];
    
    // Do any additional setup after loading the view.
}
- (void)createTableView{
    //关闭自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStylePlain];
    
    tableView.delegate = self;
    
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    //TableView存在表头和表尾视图 如何获取
//    tableView.tableFooterView
//    tableView.tableHeaderView
    //定义表头视图
    UIImageView * headView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
    
    headView.image = [UIImage imageNamed:@"4.jpeg"];
    
    //加载到TableView的头视图上
    tableView.tableHeaderView = headView;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else{
        return 5;
    }
}
//定制显示内容
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ID"];
    /*
    if (indexPath.section == 0) {
        cell.textLabel.text = self.dataArray[0][indexPath.row];
    }else{
        cell.textLabel.text = self.dataArray[1][indexPath.row];
    }
     */
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    
    return cell;
}
#pragma mark UITableView更改表头和表尾的文字
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"推荐表情";
    }else{
    return @"更多表情";
    }
}
- (NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"段尾";
}
#pragma mark UITableView更改段头段尾的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40;
}
#pragma mark 修改段头段尾样式
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
    
    if (section == 0) {
        label.text = @"推荐表情";
    }else{
        label.text = @"更多表情";
    }
    label.textAlignment = NSTextAlignmentCenter;
    
    label.font = [UIFont boldSystemFontOfSize:15];
    
    label.backgroundColor = [UIColor colorWithRed:231 / 255.0 green:231 / 255.0 blue:231 / 255.0 alpha:1];
    
    return label;
}
#pragma mark 尾视图
/*
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    
    label.text = @"更多表情";
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.font = [UIFont boldSystemFontOfSize:15];
    
    label.backgroundColor = [UIColor lightGrayColor];
    
    return label;

}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
