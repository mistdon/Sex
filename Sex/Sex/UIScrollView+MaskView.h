//
//  UIScrollView+MaskView.h
//  MaskScrollView
//
//  Created by shendong on 16/10/14.
//  Copyright © 2016年 shendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>

typedef NS_ENUM(NSInteger, indicatorState){
    indicatorStateNone,
    indicatorStateError,
    indicatorStateEmpty,
    indicatorStateLoading
};

typedef NS_ENUM(NSInteger, refreshState){
    refreshStateNormal,
    refreshStateGif
};

typedef NS_ENUM(NSInteger, refreshPlan){
    refreshPlanOne,
    refreshStateTwo
};

typedef void(^RefreshCompletion)();

@protocol RefreshProtocol <NSObject>
//! refreshState default is refreshStateGif;
- (void)setupHeaderRefresh:(RefreshCompletion)handle;
//! type为MJRefreshHeaderType
- (void)setupHeaderRefresh:(RefreshCompletion)handle type:(refreshState)type;

- (void)setupRefreshPlan:(refreshPlan)plan header:(RefreshCompletion)handerCompeltion footer:(RefreshCompletion)handlerCompletion;
@end

@protocol IndicatorViewDelegate <NSObject>

@optional

- (void)emptyIndicatorViewTapped:(id)sender;
- (void)errorIndicatorViewTapped:(id)sender;

@end


@interface UIScrollView (MaskView)<RefreshProtocol>

@property (nonatomic, strong) UIView *emptyIndicatorView;
@property (nonatomic, strong) UIView *errorIndicatorView;
@property (nonatomic, strong) UIView *loadingIndicatorView;
@property (nonatomic, assign) indicatorState state;
@property (nonatomic, assign) BOOL hasNavigationBar;
@property (nonatomic, weak) id<IndicatorViewDelegate> indicatorDelegate;

@end
