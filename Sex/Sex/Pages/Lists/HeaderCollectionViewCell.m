//
//  HeaderCollectionViewCell.m
//  Sex
//
//  Created by Shendong on 16/9/28.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "HeaderCollectionViewCell.h"
#import "SexChannel.h"
#import <UIImageView+WebCache.h>

@implementation HeaderCollectionViewCell
{
    __weak IBOutlet UILabel *detailLabel;
    __weak IBOutlet UIImageView *imageView;
}

- (void)bindWithChannel:(SexChannel *)channel{
    detailLabel.text = channel.name;
    [imageView sd_setImageWithURL:channel.navigationImage placeholderImage:nil];
}
@end
