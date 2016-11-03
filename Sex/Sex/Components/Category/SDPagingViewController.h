//
//  SDPagingViewController.h
//  Sex
//
//  Created by shendong on 16/11/2.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PagingLoadProtocol <NSObject>

@required

- (UITableView *)tableView;

- (void)pagingBeginLoad;

@end

@interface SDPagingViewController : UIViewController

@property (nonatomic, strong) NSArray *records;

- (UITableView *)tableView;

//- (void)pagingBeginLoad;

- (void)refresh;

- (void)pagingLoaded:(NSArray *)modes;

@end
