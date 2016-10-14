//
//  SearchViewModel.m
//  Sex
//
//  Created by shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "SearchViewModel.h"
#import "RequestService.h"
#import "SexProductItem.h"
#import <MJExtension/MJExtension.h>

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
- (RACSignal *)queryCategoryById:(NSUInteger)cid page:(NSUInteger)page sort:(NSString *)sort{
    NSString *url = @"http://api.qinglvmao.com/category/clist/?cid=3&page=1&pn=10&sort=&by=&umeng=0";
    RequestService *request = [RequestService new];
    RACReplaySubject *replay = [RACReplaySubject subject];
    [[request requretWithUrl:url withParameters:nil] subscribeNext:^(NSArray *datas) {
        NSArray *result = [SexProductItem mj_objectArrayWithKeyValuesArray:datas];
        [replay sendNext:result];
        [replay sendCompleted];
    }error:^(NSError *error) {
        [replay sendError:error];
    }];
    return replay;
}
@end
