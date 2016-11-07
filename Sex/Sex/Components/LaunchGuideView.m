//
//  LaunchGuideView.m
//  Sex
//
//  Created by shendong on 2016/11/7.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "LaunchGuideView.h"
#import <Masonry/Masonry.h>
#import "SexConst.h"



static NSInteger const KLaunchImagePage = 3;
@interface LaunchGuideView()<UIScrollViewDelegate>
@end
@implementation LaunchGuideView
{
    UIScrollView *scrollview;
}
static LaunchGuideView *guideView;

- (void)showMain{
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreen_Width , KScreen_Height)];
    scrollview.pagingEnabled = YES;
    scrollview.bounces = NO;
    scrollview.showsHorizontalScrollIndicator = NO;
    for (int index = 0; index < KLaunchImagePage + 1; index ++) {
        UIImageView *imageview = [[UIImageView alloc] initWithImage: index == KLaunchImagePage ? nil: [UIImage imageNamed:[NSString stringWithFormat:@"userGuide%d",index+1]]];
        imageview.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * index, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        [scrollview addSubview:imageview];
    }
    scrollview.contentSize = CGSizeMake(KScreen_Width * (KLaunchImagePage + 1), KScreen_Height);
    scrollview.delegate = self;
    [[UIApplication sharedApplication].keyWindow addSubview:scrollview];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"sss");
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x;
    if (offsetX - (KLaunchImagePage * KScreen_Width) < 20) {
        if (guideView) {
            [guideView removeFromSuperview];
        }
    }
}


@end
