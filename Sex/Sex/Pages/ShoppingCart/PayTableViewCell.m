//
//  PayTableViewCell.m
//  Sex
//
//  Created by shendong on 16/10/13.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "PayTableViewCell.h"

@implementation PayTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)slectedAction:(UIButton *)sender {
    if (!sender.selected) {
        sender.selected = YES;
        if (self.selecteBlcok) {
            self.selecteBlcok(YES);
        }
    }
}

@end
