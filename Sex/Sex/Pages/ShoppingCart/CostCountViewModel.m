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
#import "ShoppingcartAttachmentTableViewCell.h"
#import "RequestService.h"

static NSString *const KCartClistUrl = @"http://api.qinglvmao.com/cart/clist/?token=fb630f95f51389a216ffdc472b232781&sign=qHkDakhS8bU8wLSORAegUw%3D%3D";

static NSString *const KCellIdentifier = @"shoppingcartCellIdentifier";
static NSString *const KAttachmentIdentifier = @"attachmentCellIdentifer";
static NSString *const KHeaderViewIdentifier = @"shoppingcartHeaderIdentifier";

@interface CostCountViewModel()


@end
@implementation CostCountViewModel

SingletonInstance(CostCountViewModel)

#pragma mark - lazyload -
- (instancetype)init{
    if (self = [super init]) {
//        _reloadSubject = [RACSubject subject];
    }
    return self;
}
- (NSMutableArray *)datasources{
    if (!_datasources) {
        _datasources = [NSMutableArray array];
    }
    return _datasources;
}
//默认给的数据
- (void)initWithDefaultData{
    for (int index =  0 ; index < 5; index ++) {
        CartPorduct *pro  = [[CartPorduct alloc] init];
        pro.price = 100 * index;
        pro.number = index * 2;
        pro.saving = index * 0.2;
        if (index < 3) {
            pro.selected = NO;
        }
        [self.datasources addObject:pro];
    }
    self.reloadSubject = [RACReplaySubject subject];
}
#pragma mark - UITableViewdatasource and delegate -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasources.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CartPorduct *product = [self.datasources objectAtIndex:indexPath.row];
    if (product.number >= 0) {
        ShoppingCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KCellIdentifier];
        [cell bindWithProduct:product];
        __weak typeof(self)weakself = self;
        cell.newchange = ^(NSInteger newNum){
            product.number = newNum;
            [weakself recalculate];
        };
        cell.selectedChange = ^(BOOL selected){
            product.selected = selected;
            [weakself recalculate];
            [weakself judgeSelectedAllState];
        };
        return cell;
    }else{
        ShoppingcartAttachmentTableViewCell *attach = [tableView dequeueReusableCellWithIdentifier:KAttachmentIdentifier];
        return attach;
    }
}
#pragma mark - UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.datasources removeObjectAtIndex:indexPath.row];
    [self reloadTableView];
    [self recalculate];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[[NSBundle mainBundle] loadNibNamed:@"ShoppingcartHeaderView" owner:nil options:nil] firstObject];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 33.0f;
}

- (RACSignal *)getAllDatas{
    [self initWithDefaultData];
    if (self.reloadSubject) {
        [self.reloadSubject sendNext:self.datasources];
    }
    [self recalculate];
    [self reloadTableView];
    
    
    [[[RequestService new] requretWithUrl:KCartClistUrl withParameters:nil] subscribeNext:^(id x) {
        NSLog(@"request = %@",x);
    }error:^(NSError *error) {
        NSLog(@"res.error = %@",error);
    }];
    
    return [[[RequestService new] requretWithUrl:KCartClistUrl withParameters:nil] map:^id(id value) {
        return self.datasources;
    }];
    
    
}
- (void)reloadTableView{
    
}
- (void)slecteAllProducts:(BOOL)selected{
    [self.datasources enumerateObjectsUsingBlock:^(CartPorduct *pro, NSUInteger idx, BOOL * _Nonnull stop) {
        pro.selected = selected;
    }];
    [self reloadTableView];
    
}
//重新计算
- (void)recalculate{
    NSInteger temp_num = 0;
    CGFloat temp_price = 0.0f;
    CGFloat temp_saving = 0.0f;
    for (CartPorduct *pro in self.datasources) {
        if (pro.selected) {
            temp_num += pro.number;
            temp_price += pro.number * pro.price;
            temp_saving += pro.number * pro.saving;
        }
    }
    self.total_num = temp_num;
    self.total_price = temp_price;
    self.total_saving = temp_saving;
}
- (void)judgeSelectedAllState{
    [self.datasources enumerateObjectsUsingBlock:^(CartPorduct *pro, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!pro.selected) {
            self.isSelectedAll = NO;
            *stop = YES;
        };
        if ((idx = self.datasources.count - 1 && pro.selected == YES)) {
            self.isSelectedAll = YES;
        }
    }];
}





@end
