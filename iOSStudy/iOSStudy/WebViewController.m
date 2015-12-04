//
//  WebViewController.m
//  iOSStudy
//
//  Created by 汤丰源 on 15/12/4.
//  Copyright © 2015年 汤丰源. All rights reserved.
//

#import "WebViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
@interface WebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"url--->>%@",self.url);
    NSURL *webUrl = [NSURL URLWithString:self.url];
    NSURLRequest *requestUrl = [NSURLRequest requestWithURL:webUrl];
    [self.webview loadRequest:requestUrl];
    
    //实例化aiv
    self.aiv = [[UIActivityIndicatorView alloc]init];
    self.aiv.frame = CGRectMake(0, 0, 100, 100);
    self.aiv.center = CGPointMake(WIDTH*0.5, HEIGHT*0.5);
    [self.aiv setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.aiv setColor:[UIColor grayColor]];
    [self.aiv startAnimating];
    self.webview.delegate = self;
    [self.view addSubview:self.aiv];
    
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
- (void)webViewDidFinishLoad:(UIWebView *)webView;{
    [self.aiv stopAnimating];
}

@end
