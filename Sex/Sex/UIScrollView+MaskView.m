//
//  UIScrollView+MaskView.m
//  MaskScrollView
//
//  Created by shendong on 16/10/14.
//  Copyright © 2016年 shendong. All rights reserved.
//

#import "UIScrollView+MaskView.h"
#import <objc/runtime.h>
#import <Masonry.h>


const void*errorIndicatorViewKey   = &errorIndicatorViewKey;
const void*emptyIndicatorViewKey   = &emptyIndicatorViewKey;
const void*loadingIndicatorViewKey = &loadingIndicatorViewKey;
const void*indicatorDelegateKey    = &indicatorDelegateKey;
const void*hasNavigationBarKey     = &hasNavigationBarKey;
const void*stateKey = &stateKey;


@implementation UIScrollView (MaskView)

@dynamic emptyIndicatorView;
@dynamic errorIndicatorView;
@dynamic loadingIndicatorView;
@dynamic indicatorDelegate;
@dynamic hasNavigationBar;
@dynamic state;

#pragma mark - setter and getter -
- (void)setErrorIndicatorView:(UIView *)errorIndicatorView{
    objc_setAssociatedObject(self, &errorIndicatorViewKey, errorIndicatorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)errorIndicatorView{
    UIView *view = objc_getAssociatedObject(self, &errorIndicatorViewKey);
    if (!view) {
        view = [[NSBundle mainBundle] loadNibNamed:@"maskview" owner:nil options:nil][0];
        [self setErrorIndicatorView:view];
    }
   return objc_getAssociatedObject(self, &errorIndicatorViewKey);
}
- (void)setEmptyIndicatorView:(UIView *)emptyIndicatorView{
    objc_setAssociatedObject(self, &emptyIndicatorViewKey, emptyIndicatorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)emptyIndicatorView{
    UIView *view = objc_getAssociatedObject(self, &emptyIndicatorViewKey);
    if (!view) {
        view = [[NSBundle mainBundle] loadNibNamed:@"maskview" owner:nil options:nil][1];
        [self setEmptyIndicatorView:view];
    }
    return objc_getAssociatedObject(self, &emptyIndicatorViewKey);
}
- (void)setLoadingIndicatorView:(UIView *)loadingIndicatorView{
    objc_setAssociatedObject(self, &loadingIndicatorViewKey, loadingIndicatorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)loadingIndicatorView{
    UIView *view = objc_getAssociatedObject(self, &loadingIndicatorViewKey);
    if (!view) {
        view = [[NSBundle mainBundle] loadNibNamed:@"maskview" owner:nil options:nil][2];
        [self setLoadingIndicatorView:view];
    }
    return objc_getAssociatedObject(self, &loadingIndicatorViewKey);
}
- (void)setIndicatorDelegate:(id<IndicatorViewDelegate>)indicatorDelegate{
    objc_setAssociatedObject(self, &indicatorDelegateKey, indicatorDelegate, OBJC_ASSOCIATION_ASSIGN);
}
- (id<IndicatorViewDelegate>)indicatorDelegate{
    return objc_getAssociatedObject(self, &indicatorDelegateKey);
}
- (void)setHasNavigationBar:(BOOL)hasNavigationBar{
    NSNumber *bar = [NSNumber numberWithBool:hasNavigationBar];
    objc_setAssociatedObject(self, &hasNavigationBarKey, bar, OBJC_ASSOCIATION_ASSIGN);
}
- (BOOL)hasNavigationBar{
    NSNumber *bar = objc_getAssociatedObject(self, &hasNavigationBarKey);
    return [bar boolValue];
}
- (void)setState:(indicatorState)state{
    if (state == [self state]) return;
    objc_setAssociatedObject(self, stateKey, @(state), OBJC_ASSOCIATION_ASSIGN);
    switch (state) {
        case indicatorStateNone:
            [self clearIndicatorView];
            break;
        case indicatorStateError:
            [self error];
            break;
        case indicatorStateEmpty:
            [self empty];
            break;
        case indicatorStateLoading:
            [self loading];
            break;
        default:
            break;
    }
}
- (indicatorState)state{
    return [objc_getAssociatedObject(self, &stateKey) integerValue];
}
#pragma mark - custom set -
- (void)error{
    [self clearIndicatorView];
    UIView *view = [self errorIndicatorView];
    [self.superview addSubview:view];
    __weak typeof(self)weakself = self;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        //如果tableview是在tableviewController的tableview，它的superview是UIViewControllerWrapperView。 有64的部分被隐藏
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake([weakself.superview isMemberOfClass:[UIView class]] ? 0 : [weakself hasNavigationBar] ? 64 : 0, 0, 0, 0));
    }];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(errorTapped:)];
    [view addGestureRecognizer:tap];
}
- (void)loading{
    [self clearIndicatorView];
    UIView *view = [self loadingIndicatorView];
    [self.superview addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view).with.insets(UIEdgeInsetsZero);
    }];
}
- (void)empty{
    [self clearIndicatorView];
    UIView *view = [self emptyIndicatorView];
    [self.superview addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(emptyTapped:)];
    [view addGestureRecognizer:tap];
}
- (void)clearIndicatorView{
    if (self.emptyIndicatorView && self.emptyIndicatorView.superview) {
        [self.emptyIndicatorView removeFromSuperview];
    }
    if (self.errorIndicatorView && self.errorIndicatorView.superview) {
        [self.errorIndicatorView removeFromSuperview];
    }
    if (self.loadingIndicatorView && self.loadingIndicatorView.superview) {
        [self.loadingIndicatorView removeFromSuperview];
    }
}
#pragma mark - delegate -
- (void)errorTapped:(UIGestureRecognizer *)gesture{
    if (self.indicatorDelegate && [self.indicatorDelegate respondsToSelector:@selector(errorIndicatorViewTapped:)]) {
        [self.indicatorDelegate errorIndicatorViewTapped:gesture.view];
    }
}
- (void)emptyTapped:(UIGestureRecognizer *)gesture{
    if (self.indicatorDelegate && [self.indicatorDelegate respondsToSelector:@selector(emptyIndicatorViewTapped:)]) {
        [self.indicatorDelegate emptyIndicatorViewTapped:gesture.view];
    }
}
- (void)setupHeaderRefresh:(RefreshCompletion)handle{
    [self setupHeaderRefresh:handle type:refreshStateGif];
}
- (void)setupHeaderRefresh:(RefreshCompletion)handle type:(refreshState)type{
    if (type == refreshStateGif ) {
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
            handle();
        }];
        header.lastUpdatedTimeLabel.hidden = YES;
        header.stateLabel.hidden = YES;
        [header setImages:[self images] forState:MJRefreshStateRefreshing];
        self.mj_header = header;
    }else if(type == refreshStateNormal){
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            handle();
        }];
        self.mj_header = header;
    }
}
- (void)setupRefreshPlan:(refreshPlan)plan header:(RefreshCompletion)handerCompeltion footer:(RefreshCompletion)handlerCompletion{
    //一次性设置heander和footer刷新,可根据自身情况自己定义
}

- (NSArray *)images{
    NSMutableArray *array = [NSMutableArray array];
    for (int index = 1; index < 7; index++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"加载_0%d",index]];
        [array addObject:image];
    }
    return [array copy];
}
@end
