//
//  NewsViewController.m
//  WeChat
//
//  Created by Sure on 15-8-27.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCell.h"//包含自定Cell的头文件
#import "ChatViewController.h"
#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height
@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView * tableView;

//定义可变数组当做数据源
@property (nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化
    self.dataArray = [NSMutableArray array];
    
    //读取Plist中的内容
    NSString * path = [[NSBundle mainBundle]pathForResource:@"NewsList" ofType:@"plist"];
    
    self.dataArray = [NSMutableArray arrayWithContentsOfFile:path];
    
    [self createTableView];
    // Do any additional setup after loading the view.
}
- (void)createTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64 - 49) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;//与数据源个数保持一致
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //通常会自定义类，该类继承于UITableViewCell(每行的视图)
    static NSString * cellID = @"ID";
    //使用自定义的Cell
    NewsCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[NewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //显示内容
    //对NewsCell外漏的属性进行赋值
    cell.nameLabel.text = self.dataArray[indexPath.row][@"name"];
    
    cell.infoLabel.text = self.dataArray[indexPath.row][@"info"];
    
    cell.timeLabel.text = self.dataArray[indexPath.row][@"time"];
    
    //头像
    cell.headView.image = [UIImage imageNamed:self.dataArray[indexPath.row][@"head"]];
    
    return cell;
}
#pragma mark 更改行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

//去除选中效果
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //跳转聊天页面
    ChatViewController * chatVC = [[ChatViewController alloc]init];
    chatVC.hidesBottomBarWhenPushed = YES;// 当跳转时,去除底部的标签栏控制器
    //找到选中行的数据
    NSDictionary * dict = self.dataArray[indexPath.row];
    NSString * name = dict[@"name"];
    
    chatVC.name = name;//正向传值
    
    [self.navigationController pushViewController:chatVC animated:YES];
    
}
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
