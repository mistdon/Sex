//
//  ResultItemCollectionViewCell.m
//  Sex
//
//  Created by shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "ResultItemCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation ResultItemCollectionViewCell
{
    
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UILabel *contentLabel;
    __weak IBOutlet UILabel *priceLabel;
    __weak IBOutlet UILabel *salesLabel;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)bindWithModel:(SexProductItem *)item{
    [imageView sd_setImageWithURL:item.thumb placeholderImage:nil];
    contentLabel.text = item.name;
    priceLabel.text = [@"¥" stringByAppendingString:item.price];
    salesLabel.text = [[@"已售" stringByAppendingString:item.sales] stringByAppendingString:@"件"];
}
@end
