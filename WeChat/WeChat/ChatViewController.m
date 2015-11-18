//
//  ChatViewController.m
//  WeChat
//
//  Created by 朵朵奇葩向阳开 on 15/10/13.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatTableViewCell.h"
#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height
@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataArray;

//输入框
@property(nonatomic,strong)UIView * chatView;
//文本输入框
@property(nonatomic,strong)UITextField * chatTextField;
//发送按钮
@property(nonatomic,strong)UIButton * sendButton;
//表情按钮
@property(nonatomic,strong)UIButton * emojiButton;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //标题
    self.title = self.name;

    //iOS7以后视图控制器默认颜色是透明的
    self.view.backgroundColor = [UIColor whiteColor];
    
    //更改导航栏文字的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    //聊天界面搭建
    [self createUI];
}
-(void)createUI
{
    self.dataArray = [NSMutableArray array];
    //把自动布局关闭
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64,WIDTH ,HEIGHT-64-50) style:UITableViewStyleGrouped];
    
    _tableView.delegate =self;
    _tableView.dataSource = self;
    
    //去除间隙线
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
    [self.view addSubview:_tableView];
    [_tableView registerClass:[ChatTableViewCell class] forCellReuseIdentifier:@"ID"];
    
    
    
    /*************分割线***********/
    
    //输入框
    _chatView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-50, WIDTH, 50)];
    _chatView.backgroundColor = [UIColor colorWithRed:231/255.0 green:231/255.0 blue:231/255.0 alpha:1];
    
    [self.view addSubview:_chatView];
    //文本输入框
    _chatTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 5, WIDTH-120, 40)];
    _chatTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    _chatTextField.delegate = self;
    
    
    [_chatView addSubview:_chatTextField];
    //表情按钮
    _emojiButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _emojiButton.frame =  CGRectMake(WIDTH-100, 5, 40, 40);
    [_emojiButton addTarget:self action:@selector(emojiClick:) forControlEvents:UIControlEventTouchUpInside];
    [_emojiButton setImage:[UIImage imageNamed:@"Album_ToolViewEmotion@2x"] forState:UIControlStateNormal];
    [_chatView addSubview:_emojiButton];
    //发送按钮
    _sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [_sendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _sendButton.frame = CGRectMake(WIDTH-60, 5, 40, 40);
    [_sendButton addTarget:self action:@selector(sendClick:) forControlEvents:UIControlEventTouchUpInside];
    [_chatView addSubview:_sendButton];
    //点击屏幕收回
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDown)];
    
    [_tableView addGestureRecognizer:tap];
    
    //监听键盘显隐
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    
}
#pragma mark 键盘显隐
-(void)keyboardWillShow:(NSNotification *)noti
{
    //获取键盘大小  获得键盘坐标 (0,0,375,216)-->CGPoint CGSize
    CGSize keyBoardSize = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size;
    //更改聊天栏的位置
    [UIView animateWithDuration:0.1 animations:^{
       
        _chatView.frame = CGRectMake(0, HEIGHT-keyBoardSize.height-50, WIDTH, 50);
        //tableView
        _tableView.frame = CGRectMake(0, 64, WIDTH, HEIGHT-keyBoardSize.height-50-64);
        
    }];
}
-(void)keyboardWillHidden:(NSNotification *)noti
{
    //归位
    [UIView animateWithDuration:0.1 animations:^{
        _chatView.frame = CGRectMake(0, HEIGHT-50, WIDTH, 50);
        //tableView
        _tableView.frame = CGRectMake(0, 64, WIDTH, HEIGHT-50-64);
        

    }];
}
-(void)tapDown
{
    [_chatTextField resignFirstResponder];
}
-(void)emojiClick:(UIButton*)button
{

    
}
-(void)sendClick:(UIButton*)button
{
    if ([_chatTextField.text isEqualToString:@""]) {
        NSLog(@"所输内容不能为空");
    }else{
    //创建数据模型  存储所发送的内容
    ChatModel * model = [[ChatModel alloc]init];
    
    model.conent = _chatTextField.text;
    model.isSelf = YES;
    
    [self.dataArray addObject:model];
        

    //刷新TableView
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
        [_tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    
        _chatTextField.text = @"";
        
        //
        [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
        //添加自动回复
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(autoChat) userInfo:nil repeats:NO];
        
    }
    
}
-(void)autoChat
{
    ChatModel * model = [[ChatModel alloc]init];
    
    model.isSelf  = NO;
    
    NSArray * contentArr =  @[@"今天早上没吃药，感觉自己萌萌哒~",@"该吃药了",@"药不能停",@"孩子发烧总不好，多半是废了"];
    
    model.conent = contentArr[arc4random()%contentArr.count];
    [self.dataArray addObject:model];
    
    //刷新
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
    

    [_tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
    
}
#pragma mark 点击Return
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ID" forIndexPath:indexPath];
    
    //布局
    ChatModel * model = self.dataArray[indexPath.row];
    //自适应问题  根据所发送内容的大小来控制气泡的大小
    /*
     1.固定宽度高度自适应
     2.根据内容和设定的SIZE进行适应
     3.字体大小
     */
    CGSize size = [model.conent boundingRectWithSize:CGSizeMake(160, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0]} context:nil].size;
    
    
    
    
    //判断是否为自己发得
    if (model.isSelf) {
        //自己发的
        cell.leftImageView.hidden = YES;
        cell.rightImageView.hidden = NO;
        cell.rightLabel.text = model.conent;
        cell.rightLabel.numberOfLines = 0;
        cell.rightLabel.frame = CGRectMake(15, 5, size.width, size.height);
        cell.rightImageView.frame = CGRectMake(WIDTH-size.width-30, 5, size.width +30, size.height +20);//气泡大小
    }else
    {
        //对方
        cell.rightImageView.hidden = YES;
        cell.leftImageView.hidden = NO;
        cell.leftLabel.text = model.conent;
        cell.leftLabel.numberOfLines = 0;
        cell.leftLabel.frame = CGRectMake(15, 5, size.width, size.height);
        cell.leftImageView.frame = CGRectMake(10, 5, size.width+30, size.height+20);
    }
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //自适应行高
    ChatModel * model = self.dataArray[indexPath.row];
    
    CGSize size = [model.conent boundingRectWithSize:CGSizeMake(160, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0]} context:nil].size;
    return size.height+30;
}


































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
