//
//  SearchResultListCollectionViewCell.m
//  Sex
//
//  Created by shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "SearchResultListCollectionViewCell.h"
#import "ResultItemCollectionViewCell.h"

@interface SearchResultListCollectionViewCell()
@property (nonatomic, strong) NSMutableArray<SexProductItem *> *datas;
@property (weak, nonatomic) IBOutlet UICollectionView *listCollectionView;
@end
@implementation SearchResultListCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.datas = @[@"11",@"22",@"33",@"11",@"22",@"33",@"11",@"22",@"33",@"11",@"22",@"33"];
    // Initialization code
}
- (void)didMoveToSuperview{
    [self.listCollectionView registerNib:[UINib nibWithNibName:@"ResultItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"keeeys"];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datas.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ResultItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"keeeys" forIndexPath:indexPath];
//    [cell bindWithModel:[self.datas objectAtIndex:indexPath.row]];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.bounds.size.width-30)/2, 250);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
@end
