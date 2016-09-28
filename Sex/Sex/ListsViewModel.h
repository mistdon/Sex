//
//  ListsViewModel.h
//  Sex
//
//  Created by Shendong on 16/9/28.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACSignal;
@interface ListsViewModel : NSObject

- (RACSignal *)queryLists;

@end
