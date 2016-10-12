//
//  CartPorduct.h
//  Sex
//
//  Created by shendong on 16/10/10.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CartPorduct : NSObject
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, assign) CGFloat saving;
@property (nonatomic, assign) NSInteger num;
@end
