//
//  HorizontailListView.h
//  Sex
//
//  Created by shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XXNibBridge/XXNibBridge.h>
#import "SexChannel.h"

@interface HorizontailListView : UIView<XXNibBridge>
@property (nonatomic, strong) NSArray<__kindof SexProduct*> *datas;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, strong) SexProduct *currentItem;

@property (nonatomic, copy) void(^currentPage)(NSInteger page);

- (void)setCurrentIndex:(NSInteger)page;

@end
