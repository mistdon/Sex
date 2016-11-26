//
//  SearchViewController.h
//  Sex
//
//  Created by Shendong on 16/9/29.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
@property (nonatomic, copy) NSString *searchCategory;
@property (nonatomic, copy) NSString *searchItem;

@property (nonatomic, assign) NSInteger cid;
@property (nonatomic, strong) NSArray *categorys;

@end
