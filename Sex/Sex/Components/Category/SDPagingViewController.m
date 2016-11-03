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

- (void)setupUITableView{
    [self tableView].mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(pagingBeginLoad)];
    [self tableView].mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pageBeginFirstLoad)];
    [[self tableView] setTableFooterView:[UIView new]];
    [self tableView].delegate = self;
    [self tableView].dataSource = self;
}
- (UITableView *)tableView{
    return nil;
}
- (void)pageBeginFirstLoad{
    [self pagingBeginLoad];
}
- (void)pagingBeginLoad{
    
}
- (void)reset{
    self.records  = nil;
    [self.tableView setContentOffset:CGPointMake(0, 0)];
    [self.tableView reloadData];
}
#pragma mark - UITableViewDelegate and datasource - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.records) {
        return self.records.count > 0 ? self.records.count : 0;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
#pragma mark - public method - 

- (void)refresh{
    if (!self.records || self.records.count == 0) {
        NSLog(@"无数据");
    }
    [self reset];
    [self pagingBeginLoad];
}
- (void)pagingLoaded:(NSArray *)modes{
    if (!self.records) {
        self.records = [modes copy];
    }else{
        self.records = [self.records arrayByAddingObjectsFromArray:modes];
    }
    [[self tableView] reloadData];
    
    if (modes.count == 0 ) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }else{
        [self.tableView.mj_footer endRefreshing];
    }
    if ([self.tableView.mj_header isRefreshing]) {
        [self.tableView.mj_header endRefreshing];
    }
}
@end
