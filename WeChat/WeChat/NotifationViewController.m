//
//  NotifationViewController.m
//  WeChat
//
//  Created by Sure on 15-8-28.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "NotifationViewController.h"

@interface NotifationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSMutableArray * footTitleArray;

@end

@implementation NotifationViewController

- (instancetype)init{
    if (self = [super init]) {
        self.footTitleArray = [NSMutableArray arrayWithArray:@[@"如果你要关闭或开启微信的新消息通知，请再iphone的“设置”-“通知”功能中，找到应用程序“微信”更改。",@"若关闭，当收到微信消息时，通知提示将不显示发信人和内容摘要。",@"设置系统功能消息提示声音和振动的时段。",@"当微信在运行时，你可以设置是否需要声音或者振动。",@"关闭后，有朋友更新照片时，界面下面的“发现”切换按钮上不再出现红点提示。"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"新消息通知";
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self createTableView];
    // Do any additional setup after loading the view.
}
- (void)createTableView{
    //关闭自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStyleGrouped];
    
    tableView.delegate = self;
    
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
}
//设置TableView中段Section的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;// 0 1 2 3
}
//设置具体某一段有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 3) {
        return 2;
    }else{
        return 1;
    }
}
//显示具体内容
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    //设置具体每段每行的内容
    if (indexPath.section == 0) {
        cell.textLabel.text = @"接收新消息通知";
        
    }else if (indexPath.section == 1){
        cell.textLabel.text = @"通知显示消息详情";
    }else if (indexPath.section == 2){
        cell.textLabel.text = @"消息免打扰";
    }else if (indexPath.section == 3){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"声音";
        }else{
            cell.textLabel.text = @"振动";
        }
    }else{
        cell.textLabel.text = @"朋友圈更新";
    }
    //设置右侧按钮的样式
    /*
     UITableViewCellAccessoryDisclosureIndicator
     UITableViewCellAccessoryDetailDisclosureButton
     UITableViewCellAccessoryDetailButton
     UITableViewCellAccessoryCheckmark
     */
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //去除系统默认的点击效果 添加点击动画
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
#pragma mark 返回段尾/脚文字的方法
- (NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return self.footTitleArray[section];//0 1 2 3 4
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
