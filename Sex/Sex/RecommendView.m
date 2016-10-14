//
//  RecommendView.m
//  Sex
//
//  Created by shendong on 16/10/14.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "RecommendView.h"
#import "RecommendViewModel.h"
#import "SexCollectionViewCell.h"
#import "SexModel.h"

@interface RecommendView ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet RecommendViewModel *recommendViewModel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *resources;
@end

@implementation RecommendView
- (NSMutableArray *)resources{
    if (!_resources) {
        _resources = [NSMutableArray array];
    }
    return _resources;
}
- (void)didMoveToSuperview{
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"SexCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellKey"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
    NSLog(@"frame = %@", NSStringFromCGRect(self.frame));
    [self.resources addObjectsFromArray:[SexModel testModels:10]];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.resources.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SexCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellKey" forIndexPath:indexPath];
    cell.product = self.resources[indexPath.row];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, CGRectGetHeight(self.frame));
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"indexrow = %ld",indexPath.row);
}
- (void)layoutSubviews{
    NSLog(@"layoutSubviews :frame = %@", NSStringFromCGRect(self.frame));
    NSLog(@"cgrect :frame = %lf", CGRectGetHeight(self.frame));
}

@end
