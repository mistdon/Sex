//
//  ListsViewModel.m
//  Sex
//
//  Created by Shendong on 16/9/28.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "ListsViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <MJExtension/MJExtension.h>
#import "RequestService.h"
#import "SexChannel.h"

@implementation ListsViewModel

-(RACSignal *)queryLists{
    RACReplaySubject *replay = [RACReplaySubject subject];
    RequestService *request = [[RequestService alloc] init];
    [[request requretWithUrl:@"http://api.qinglvmao.com/category/indexnew" withParameters:nil] subscribeNext:^(NSArray *arr) {
        if (!arr || arr.count == 0) {
            [replay sendError:[NSError errorWithDomain:@"Sex" code:2001 userInfo:nil]];
            return ;
        }
        [SexChannel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"data":@"SexProduct"
                     };
        }];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            SexChannel *channel = [SexChannel mj_objectWithKeyValues:dict];
            [array addObject:channel];
        }
        [replay sendNext:array];
        [replay sendCompleted];
    }error:^(NSError *error) {
        [replay sendError:error];
    }];
    return replay;
}

@end
