//
//  SettingViewController.m
//  WeChat
//
//  Created by Sure on 15-8-28.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "SettingViewController.h"
#import "NotifationViewController.h"
@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>



@end

@implementation SettingViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"设置";
    
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
    return 4;// 0 1 2 3
}
//设置具体某一段有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 3;
    }else{
        return 1;
    }
}
//显示具体内容
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    //设置具体每段每行的内容
    if (indexPath.section == 0) {
        cell.textLabel.text = @"账号与安全";
        
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"新消息通知";
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"隐私";
        }else if (indexPath.row == 2){
        cell.textLabel.text = @"通用";
        }
    }else if (indexPath.section == 2){
        cell.textLabel.text = @"关于微信";
    }else{
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
        label.text = @"退出登录";
        label.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:label];
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
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            NotifationViewController * noti = [[NotifationViewController alloc]init];
            
            noti.hidesBottomBarWhenPushed = YES;
            
            [self.navigationController pushViewController:noti animated:YES];
        }
    }
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
