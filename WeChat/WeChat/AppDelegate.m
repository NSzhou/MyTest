//
//  AppDelegate.m
//  WeChat
//
//  Created by Sure on 15-8-27.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsViewController.h"
#import "MailListViewController.h"
#import "FindViewController.h"
#import "MeViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.backgroundColor = [UIColor whiteColor];
    
    [self createTabBarController];
    
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)createTabBarController{
    
    [[UINavigationBar appearance]setBarStyle:UIBarStyleBlack];
    
    NewsViewController * news = [[NewsViewController alloc]init];
    
    MailListViewController * mailList = [[MailListViewController alloc]init];
    
    FindViewController * find = [[FindViewController alloc]init];
    
    MeViewController * me = [[MeViewController alloc]init];
    
    NSMutableArray* array = [NSMutableArray arrayWithObjects:news, mailList, find, me, nil];
    
    NSArray * normalArr = @[@"tabbar_mainframe",@"tabbar_contacts",@"tabbar_discover",@"tabbar_me"];
    
    NSArray * selectedArr = @[@"tabbar_mainframeHL",@"tabbar_contactsHL",@"tabbar_discoverHL",@"tabbar_meHL"];;
    
    NSArray* titleArray = @[@"消息", @"通讯录", @"发现", @"我"];
    for (int i = 0; i < 4; i++) {
        UIViewController* vc = [array objectAtIndex:i];
        vc.title = titleArray[i];
        
        UINavigationController* nc = [[UINavigationController alloc] initWithRootViewController:vc];
        
        [vc.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        //array vc1,vc2...  替换
        //array nc1,nc2...
        [array replaceObjectAtIndex:i withObject:nc];
        
        //tabbar
        UIImage* image = [UIImage imageNamed:normalArr[i]];
        UIImage* selectImage = [UIImage imageNamed:selectedArr[i]];
        //ios7.0
        //渲染模式
        nc.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nc.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        /******/
        [nc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:43 / 255.0 green:179/ 255.0 blue:0 alpha:1]} forState:UIControlStateSelected];
//        nc.tabBarItem.badgeValue=@"New";
    }
    
    UITabBarController* tc = [[UITabBarController alloc] init];
    
    tc.viewControllers = array;
    
    self.window.rootViewController = tc;

}
- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
 
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
