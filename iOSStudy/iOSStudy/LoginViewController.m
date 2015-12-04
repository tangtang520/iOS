//
//  LoginViewController.m
//  iOSStudy
//
//  Created by 汤丰源 on 15/12/4.
//  Copyright © 2015年 汤丰源. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
@interface LoginViewController ()
- (IBAction)showLeftView:(UIBarButtonItem *)sender;
- (IBAction)register:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)doLogin:(UIButton *)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//呼出设置菜单
- (IBAction)showLeftView:(UIBarButtonItem *)sender {
    [[AppDelegate globalDelegate]toggleLeftDrawer:self animated:YES];
}

//跳转注册页面
- (IBAction)register:(UIBarButtonItem *)sender {
}
- (IBAction)doLogin:(UIButton *)sender {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefault objectForKey:@"userInfo"];
    if (self.userName.text.length == 0 || self.password.text.length == 0 ) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"请输入信息" message:nil delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [alertView show];
    }else{
        if (dic == nil) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"账号不存在" message:nil delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            [alertView show];
            
        }else{
            if (self.userName.text != [dic objectForKey:self.userName.text] || dic == nil) {
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"账号不存在" message:nil delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
                [alertView show];
            }else{
                if (self.password.text != [dic objectForKey:self.password.text]) {
                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"密码不正确" message:nil delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
                    [alertView show];
                }else{
                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"登陆成功" message:nil delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
                    [alertView show];
                }
            }
        }
        
    }
}
@end
