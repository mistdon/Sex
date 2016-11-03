//
//  NumberCount.m
//  Sex
//
//  Created by shendong on 16/10/10.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "NumberCountView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface NumberCountView()
@property (nonatomic, weak) IBOutlet UIButton *decreaseButton;
@property (nonatomic, weak) IBOutlet UIButton *increaseButton;
@property (nonatomic, weak) IBOutlet UILabel *numberLabel;
@end
;
@implementation NumberCountView

-(void)didMoveToSuperview{
    @weakify(self);
    RAC(self.numberLabel, text) = [[RACObserve(self, num) distinctUntilChanged] map:^id(id value) {
        return [NSString stringWithFormat:@"%@",value];
    }];
    [[[self.decreaseButton rac_signalForControlEvents:UIControlEventTouchUpInside] filter:^BOOL(id value) {
        return self.num  >= 1;
    }] subscribeNext:^(id x) {
        @strongify(self);
        self.num -= 1;
        if (self.newchange) {
            self.newchange(self.num);
        }
    }];
    [[self.increaseButton rac_signalForControlEvents:UIControlEventTouchUpInside]  subscribeNext:^(id x) {
        @strongify(self);
        self.num += 1;
        if (self.newchange) {
            self.newchange(self.num);
        }
    }];
}
@end
