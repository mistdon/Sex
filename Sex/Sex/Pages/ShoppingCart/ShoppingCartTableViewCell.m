//
//  ShoppingCartTableViewCell.m
//  Sex
//
//  Created by shendong on 16/10/10.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "ShoppingCartTableViewCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

#import "NumberCountView.h"

@interface ShoppingCartTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet NumberCountView *numerCountView;
@property (weak, nonatomic) IBOutlet UIButton *selectedButton;

@end
@implementation ShoppingCartTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [[self.selectedButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        self.selectedButton.selected = !self.selectedButton.selected;
    }];
    
}
- (void)bindWithProduct:(CartPorduct *)product{
    self.selectedButton.selected = product.selected ;
    self.numerCountView.num = product.number;
    self.priceLabel.text    = [NSString stringWithFormat:@"%2.lf",product.price];

    self.numerCountView.newchange = ^(NSInteger newnum){
        self.newchange(newnum);
    };
    [RACObserve(self.selectedButton, selected) subscribeNext:^(id x) {
        if (self.selectedChange) {
            self.selectedChange([x boolValue]);
        }
    }];
}
@end
