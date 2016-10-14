//
//  SearchListCollectionView.m
//  Sex
//
//  Created by shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "SearchResultListView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "SearchResultListCollectionViewCell.h"

@interface SearchResultListView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
//@property (nonatomic, strong) UICollectionView *contentView;
@property (weak, nonatomic) IBOutlet UICollectionView *contentView;
@end
@implementation SearchResultListView

- (NSMutableArray *)keys{
    if (!_keys) {
        _keys = [NSMutableArray array];
    }
    return _keys;
}
- (void)didMoveToWindow{
    [self.contentView registerNib:[UINib nibWithNibName:@"SearchResultListCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"keys"];
    @weakify(self);
    [[RACObserve(self, keys) distinctUntilChanged] subscribeNext:^(id x) {
        @strongify(self);
        [self.contentView reloadData];
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.keys.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SearchResultListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"keys" forIndexPath:indexPath];
    cell.contentView.backgroundColor = indexPath.row == 0 ? [UIColor greenColor] : [UIColor blueColor];
//    cell 
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return self.bounds.size;
}
@end
