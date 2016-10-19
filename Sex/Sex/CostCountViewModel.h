//
//  CostCountViewModel.h
//  Sex
//
//  Created by shendong on 16/10/10.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SingletonProtocol.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface CostCountViewModel : NSObject<SingletonProtocol,UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *datasources;
@property (nonatomic, strong) RACReplaySubject *reloadSubject;

@property (nonatomic, assign) NSInteger total_num;
@property (nonatomic, assign) CGFloat total_price;
@property (nonatomic, assign) CGFloat total_saving;

@property (nonatomic, assign) BOOL isSelectedAll;

- (void)slecteAllProducts:(BOOL)selected;
- (RACSignal *)getAllDatas;
- (void)reloadTableView;
@end
