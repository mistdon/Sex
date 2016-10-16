//
//  RecommendViewModel.m
//  Sex
//
//  Created by shendong on 16/10/14.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "RecommendViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RequestService.h"
#import <MJExtension/MJExtension.h>
#import "SexModel.h"

static NSString *const KBoughtKey = @"index/bought/?page=2&pn=12";

@implementation RecommendViewModel

- (RACSignal *)fetchBoughtProducts{
    return [[[RequestService new] requretWithUrl:KBoughtKey withParameters:nil] map:^id(NSArray *value) {
        return [SexModel mj_objectArrayWithKeyValuesArray:value];
    }];
}

@end
