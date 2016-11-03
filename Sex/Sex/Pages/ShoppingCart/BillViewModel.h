//
//  BillViewModel.h
//  Sex
//
//  Created by shendong on 16/10/13.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RACSignal;
@interface BillViewModel : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) NSString *payway;
@property (nonatomic, copy) NSString *transportway;
@property (nonatomic, copy) void(^reloadBlock)(NSInteger section);
@property (nonatomic, strong) RACSignal *reloadSection;

- (void)closeBill:(NSArray *)bills;

@end
