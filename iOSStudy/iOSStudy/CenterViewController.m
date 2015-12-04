//
//  CenterViewController.m
//  iOSStudy
//
//  Created by 汤丰源 on 15/12/3.
//  Copyright © 2015年 汤丰源. All rights reserved.
//

#import "CenterViewController.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
#import "WebViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
@interface CenterViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
- (IBAction)showLeftView:(UIBarButtonItem *)sender;

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [self loadData];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem.title = @"编辑";
    
    //设置菊花loading
    self.aiv = [[UIActivityIndicatorView alloc]init];
    self.aiv.frame = CGRectMake(0, 0, 100, 100);
    self.aiv.center = CGPointMake(WIDTH*0.5, HEIGHT*0.5);
    [self.aiv setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.aiv setColor:[UIColor grayColor]];
    [self.aiv startAnimating];
    [self.view addSubview:self.aiv];
}

//设置编辑功能

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showLeftView:(UIBarButtonItem *)sender {
    [[AppDelegate globalDelegate]toggleLeftDrawer:self animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [self.data[indexPath.row] objectForKey:@"title"];
    NSURL *imageUrl = [NSURL URLWithString:[self.data[indexPath.row] objectForKey:@"iconUrl"]];
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
    return cell;
}
//网络请求数据
-(void)loadData{
    AFHTTPRequestOperationManager *manage = [AFHTTPRequestOperationManager manager];
    [manage GET:@"http://ch.dev.selcome.com/json-data/wangzhi/jsonData.json" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        self.data = [responseObject mutableCopy];
        [self.aiv stopAnimating];
        [self.tableview reloadData];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"失败了");
    }];
}

//设置编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;{
    return UITableViewCellEditingStyleDelete;
}
//设置编辑状态
-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    [self.tableview setEditing:editing animated:YES];
    if (editing) {
        self.navigationItem.rightBarButtonItem.title = @"完成";
    }else{
        self.navigationItem.rightBarButtonItem.title = @"编辑";
    }
}
//删除提交操作
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *indexArr = [NSArray arrayWithObject:indexPath];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.data removeObjectAtIndex:indexPath.row];
        [self.tableview deleteRowsAtIndexPaths:indexArr withRowAnimation:UITableViewRowAnimationFade];
        [self.tableview reloadData];
    }
    
}
//cell选中操作
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WebViewController *webview = [storyboard instantiateViewControllerWithIdentifier:@"webview"];
    webview.url = [self.data[indexPath.row] objectForKey:@"url"];
    [self.navigationController pushViewController:webview animated:YES];
    //移除选中状态
    [self.tableview deselectRowAtIndexPath:indexPath animated:YES];
}

//设置高亮
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
@end
