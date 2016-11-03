//
//  SDPagingViewController.m
//  Sex
//
//  Created by shendong on 16/11/2.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "SDPagingViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface SDPagingViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation SDPagingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUITableView];
    
    [self refresh];
}

- (UITableView *)tableView{
    return nil;
}
- (void)setupUITableView{
    [self tableView].mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(pageBeginLoad)];
    [self tableView].mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pageBeginFirstLoad)];
    [[self tableView] setTableFooterView:[UIView new]];
    [self tableView].delegate = self;
    [self tableView].dataSource = self;
}
- (void)pageBeginLoad{
    
}
- (void)pageBeginFirstLoad{
    
}
#pragma mark - public method - 

- (void)refresh{
    
}

@end
