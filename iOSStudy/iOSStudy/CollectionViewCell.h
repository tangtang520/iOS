//
//  CollectionViewCell.h
//  iOSStudy
//
//  Created by 汤丰源 on 15/12/4.
//  Copyright © 2015年 汤丰源. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end