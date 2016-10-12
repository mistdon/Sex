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

@property (nonatomic, assign) NSInteger num; 
@property (nonatomic, assign) CGFloat totalPrice;
@property (nonatomic, assign) CGFloat saving;
@property (nonatomic, strong) NSArray *datas;
@property (nonatomic, assign) BOOL isSelectedAll;
@property (nonatomic, assign) BOOL needReloadData;
- (RACSignal *)fetchAlldatas; // NSArray<CartProduct *> *datas;

- (void)fetchNewData;

- (void)refresh;

- (RACSignal *)reloadData;
@end
