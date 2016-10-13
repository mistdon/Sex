//
//  TotalCostView.m
//  
//
//  Created by shendong on 16/10/10.
//
//

#import "TotalCostView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface TotalCostView()
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *costLabel;
@property (weak, nonatomic) IBOutlet UILabel *savingLabel;

@end
@implementation TotalCostView

- (void)didMoveToSuperview{
    @weakify(self);
    [[[[RACObserve(self, num) distinctUntilChanged] doNext:^(id x) {
        @strongify(self);
        self.numLabel.text = [NSString stringWithFormat:@"%@",x];
    }]map:^id(id value) {
        return @([value integerValue] > 0);
    }] subscribeNext:^(id x) {
        self.calculateButton.enabled = [x boolValue];
    }];
    RAC(self.costLabel, text) = [RACObserve(self, cost) map:^id(id value) {
        return [NSString stringWithFormat:@"¥ %.2f",[value floatValue]];
    }];
    RAC(self.savingLabel, text) = [RACObserve(self, save) map:^id(id value) {
        return [NSString stringWithFormat:@"¥ %.2f",[value floatValue]];
    }];
}

@end
