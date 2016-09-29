//
//  DropdownView.m
//  Sex
//
//  Created by shendong on 16/9/29.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "DropdownView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Masonry.h>
#import "DropdownViewModel.h"


@interface DropdownView()
@property (weak, nonatomic) IBOutlet UIButton *categoryButton;
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, assign) BOOL expand; //是否展开
@property (nonatomic, strong) DropdownViewModel *viewModel;
@property (nonatomic, strong) UIButton *maskView;
@end
@implementation DropdownView

- (void)bindWithViewModel{
    self.viewModel = [[DropdownViewModel alloc]  init];
    @weakify(self);
    [[self.categoryButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        self.expand = !self.expand;
    }];
}
- (void)setupSubViews{
    [self.superview bringSubviewToFront:self];
    [self insertSubview:self.maskView atIndex:0];
    @weakify(self);
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.mas_bottom);
        make.leading.trailing.equalTo(self.superview);
        make.bottom.equalTo(self.mas_bottom);
    }];
    [[self.maskView rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        self.expand = !self.expand;
    }];
    [[RACObserve(self, expand) distinctUntilChanged] subscribeNext:^(NSNumber *x) {
        NSLog(@"expand = %d", x.boolValue);
        if ([x boolValue]) {
            [self.maskView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_bottom);
                make.leading.trailing.equalTo(self.superview);
                make.bottom.equalTo(self.superview);
            }];
            [UIView animateWithDuration:1 animations:^{
                [self.maskView layoutIfNeeded];
            }];
        }else{
            [self.maskView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.mas_bottom);
            }];
            
            [UIView animateWithDuration:1 animations:^{
                 [self.maskView layoutIfNeeded];;
            }];
        };
    }];
}
- (UIButton *)maskView{
    if (!_maskView) {
        _maskView = [[UIButton alloc] init];
//        _maskView.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
        _maskView.backgroundColor = [UIColor greenColor];
    }
    return _maskView;
}
- (void)didMoveToSuperview{
    NSLog(@"%s",__FUNCTION__);
    [self setupSubViews];
    [self bindWithViewModel];
}

@end
