//
//  UIScrollView+SexRefresh.h
//  Sex
//
//  Created by Shendong on 16/10/17.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SexRefreshProtocol <NSObject>
@optional;
- (void)setupRefresh;

@end

@interface UIScrollView (SexRefresh)<SexRefreshProtocol>

@end
