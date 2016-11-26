//
//  ListsCollectionViewController.m
//  Sex
//
//  Created by Shendong on 16/9/28.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "ListsCollectionViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <MJRefresh/MJRefresh.h>

#import "ListsViewModel.h"
#import "SexChannel.h"
#import "ListsCollectionViewCell.h"
#import "ListsHeaderCollectionReusableView.h"
#import "HeaderCollectionViewCell.h"
#import "DirectSearchTableViewController.h"
#import "UIScrollView+SexRefresh.h"

#import "UIColor+scheme.h"

@interface ListsCollectionViewController ()<UICollectionViewDelegateFlowLayout, UISearchBarDelegate>
@property (nonatomic, strong) NSMutableArray *datasources;
@end

@implementation ListsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datasources = [NSMutableArray array];
    
    [self setupTitleView];
    [self setupRefresh];
    [self queryNewData];
    [self setEmptyViewWithOutNetwork];
}
- (void)setEmptyViewWithOutNetwork{
    
}
- (void)queryNewData{
    ListsViewModel *viewModel = [[ListsViewModel alloc] init];
    [[viewModel queryLists] subscribeNext:^(NSArray *x) {
        [self.datasources removeAllObjects];
        [self.datasources addObjectsFromArray:x];
        [self.collectionView reloadData];
    }error:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}
- (void)setupTitleView{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20, 0, [UIScreen mainScreen].bounds.size.width - 40 , 44)];
    searchBar.delegate = self;
    searchBar.placeholder = @"请输入您要搜索的商品名称";
    UITextField *textField = [searchBar valueForKey:@"_searchField"];
    textField.backgroundColor = RGB(232, 233, 232);
    textField.textAlignment = NSTextAlignmentLeft;
    self.navigationItem.titleView = searchBar;
}
- (void)setupRefresh{
    
    @weakify(self);
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        @strongify(self);
        [self queryNewData];
        [self.collectionView.mj_header endRefreshing];
    }];
    NSMutableArray *array  = [NSMutableArray array];
    for (int index = 1; index < 10; index++) {
        [array addObject:[UIImage imageNamed:[NSString stringWithFormat:@"ic_ani_loaing_%d",index]]];
    }
    NSArray *pullingImages = array;
    [header setImages:pullingImages forState:MJRefreshStateIdle];
    // Set the refreshing state of animated images
    NSMutableArray *array1  = [NSMutableArray array];
    for (int index = 10; index < 29; index++) {
        [array1 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"ic_ani_loaing_%d",index]]];
    }
    NSArray *refreshingImages = array1;
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
    // Set header
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    self.collectionView.mj_header = header;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (self.datasources.count == 0) {
        return 0;
    }
    return self.datasources.count + 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.datasources.count;
    }
    SexChannel *channel = self.datasources[section - 1];
    return channel.data.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 ) {
        HeaderCollectionViewCell *headerCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HeaderCell" forIndexPath:indexPath];
        SexChannel *channel  = self.datasources[indexPath.row];
        [headerCell bindWithChannel:channel];
        return headerCell;
    }else{
            ListsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        SexChannel *channel  = self.datasources[indexPath.section - 1];
        SexProduct *product = channel.data[indexPath.row];
        [cell.imageView sd_setImageWithURL:product.goodsImg placeholderImage:nil];
        cell.detailLabel.text = product.goodsName;
        cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? [UIColor clearColor] : [UIColor whiteColor];
        return cell;
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    ListsHeaderCollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        return nil;
    }
    [reusableView bindChannel:self.datasources[indexPath.section-1]];
    return reusableView;
}
#pragma mark <UICollectionViewDelegate>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return section == 0 ? CGSizeZero:CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *search = [[UIStoryboard storyboardWithName:@"Search" bundle:nil] instantiateViewControllerWithIdentifier:@"SearchViewController"];
    if (indexPath.section == 0) {
        SexChannel *channel = self.datasources[indexPath.row];
        NSInteger cid = channel.value;
        [search setValue:@(cid) forKey:@"cid"];
    }else{
        SexChannel *channel  = self.datasources[indexPath.section - 1];
        SexProduct *product = channel.data[indexPath.row];
        NSInteger cid = product.value;
        [search setValue:@(cid) forKey:@"cid"];
    }
    [search setValue:self.datasources forKey:@"categorys"];
    [self.navigationController pushViewController:search animated:YES];
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width)/ 3.0, ([UIScreen mainScreen].bounds.size.width/ 3.0) * 1.1);
}

#pragma mark - searchbar delegate - 
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    UIViewController *searchvc = [[UIStoryboard storyboardWithName:@"Search" bundle:nil] instantiateViewControllerWithIdentifier:@"DirectSearchTableViewController"];
    [self.navigationController pushViewController:searchvc animated:YES];
    
}
@end
