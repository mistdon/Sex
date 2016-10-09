//
//  SearchViewModel.m
//  Sex
//
//  Created by shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "SearchViewModel.h"

@implementation SearchViewModel
- (instancetype)init{
    if (self = [super init]) {
        [self bindWithModels];
    }
    return self;
}
- (void)bindWithModels{
    self.Categorys = @[@"11",@"22",@"33",@"44",@"55",@"66",@"77"];
}
@end
