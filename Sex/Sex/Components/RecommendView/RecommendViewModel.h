//
//  RecommendViewModel.h
//  Sex
//
//  Created by shendong on 16/10/14.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACSignal;
@interface RecommendViewModel : NSObject
- (RACSignal *)fetchBoughtProducts;
@end
