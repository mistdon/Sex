//
//  ShoppingCartTableViewCell.h
//  Sex
//
//  Created by shendong on 16/10/10.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartPorduct.h"

typedef void(^ChangeNum)(NSInteger num);

@interface ShoppingCartTableViewCell : UITableViewCell

@property (nonatomic, copy) ChangeNum numberChange;

- (void)bindWithProduct:(CartPorduct *)product;

//- (void)productNumChangeCompletion:(void(^)(NSInteger newNum))block;

@end
