//
//  PayTableViewCell.h
//  Sex
//
//  Created by shendong on 16/10/13.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface PayTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *selectedButton;
@property (nonatomic, copy) void(^selecteBlcok)(BOOL selected);

@end
