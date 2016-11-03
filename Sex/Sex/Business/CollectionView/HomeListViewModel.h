//
//  HomeListViewModel.h
//  Sex
//
//  Created by shendong on 16/9/29.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HomeListsTableView;

@interface HomeListViewModel : NSObject

- (void)bindWithTableView:(__kindof HomeListsTableView *)homelistTableView;

@end
