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

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet DropdownView *dropdownView;
@property (weak, nonatomic) IBOutlet HorizontailListView *horizonalListView;
@property (weak, nonatomic) IBOutlet SearchResultListView *searchResultListView;
@property (weak, nonatomic) IBOutlet SearchOptionsView *searchOptions;

@property (nonatomic, strong) SearchViewModel *searchViewModel;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Search";
    self.searchViewModel = [[SearchViewModel alloc] init];
    self.searchViewModel.currentCategory = self.searchCategory;
    self.searchViewModel.currentItem = self.searchItem;
    
    NSArray *data =  @[@"111",@"222",@"333",@"44",@"55"];
    
    @weakify(self);
    RAC(self.horizonalListView, category)  = RACObserve(self.dropdownView, categoryItem);
    RACSignal *combines = [RACSignal combineLatest:@[RACObserve(self.dropdownView, categoryItem), RACObserve(self.horizonalListView, currentItem), RACObserve(self.searchOptions, option)] reduce:^id(NSString *category, NSString *item, NSNumber *option){
        return [RACTuple tupleWithObjects:category, item,option, nil];
    }];
    [[combines distinctUntilChanged] subscribeNext:^(RACTuple *tuple) {
        NSLog(@"tupe = %@,%@,%@",tuple.first, tuple.second, tuple.third);
    }];
    
    self.horizonalListView.datas = data;

    self.horizonalListView.currentPage = ^(NSInteger page){
        @strongify(self);
        NSLog(@"111page = %ld",page);
        [self.searchResultListView scrollToPage:page];;
    };
    
    
    self.searchResultListView.keys = data;
    
    self.searchResultListView.currentPage = ^(NSInteger page){
        @strongify(self);
        NSLog(@"page = %ld",page);
        [self.horizonalListView setCurrentIndex:page];;
    };
    
    [[self.searchViewModel queryCategoryById:0 page:0 sort:@"11"] subscribeNext:^(NSArray<SexProductItem *> *datas) {
        NSLog(@"x = %@",datas);
    }error:^(NSError *error) {
        NSLog(@"error  %");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
