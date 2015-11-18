//
//  NewsCell.h
//  WeChat
//
//  Created by Sure on 15-8-31.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell

//定义Cell所需展示内容的属性
@property (nonatomic,strong)UIImageView * headView;

@property (nonatomic,strong)UILabel * nameLabel;

@property (nonatomic,strong)UILabel * infoLabel;

@property (nonatomic,strong)UILabel * timeLabel;


@end
