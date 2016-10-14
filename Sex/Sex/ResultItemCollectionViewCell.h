//
//  ResultItemCollectionViewCell.h
//  Sex
//
//  Created by shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SexProductItem.h"
@interface ResultItemCollectionViewCell : UICollectionViewCell

- (void)bindWithModel:(SexProductItem *)item;

@end
