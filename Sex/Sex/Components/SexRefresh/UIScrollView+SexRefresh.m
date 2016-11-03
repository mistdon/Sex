//
//  UIScrollView+SexRefresh.m
//  Sex
//
//  Created by Shendong on 16/10/17.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "UIScrollView+SexRefresh.h"
#import <MJRefresh/MJRefresh.h>

@implementation UIScrollView (SexRefresh)

- (void)setupRefresh{
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // Set the ordinary state of animated images
    
    NSMutableArray *pullingImages = [NSMutableArray array];
    NSMutableArray *idleImages = [NSMutableArray array];
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (int index = 0; index < 30; index++) {
        if (index < 10) {
            [pullingImages addObject:[UIImage imageNamed:[NSString stringWithFormat:@"ic_ani_loaing_%d",index]]];
        }else if(index < 20){
            [idleImages addObject:[UIImage imageNamed:[NSString stringWithFormat:@"ic_ani_loaing_%d",index]]];
        }else{
            [refreshingImages addObject:[UIImage imageNamed:[NSString stringWithFormat:@"ic_ani_loaing_%d",index]]];
        }

    }
    
    [header setImages:idleImages forState:MJRefreshStateIdle];
    // Set the pulling state of animated images（Enter the status of refreshing as soon as loosen）
    [header setImages:pullingImages forState:MJRefreshStatePulling];
    // Set the refreshing state of animated images
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
    // Set header
    self.mj_header = header;
}
- (void)loadNewData{
    NSLog(@"loadNewData");
}


@end
