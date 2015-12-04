//
//  LeftViewController.m
//  iOSStudy
//
//  Created by 汤丰源 on 15/12/3.
//  Copyright © 2015年 汤丰源. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftTableViewCell.h"
#import "LeadViewController.h"
#import "AppDelegate.h"
#import "JVFloatingDrawerViewController.h"
@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;    
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    switch (indexPath.row) {
        case 0:
            cell.imageview.image = [UIImage imageNamed:@"one"];
            cell.label.text = @"tableView";
            break;
        case 1:
            cell.imageview.image = [UIImage imageNamed:@"two"];
            cell.label.text = @"scrollView";
            break;
        case 2:
            cell.imageview.image = [UIImage imageNamed:@"one"];
            cell.label.text = @"collectionView";
            break;
        case 3:
            cell.imageview.image = [UIImage imageNamed:@"two"];
            cell.label.text = @"login+register";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;{
    UIStoryboard *storeboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *leadViewController = [storeboard instantiateViewControllerWithIdentifier:@"leadView"];
    UICollectionViewController *collectionViewController = [storeboard instantiateViewControllerWithIdentifier:@"collectionview"];
    UIViewController *loginViewController = [storeboard instantiateViewControllerWithIdentifier:@"login"];
    UIViewController *destinationViewControllerView = nil;
    switch (indexPath.row) {
        case 0:
            destinationViewControllerView = [[AppDelegate globalDelegate] centerViewController];
            break;
        case 1:
            destinationViewControllerView = leadViewController;
            break;
        case 2:
            destinationViewControllerView = collectionViewController;
            break;
        case 3:
            destinationViewControllerView = loginViewController;
            break;
        default:
            break;
    }
    [[[AppDelegate globalDelegate] drawerViewController]setCenterViewController:destinationViewControllerView];
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
@end
