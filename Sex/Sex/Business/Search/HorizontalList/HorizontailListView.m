//
//  HorizontailListView.m
//  Sex
//
//  Created by shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "HorizontailListView.h"
#import <HTHorizontalSelectionList/HTHorizontalSelectionList.h>

@interface HorizontailListView()<HTHorizontalSelectionListDelegate, HTHorizontalSelectionListDataSource>

@property (weak, nonatomic) IBOutlet HTHorizontalSelectionList *listview;
@end
@implementation HorizontailListView

- (void)didMoveToWindow{
    self.listview.dataSource = self;
    self.listview.delegate = self;
    self.listview.selectionIndicatorColor = [UIColor redColor];
    self.listview.bottomTrimColor = [UIColor clearColor];
}
#pragma mark - HTHorizontalSelectionListDataSource Protocol Methods
- (NSInteger)numberOfItemsInSelectionList:(HTHorizontalSelectionList *)selectionList {
    return self.datas.count;
}

- (NSString *)selectionList:(HTHorizontalSelectionList *)selectionList titleForItemWithIndex:(NSInteger)index {
    return self.datas[index];
}

#pragma mark - HTHorizontalSelectionListDelegate Protocol Methods

- (void)selectionList:(HTHorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index {
    self.currentItem = self.datas[index];
    if (self.currentPage) {
        self.currentPage(index);
    }
}
- (void)setCurrentIndex:(NSInteger)page{
    [self.listview setSelectedButtonIndex:page animated:YES];
}
@end
