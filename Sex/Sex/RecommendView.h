//
//  RecommendView.h
//  Sex
//
//  Created by shendong on 16/10/14.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XXNibBridge/XXNibBridge.h>

@class SexModel;
@interface RecommendView : UIView<XXNibBridge>
@property (weak, nonatomic) IBOutlet UIButton *toToHallButton;
@property (nonatomic, copy) void(^slectedRecommend)(SexModel *product);
@end
