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
@property (nonatomic, strong) NSMutableArray *datas;
@end
@implementation HorizontailListView

- (void)didMoveToWindow{
    self.listview.dataSource = self;
    self.listview.delegate = self;
    self.listview.selectionIndicatorColor = [UIColor redColor];
    self.listview.bottomTrimColor = [UIColor clearColor];
    self.datas = @[@"111",@"111",@"ddd",@"ssss",@"fdfds",@"dfdsfs",@" daxiangguijinshu"];
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
//    NSLog(@"list : %@",self.datas[index]);
    self.currentItem = self.datas[index];
}
@end
