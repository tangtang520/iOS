//
//  LeadViewController.m
//  iOSStudy
//
//  Created by 汤丰源 on 15/12/3.
//  Copyright © 2015年 汤丰源. All rights reserved.
//

#import "LeadViewController.h"
#import "AppDelegate.h"
#import "JVFloatingDrawerViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
@interface LeadViewController ()
- (IBAction)showLeftView:(UIBarButtonItem *)sender;

@end

@implementation LeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpSrollView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 引导页面
-(void)setUpSrollView{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(WIDTH * 3, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    for (int i=0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH * i, 0, WIDTH, HEIGHT)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]];
        [scrollView addSubview:imageView];
    }
}


- (IBAction)showLeftView:(UIBarButtonItem *)sender {
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
}
@end
