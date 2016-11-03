//
//  ShoppingCartTableViewCell.h
//  Sex
//
//  Created by shendong on 16/10/10.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartPorduct.h"
#import "NumberCountView.h"

@interface ShoppingCartTableViewCell : UITableViewCell

@property (nonatomic, copy) numberChange newchange;
@property (nonatomic, copy) void(^selectedChange)(BOOL selected);

- (void)bindWithProduct:(CartPorduct *)product;

@end
