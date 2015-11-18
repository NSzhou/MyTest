//
//  ChatTableViewCell.m
//  WeChat
//
//  Created by 朵朵奇葩向阳开 on 15/10/13.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "ChatTableViewCell.h"

@implementation ChatTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //拉取像素进行放大
        //找到图片信息
        UIImage * letfImage = [UIImage imageNamed:@"ReceiverTextNodeBkg"];
        UIImage * rightImage = [UIImage imageNamed:@"SenderTextNodeBkg"];
        //设定像素拉伸
        letfImage = [letfImage stretchableImageWithLeftCapWidth:30 topCapHeight:35];
        rightImage = [rightImage stretchableImageWithLeftCapWidth:30 topCapHeight:35];
        
        
        
        //左气泡
        self.leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 180, 40)];
        
        self.leftImageView.image = letfImage;
        
        [self.contentView addSubview:self.leftImageView];
        //右气泡
        self.rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(190, 5, 180, 40)];
        self.rightImageView.image = rightImage;
        [self.contentView addSubview:self.rightImageView];
        
        //添加文字
        self.leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 160, 30)];
        
        self.leftLabel.text = @"冰冰姐";
        
        [self.leftImageView addSubview:self.leftLabel];
        
        self.rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 160, 30)];
        
        self.rightLabel.text = @"你好啊";
        
        [self.rightImageView addSubview:self.rightLabel];
        
    }
    return self;
}



























- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
