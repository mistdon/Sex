//
//  SexCollectionViewCell.m
//  Sex
//
//  Created by shendong on 16/10/14.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "SexCollectionViewCell.h"
#import "SexModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation SexCollectionViewCell
{
    
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UILabel *descriptionLabel;
    __weak IBOutlet UILabel *priceLabel;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setProduct:(SexModel *)product{
    [imageView sd_setImageWithURL:product.image placeholderImage:[UIImage imageNamed:@"littledog.jpg"]];
    descriptionLabel.text = product.descriptionContent;
    priceLabel.text = [NSString stringWithFormat:@"¥ %.2lf",product.price];
}
@end
