//
//  CostCountViewModel.m
//  Sex
//
//  Created by shendong on 16/10/10.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "CostCountViewModel.h"
#import "CartPorduct.h"
#import "ShoppingCartTableViewCell.h"

static NSString *const KCellIdentifier = @"shoppingcartCellIdentifier";

@interface CostCountViewModel()

@property (nonatomic, strong) NSMutableArray *innerDatas;

@end
@implementation CostCountViewModel

SingletonInstance(CostCountViewModel)
- (instancetype)init{
    if (self = [super init]) {
        [self configure];
    }
    return self;
}
- (void)configure{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self fetchNewData];
    });
    [[[RACObserve(self, isSelectedAll) skip:1] distinctUntilChanged] subscribeNext:^(id x) {
        for (CartPorduct *pro in self.innerDatas) {
            pro.selected = YES;
        };
        [self refresh];
    }];
}
- (NSMutableArray *)innerDatas{
    if (!_innerDatas) {
        _innerDatas = [NSMutableArray array];
    }
    return _innerDatas;
}
- (void)fetchNewData{
    for (int index =  0 ; index < 5; index ++) {
        CartPorduct *pro  = [[CartPorduct alloc] init];
        pro.price = 100 * index;
        pro.num = index * 2;
        pro.saving = index * 0.2;
        if (index < 3) {
            pro.selected = NO;
        }
        [self.innerDatas addObject:pro];
    }
    [self.innerDatas enumerateObjectsUsingBlock:^(CartPorduct *product, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!product.selected) {
            self.isSelectedAll = NO;
            *stop = YES;
        };
    }];
    [self refresh];
    
}

#pragma mark - refresh -
- (RACSignal *)reloadData{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        for (CartPorduct *pro in self.innerDatas) {
            pro.selected = self.isSelectedAll;
        };
        [subscriber sendNext:self.innerDatas];
        [subscriber sendCompleted];
        return nil;
    }];
}
- (void)refresh{
    self.datas = [self.innerDatas copy];
    self.needReloadData = !self.needReloadData;
}
#pragma mark - UITableViewdatasource and delegate -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShoppingCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KCellIdentifier];
    CartPorduct *product = [self.innerDatas objectAtIndex:indexPath.row];
    [cell bindWithProduct:product];

    NSArray *combines = @[RACObserve(product, num),RACObserve(product, selected)];
    [[[RACSignal combineLatest:combines] skip:1] subscribeNext:^(id x) {
        [self refresh];
        [self reCalculateNewPrices];
    }];
    return cell;
}
- (void)reCalculateNewPrices{
    NSInteger total_num = 0;
    CGFloat total_price = 0.0;
    CGFloat total_saveing = 0.0;
    for (CartPorduct *product in self.innerDatas) {
        if (product.selected) {
            total_num += product.num;
            total_price += product.price * product.num;
            total_saveing += product.saving * product.num;
        }
    }
    self.num = total_num;
    self.totalPrice = total_price;
    self.saving = total_saveing;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.innerDatas removeObjectAtIndex:indexPath.row];
    [self refresh];
}
@end
