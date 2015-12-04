//
//  AppDelegate.h
//  iOSStudy
//
//  Created by 汤丰源 on 15/12/3.
//  Copyright © 2015年 汤丰源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CenterViewController.h"
#import "LeftViewController.h"
@class JVFloatingDrawerViewController;
@class JVFloatingDrawerSpringAnimator;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//定义主页面视图控制器
@property (nonatomic,strong) CenterViewController *centerViewController;

//定义主页面中左边划出的视图
@property (nonatomic,strong) LeftViewController *leftViewController;
//定义JVFloatingDrawerViewController控制器
@property (nonatomic, strong) JVFloatingDrawerViewController *drawerViewController;

//定义组件动画类
@property (nonatomic, strong) JVFloatingDrawerSpringAnimator *drawerAnimator;

//定义单例
+ (AppDelegate *)globalDelegate;

- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated;
-(void)setUpViewControllerForJVFloatingDrawer;
- (JVFloatingDrawerViewController *)drawerViewController;

@end

