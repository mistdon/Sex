//
//  ShoppingCartViewController.m
//  Sex
//
//  Created by shendong on 16/10/10.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "BillViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

#import "ShoppingCartTableViewCell.h"
#import "CostCountViewModel.h"
#import "TotalCostView.h"
#import "CartPorduct.h"
#import "RecommendView.h"
#import "SexModel.h"
#import "RequestService.h"

@interface ShoppingCartViewController ()
@property (nonatomic, strong) CostCountViewModel *costcount;
@property (weak, nonatomic) IBOutlet TotalCostView *totalcostView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet RecommendView *emptyView;
@property (nonatomic, strong) NSArray *resultArray;
@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //viewmodel
    self.costcount = [CostCountViewModel shareInstance];
    //tableview
    
    self.tableView.dataSource = self.costcount;
    self.tableView.delegate   = self.costcount;

    [[self.costcount rac_signalForSelector:@selector(reloadTableView)] subscribeNext:^(id x) {
        NSLog(@"x = %@",x);
        [self.tableView reloadData];
    }];
    RAC(self.totalcostView, num) = RACObserve(self.costcount, total_num);
    RAC(self.totalcostView, cost) = RACObserve(self.costcount, total_price);
    RAC(self.totalcostView, save) = RACObserve(self.costcount, total_saving);
    
    @weakify(self);
    [[self.totalcostView.allSelectedButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *x) {
        @strongify(self);
        x.selected = !x.selected;
        [self.costcount slecteAllProducts:x.selected];;
    }];
    [[self.totalcostView.calculateButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        self.resultArray = [self.costcount.datasources filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"selected = YES"]];
        [self performSegueWithIdentifier:@"showBill" sender:self];
    }];
    RAC(self.totalcostView.allSelectedButton,selected) = RACObserve(self.costcount, isSelectedAll);
    
    [[self.emptyView.toToHallButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"去逛逛");
    }];
    self.emptyView.slectedRecommend = ^(SexModel *model){
        NSLog(@"name= %@",model.name);
    };
    //拉取数据
    [[self.costcount getAllDatas] subscribeNext:^(id x) {
        NSLog(@"x = %@",x);
    }];
    
    RequestService *service = [[RequestService alloc] init];
    [[service requretWithUrl:@"cart/clist/?token=fb630f95f51389a216ffdc472b232781&sign=pT%2F%2BpyDf4fotXxWFtACgZA%3D%3D" withParameters:nil] subscribeNext:^(id x) {
        NSLog(@"text = %@",x);
    }];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showBill"]) {
        BillViewController *bill  = segue.destinationViewController;
        bill.bills = self.resultArray;
    }
}
@end
