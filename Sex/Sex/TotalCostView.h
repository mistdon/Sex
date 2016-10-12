//
//  TotalCostView.h
//  
//
//  Created by shendong on 16/10/10.
//
//

#import <UIKit/UIKit.h>
#import <XXNibBridge/XXNibBridge.h>

@interface TotalCostView : UIView<XXNibBridge>

@property (nonatomic, assign) IBInspectable NSInteger num;
@property (nonatomic, assign) CGFloat cost;
@property (nonatomic, assign) CGFloat save;
@property (nonatomic, assign) BOOL selectedAll;
- (void)calculate;

@end
