//
//  DropdownView.h
//  Sex
//
//  Created by shendong on 16/9/29.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XXNibBridge/XXNibBridge.h>

@protocol DropDownViewDelegate <NSObject>

- (void)selectCategory:(NSString *)category;

@end

@interface DropdownView : UIView<XXNibBridge>
@property (nonatomic, weak)IBOutlet id<DropDownViewDelegate> delegate;
@end
