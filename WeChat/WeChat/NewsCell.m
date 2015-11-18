//
//  NewsCell.m
//  WeChat
//
//  Created by Sure on 15-8-31.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell
//创建Cell的初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //书写当前Cell上需显示的内容
        //进行布局 self.contentView
        //头像
        self.headView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
        
        self.headView.backgroundColor = [UIColor greenColor];
        
        self.headView.layer.cornerRadius = 5;
        
        self.headView.clipsToBounds = YES;
        
        [self.contentView addSubview:self.headView];
        
        //名字
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 15, 200, 25)];
        
//        self.nameLabel.backgroundColor = [UIColor greenColor];
        
        [self.contentView addSubview:self.nameLabel];
        
        //详情
        self.infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 45, 200, 25)];
        
//        self.infoLabel.backgroundColor = [UIColor redColor];
        
        [self.contentView addSubview:self.infoLabel];
        
        //时间
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(290, 15, 75, 25)];
        
        self.timeLabel.textAlignment = NSTextAlignmentRight;
        
//        self.timeLabel.backgroundColor = [UIColor yellowColor];
        
        [self.contentView addSubview:self.timeLabel];
    }
    return self;
}


//Xib所需调用的方法
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
