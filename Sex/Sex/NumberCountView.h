//
//  NumberCount.h
//  Sex
//
//  Created by shendong on 16/10/10.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XXNibBridge/XXNibBridge.h>

@interface NumberCountView : UIView<XXNibBridge>

@property (nonatomic, assign)IB_DESIGNABLE NSInteger num;

@property (nonatomic, copy) void(^changeNum)(NSInteger num);

@end
