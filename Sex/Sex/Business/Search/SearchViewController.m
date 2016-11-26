//
//  SearchViewController.m
//  Sex
//
//  Created by Shendong on 16/9/29.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "SearchViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "DropdownView.h"
#import "HorizontailListView.h"
#import "SearchResultListView.h"
#import "SearchViewModel.h"
#import "SearchOptionsView.h"
#import "SexProductItem.h"
#import "RequestService.h"
#import "ResultItemCollectionViewCell.h"
#import <MJExtension/MJExtension.h>
#import "SexConst.h"

@interface SearchViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet DropdownView *dropdownView;
@property (weak, nonatomic) IBOutlet HorizontailListView *horizonalListView;
@property (weak, nonatomic) IBOutlet SearchResultListView *searchResultListView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet SearchOptionsView *searchOptions;

@property (nonatomic, strong) SearchViewModel *searchViewModel;

@property (nonatomic, strong) RACSignal *combinesSignal;

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger pn;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, copy) NSString *by;
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.pn = 10; //每页数量
    
    self.datas = [NSMutableArray array];
    
    self.sort = @"price";
    self.by = @"ase";
   
    self.title = @"Search";
    [self.collectionView registerNib:[UINib nibWithNibName:@"ResultItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellidentifer"];
    
    
    self.searchViewModel = [[SearchViewModel alloc] init];
    self.searchViewModel.currentCategory = self.searchCategory;
    self.searchViewModel.currentItem = self.searchItem;
    
    self.combinesSignal = [RACSignal combineLatest:@[RACObserve(self, cid), RACObserve(self, page), RACObserve(self, pn), RACObserve(self, sort), RACObserve(self, by)] reduce:^id(NSNumber *cid, NSNumber *page, NSNumber *pn, NSString *sort, NSString *by){
        return [RACTuple tupleWithObjects:cid,page,pn,sort,by,nil];
    }];
    @weakify(self);
    [self.combinesSignal subscribeNext:^(id x) {
        NSLog(@"combine = %@",x);
    }];
    
    self.dropdownView.datas = self.categorys;
    
    [RACObserve(self.dropdownView, currentChannel) subscribeNext:^(SexChannel *x) {
        NSLog(@"current category item = %@",x.name);
        @strongify(self);
        self.horizonalListView.datas = x.data;
    }];
    
    [[RACObserve(self.searchOptions, option) distinctUntilChanged] subscribeNext:^(NSNumber *x) {
        NSLog(@"option = %ld",[x integerValue]);
        @strongify(self);
        [self requreyData];
        
    }];
    
    
    NSLog(@"cid = %ld",self.cid);
    
    
//    NSArray *data =  @[@"111",@"222",@"333",@"44",@"55"];
//
//    @weakify(self);
//    RAC(self.horizonalListView, category)  = RACObserve(self.dropdownView, categoryItem);
//    RACSignal *combines = [RACSignal combineLatest:@[RACObserve(self.dropdownView, categoryItem), RACObserve(self.horizonalListView, currentItem), RACObserve(self.searchOptions, option)] reduce:^id(NSString *category, NSString *item, NSNumber *option){
//        return [RACTuple tupleWithObjects:category, item,option, nil];
//    }];
//    [[combines distinctUntilChanged] subscribeNext:^(RACTuple *tuple) {
//        NSLog(@"tupe = %@,%@,%@",tuple.first, tuple.second, tuple.third);
//    }];
//    
//    self.horizonalListView.datas = data;
//
//    self.horizonalListView.currentPage = ^(NSInteger page){
//        @strongify(self);
//        NSLog(@"111page = %ld",page);
//        [self.searchResultListView scrollToPage:page];;
//    };
//    
//    
//    self.searchResultListView.keys = data;
//    
//    self.searchResultListView.currentPage = ^(NSInteger page){
//        @strongify(self);
//        NSLog(@"page = %ld",page);
//        [self.horizonalListView setCurrentIndex:page];;
//    };
//    
//    [[self.searchViewModel queryCategoryById:0 page:0 sort:@"11"] subscribeNext:^(NSArray<SexProductItem *> *datas) {
//        NSLog(@"x = %@",datas);
//    }error:^(NSError *error) {
//        NSLog(@"error = %@",error);
//    }];
}

- (void)requreyData{
    RequestService *serivce  = [[RequestService alloc] init];
    [[serivce requretWithUrl:KSearch withParameters:nil] subscribeNext:^(NSArray *x) {
        NSArray *array = [SexProductItem mj_objectArrayWithKeyValuesArray:x];
        [self.datas removeAllObjects];
        [self.datas addObjectsFromArray:array];
        [self.collectionView reloadData];
    }];
}
#pragma mark - UICollectionView datasource and delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datas.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ResultItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellidentifer" forIndexPath:indexPath];
    [cell bindWithModel:self.datas[indexPath.row]];
//    cell.contentView.backgroundColor = [UIColor lightGrayColor];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((KScreen_Width - 30) / 2.0, 200);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
