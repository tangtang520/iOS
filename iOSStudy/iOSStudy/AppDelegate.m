//
//  AppDelegate.m
//  iOSStudy
//
//  Created by 汤丰源 on 15/12/3.
//  Copyright © 2015年 汤丰源. All rights reserved.
//

#import "AppDelegate.h"
#import "CenterViewController.h"
#import "LeadViewController.h"
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.window.rootViewController = [self drawerViewController];
        [self setUpViewControllerForJVFloatingDrawer];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark - 把试图控制器设置为JVFloatingDrawerViewController中的视图
-(void)setUpViewControllerForJVFloatingDrawer{
    //实例化视图
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CenterViewController *centerViewController = [storyboard instantiateViewControllerWithIdentifier:@"centerView"];
    LeftViewController *leftViewController = [storyboard instantiateViewControllerWithIdentifier:@"leftView"];
    self.leftViewController = [[LeftViewController alloc]init];
    self.drawerViewController.centerViewController = self.centerViewController;
    self.drawerViewController.leftViewController = leftViewController;
    self.drawerViewController.backgroundImage = [UIImage imageNamed:@"sky"];
    //设置动画
    self.drawerViewController.animator = self.drawerAnimator;
}

#pragma mark - 实现单例方法
+ (AppDelegate *)globalDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

#pragma mark - get方法实例JVController与jVAnimator
- (JVFloatingDrawerViewController *)drawerViewController {
    if (!_drawerViewController) {
        _drawerViewController = [[JVFloatingDrawerViewController alloc] init];
    }
    
    return _drawerViewController;
}
- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    if (!_drawerAnimator) {
        _drawerAnimator = [[JVFloatingDrawerSpringAnimator alloc] init];
    }
    
    return _drawerAnimator;
}

//实现点击左页面出现
- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated {
    [self.drawerViewController toggleDrawerWithSide:JVFloatingDrawerSideLeft animated:animated completion:nil];
}

-(UIViewController*)centerViewController{
    if (!_centerViewController) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CenterViewController *centerViewController = [storyboard instantiateViewControllerWithIdentifier:@"centerView"];
        _centerViewController = centerViewController;
    }
    return _centerViewController;
}

@end
