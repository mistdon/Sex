//
//  SearchViewModel.h
//  Sex
//
//  Created by shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

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
// http://api.qinglvmao.com/category/clist/?cid=3&page=1&pn=10&sort=&by=&umeng=0
- (RACSignal *)queryCategoryById:(NSUInteger)cid page:(NSUInteger)page sort:(NSString *)sort;

@end
