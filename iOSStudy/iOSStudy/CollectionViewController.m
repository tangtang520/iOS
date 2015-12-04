//
//  CollectionViewController.m
//  iOSStudy
//
//  Created by 汤丰源 on 15/12/4.
//  Copyright © 2015年 汤丰源. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "AppDelegate.h"
@interface CollectionViewController ()
- (IBAction)showLeftView:(UIBarButtonItem *)sender;

@end

@implementation CollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.imageview.image = [UIImage imageNamed:@"sky"];
    int num = indexPath.section*2 + (indexPath.row+1);
    cell.label.text = [NSString stringWithFormat:@"第%d张",num];
    
    // Configure the cell
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    int num = indexPath.section*2 + (indexPath.row+1);
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"点击了第%d张",num] message:nil delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
    [alertView show];
    
}



- (IBAction)showLeftView:(UIBarButtonItem *)sender {
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
}
@end
