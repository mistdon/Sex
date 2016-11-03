//
//  SearchOptions.m
//  Sex
//
//  Created by shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "SearchOptionsView.h"
@interface SearchOptionsView()
@property (weak, nonatomic) IBOutlet UIButton *allButton;
@property (weak, nonatomic) IBOutlet UIButton *priceButton;
@property (weak, nonatomic) IBOutlet UIButton *saleButton;
@property (weak, nonatomic) IBOutlet UIButton *lastedButton;

@end
@implementation SearchOptionsView{
    NSUInteger selected;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    selected = 0;
}
- (void)didMoveToSuperview{

}
- (IBAction)TapAction:(UIButton *)sender {
    if (sender.tag - 1000 == selected)return;
    for (UIButton *old in self.subviews[0].subviews) {
        if (old.tag - 1000 == selected) {
            old.selected = NO;
            break;
        }
    }
    selected = sender.tag - 1000;
    self.option = [NSNumber numberWithUnsignedInteger:selected];
    sender.selected = YES;
}

@end
