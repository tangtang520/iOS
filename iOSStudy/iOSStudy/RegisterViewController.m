//
//  RegisterViewController.m
//  iOSStudy
//
//  Created by 汤丰源 on 15/12/4.
//  Copyright © 2015年 汤丰源. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UITextField *againpassword;
- (IBAction)doRegister:(UIButton *)sender;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doRegister:(UIButton *)sender {
    if (self.username.text.length == 0  || self.password.text.length == 0 || self.againpassword.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"请输入信息" message:nil delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [alertView show];
    }else{
        if (self.password.text != self.againpassword.text) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"请输入相同的密码" message:nil delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            [alertView show];
        }else{
            //可以存储信息
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            [dic setObject:self.username.text forKey:self.username.text];
            [dic setObject:self.password.text forKey:self.password.text];
            NSLog(@"self.dic-->>>%@",dic);
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            [userDefault setObject:dic forKey:@"userInfo"];
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"注册成功" message:nil delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            alertView.delegate = self;
            [alertView show];
        }
    }
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex NS_DEPRECATED_IOS(2_0, 9_0);{
    if(buttonIndex == 0){
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
