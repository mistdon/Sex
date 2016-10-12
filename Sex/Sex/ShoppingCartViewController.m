//
//  ShoppingCartViewController.m
//  Sex
//
//  Created by shendong on 16/10/10.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

#import "ShoppingCartTableViewCell.h"
#import "CostCountViewModel.h"
#import "TotalCostView.h"
#import "CartPorduct.h"

@interface ShoppingCartViewController ()
@property (nonatomic, strong) CostCountViewModel *costcount;
@property (weak, nonatomic) IBOutlet TotalCostView *totalcostView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.costcount = [CostCountViewModel shareInstance];
    
    self.tableView.dataSource = self.costcount;
    self.tableView.delegate   = self.costcount;
    
    [RACObserve(self.costcount, num) subscribeNext:^(id x) {
        NSLog(@"total_num = %ld",[x integerValue]);
    }];
    [RACObserve(self.costcount, totalPrice) subscribeNext:^(id x) {
        NSLog(@"totalPrice = %.2f",[x floatValue]);
    }];
    [RACObserve(self.costcount, saving) subscribeNext:^(id x) {
        NSLog(@"saving = %.2f",[x floatValue]);
    }];
    
    RAC(self.totalcostView, num) = RACObserve(self.costcount, num);
    RAC(self.totalcostView, cost) = RACObserve(self.costcount, totalPrice);
    RAC(self.totalcostView, save) = RACObserve(self.costcount, saving);
//    RAC(self.totalcostView, selectedAll) = RACObserve(self.costcount, isSelectedAll);
    [RACObserve(self.totalcostView, selectedAll) subscribeNext:^(id x) {
        NSLog(@"x = %@",x);
        self.costcount.isSelectedAll = [x boolValue];
        [[self.costcount reloadData] subscribeNext:^(id x) {
            [self.tableView reloadData];
        }];
        
    }];
    
//    [[RACSignal combineLatest:@[RACObserve(self.costcount, num), RACObserve(self.costcount, totalPrice), RACObserve(self.costcount, saving)]] subscribeNext:^(id x) {
//        NSLog(@"resulr = %@",x);
//    }];
    
    [[self.totalcostView rac_signalForSelector:@selector(calculate)] subscribeNext:^(id x) {
        NSLog(@"结算");
    }];
    
}



@end
