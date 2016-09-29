//
//  HomeListViewModel.m
//  Sex
//
//  Created by shendong on 16/9/29.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "HomeListViewModel.h"
#import "HomeListsTableView.h"
#import "HomeListAriticleTableViewCell.h"
#import "HomeListsTableViewHeaderView.h"


@interface HomeListViewModel ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) HomeListsTableView *listsTableView;

@end

@implementation HomeListViewModel

- (void)bindWithTableView:(__kindof HomeListsTableView *)homelistTableView{
    self.listsTableView = homelistTableView;
    self.listsTableView.dataSource = self;
    self.listsTableView.delegate = self;
    [self.listsTableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeListAriticleTableViewCell class]) bundle:nil] forCellReuseIdentifier:[HomeListAriticleTableViewCell cellIdentifier]];
    [self.listsTableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeListsTableViewHeaderView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:[HomeListsTableViewHeaderView cellIdentifier]];
    [self.listsTableView reloadData];
}
#pragma mark - UITableViewDatasource and delegate -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeListAriticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HomeListAriticleTableViewCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HomeListsTableViewHeaderView *header = [self.listsTableView dequeueReusableHeaderFooterViewWithIdentifier:[HomeListsTableViewHeaderView cellIdentifier]];
    return header;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%s",__FUNCTION__);
}
@end
