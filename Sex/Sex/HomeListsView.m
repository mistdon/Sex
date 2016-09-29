//
//  HomeListsView.m
//  Sex
//
//  Created by shendong on 16/9/29.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "HomeListsView.h"
#import <Masonry.h>

#import "HomeListsTableView.h"
#import "HomeListAriticleTableViewCell.h"

@interface HomeListsView()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) HomeListsTableView *homeListsTableView;

@end
@implementation HomeListsView
#pragma mark - lazy load - 
- (HomeListsTableView *)homeListsTableView{
    if (!_homeListsTableView) {
        _homeListsTableView  =  [[HomeListsTableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _homeListsTableView.delegate = self;
        _homeListsTableView.dataSource = self;
    }
    return _homeListsTableView;
}
#pragma mark - life cycle -
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews{
    NSLog(@"%s",__FUNCTION__);
    [self addSubview:self.homeListsTableView];
//    [self.homeListsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.and.leading.trailing.equalTo(self);
//    }];
    
}
#pragma mark - UITableViewDatasource and delegate -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HomeListAriticleTableViewCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}


@end
