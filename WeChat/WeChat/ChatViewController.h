//
//  ChatViewController.h
//  WeChat
//
//  Created by 朵朵奇葩向阳开 on 15/10/13.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatModel.h"
@interface ChatViewController : UIViewController<UITextFieldDelegate>

//正向传值
@property(nonatomic,copy)NSString * name;

@end
