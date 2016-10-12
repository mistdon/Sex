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
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (weak, nonatomic) IBOutlet UIButton *allSelectedButton;

@end
@implementation TotalCostView

- (void)didMoveToSuperview{
    RAC(self.numLabel, text) = [RACObserve(self, num) map:^id(id value) {
        return [NSString stringWithFormat:@"%@",value];
    }];
    RAC(self.costLabel, text) = [RACObserve(self, cost) map:^id(id value) {
        return [NSString stringWithFormat:@"¥ %.2f",[value floatValue]];
    }];
    RAC(self.savingLabel, text) = [RACObserve(self, save) map:^id(id value) {
        return [NSString stringWithFormat:@"¥ %.2f",[value floatValue]];
    }];
    
    [[self.allSelectedButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        self.allSelectedButton.selected = !self.allSelectedButton.selected;
        self.selectedAll = self.allSelectedButton.selected;
    }];
    
}
- (IBAction)calculateButtonClicked:(id)sender {
    [self calculate];
}

@end
