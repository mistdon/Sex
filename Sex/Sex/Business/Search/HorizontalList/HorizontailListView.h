//
//  HorizontailListView.h
//  Sex
//
//  Created by shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XXNibBridge/XXNibBridge.h>


@interface HorizontailListView : UIView<XXNibBridge>
@property (nonatomic, strong) NSArray *datas;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *currentItem;

@property (nonatomic, copy) void(^currentPage)(NSInteger page);

- (void)setCurrentIndex:(NSInteger)page;

@end
