//
//  EmojiViewController.m
//  WeChat
//
//  Created by 朵朵奇葩向阳开 on 15/10/13.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "EmojiViewController.h"

@interface EmojiViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView * scrollView;

@end

@implementation EmojiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    //创建scrollview
    [self createScrollview];

    //往scrollview上添加图片
    [self addSubviews];
    
    
    
}
-(void)addSubviews
{
    UIImageView * imageView;
    for (int i = 0; i< 20; i++) {
            NSString * path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"Expression_%d@2x副本",i] ofType:@"png"];
            NSData * data = [[NSData alloc]initWithContentsOfFile:path];
            UIImage * image = [UIImage imageWithData:data];
            imageView = [[UIImageView alloc]initWithImage:image];
            imageView.frame = CGRectMake(48*(i-1),0 , 48, 48);
        [_scrollView addSubview:imageView];
    
    }
}
-(void)createScrollview
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-216, self.view.frame.size.width, 216)];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, 216);
    _scrollView.backgroundColor = [UIColor grayColor];
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
}










































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
