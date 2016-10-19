//
//  BillViewController.m
//  Sex
//
//  Created by shendong on 16/10/13.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "BillViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "CartPorduct.h"
#import "BillViewModel.h"
#import "RequestServiceManager.h"
#import "RequestService.h"

@interface BillViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet BillViewModel *billViewModel;

@end

@implementation BillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[[RequestServiceManager shareInstance] networkChangeSignal] subscribeNext:^(id x) {
        NSLog(@"x = %@",x);
    }];
    
    RequestService *service = [RequestService new];
    [[service testRequest] subscribeNext:^(id x) {
        NSLog(@"x = %@",x);
    }];
    
    
   
    
    @weakify(self);
    self.billViewModel.reloadBlock = ^(NSInteger section){
        @strongify(self);
        if (section > 0) {
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic]; ;
        }else{
            [self.tableView reloadData];
        }
    };
    [self.billViewModel closeBill:self.bills];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)commitBill:(id)sender {
    NSLog(@"payway = %@",self.billViewModel.payway);
    NSLog(@"transport = %@",self.billViewModel.transportway);
}



@end
