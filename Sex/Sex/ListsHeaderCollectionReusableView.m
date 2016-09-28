//
//  ListsHeaderCollectionReusableView.m
//  Sex
//
//  Created by Shendong on 16/9/28.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "ListsHeaderCollectionReusableView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "SexChannel.h"


@implementation ListsHeaderCollectionReusableView
{
    __weak IBOutlet UIImageView *backgroundImageView;
}
- (void)bindChannel:(SexChannel *)channel{
    [backgroundImageView sd_setImageWithURL: channel.classImg placeholderImage:nil];
}
@end
