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
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *currentItem;
@end
