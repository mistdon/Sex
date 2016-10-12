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
    // Initialization code
    [[self.selectedButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        self.selectedButton.selected = !self.selectedButton.selected;
    }];
    
}
- (void)bindWithProduct:(CartPorduct *)product{
    self.selectedButton.selected = product.selected ;
    [RACObserve(self.selectedButton, selected) subscribeNext:^(id x) {
//        NSLog(@"x = %d",[x boolValue]);
        product.selected = [x boolValue];
    }];
    
    self.numerCountView.num = product.num;
    self.priceLabel.text    = [NSString stringWithFormat:@"%2.lf",product.price];
    self.numberChange = self.numerCountView.changeNum;
    [RACObserve(self.numerCountView, num) subscribeNext:^(id x) {
        product.num = [x integerValue];
    }];
}
- (void)productNumChangeCompletion:(void (^)(NSInteger))block{
//    [[[RACObserve(self.numerCountView, num) skip:1] distinctUntilChanged] subscribeNext:^(id x) {
//        block([x integerValue]);
//    }];
    block = self.numerCountView.changeNum;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
