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
- (void)didMoveToSuperview{
    self.allButton.selected = YES;
    selected = 1;
    self.option = 1;

    
    
}
- (IBAction)TapAction:(UIButton *)sender {
    if (sender.tag == 1004 ) {
        if (self.option != 4) {
            [sender setImage:[self priceImageWithTag:1] forState:UIControlStateSelected];
        }else{
            [sender setImage:[self priceImageWithTag:2] forState:UIControlStateSelected];
            self.option = 5;
            return;
        }
    }
    if (sender.tag - 1000 == selected)return;
    for (UIButton *old in self.subviews[0].subviews) {
        if (old.tag - 1000 == selected) {
            old.selected = NO;
            break;
        }
    }
    selected = sender.tag - 1000;
    self.option = selected;
    sender.selected = YES;
}
- (UIImage *)priceImageWithTag:(NSInteger)tag{
    if (tag < 0 || tag > 2)return nil;
    NSString *name = nil;
    switch (tag) {
        case 0:
            name = @"price_normal";
            break;
        case 1:
            name = @"price_asc";
            break;
        case 2:
            name = @"price_desc";
            break;
        default:
            break;
    }
    return [UIImage imageNamed:name];
}
@end
