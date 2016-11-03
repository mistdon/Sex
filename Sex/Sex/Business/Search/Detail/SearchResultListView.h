//
//  SearchListCollectionView.h
//  Sex
//
//  Created by shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XXNibBridge/XXNibBridge.h>

@interface SearchResultListView : UIView<XXNibBridge>

@property (nonatomic, strong) NSMutableArray *keys;

@property (nonatomic, copy) void(^currentPage)(NSInteger page);

- (void)scrollToPage:(NSUInteger)page;

@end
