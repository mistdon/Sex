//
//  SearchOptions.h
//  Sex
//
//  Created by shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XXNibBridge/XXNibBridge.h>

typedef NS_ENUM(NSInteger, SearchOption){
    SearchOptionAll = 1,
    SearchOptionSales,
    SearchOptionLatest,
    SearchOptionPriiceAsc,
    SearchOptionPriceDesc,
};


@interface SearchOptionsView : UIView<XXNibBridge>
@property (nonatomic,assign) SearchOption option;
@end
