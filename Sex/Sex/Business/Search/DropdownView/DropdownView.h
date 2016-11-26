//
//  DropdownView.h
//  Sex
//
//  Created by shendong on 16/9/29.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XXNibBridge/XXNibBridge.h>
#import "SexChannel.h"

@interface DropdownView : UIView<XXNibBridge>

@property (nonatomic, strong) SexChannel *currentChannel;

@property (nonatomic, strong) NSArray<__kindof SexChannel *> *datas;

@end
