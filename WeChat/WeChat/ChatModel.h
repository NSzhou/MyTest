//
//  ChatModel.h
//  WeChat
//
//  Created by 朵朵奇葩向阳开 on 15/10/13.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatModel : NSObject

@property(nonatomic,copy)NSString * conent;//内容

//用于判断是否为自己发得属性
@property(nonatomic,assign)BOOL isSelf;

@end
