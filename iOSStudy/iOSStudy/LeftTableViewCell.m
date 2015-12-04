//
//  LeftTableViewCell.m
//  iOSStudy
//
//  Created by 汤丰源 on 15/12/3.
//  Copyright © 2015年 汤丰源. All rights reserved.
//

#import "LeftTableViewCell.h"
@implementation LeftTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.label.textColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    

    
}


@end
