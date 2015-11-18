//
//  FindViewController.m
//  WeChat
//
//  Created by Sure on 15-8-27.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()<UITableViewDelegate,UITableViewDataSource>//遵守协议

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
    // Do any additional setup after loading the view.
}
- (void)createTableView{
    //关闭自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64 - 49) style:UITableViewStyleGrouped];
    
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
    if (section == 0) {
        return 1;
    }else{
        return 2;
    }
}
//显示具体内容
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    //设置具体每段每行的内容
    if (indexPath.section == 0) {
        cell.textLabel.text = @"朋友圈";
        cell.imageView.image = [UIImage imageNamed:@"ff_IconShowAlbum"];
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"扫一扫";
            cell.imageView.image = [UIImage imageNamed:@"ff_IconQRCode"];
        }else{
            cell.textLabel.text = @"摇一摇";
            cell.imageView.image = [UIImage imageNamed:@"ff_IconShake"];
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"附近的人";
            cell.imageView.image = [UIImage imageNamed:@"ff_IconLocationService"];
        }else{
            cell.textLabel.text = @"漂流瓶";
            cell.imageView.image = [UIImage imageNamed:@"ff_IconBottle"];
        }
    }else{
        if (indexPath.row == 0) {
            cell.textLabel.text = @"购物";
            cell.imageView.image = [UIImage imageNamed:@"CreditCard_ShoppingBag"];
        }else{
            cell.textLabel.text = @"游戏";
            cell.imageView.image = [UIImage imageNamed:@"MoreGame"];
        }
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
