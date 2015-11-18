//
//  MeViewController.m
//  WeChat
//
//  Created by Sure on 15-8-27.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "MeViewController.h"
#import "InfoViewController.h"//包含头文件
#import "FaceLookViewController.h"
#import "SettingViewController.h"
@interface MeViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
    // Do any additional setup after loading the view.
}
- (void)createTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 49 - 64) style:UITableViewStyleGrouped];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
    [self.view addSubview:tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 4;
    }else{
        return 1;
    }
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ID"];
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"相册";
            cell.imageView.image = [UIImage imageNamed:@"MoreMyAlbum@2x"];
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"收藏";
            cell.imageView.image = [UIImage imageNamed:@"MoreMyFavorites@2x"];
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"钱包";
            cell.imageView.image = [UIImage imageNamed:@"MoreMyBankCard@2x"];
        }else{
            cell.textLabel.text = @"卡包";
            cell.imageView.image = [UIImage imageNamed:@"MyCardPackageIcon@2x"];
        }
    }else if (indexPath.section == 2){
        cell.textLabel.text = @"表情";
        cell.imageView.image = [UIImage imageNamed:@"MoreExpressionShops@2x"];
    }else if (indexPath.section == 3){
        cell.textLabel.text = @"设置";
        cell.imageView.image = [UIImage imageNamed:@"MoreSetting@2x"];
    }else{
        //section==0时 寻找每一行的View  cell.contentView
        //头像
        UIImageView * headView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 70, 70)];
        
        headView.image = [UIImage imageNamed:@"1"];
        
        headView.layer.cornerRadius = 5;
        
        headView.clipsToBounds = YES;
        
        //将头像图片视图加载到cell上
        [cell.contentView addSubview:headView];
        
        //姓名
        UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(105, 20, 200, 30)];
        
        nameLabel.text = @"卖报的小画家";
        
        [cell.contentView addSubview:nameLabel];
        
        //微信号
        UILabel * wcLabel = [[UILabel alloc]initWithFrame:CGRectMake(105, 50, 200, 30)];
        
        wcLabel.text = @"微信号:maibao781085";
        
        [cell.contentView addSubview:wcLabel];
        
        //二维码图像
        UIImageView * qrImageView = [[UIImageView alloc]initWithFrame:CGRectMake(310, (100 - 18) / 2, 18, 18)];
        
        qrImageView.image = [UIImage imageNamed:@"setting_myQR"];
        
        [cell.contentView addSubview:qrImageView];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}
#pragma mark UITableView调节行高 默认行高为44
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }else{
        return 44;
    }
}
#pragma mark UITableView点击行时触发方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //去除系统默认的点击效果 添加点击动画
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    NSLog(@"点击为:%ld段 %ld行",indexPath.section,indexPath.row);
    if (indexPath.section == 0) {
//        NSLog(@"跳转个人信息页面");
        InfoViewController * infoVC = [[InfoViewController alloc]init];
        //跳转界面时隐藏TabBar
        infoVC.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:infoVC animated:YES];
    }else if (indexPath.section == 2){
    //跳转表情界面
        FaceLookViewController * face = [[FaceLookViewController alloc]init];
        face.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:face animated:YES];
    }else if (indexPath.section == 3){
    //跳转设置界面
        SettingViewController * setting = [[SettingViewController alloc]init];
        
        setting.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:setting animated:YES];
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
