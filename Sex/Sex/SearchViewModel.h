//
//  SearchViewModel.h
//  Sex
//
//  Created by shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, SearchOptions){
    SearchOptionsAll,
    SearchOptionsPriceHigh,
    SearchOptionsPriceLow,
    SearchOptionsSales,
    SearchOptionsLatest
};
@interface SearchViewModel : NSObject
@property (nonatomic, strong) NSArray *Categorys;
@property (nonatomic, copy) NSString *currentCategory;
@property (nonatomic, strong) NSArray *Items;
@property (nonatomic, copy) NSString *currentItem;
@property (nonatomic, assign) SearchOptions searchoptions;
@end
